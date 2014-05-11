	;; Ram's Kernal
	;; Madison Burke / Christian / Aneesh 

	.Code 
;;; %G4 should still hold ram base
;;; %G5 should have kernal.length
;;; %G3 should have ram limit
;;; All functions must be CALLED now


	COPY 	%G0		*0x1028			;%G0 holds kernal base
	COPY	%G1		*0x102c			;%G1 holds kernal limit
	SUBUS	%G5		%G1		%G0		;%G5 is kernal.length
	COPY	%G4		*0x1010			;%G4 holds ram base
	COPY	%G0		*0x1014			;%G0 holds ram limit
	COPY	%SP		+RAM_limit		;Need extra register temporarily 
	COPY	*%SP	%G0				;Ram_limit saved 
	
	ADD		%G5		%G5		%G4  	;%G5 is ramkernal.limit
	COPY	%G0		+kernel_limit
	COPY	*%G0	%G5
	COPY	%SP		%G5				; initialize Stack and Frame pointer
	COPY	%FP		%SP
	COPY	%G0		+kernel_base
	COPY	*%G0	%G4
	COPY	%G0		+ALM
	ADDUS	%G0		%G0		4
	COPY	*%G0	0x10
	

	
find_free_RAM:	
	BEQ		+set_trap_base	*%G5	0 	;Branch if Ram is empty
	ADD		%G5		%G5		16 	;else, check next instruction
	JUMP	+find_free_RAM

set_trap_base:
	SETTBR	%G5			;Set trap base register to fresh ram
	COPY	%G0	0		;Refresh %G0
	COPY	%G1	0
	
	
set_trap_table:
	BEQ		+clock_alarm_interrupt	%G0	3
	BEQ		+system_call_interrupt	%G0	9
	COPY	*%G5	+end
	ADD		%G0		%G0		1
	ADD		%G5		%G5		4
	JUMP	+set_trap_table

clock_alarm_interrupt:
	COPY	*%G5	+clock_Alarm
	ADD		%G0		%G0		1
	ADD		%G5		%G5		4
	JUMP	+set_trap_table

system_call_interrupt:
	COPY	*%G5	+system_Call
	ADD		%G0		%G0		1
	ADD		%G5		%G5		4
	BGT		+process_table_base_setup	%G0		9

end:	HALT				;Where all interrupts return atm

	;; Set up process table base
process_table_base_setup:	
	ADDUS 	%G5		%G5		8 			; Balance it back out
	COPY	*%G5	0x210000	 	  	; Halt after trap table
	ADDUS	%G5		%G5		16	   		; %G5 is my pointer
	COPY	%G0 	+IB					; Interrupt Buffer label set up
	SETIBR	%G0					 		
	
	COPY	%G0		+process_table_base
	COPY	*%G0	%G5
	COPY	%G0		+next_free_process
	COPY	*%G0	%G5
	COPY	%G0		+process_table_pointer_base
	COPY	*%G0	%G5	
	COPY	%G0		+process_table_pointer
	COPY	*%G0	*+process_table_pointer_base
	
	ADDUS	%G5		%G5		0x540
	COPY	%G0		+process_table_limit
	COPY	*%G0	%G5					; Processes table can hold 24 processes atm
	
	COPY	%G0		+kernel_limit
	ADDUS 	*%G0	%G5		1520			; Extend kernal limit to include stack and process table
	ADDUS	%SP		0x5000	*+kernel_limit			; Initialize stack pointer
	COPY	%FP		%SP
	COPY	%G0		+next_free_RAM
	COPY	*%G0	%SP
	ADDUS	*%G0	*+next_free_RAM		4
	
;;; Set kernal's place in process table using process_table_Add (Process table ADD function).

	COPY	%G0		+return
	CALL	+process_table_Add_Args	*%G0			; Decrements %SP automatically
	COPY	*%SP	*+kernel_base		; P_add's 1st argument: BASE
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+kernel_limit	; P_add's 2nd argument: LIMIT
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x01		; 3rd arg: 1 means kernal is an active process
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+total_PIDs	; 4th: kernel is its own parent 
	CALL	+process_table_Add	*%G0	
	;; All above this is successful.  
	COPY	%G0		+kernel_limit
	ADDUS	*%G0	*+kernel_limit	0x5000
	
;;; Let's find the console. 
procedure_find_console:
	COPY		%G0		4		; Type
	COPY		%G1		1		; Instance 
	COPY		%G2		0x1000	; Bus controller base
find_device_loop_top:
	;; End the search with failure if we've reached the end of the table without finding the device.
	BEQ		+find_device_loop_failure	*%G2		0
	;; If this entry matches the device type we seek, then decrement the instance count.  If the instance count hits zero, then
	;; the search ends successfully.
	BNEQ		+find_device_continue_loop	*%G2		%G0
	SUB		%G1				%G1		1
	BEQ		+find_device_loop_success	%G1		0
find_device_continue_loop:	
	;; Advance to the next entry.
	ADDUS		%G2			%G2		12
	JUMP		+find_device_loop_top
find_device_loop_failure:
	;; Set the return value to a null pointer.
	HALT
find_device_loop_success:
	;; Save the console base and limit in statics
	ADDUS	%G2		%G2		4
	COPY	%G0		+console_base			
	COPY	*%G0	*%G2
	ADDUS	%G2		%G2		4
	COPY	%G0		+console_limit
	COPY	*%G0	*%G2
	;; Fall through...
	COPY	%G0		+return				; console_base found 
	CALL	+process_table_Print	*%G0	; works 
	
    
    
    ;;; Let's find the block_device.
procedure_find_block:
	COPY		%G0		5		; Type
	COPY		%G1		1		; Instance 
	COPY		%G2		0x1000	; Bus controller base
find_block_loop_top:
	;; End the search with failure if we've reached the end of the table without finding the device.
	BEQ		+find_block_loop_failure	*%G2		0
	;; If this entry matches the device type we seek, then decrement the instance count.  If the instance count hits zero, then
	;; the search ends successfully.
	BNEQ		+find_block_continue_loop	*%G2		%G0
	SUB		%G1				%G1		1
	BEQ		+find_block_loop_success	%G1		0
find_block_continue_loop:
	;; Advance to the next entry.
	ADDUS		%G2			%G2		12
	JUMP		+find_block_loop_top
find_block_loop_failure:
	;; Set the return value to a null pointer.
	HALT
