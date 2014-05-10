#====     INode: Marie, Christine & Chloe


# ==================================================================================================================================
# Statically allocated variables that store information and state about the console
# and its use for printing.

var 4 leading_immediate_data
var 4 direct_indicies #this leads to the first index, the following are below it
var 4 length

#procedure extern 4 memalloc
#procedure extern 4 block_device_alloc


#====the following two are not implemented yet. May be later if time permits

#var 4 permssion bits #this will lead to r or 0 followed by w/0 and e/0
#var 4 timestamp #date created, data last modified


# ========================================================================================


# ======================== next 3 procedures is the code provided by Aneesh=====not rly part of INode but here for awhile.


var 4 block_base
var 4 block_limit


# ========================================================================


# Initialize use of the block device

procedure 0 init ()
	    	 [4 device_table_entry_ptr]
{

  # Find the block device entry in the device table, based on its code (5).
  (= &device_table_entry_ptr 0x1000)
  while ((not (== *(4)device_table_entry_ptr 5))) {

    # Advance to the next entry.
    (= &device_table_entry_ptr (+ device_table_entry_ptr 12))

  }

  # Grab the base and then the limit.
  (= &block_base *(4)(+ device_table_entry_ptr 4))
  (= &block_limit *(4)(+ device_table_entry_ptr 8))

}


#==========================================================

procedure 0 block_device_write (4 page_no
	    		        4 ram_loc_start )
	    	   [4 block_counter
		   4 block_stop
		   4 page
                   4 ram_location
		   4 block_touch]
{
  (= &ram_location ram_loc_start)
  (= &block_counter block_base)
  (= &block_stop (+ block_base 4096))
  while ((not (== block_stop block_counter))) {
    while ((not (== ram_location (+ ram_loc_start 4096)))) {
      (= block_counter *(4)ram_location)
      (= &block_counter (+ block_counter 4))  
      (= &ram_location (+ ram_location 4))
    }
  }
  #this is a 'touch to write' so as soon as I write 1 to the last bit, it will write to the block dev
  (= &block_touch (- block_limit 4))
  (= &page (- block_limit 8))
  (= page page_no)
  (= block_touch 1)
}


# ==================usage: block_device_read(<ram location to read to, starting>, <end>, <block page>)

procedure 0 block_device_read (4 page_no
	    		      4 ram_loc_start)
	    	  [4 block_counter
  		  4 block_stop
		  4 page
  		  4 ram_location
		  4 block_touch]
{
  (= &ram_location ram_loc_start)
  (= &block_counter block_base)
  (= &block_stop (+ block_base 4096))
  while ((not (== block_stop block_counter))) {
    while ((not (== ram_location (+ ram_loc_start 4096)))) {
      (= ram_location *(4)block_counter)
      (= &block_counter (+ block_counter 4))  
      (= &ram_location (+ ram_location 4))
    }
  }
  (= &block_touch (- block_limit 4))
  (= &page (- block_limit 8))
  (= page page_no)
  (= block_touch 0)

}	  



#==========================================Actual INode code written by Marie

procedure 4 make_new(4 pointer) #4 length, 2044 bytes of leading_immediate_data, 12 direct indicies
	  [4 index]
{
	(= &index 0)
	while ((not (== index 4096))) {
	
	      ( = &pointer 0x0)
    	      #Advance to the next entry.
   	      (= &index (+ index 4))

  }

}


# ===========================================


procedure 0 set_immediate_data (4 data
	    		       4 data_len
			       4 inode_num
			       4 offset)
	    	 [4 ptr
		 4 place
		 4 len_left
		 4 ramSpace
		 4 block]
{
	
	#(= &ramSpace (memalloc 4096))
	(= &ramSpace 0x00f00000) #for now
	(block_device_read inode_num ramSpace)
	(= &place (+ ramSpace offset))


	ifthen ((< data_len (- 2048 length))){
	        (= &ptr 0)
	       	while ((not (== ptr data_len))){
	    	    (= place  *(1)data)
		    (= &ptr (+ ptr 1))
	      	    (= &data (+ data 1))
		    (= &place (+ place 1))
		    (= &length (+ length 1))
		}
  	}
	ifthen ((> data_len (- 2048 length))){
	       (= &len_left (- data_len (- 2048 length)))
	       while ((not(== length 2048))){
	       	    (= place *(1)data)
	      	    (= &data (+ data 1))
		    (= &place (+ place 1))
		    (= &length (+ length 1)) 
	       }
	     # (= &block (block_device_alloc)) the below line is faking what this one should do once we have the method
	       (= &block 1)
	     # (= &ramSpace (memalloc 4096)) the below line is faking what this one should do once we have the method	
	       (= &ramSpace 0x00e00000)
	       (write 0x0 data len_left) #need to fill this in asap
	       (block_device_write block ramSpace)   
	       (set_direct_ptr block)

	}

}

# ===========================================

procedure 0 set_direct_ptr (4 block_number) #caclcute which direct_ptr it'd be on your own
	    		   [4 toSet]
{
	(= &toSet (/ (- length 2048) 4096))
	(= &toSet (+ toSet direct_indicies))
	(= toSet block_number)	
}


# ===========================================

procedure 4 get_length()
	  []
{
	return length
}



# ===========================================Below for Chloe & Christine

procedure 0 write (4 offset
	  4 data_buffer
	  4 buffer_length)
	  []
{
#while length is less than leading_immediate_data size + 4 for length (2048), 
  #fill in leading immediate data
#if length is >= leading immediate data.
    # calculate which direct index you should be looking at
    
    #while data buffer hasn't fully been written into INode
      	    #if that index is 0, allocate new block and point the index (%buffer=alloc(40%)#???)
           #while data_buffer hasn't fully been written and block isn't full
	       	  # write into the block
		  #go where the next direct block index should be


}


# ===========================================

procedure 0 read (4 offset_in_inode
	  4 length
	  4 buffer) # when we read we need to write to a user-level process buffer provided in param
	  []
{

}
