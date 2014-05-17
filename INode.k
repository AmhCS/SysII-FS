#====     INode: Marie, Christine & Chloe


# ==================================================================================================================================
# Statically allocated variables that store information and state about the console
# and its use for printing.

var 4 leading_immediate_data
var 4 direct_indices #this leads to the first index, the following are below it
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

procedure 4 make_new(4 pointer) #4 length, 2044 bytes of leading_immediate_data, 12 direct indices
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
	    # (write 0x0 data len_left inode_num) #need to fill this in asap
	       (block_device_write block ramSpace)   
	       (set_direct_ptr block)

	}

}

# ===========================================

procedure 0 set_direct_ptr (4 block_number) #caclcute which direct_ptr it'd be on your own
	    		   [4 toSet]
{
	(= &toSet (/ (- length 2048) 4096))
	(= &toSet (+ toSet direct_indices))
	(= toSet block_number)	
}


# ===========================================

procedure 4 get_length()
	  []
{
	return length
}



# ================================================Dan's code

procedure 4 block_device_alloc()
	  	  [4 free
		   4 device
	  	   4 base
	  	   4 limit
	  	   4 blocknum
	  	   4 trigger
	  	   4 freeadd]
{
	#find block device in BC, code is 5
	(= &device 0x1000) 
        while ((not (== *(4)device 5))) {

    	# Advance to the next entry.
    	(= &device (+ device 12))

  }

  # Grab the base and then the limit.
  (= &base *(4)(+ device 4))
  (= &limit *(4)(+ device 8))  

  (= &trigger *(4)(- limit 4))
  (= &blocknum *(4)(- limit 8))
  
  #set blocknum to 0 to get superblock, and set the trigger to 0 to read 
  (= *(4)blocknum 0)
  (= *(4)trigger 0)
  
  #find the 4th word in the superblock, which is a pointer to the free chain, save that number in &free and increment that number in the superblock by 1 and save it back into the BD
  (= &freeadd *(4)(+ limit 12))
  (= &free *(4)freeadd)
  (= *(4)freeadd (+ free 1))
  (= *(4)trigger 1)
  return free

  
}

# ===========================================Below for Chloe & Christine

procedure 4 mod (4 a #calculates a mod b
	4 b
	4 i)
	[]
{
	(= &i 0) #i = 0
	while ((< a (* b i))) #while a<(b*i)
		(= &i (+ &i 1)) #i++
	return (- a (* b i)) #return a-(b*i)
}

# ================================================================

#this procedure writes content from a data_buffer of buffer_length
#to a block organized by inode number inode_num
#this was written with the assumption that the param "offset" referred to
#the offset within the data_buffer where code should start being copied
#(which perhaps was a bad assumption, since the same effect could more
#easily be achieved by shifting the data_buffer pointer before calling
#the write procedure)
#this could be rewritten so that offset actually refers to an offset
#within the inode, allowing the procedure to write over previously
#written content in the block

procedure 0 write (4 offset 
     	   4 data_buffer
      	   4 buffer_length
      	   4 inode_num)
      	   [4 direct_index
     	   4 index_offset
     	   4 block
      	   4 ramSpace
     	   4 place
     	   4 ptr]
{

	ifthenelse ((< length 2048)){ #if inode is not filled up through immediate data
		(set_immediate_data data_buffer buffer_length inode_num offset) #fill in leading immediate data
		#set_immediate_data calls write if there is leftover content that does not fit in immediate data
	
	}
	#everything below this in the else clause
	      else{ #calculating next available space to write 
	      #(which direct index and how far into that block)
	      	    (= &direct_index (/ length 4096))
		    (= &index_offset (mod length 4096))
	
		ifthenelse ((== index_offset 0)){ #if we're at the start of a new block
			   (= &block (block_device_alloc)) #allocate the block
			   #(= &block 1)
			   #(= &ramSpace (memalloc 4096)) #allocate ram space
			   (= &ramSpace 0x00e00000) #faking the memalloc function for now
			   (= &place ramSpace)
		}
		else { #block is already partially filled
		       	   (= &block (+ &direct_indices (* direct_index 4)))
			   #(= &ramSpace (memalloc 4096))
			   (= &ramSpace 0x00e00000)
			   (block_device_read block ramSpace) #copy the already filled portion of block into RAM (cannot write into a partial block)
			   (= &place (+ ramSpace offset)) #?
		}
	
		(= &ptr 0)
	
		#copy from buffer into RAM
	
		while ((< &index_offset 4096)){ #until the current block fills up
		      (= place *(1)data_buffer)
		      (= &ptr (+ ptr 1))
		      (= &data_buffer (+ data_buffer 1))
		      (= &place (+ place 1))
		      (= &length (+ length 1))
		      (= &index_offset (+ index_offset 1))
		}
	
		#copy from RAM into block

		(block_device_write block ramSpace)
	
		ifthen ((!= ptr buffer_length)){ #if there was more data left uncoppied, recur
		       (write offset data_buffer (- buffer_length ptr) inode_num)
	}
}

# ===========================================

#this code is less polished than the write function, though they function similarly
#when finished, read should grab content from at offset_in_inode in inode_num
#and write it to buffer of buffer_length
#like in the write function, code must be copied into RAM before it can be
#written to a block or to a buffer

procedure 0 read (4 offset_in_inode
	  	  4 inode_num
	 	  4 buffer_length	
	  	  4 offset
	 	   4 buffer) # when we read we need to write to a user-level process buffer provided in param
	  [4 data #points to where we want to start reading
	  4 ramSpace]
{

	#this is an (incorrect) attempt at implementing error detection
	#if someone tries to read a file longer than length of inode content	
	ifthen ((>= (+ offset_in_inode buffer_length) length)) {
	       asm (" SYSC ")
	       #return?
	}

	#based on offset, calculate where you want to read from

	ifthenelse ((< offset_in_inode 2048)) {
	      #read from immediate data?
	      (= &data (+ &leading_immediate_data offset_in_inode))
	}
	else {
	     #read from one of the direct indices
	     #determine index and offset
		(= &direct_index (/ offset_in_inode 4096)
		(= &index_offset (mod offset_in_inode 4096))
		(= &data (+ &direct_indices (* direct_index 4)))
	}
	
	(= &ramSpace (memalloc 4096))
	(= &place ramSpace)
	ifthen ((== offset 0)) {
	      (block_device_read (+ buffer offset) ramSpace)
	      (= &place (+ ramSpace offset))
	}
	#word by word copy from &data to buffer+offset

	(= &ptr 0)
	
	while ((< &offset_in_inode 4096)){ #until the current block fills up
		(= place *(1)data)
		(= &ptr (+ ptr 1))
		(= &data (+ data 1))
		(= &place (+ place 1))
		(= &length (+ length 1))
		(= &offset_in_inode (+ offset_in_inode 1))
	}

	(block_device_write buffer ramSpace)
}

# ===========================================