find_block_loop_success:
	;; Save the console base and limit in statics
	ADDUS	%G2		%G2		4
	COPY	%G0		+block_base
	COPY	*%G0	*%G2
	ADDUS	%G2		%G2		4
	COPY	%G0		+block_limit
	COPY	*%G0	*%G2
    
    COPY    %G0     +block_trigger
    COPY    %G2     +block_limit
    SUBUS   *%G0    *%G2    4       ;; initialize address of trigger on block device
    COPY    %G0     +block_num
    SUBUS   *%G0    *%G2    8       ;; initialize address of block device block # input
    COPY    %G0     +block_buffer_limit
    SUBUS   *%G0    *%G2    12      ;; initialize address for buffer limit (base + 4096)
    

	;; 1. WRITE CODE TO COPY INIT TO RAM HERE, THEN JUMP TO IT.
	;; If 0x1030 is 2, copy and run it. Else, do nothing. 
	COPY	%G1		*0x1030			; type of next ROM
	BNEQ	+end	%G1		2		; if it isn't a program (init hopefully), HALT
	
	SUBUS	%G2		*0x1038		*0x1034	; length of next program
	ADDUS	%G2		%G2		*+next_free_RAM  ; limit in RAM of new process
	COPY	%G0		+return
	CALL	+copy_Args		*%G0	; Going to copy the program to RAM
	COPY	*%SP	*0x1034			; Base 
	SUBUS	%SP		%SP		4
	COPY	*%SP	*0x1038			; Limit 
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+next_free_RAM	; Destination (Correct)
	;; successful ^^
	CALL	+copy	*%G0			; Begin copying
	CALL	+process_table_Add_Args		*%G0
	COPY	*%SP	*+next_free_RAM	; Base	of init in RAM
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G2				; Limit of init
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x01			; Status
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x00			; Kernel is this program's parent
	CALL	+process_table_Add	*%G0		; Need to make PTADD more automatic. 

    ;; this is a function call to "fileExists" function.
    COPY %G0 +return           ;; copy +return into a register
	CALL +fileExists_Args *%G0   ;; call the functions Args section
	COPY *%SP +file_name          ;; copy your argument into the SP
	CALL +fileExists *%G0         ;; call the function itself. 
    ;; complete function call! 


	;; Run init, if it exists. 
	;; everything above this works. 
	JUMP	+process_table_Run_Next
	
	
	
	HALT							;Will set up init later
	
;;; Setup can only be run when total_PIDs is 1. Otherwise, it halts. 
	
;;; Copy Init to Ram, and run it. 


;;; Search Function: Checks block of data for particular item.
;;; Returns the address the item is at if found, or 0x00 if not found. 
;;; Will help when picking next PID.
;;; args: 1. ITEM, 2. BASE, 3. LIMIT, 4. Increment		results: 1
search_Args:
	SUBUS	%SP	%SP	4
	JUMP	+fArgs
	
search:	
	SUBUS	%SP	%SP	4
	COPY	*%SP	1
	COPY	%G0	+return2
	CALL	+fCall	*%G0
	
	COPY	%G0	*%FP		; ITEM
	ADDUS	%FP	%FP	4
	COPY	%G1	*%FP		; BASE
	ADDUS	%FP	%FP	4
	COPY	%G2	*%FP		; LIMIT
	ADDUS	%FP	%FP	4
	COPY	%G3 *%FP		; By how much to increment, 4 is typical
	COPY	%G4	0x00		; RESULT not yet found	
search1:	
	BEQ		+search2	%G0		*%G1		; Checks to see if GO item is in address in G1
	BEQ		+search3	%G1		%G2			; Finishes when G1 equals G2
	ADD		%G1			%G1		%G3			; Increments G1 by %G3
	JUMP	+search1				; LOOP
search2:	
	COPY	%G4	%G1			;Copies address in G1 to G5
search3:	
	SUBUS	%SP		%SP	4
	COPY	*%SP	%G4		; Buries its result 
	ADDUS	%SP		%SP	4
	JUMP	+fDone			; Jumps to fdone.


;;;Copy Function: Copies block of data from one place to another
;;;args: 1. BASE, 2. LIMIT,	3.	DESTINATION		results: 0
copy_Args:
	JUMP +fArgs

copy:
	SUBUS	%SP	%SP	4
	COPY	*%SP	0
	COPY	%G0	+return2
	CALL	+fCall	*%G0

	COPY	%G0	*%FP		;Gets base
	ADDUS	%FP	%FP	4
	COPY	%G1	*%FP		;Gets limit
	ADDUS	%FP	%FP	4
	COPY	%G3	*%FP		;Gets destination base
copy1:
	BGTE	+copy2	%G0	%G1
	COPY	*%G3	*%G0
	ADDUS	%G0		%G0		4
	ADDUS	%G3		%G3		4
	JUMP	+copy1
copy2:						;G3 has base in RAM, and G0 has limit in RAM
	;; next_free_RAM will change after the copy, during the process_add call.
	JUMP	+fDone
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; INTERRUPT HANDLERS ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


				;; Interrupt # 2: CLOCK ALARM 
;;; It's set to only work if +process_table_total_processes > 1
clock_Alarm:
	SETALM	*+ALM	0x00
	;; Check if an interrupt handler was interrupted. 
	;; Later	
	
	ADDUS	%SP		%SP		*+BS	; SP becomes physical again / Must be after every interrupt. 
	
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G0				; save %G0 contents 
	COPY	%G0		+return
	COPY	*%G0	+clock_Alarm1		
	COPY	%G0		*%SP
	ADDUS	%SP		%SP		4
	JUMP	+process_table_Update_Process_Args
clock_Alarm1:
	COPY	*%SP	*+current_PID	;PT_update 1st arg: PID
	COPY	%G0		+return 
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x01			;PT_update 2nd arg: Status 
	CALL	+process_table_Update_Process		*%G0
	
	;;Getting Kernel Info back. (probably irrelevant)
	COPY	%G0		+BS
	COPY	*%G0	0			;Return BS to 0.
	COPY	%G0		+return 	
	
	COPY	%G5		%SP
			
	CALL	+process_table_Restore_Args	*%G0	; Restoring Kernel's info
	COPY	*%SP	0						; PID of process to be restored
	COPY	%G0		+return	
	CALL	+process_table_Restore	*%G0		; Kernel's registers restored 
	
	;; Running next process 
	JUMP	+process_table_Run_Next

				;; Interrupt #9: SYSTEM CALL
				
;;; Behold, the system call function.
;;; The arguments it takes should be put in numerics mode, right after the call
;;; Args: 1. type; The rest of the arguments depend on the type. Details in README.
system_Call:
SETALM	*+ALM	0x00
;;; Save prog's registers in temp space, will then use process_table_Update_Process to put them in process table
;;; check IB for address of syscall, save it in %G0, and add 16 to %G0 to point at the syscall type
;;; If Syscall type is 1, then jump to +sys1(setup)
	;; Save registers in temp without using registers 		
