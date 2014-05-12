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