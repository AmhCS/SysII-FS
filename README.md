SysII-FS
========

The Systems II file system project

* Notes:
// Christian, Aneesh, Prof. Kaplan

I made a few final changes to our project 1, 
so the 2nd kernel is the better one by far. 

The second kernel version includes the clock interrupts, and a console 
visual of the process table as the system runs. 
The process table visual should be interpreted as such: 

1.PID  2.STATUS  3.SP  4.FP   5.%G0  6.%G2  7.%G3  8.%G4  9.%G5
10.BASE  11.LIMIT  12.lastIP  13.PARENT 

After that it loops, so for most of the run the first PT spot will be 0x0000 for kernel PID,
and the 14th spot will be 0x0002 for the process brought in after init left. 
(We put the kernel on the process table for easy register information storage. 
It doesn't get ran like the other processes.) 
 										-  Madison  