system_Call0:
	ADDUS	%SP		%SP		*+BS	; SP becomes physical again / Must be after every interrupt. 
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G0				; save %G0 contents 	

	COPY	%G0		+return
	COPY	*%G0	+system_Call1		
	COPY	%G0		*%SP
	ADDUS	%SP		%SP		4
	JUMP	+process_table_Update_Process_Args
system_Call1:
	COPY	*%SP	*+current_PID	;PT_update 1st arg: PID
	COPY	%G0		+return 
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x01			;PT_update 2nd arg: Status 
	CALL	+process_table_Update_Process		*%G0
	;;Process's register information is secure
	
	;;Need address of syscall
	COPY	%G0		+address_of_interruption		
	ADDUS	*%G0	*+BS	*+IB		;%G1 has place of interruption
	
	;; Need to get Kernel's registers back. 
	COPY	%G0		+BS
	COPY	*%G0	0			;Return BS to 0.
	COPY	%G0		+return 			
	CALL	+process_table_Restore_Args	*%G0	; Restoring Kernel's info
	COPY	*%SP	0						; PID of process to be restored
	COPY	%G0		+return	
	CALL	+process_table_Restore	*%G0		; Kernel's registers restored 
	
	COPY	%G0		*+address_of_interruption	;%G0 has physical address of syscall
	ADDUS	%G0		%G0		16					; Address right after syscall
	
	BEQ		+system_setup	*%G0	1		; setup is syscall arg is 1
	BEQ		+system_exit	*%G0	0		; exit if syscall arg is 0
	BEQ		+system_fork	*%G0	2		; fork if syscall arg is 2
	;; The address after the syscall had neither 1, 0 nor 2.
	HALT
	
system_setup:
	;; Get current_PID, if it's not 1, HALT
	BNEQ	+system_setup_denied	*+current_PID	1
	
	;; Get the base of the process that called SysCall[1]
	;; For now I'll assume only init can use it, and thus I'll use
	;; the bus controller to find init's base. 
	COPY	%G5		*+kernel_limit			; Init base 
	COPY	%G0		+next_free_RAM  	; to overwrite init
	COPY	*%G0	%G5					
	COPY	%G0		+return
	CALL	+process_table_Remove_Args	*%G0
	COPY	*%SP	1
	CALL	+process_table_Remove	*%G0	;Remove process 1 (init) from process table 
	
	COPY	%G1		0x103c				; type of next Rom

system_setup_copy:	
	BNEQ	+system_setup_complete		*%G1		2
	ADDUS	%G1		%G1		4
	COPY	%G2		*%G1				;%G2 has base of new program
	ADDUS	%G1		%G1		4
	COPY	%G3		*%G1				;%G3 has limit of new program
	ADDUS	%G1		%G1		4
	
	;; Copy program to RAM
	CALL	+copy_Args		*%G0
	COPY	*%SP	%G2					; Base of new program ROM
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G3					; Limit of new program ROM
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+next_free_RAM		; next free RAM 
	CALL	+copy	*%G0
	
	;; Put program in ProcessTable (need: Base, Limit, Status, Parent)
	CALL	+process_table_Add_Args		*%G0
	COPY	*%SP	*+next_free_RAM
	SUBUS	%SP		%SP		4
	SUBUS	%G4		%G3		%G2			; Length of program
	ADDUS	%G4		%G4		*+next_free_RAM		; it's limit in ram
	COPY	*%SP	%G4
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x01				; Assuming all initialized progs are active for now 
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+current_PID		; init is the parent 
	CALL	+process_table_Add		*%G0
	
	;;Loop
	JUMP	+system_setup_copy
		
system_setup_complete:
	JUMP	+process_table_Run_Next

system_setup_denied:
	;; only process 1 (init) can use the system_setup call.
	HALT

system_exit:
	;; Will halt for now (system.exit)
	COPY	%G0		+return
	CALL	+process_table_Remove_Args	*%G0
	COPY	*%SP	*+current_PID
	CALL	+process_table_Remove	*%G0
	JUMP	+process_table_Run_Next

	
system_fork:
	;; Will halt for now (system.fork) 
	HALT	
	
	;; Save temp in process table entry of current process 
	;; Need process_table_Update_Process_Current function


;;;These functions are used to manipulate the process table.

;;; Process Add Function: Prepares process table for the new process (some info not updated)
;;; Typically called right before process is copied into ram. Auto adds 720 extra space to process's limit.
;;; args: 1. BASE(in ram), 2. LIMIT, 3. ACTIVE, 4. Parent PID    results: 0
process_table_Add_Args:
	JUMP +fArgs

process_table_Add:
	SUBUS	%SP		%SP		4
	COPY	*%SP	0
	COPY	%G0		+return2
	CALL	+fCall	*%G0
	
	COPY	%G0		*%FP				;%G0 is BASE
	ADDUS	%FP		%FP		4
	ADDUS	%G1		*%FP	0x5000		;%G1 is LIMIT
	ADDUS	%FP		%FP		4
	COPY	%G2		*%FP				;%G2 is ACTIVE
	ADDUS	%FP		%FP		4
	COPY	%G3		*%FP				;%G3 is Parent PID
	COPY	*%FP		0x00				; 0 means no pocket space in PT

	COPY	%G4		*+next_free_process	;%G4 has next empty space in process table
	
	;; Checking for pocket space 
	BEQ		+PTA1		*+process_table_pocket_space		0
	COPY	*%FP		1						;means don't change next_free_process later
	COPY	%G4		+return
	CALL	+search_Args		*%G4
	COPY	*%SP	0				; Item (is an empty space)
	SUBUS	%SP		%SP		4
	ADDUS	*%SP	*+process_table_base	56	;Base (entry after kernel)
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+process_table_limit		;Limit
	SUBUS	%SP		%SP		4
	COPY	*%SP	56							;Increment(only looking at pids)
	CALL	+search		*%G4
	COPY	%G4		*%SP		; Copy base of free_space to %G4
	ADDUS	%SP		%SP		4	;put SP back
	
	
PTA1:
	COPY	*%G4	*+total_PIDs	; PID# is the number of current total pids seen
	COPY	%G5		+total_PIDs
	ADDUS	*%G5	*+total_PIDs	1
	ADDUS	%G4		%G4		4
	COPY	*%G4	%G2			;Is process active? 
	ADDUS	%G4		%G4		4
	
	COPY	*%G4	%G1			;The current stack pointer (the limit of the prog by default)
	ADDUS	%G4		%G4		4
	COPY	*%G4	%G1			;The current frame pointer (the limit of the prog by default)
	ADDUS	%G4		%G4		4
								; incremented 16 since PID
	
	COPY	*%G4	0			; Saving all registers as 0 by default. 
	ADDUS	%G4		%G4		4
	COPY	*%G4	0			; %G1
	ADDUS	%G4		%G4		4
	COPY	*%G4	0			;G2
	ADDUS	%G4		%G4		4
	COPY	*%G4	0			;G3
	ADDUS	%G4		%G4		4
	COPY	*%G4	0			;G4
	ADDUS	%G4		%G4		4
	COPY	*%G4	0			;G5
	ADDUS	%G4		%G4		4
								; Incremented 40 since PID
	COPY	*%G4	%G0			;Input base
	ADDUS	%G4		%G4		4
	COPY	*%G4	%G1			;Input limit
	ADDUS	%G4		%G4		4
	COPY	*%G4	0x00		;Current IP is defaulted to 0 (will be offset in virtual mode)
	ADDUS	%G4		%G4	4
	COPY	*%G4	%G3			;Input Parent PID
	ADDUS	%G4		%G4		4
	
	;If *%FP is 0 next_free_process gets updated. Else, this gets skipped.
	BEQ		+PTA2	*%FP		1
	COPY	%G5		+next_free_process
	COPY	*%G5	%G4			;remembers next free space
								; Incremented 56 to get to next PID space.
	JUMP	+PTA3
PTA2:
	;; Will clear process_table_pocket_space if no pockets are left.
	BNEQ	+PTA3	%G4		*+next_free_process
	COPY	%G5		+process_table_pocket_space
	COPY	*%G5	0x00
PTA3:
	;; if the limit is bigger than the next_free_RAM, change next_free_RAM
	BLT		+process_table_Add_complete		%G1		*+next_free_RAM
	COPY	%G0		+next_free_RAM
	COPY	*%G0	%G1
process_table_Add_complete:
	COPY	%G0		+process_table_total_processes			; if kernel is being added.
	ADDUS	*%G0	*%G0	1
process_table_Add_completeB:
	JUMP	+fDone			 		;Complete 
	


;;; Process Remove function (pid), results: 0
process_table_Remove_Args:
	JUMP	+fArgs
	
process_table_Remove:
	SUBUS	%SP	%SP	4
	COPY	*%SP	0
	COPY	%G0		+return2
	CALL	+fCall	*%G0

	COPY	%G0		+return
	CALL	+process_table_Search_Args	*%G0	
	COPY	*%SP		*%FP				; put PID as PT search argument
	CALL	+process_table_Search	*%G0
	COPY	%G1		*%SP				; G1 has address of target pid
	ADDUS	%SP	%SP	4				; put SP back where it belongs

	BEQ		+process_table_Remove_fail 	%G1		0
	COPY	%G0		0
PTR1:
	;; Clearing process table entry 
	BEQ		+process_table_Remove_complete	%G0		56
	COPY	*%G1	0
	ADDUS	%G1		%G1		4
	ADDUS	%G0		%G0		4
	JUMP	+PTR1
	
process_table_Remove_complete:
	;; Remove complete
	COPY	%G0		+process_table_pocket_space
	COPY	*%G0	0x01
	COPY	%G0		+process_table_pointer_count
	SUBUS	*%G0	*%G0	1
	COPY	%G0		+process_table_total_processes
	SUBUS	*%G0	*%G0	1
	COPY	%G0		+process_table_pointer
	SUBUS	*%G0	*%G0	56
	JUMP	+fDone
	
process_table_Remove_fail:
	COPY	%G2		1 	 	;for debugging
	HALT			; Could not find PID to remove process 
	
	
	
;;; process_table Run Next Process (), results: 0
;;; Just jump to process_table_Run_Next; Do not Call it, it will not return. 
;;; Increments current_PID and then runs that process. 
	;; Puts current_PID in register 1 for p_t_Run_Process(%G1)
process_table_Run_Next:	
	;; Save kernel's state in PT 
	SUBUS	%SP		%SP		16
	COPY	*%SP	%G0				;saving G0 contents 
	ADDUS	%SP		%SP		16
	COPY	%G0		+return
	
	CALL	+process_table_Update_Process_Args	*%G0
	
	SUBUS	%SP		%SP		12
	COPY	%G0		+reg0			
	COPY	*%G0	*%SP			;put in real G0 contents
	ADDUS	%SP		%SP		12
	
	COPY	%G0		+return
	COPY	*%SP	0x00					; PT_update 1st arg, PID of kernel
	SUBUS	%SP		%SP		4
	COPY	*%SP	0x01					; PT_update 2nd arg, status 
	CALL	+process_table_Update_Process	*%G0
	
	
process_table_Run_again:
	;; HALT if there are no more processes to run.
	BEQ		+process_table_Run_Next_none	*+process_table_total_processes		1
	COPY	%G1		+process_table_pointer_count
	COPY	%G0		+process_table_pointer
	ADDUS	*%G1		*%G1	1
	ADDUS	*%G0		*%G0	56
	
	;; Pointer loops back to 0x01 if it goes past the total amount of processes
	BGT		+process_table_Run_Next_loop	*%G1	*+process_table_total_processes
	COPY	%G1		*%G0
	BEQ		+process_table_Run_Next_search	*%G1	0
	
	;; Put PID in %G1 and jump to process_table_Run_Process()
	;; it needs PID in %G1 to be used.
	COPY	%G0		+current_PID
	COPY	*%G0	*%G1			;update current_PID
	COPY	%G1		*+current_PID
	JUMP	+process_table_Run_Process		;Run's the process 
	
	;; Looking for next process in process table
process_table_Run_Next_search:
	BGTE	+process_table_Run_Next_loop	*%G0	*+next_free_process
	ADDUS	*%G0	*%G0	56		; Look for next process	
	COPY	%G1		*%G0			; Copy value into %G1 to check
	BEQ		+process_table_Run_Next_search	*%G1	0
	COPY	%G0		+current_PID
	COPY	*%G0	*%G1			;update current_PID
	COPY	%G1		*%G1
	JUMP	+process_table_Run_Process
	
	;; Loops pointer back to 0x01 process when it goes too far.
process_table_Run_Next_loop:
	COPY	%G1		+process_table_pointer_count
	COPY	*%G1	1				; Gets incremented to 1 at process_table_Run_Next
	COPY	%G1		+process_table_pointer_base
	COPY	%G0		+process_table_pointer
	COPY	*%G0	*%G1
	JUMP	+process_table_Run_again
	

process_table_Run_Next_none:
	HALT			; No more processes to run 	
	
	
;;; Process Table Run Process (PID), results: 0
;;; Run's process with specified PID. Argument taken by register 1.
;;; Does not use kernel's Stack; saves kernel info in PT, clears registers;
	;; So jump to process_table_Run_Process, not call. 
	
process_table_Run_Process:
	;; Assuming %G1 has the PID 
	COPY	%G0		+return
	CALL	+process_table_Search_Args	*%G0
	COPY	*%SP	%G1
	CALL	+process_table_Search	*%G0
	COPY	%G2		*%SP
	ADDUS	%SP		%SP		4
	
	BEQ		+process_table_Run_Process_fail		%G2		0
	ADDUS	%G2		%G2		40			; Looking at process's Base
	COPY	%G0		+BS
	COPY	*%G0	*%G2
	SETBS	*%G2
	ADDUS	%G2		%G2		4			; Looking at process's Limit
	COPY	%G0		+LM
	COPY	*%G0	*%G2
	SETLM	*%G2
	
	ADDUS	%G2		%G2		4			; Find current IP
	COPY	%G0		+process_table_Run_jump_address
	COPY	*%G0	*%G2				; saved jump_address, (not yet offset by BS)
	
	;; Should clock be on if total_processes < 2? (Unless debugging) 
	;; Will keep it on for now.
	
	
	;; Restore Registers
	COPY	%G0		+return
	CALL	+process_table_Restore_Args		*%G0
	COPY	*%SP	%G1							; Assumes PID is in %G1 
	CALL	+process_table_Restore	*%G0		; restores registers 
	BLT		+process_table_Run_one		*+process_table_total_processes		2
	SETALM	*+ALM	0x01				; if it's only one process, alarm not set.
	JUMPMD	*+process_table_Run_jump_address		0x06	; Jump to that IP, and offsets by BS.

process_table_Run_one:
	JUMPMD	*+process_table_Run_jump_address		0x06	; Jump to that IP, and offsets by BS.
	
	
process_table_Run_Process_fail:
	HALT			; Could not find PID to run process 
 	
	

;;; Process Table Update function (status), results: 0
;;;	Updates the last interrupted process's PT information
;;; Jumps to next ready process 

process_table_Update_Args:
	JUMP	+fArgs

process_table_Update:
	SUBUS	%SP	%SP	4
	COPY	*%SP	0
	COPY	%G0		+return2
	CALL	+fCall	*%G0
	
	;; Updating Current Process 
	COPY	%G0		*+reg0
	COPY	%G1		+reg00
	COPY	*%G1	%G0 
	COPY	%G0		*+reg1
	COPY	%G1		+reg01
	COPY	*%G1	%G0 
	COPY	%G0		*+reg2
	COPY	%G1		+reg02
	COPY	*%G1	%G0 
	COPY	%G0		*+reg3
	COPY	%G1		+reg03
	COPY	*%G1	%G0 
	COPY	%G0		*+reg4
	COPY	%G1		+reg04
	COPY	*%G1	%G0 
	COPY	%G0		*+reg5
	COPY	%G1		+reg05
	COPY	*%G1	%G0 
	COPY	%G0		+oldSP2
	COPY	*%G0	%SP			; Copied fCall's SP into oldSP2
	COPY	%G0		+oldFP2
	COPY	*%G0	%FP

	COPY	%G0		+return 
	COPY	%G1		*%FP		; G1 has status 
	COPY	%SP		*+process_SP	; SP has the sp it had when update args was called 
	COPY	%FP		*+process_FP	; Suspicious 
	CALL	+process_table_Update_Process_Args	*%G0
	COPY	*%SP	*+current_PID
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G1
	
	COPY	%G0		*+reg00
	COPY	%G1		+reg0
	COPY	*%G1	%G0
	COPY	%G0		*+reg01
	COPY	%G1		+reg1
	COPY	*%G1	%G0
	COPY	%G0		*+reg02
	COPY	%G1		+reg2
	COPY	*%G1	%G0
	COPY	%G0		*+reg03
	COPY	%G1		+reg3
	COPY	*%G1	%G0
	COPY	%G0		*+reg04
	COPY	%G1		+reg4
	COPY	*%G1	%G0
	COPY	%G0		*+reg05
	COPY	%G1		+reg5
	COPY	*%G1	%G0
	
	CALL	+process_table_Update_Process	*%G0
	COPY	%SP		*+oldSP2
	COPY	%FP		*+oldFP2
	
	JUMP	+fDone
	
	

;;; Process Table Update Process function (pid, status), results : 0
;;; Updates a chosen process's PT information 
;;; Assumes all regs for process have been stored in temp space 
process_table_Update_Process_Args:
	JUMP	+fArgs
	
process_table_Update_Process:
	SUBUS	%SP	%SP	4
	COPY	*%SP	0
	COPY	%G0		+return2
	CALL	+fCall	*%G0
	
	COPY	%G0		+return
	CALL	+process_table_Search_Args	*%G0	
	COPY	*%SP	*%FP				; put PID as PT search argument
	ADDUS	%FP		%FP		4
	CALL	+process_table_Search	*%G0
	COPY	%G1		*%SP				; G1 has address of target pid
	ADDUS	%SP	%SP	4				; put SP back where it belongs
	
	BEQ		+process_table_Update_Process_fail	%G1		0
	ADDUS	%G1		%G1		4		; %G1 is looking at status of chosen PID
	COPY	*%G1	*%FP			; Input new status 
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+process_SP	; process's SP updated 
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+process_FP	; process's FP updated
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+reg0
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+reg1
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+reg2
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+reg3
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+reg4
	ADDUS	%G1		%G1		4
	COPY	*%G1	*+reg5
	ADDUS	%G1		%G1		12		;skip limit and base (they don't change)
	COPY	*%G1	*+IB			;copy where the interrupt took place (current IP)
	
	CALL	+process_table_Print	*%G0

	JUMP	+fDone					; should just jump to whatever called it 
	
process_table_Update_Process_fail:
	;; Could not find requested PID. Update Fail
	COPY	%G2		2 	 	;for debugging
	HALT 
	
	
		
;;; Process Table Search function(PID). returns the address of requested PID. 
process_table_Search_Args:
	SUBUS	%SP	%SP	4
	JUMP	+fArgs

process_table_Search:
	SUBUS	%SP	%SP	4
	COPY	*%SP	1
	COPY	%G0	+return2
	CALL	+fCall	*%G0
	
	COPY	%G0		+return
	CALL	+search_Args	*%G0
	COPY 	*%SP	*%FP		;give search the item (PID)
	SUBUS	%SP		%SP		4	
	COPY	*%SP	*+process_table_base	; give search the base 
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+process_table_limit	; give search the limit
	SUBUS	%SP		%SP		4
	COPY	*%SP	56				; give search the increment amount 
	CALL	+search		*%G0
	;; Search leaves the answer at the stack pointer
	ADDUS	%SP		%SP		4				;So we bury the answer, for fDone to find.
	JUMP	+fDone
	
	
;;; Process Restore function(PID). returns nothing
;;; It simply restores registers to how they were saved on the process table
process_table_Restore_Args:
	JUMP	+fArgs


process_table_Restore:
	SUBUS	%SP	%SP	4
	COPY	*%SP	0
	COPY	%G0	+return2
	CALL	+fCall	*%G0
	
	COPY	%G3			+process_table_Restore_jump_address
	COPY	*%G3		*+return 
	COPY	%G0		+return
	CALL	+process_table_Search_Args	*%G0
	COPY	*%SP	*%FP					;input PID to PT_Search
	CALL	+process_table_Search	*%G0
	COPY	%G1		*%SP					;%G1 has base of entry (or 0 if fail)
	ADDUS	%SP		%SP		4
	
	BEQ		+process_table_Restore_fail		%G1		0
	ADDUS	%G1		%G1		8			;%G1 is looking at SP in PT 
	SUBUS	%SP		*%G1	*+BS			; %SP restored
	ADDUS	%G1		%G1		4			; looking at FP
	COPY	%FP		*%G1				
	
	
	COPY	%G0		+reg0				; %G0 has +reg0 

	ADDUS	%G1		%G1		4			;%G1 is looking at %G0 in PT
	COPY	*%G0	*%G1				;put %G0 contents in reg0
	COPY	%G0		%G1					;%G0 becomes %G1
	ADDUS	%G0		%G0		4			
	COPY	%G1		*%G0				; so that %G1 can be restored 
	ADDUS	%G0		%G0		4
	COPY	%G2		*%G0
	ADDUS	%G0		%G0		4
	COPY	%G3		*%G0
	ADDUS	%G0		%G0		4
	COPY	%G4		*%G0
	ADDUS	%G0		%G0		4
	COPY	%G5		*%G0
	COPY	%G0		*+reg0
	
	JUMP	*+process_table_Restore_jump_address
	
process_table_Restore_fail:
	COPY	%G3		+current_PID
	COPY	%G2		3 	 	;for debugging
	;;Could not find PID. Could not restore.
	HALT
	

;; This function prints the current process table. Needs no arguments 
;; You lose %G0 though.
process_table_Print:
	COPY	%G0		+spot0
	COPY	*%G0	*+return
	COPY	%G0		+return
	CALL	+fArgs	*%G0
	COPY	*%G0	*+spot0
	
	
	COPY	*%SP	0
	COPY	%G0	+return2
	CALL	+fCall	*%G0
	
	COPY	%G0		*+process_table_base
	COPY	%G1		*+console_base

	
process_table_Print_tabdown:
	;; Tabs down after printing one PT attribute. 
	NOOP
	MOD		%G5		%G0		0x04
	BNEQ	+process_table_Print_begin		%G5		0
	BGTE		+process_table_Print_done		%G0		*+next_free_process
	BLT			+process_table_Print_done		%G0		*+process_table_base ;just in case 
	COPYB	*%G1	0x0b		; 0xb is vertical tab in aschii
	ADDUS	%G1		%G1		1
	COPYB	*%G1	0x30		; Attempting to put 0x in front of #s
	ADDUS	%G1		%G1		1
	COPYB	*%G1	0x78		; 0x78 is the x
	ADDUS	%G1		%G1		1
	
process_table_Print_begin:
	COPYB	%G2		*%G0		; Copy first two digits into %G2 
	ADDUS	%G0		%G0		1
	DIV		%G3		%G2		0x10	; %G3 gets 1st digit
	MOD		%G4		%G2		0x10	; %G4 gets 2nd digit
	BGT		+letters	%G3		0x09	; If it's a letter, it has different translation
	ADDUS	%G3		%G3		0x30		; Aschii number version
	COPYB	*%G1	%G3					; Copy to console 
	ADDUS	%G1		%G1		1	
	JUMP	+digit2
	
letters:
	ADDUS	%G3		%G3		87			; Aschii number version
	COPYB	*%G1	%G3					; Copy to console 
	ADDUS	%G1		%G1		1	

digit2:	
	BGT		+letters2	%G4		0x09	; If it's a letter, it has different translation
	ADDUS	%G4		%G4		0x30		; Aschii number version
	COPYB	*%G1	%G4					; Copy to console 
	ADDUS	%G1		%G1		1	
	JUMP	+process_table_Print_tabdown

letters2:
	ADDUS	%G4		%G4		87			; Aschii number version
	COPYB	*%G1	%G4					; Copy to console 
	ADDUS	%G1		%G1		1	
	JUMP	+process_table_Print_tabdown


process_table_Print_done:
	NOOP
	NOOP
	JUMP	+fDone



;;;STACKLESS FUNCTIONS: functions that do not use the stack (just call them; no set up)

;;; Save function/ does not use stack (just call it)
store_Regs:
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G0
	COPY	%G0		+reg0
	COPY	*%G0	*%SP
	ADDUS	%SP		%SP		4
	COPY	%G0		+reg1
	COPY	*%G0	%G1
	COPY	%G0		+reg2
	COPY	*%G0	%G2
	COPY	%G0		+reg3
	COPY	*%G0	%G3
	COPY	%G0		+reg4
	COPY	*%G0	%G4
	COPY	%G0		+reg5
	COPY	*%G0	%G5
	
	COPY	%G0		+oldSP
	
	COPY	*%G0	%SP
	COPY	%G0		+process_SP
	COPY	*%G0	%SP
	COPY	%G0		+process_FP
	COPY	*%G0	%FP
	
	COPY	%G0		*+reg0
	JUMP	*+return 
	
	
;;; Clear Registers function: clears registers / does not use stack (just call it)
clear_Regs:
	COPY	%G0	0x00
	COPY	%G1	0x00
	COPY	%G2	0x00
	COPY	%G3	0x00
	COPY	%G4	0x00
	COPY	%G5	0x00
	JUMP	*+return

;;; Function args: store current state of registers and %SP. Call before calling new function.
;;; User types an arg after calling fargs, then decrements SP, and types another arg.
;;; Every Stack-Function has an fArgs (i.e. someFunctionArgs) that's used before calling the function.
fArgs:
	SUBUS	%SP		%SP		4
	COPY	*%SP	%G0
	COPY	%G0		+return2		
	COPY	*%G0	*+return		;return2 has 0 in it, because return has 0 in it
	COPY	%G0		+return
	COPY	*%G0	+fA1			;return now brings you back to fArgs 
	COPY	%G0		*%SP
	ADDUS	%SP		%SP		4
	JUMP	+store_Regs
fA1:
	SUBUS	%SP		%SP		8
	COPY	*%SP	%G0
	COPY	%G0		+return
	COPY	*%G0	*+return2
	COPY	%G0		*%SP
	ADDUS	%SP		%SP		4
	JUMP	*+return
	
	;;Dead code
	COPY	*%SP	%FP
	COPY	%FP	+oldSP
	ADDUS	*%FP	%SP		4
	COPY	%FP	+reg0
	COPY	*%FP	%G0
	COPY	%FP	+reg1
	COPY	*%FP	%G1
	COPY	%FP	+reg2
	COPY	*%FP	%G2
	COPY	%FP	+reg3
	COPY	*%FP	%G3
	COPY	%FP	+reg4
	COPY	*%FP	%G4
	COPY	%FP	+reg5
	COPY	*%FP	%G5
	COPY	%FP	*%SP
	JUMP	*+return		;Allow %SP to stay decremented, to take first argument
	
;;; Function Call Prologue: Stores registers, old sp, return address, old fp, and arranges FP at args list.
;;; Every Stack-Function should start with fCall (after providing amount of expected results) 
fCall:	
	SUBUS	%G0		*+oldSP		28		;0x4f50
	SUBUS	%G2		*+oldSP		24
	COPY	%G3		*%SP				;%G3 has the amount of results expected from called function
	ADDUS	%G1		%SP			4		;%G1 is pointing to the last arg in the list of args 
fc1:									; Copying argument list (assuming args were added after fargs call)
	BGTE	+fc2	%G1		*+oldSP
	COPY	*%G0	*%G1
	SUBUS	%G0		%G0		4
	ADDUS	%G1		%G1		4
	JUMP	+fc1
fc2:
	COPY	*%G2	*+reg5
	ADDUS	%G2		%G2		4
	COPY	*%G2	*+reg4
	ADDUS	%G2		%G2		4
	COPY	*%G2	*+reg3
	ADDUS	%G2		%G2		4
	COPY	*%G2	*+reg2
	ADDUS	%G2		%G2		4
	COPY	*%G2	*+reg1
	ADDUS	%G2		%G2		4
	COPY	*%G2	*+reg0
	ADDUS	%G2		%G2		4		;%G2 should be at the old %SP position
	;;%G0 should be at the end of the copied argument list
	COPY	*%G0	%G2				; oldSP value saved
	SUBUS	%G0		%G0		4
	COPY	*%G0	*+return		; return address saved
	SUBUS	%G0		%G0		4
	COPY	*%G0	%FP				;Preserved frame pointer
	SUBUS	%G0		%G0		4
	COPY	*%G0	%G3				; Expected amount of results
	;; all of the above works correctly for process_table_Add
	COPY	%SP		%G0				;%SP in proper new position
	ADDUS	%G0		%G0		16
	COPY	%FP		%G0				;making FP point at beginning of arg list
	;; Check
	;;Clearing registers
	SUBUS	%SP		%SP		4
	COPY	*%SP	*+return
	COPY	%G0		+return
	CALL	+clear_Regs		*%G0	
	COPY	%G0		+return
	COPY	*%G0	*%SP
	ADDUS	%SP		%SP		4
	COPY	%G0		0x00
	
	JUMP	*+return2 				;done
	
	
;;; Function Done: Returns registers, SP, FP, and return address to their stored values. 
;;; Every finished stack-function should call fdone.
;;; Can only be used if %SP is in the place it was right after fcall was used. 
fDone:
	COPY	%G0	*%SP		;%G0 has expected amount of results
	COPY	%G1	%SP
	;; Restoring former SP, FP, and return address
	ADDUS	%SP	%SP	4
	COPY	%FP	*%SP		; Restored frame pointer
	ADDUS	%SP	%SP	4
	COPY	%G2	+return
	COPY	*%G2	*%SP	; Copied return address to temp space 
	ADDUS	%SP	%SP	4
	COPY	%G2	+oldSP
	COPY	*%G2	*%SP	; Copied old sp pointer to temp space 
							
	
	;; Checking for expected results
	SUBUS	%G1	%G1	4
	COPY	%G3	*+oldSP


fd1:
	BLTE	+fd2	%G0	0	;if results expected
	SUBUS	%G0	%G0	1
	COPY	*%G3	*%G1	;Copy result to old sp space
	SUBUS	%G1	%G1	4
	ADDUS	%G3	%G3	4
	JUMP	+fd1

	;; Restoring registers (part 1)
fd2:
	COPY	%SP	*+oldSP		
	SUBUS	%SP	%SP	4		
	
	COPY	%G0	*%SP
	SUBUS	%SP	%SP	4
	COPY	%G1	*%SP
	SUBUS	%SP	%SP	4
	COPY	%G2	*%SP
	SUBUS	%SP	%SP	4
	COPY	%G3	*%SP
	SUBUS	%SP	%SP	4
	COPY	%G4	*%SP
	SUBUS	%SP	%SP	4
	COPY	%G5	*%SP
	COPY	%SP	*+oldSP
	JUMP	*+return	;Jump to the return address specified in stack 
	

	;; check if file exists, returns block # if it does, returns 0 if it does not.
    ;; basically map's string to inode. Takes pointer to a filename as it's parameter. 
fileExists_Args:
	SUBUS	%SP	%SP	4
	JUMP	+fArgs

fileExists:
	SUBUS %SP %SP 4
	COPY *%SP 1
	COPY  %G0 +return2
	CALL +fCall *%G0

	;; block_trigger, block_base, block_limit, block_num
    ;COPY %G0    *+block_num
	;COPY *%G0 0x01          ;; first block, has filename -> inode number mappings
    ;COPY %G0    *+block_trigger
	;COPY *%G0 0x00
    
    COPY %G0 +return
    CALL +open_Block_Args *%G0
    COPY *%SP 1
    CALL +open_Block *%G0

    COPY %G3 0x0                ;; offset within the files we are looking at
    COPY %G4 *+block_base       ;; %G5 has the block base

	ADDUS %G0 %G3 *%FP          ;; %G0 now holds the first (only) argument, which is the address holding the base of the string filename
	COPYB %G1 *%G0              ;; %G1 now holds the first byte of this file name
    
    ADDUS %G0 %G3 %G4           ;; %G0 now points to the first character in the file table
    COPYB %G2 *%G0              ;; %G4 now holds that first byte of this file name


    searchFilesTop:             ;; outer loop (goes through each filename in the table)
        BGTE +searchFilesFail %G4 *+block_buffer_limit          ;; if we searched entire file table, we couldn't find it.

    parseFileNameTop: ;; inner loop (goes through characters in filename)
        BGTE +parseFileNameEnd %G3 12

        ADDUS %G0 %G3 *%FP          ;; %G0 now holds the first (only) argument, which is the address holding the base of the string filename
        COPYB %G1 *%G0              ;; %G1 now holds the first byte of this file name

        ADDUS %G0 %G3 %G4           ;; %G0 now points to the first character in the file table
        COPYB %G2 *%G0              ;; %G4 now holds that first byte of this file name

        BNEQ +parseFileFail %G1 %G2 ;; if the two characters don't match, then move to next entry.
        ADDUS %G3 %G3 1             ;; if they do match, try next char in filename and in table entry name.
        JUMP +parseFileNameTop

    parseFileNameEnd:               ;; file found at this point!
        ADDUS %G4 %G4 12            ;; %G4 points to the block number of found file
        SUBUS %SP %SP 4             ;; begin burying result.
        COPY *%SP *%G4              ;; save file number into stack where return value should be
        COPY %G0 +return
        ADDUS %SP %SP 4             ;; Since we decremented before calling fArgs, we have to increment it back
        CALL +print_Args *%G0
        COPY *%SP +file_found
        CALL +print *%G0
        JUMP +fDone


    parseFileFail:                  ;; Checked entry did not contain file name. So check next entry.
        COPY %G3 0x0                ;; reset offset
        ADDUS %G4 %G4 16            ;; increment %G4, which is the entry in the table we are looking at
        JUMP +searchFilesTop        ;; Jump back to the top and search again

    searchFilesFail:                ;; we searched entire file table and couldn't find file
        SUBUS %SP %SP 4
        COPY *%SP 0x00              ;; 0x00 will be this function's return value when file not found
        COPY %G0 +return
        ADDUS %SP %SP 4             ;; bury the result so that fDone will find it
        CALL +print_Args *%G0
        COPY *%SP +file_not_found
        CALL +print *%G0
        JUMP +fDone                 ;; Jump to fDone for epilogue



;;; print function(pointer to string), return value - none
;;; prints each character to the console until it reaches a null value.
print_Args:
    JUMP    +fArgs
    
print:
    SUBUS %SP %SP 4
	COPY *%SP 0
	COPY  %G0 +return2
	CALL +fCall *%G0

    COPY %G1 *%FP                   ;; %G1 has first address of string to be printed
    ADDUS %G3 0x190 *+console_base         ;; %G3 initializes to console_base
    COPY %G5 0x00
    
   ;; space_loop:
     ;;   BGTE +print_loop %G5 0x50
       ; ADDUS %G4 %G5 %G3
        ;ADDUS %G5 %G5 1
        ;COPYB %G4 0x20
        ;ADDUS %G4
    print_loop:
        COPYB %G0 *%G1                  ;; %G0 will carry the bytes
        COPYB *%G3 %G0                  ;; put %G0's character in console
        BEQ +print_done %G0 0           ;; break if character is null
        ADDUS %G3 %G3 1                 ;; move foward in console
        ADDUS %G1 %G1 1                 ;; move forward in string to be printed
        JUMP +print_loop
    print_done:
        JUMP +fDone

;;; prints "File Not Found" if input is 0
;;; prints "File Found!" if input is non-0
print_Result_Args:
    JUMP    +fArgs
    
print_Result:
    SUBUS %SP %SP 4
	COPY *%SP 0
	COPY  %G0 +return2
	CALL +fCall *%G0
    
    COPY %G0 *%FP
    BEQ +print_file_not_found %G0 0
        COPY %G0 +return
        CALL +print_Args *%G0
        COPY *%SP +file_found
        CALL +print *%G0
        JUMP +fDone


    
    print_file_not_found:
        CALL +print_Args *%G0
        COPY *%SP +file_not_found
        CALL +print *%G0
        JUMP +fDone

    
;;; Open Buffer Function: Inputs the block# into the block_device and triggers a read. 
;;; args: 1.block#  results: 0 

open_Block_Args: 
	JUMP +fArgs
	
open_Block: 
	SUBUS	%SP %SP 4
	COPY	*%SP	0
	COPY	%G0 +return2
	CALL	+fCall *%G0
	

	COPY	%G0	*%FP			;Gets block#

	SUBUS	%G1 *+block_limit 8	;Limit of block device-8
	COPY	*%G1 %G0			;Puts the block# at the limit(limit-8) of the block device
	
	ADDUS	%G1 %G1	4			;block_limit set to (limit-4)
	COPY	*%G1 0				;triggers read by inputting a 0 into the block device's r/w place
	
	JUMP	+fDone				;Jumps to fDone


	.Numeric
total_PIDs: 0x00	; total amount of pids
current_PID: 0x00	; current pid being used
process_table_base:	0x00	; Process table Base 
process_table_limit: 0x00	; Process table limit
next_free_process:	0x00		; Next free spot on process table (address)
process_table_pocket_space:	0x00	; If free space becomes segmented on the table 
process_table_total_processes:	0x00
process_table_pointer: 0x00		; Should point to current_PID
process_table_pointer_base:	0x00	; It's base is the PID of first process
process_table_pointer_count: 0x00	; Keeps track of which of the total processes it's on 
kernel_base:	0x00
kernel_limit:	0x00		; RAMkernal.limit
RAM_limit:		0x00		; Base of Ram 
RAM_pocket_space:	0x00	; Has a deleted program left space? (implement later)
next_free_RAM: 0x00			; next free space in ram (might implement later)
address_of_interruption: 0x00
console_base: 0x00
console_limit: 0x00

BS: 0x00		; Run_next updates BS and LM
LM: 0x00
ALM: 0x00		; Trying to figure out how to use alarm 
ALM2: 0x00
IB:	0x101			; has interrupt information 


;;; These temporary variables are for calling functions
return: 0x00	;call sends return addresses here
return2: 0x00	;
process_table_Restore_jump_address: 0x00
process_table_Run_jump_address:	0x00	;The interrupted IP of target process
oldSP:	0x00	;keeps track of last SP position
process_SP:	0x00	;interrupts save process's SP and FP here
process_FP:	0x00
	;; These variables are where a functions regs are stored temporarily
spot0: 0x00
reg0: 0x00
reg1: 0x00
reg2: 0x00
reg3: 0x00 
reg4: 0x00
reg5: 0x00
reg00: 0x00
reg01: 0x00
reg02: 0x00
reg03: 0x00
reg04: 0x00
reg05: 0x00
oldSP2:	0x00
oldFP2: 0x00
kernel_SP: 0x00
kernel_FP: 0x00
block_base: 0x00
block_limit: 0x00
block_num: 0x00
block_trigger: 0x00
block_buffer_limit: 0x00

	;; Will load the next program, and run it in user mode
	;; Doesn't matter if programs don't finish. 

.Text

file_name: "somefile.txt"
file_not_found: "file does not exists"
file_found: "file found!"

