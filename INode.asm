;;; Stub code

	.Code

	;; The kernel will have placed the process's allocation size (i.e., its virtual limit) in %SP, thus initializing the stack.
	;; Initialize fp.
	COPY		%FP		%SP				; fp = sp

	;; Call main() to enter the program proper.
	SUBUS		%SP		%SP		12		; Push: pfp / ra / rv
	COPY		*%SP		%FP				; pfp = fp
	COPY		%FP		%SP				; fp = sp
	ADDUS		%G0		%FP		4		; %G0 = &ra
	CALL		+_procedure_main		*%G0		; Call main().

	;; Exit, copying the return value from main() as the result code.
	ADDUS		%SP		%SP		4		; Pop: pfp / ra; push: syscall 
	COPY		*%SP		0x1001				; syscall 
	SYSC

	.Code

	;; Procedure entry point
_procedure_init:
	;; Callee for init: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0x00001000 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0x00001000				; Copy the value

	;; Call to =:   Argument #0
	;; Reference device_table_entry_ptr
	;; Push the address of dynamic variable device_table_entry_ptr

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; While 37: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_init_loop_37_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Push integer value 5 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		5				; Copy the value

	;; Call to ==:   Argument #0
	;; Dereference #24: Prelude -- evaluate the src pointer
	;; Identifier evaluation: device_table_entry_ptr

	;; Evaluate dynamic variable device_table_entry_ptr
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 37: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_init_loop_37_end		%G0		0		; Jump if false
	;; While 37: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 12 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		12				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: device_table_entry_ptr

	;; Evaluate dynamic variable device_table_entry_ptr
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference device_table_entry_ptr
	;; Push the address of dynamic variable device_table_entry_ptr

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 37: (d) Iterate
	JUMP		_procedure_init_loop_37_top						; Jump to top of loop
	;; While 37: (e) Loop's end
_procedure_init_loop_37_end:
	NOOP								; Placeholder
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #46: Prelude -- evaluate the src pointer
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: device_table_entry_ptr

	;; Evaluate dynamic variable device_table_entry_ptr
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference block_base
	;; Reference static variable block_base: 
	SUBUS		%SP		%SP		4		; Push pointer space
	COPY		*%SP		_static_block_base				; Copy address
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #56: Prelude -- evaluate the src pointer
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 8 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		8				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: device_table_entry_ptr

	;; Evaluate dynamic variable device_table_entry_ptr
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference block_limit
	;; Reference static variable block_limit: 
	SUBUS		%SP		%SP		4		; Push pointer space
	COPY		*%SP		_static_block_limit				; Copy address
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
_procedure_init_epilogue:
	;; Callee for init: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		4		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_block_device_write:
	;; Callee for block_device_write: (prologue) Push locals
	SUBUS		%SP		%SP		20		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: ram_loc_start

	;; Evaluate dynamic variable ram_loc_start
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference ram_location
	;; Push the address of dynamic variable ram_location

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: block_base

	;; Evaluate static variable block_base: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_base: (b) Copy single-word value
	COPY		*%SP		*_static_block_base				; Copy value
	;; Call to =:   Argument #0
	;; Reference block_counter
	;; Push the address of dynamic variable block_counter

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4096 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4096				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: block_base

	;; Evaluate static variable block_base: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_base: (b) Copy single-word value
	COPY		*%SP		*_static_block_base				; Copy value
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference block_stop
	;; Push the address of dynamic variable block_stop

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-8		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; While 133: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_block_device_write_loop_133_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: block_counter

	;; Evaluate dynamic variable block_counter
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: block_stop

	;; Evaluate dynamic variable block_stop
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 133: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_block_device_write_loop_133_end		%G0		0		; Jump if false
	;; While 133: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; While 131: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_block_device_write_loop_131_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4096 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4096				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: ram_loc_start

	;; Evaluate dynamic variable ram_loc_start
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to ==:   Argument #0
	;; Identifier evaluation: ram_location

	;; Evaluate dynamic variable ram_location
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 131: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_block_device_write_loop_131_end		%G0		0		; Jump if false
	;; While 131: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #112: Prelude -- evaluate the src pointer
	;; Identifier evaluation: ram_location

	;; Evaluate dynamic variable ram_location
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Identifier evaluation: block_counter

	;; Evaluate dynamic variable block_counter
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: block_counter

	;; Evaluate dynamic variable block_counter
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference block_counter
	;; Push the address of dynamic variable block_counter

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: ram_location

	;; Evaluate dynamic variable ram_location
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference ram_location
	;; Push the address of dynamic variable ram_location

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 131: (d) Iterate
	JUMP		_procedure_block_device_write_loop_131_top						; Jump to top of loop
	;; While 131: (e) Loop's end
_procedure_block_device_write_loop_131_end:
	NOOP								; Placeholder
	;; While 133: (d) Iterate
	JUMP		_procedure_block_device_write_loop_133_top						; Jump to top of loop
	;; While 133: (e) Loop's end
_procedure_block_device_write_loop_133_end:
	NOOP								; Placeholder
	;; Statement #4 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: block_limit

	;; Evaluate static variable block_limit: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_limit: (b) Copy single-word value
	COPY		*%SP		*_static_block_limit				; Copy value
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference block_touch
	;; Push the address of dynamic variable block_touch

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-20		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #5 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 8 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		8				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: block_limit

	;; Evaluate static variable block_limit: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_limit: (b) Copy single-word value
	COPY		*%SP		*_static_block_limit				; Copy value
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference page
	;; Push the address of dynamic variable page

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-12		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #6 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: page_no

	;; Evaluate dynamic variable page_no
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Identifier evaluation: page

	;; Evaluate dynamic variable page
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #7 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to =:   Argument #0
	;; Identifier evaluation: block_touch

	;; Evaluate dynamic variable block_touch
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
_procedure_block_device_write_epilogue:
	;; Callee for block_device_write: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_block_device_read:
	;; Callee for block_device_read: (prologue) Push locals
	SUBUS		%SP		%SP		20		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: ram_loc_start

	;; Evaluate dynamic variable ram_loc_start
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference ram_location
	;; Push the address of dynamic variable ram_location

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: block_base

	;; Evaluate static variable block_base: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_base: (b) Copy single-word value
	COPY		*%SP		*_static_block_base				; Copy value
	;; Call to =:   Argument #0
	;; Reference block_counter
	;; Push the address of dynamic variable block_counter

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4096 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4096				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: block_base

	;; Evaluate static variable block_base: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_base: (b) Copy single-word value
	COPY		*%SP		*_static_block_base				; Copy value
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference block_stop
	;; Push the address of dynamic variable block_stop

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-8		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; While 233: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_block_device_read_loop_233_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: block_counter

	;; Evaluate dynamic variable block_counter
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: block_stop

	;; Evaluate dynamic variable block_stop
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 233: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_block_device_read_loop_233_end		%G0		0		; Jump if false
	;; While 233: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; While 231: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_block_device_read_loop_231_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4096 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4096				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: ram_loc_start

	;; Evaluate dynamic variable ram_loc_start
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to ==:   Argument #0
	;; Identifier evaluation: ram_location

	;; Evaluate dynamic variable ram_location
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 231: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_block_device_read_loop_231_end		%G0		0		; Jump if false
	;; While 231: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #212: Prelude -- evaluate the src pointer
	;; Identifier evaluation: block_counter

	;; Evaluate dynamic variable block_counter
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Identifier evaluation: ram_location

	;; Evaluate dynamic variable ram_location
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: block_counter

	;; Evaluate dynamic variable block_counter
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference block_counter
	;; Push the address of dynamic variable block_counter

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: ram_location

	;; Evaluate dynamic variable ram_location
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference ram_location
	;; Push the address of dynamic variable ram_location

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 231: (d) Iterate
	JUMP		_procedure_block_device_read_loop_231_top						; Jump to top of loop
	;; While 231: (e) Loop's end
_procedure_block_device_read_loop_231_end:
	NOOP								; Placeholder
	;; While 233: (d) Iterate
	JUMP		_procedure_block_device_read_loop_233_top						; Jump to top of loop
	;; While 233: (e) Loop's end
_procedure_block_device_read_loop_233_end:
	NOOP								; Placeholder
	;; Statement #4 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: block_limit

	;; Evaluate static variable block_limit: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_limit: (b) Copy single-word value
	COPY		*%SP		*_static_block_limit				; Copy value
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference block_touch
	;; Push the address of dynamic variable block_touch

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-20		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #5 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 8 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		8				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: block_limit

	;; Evaluate static variable block_limit: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable block_limit: (b) Copy single-word value
	COPY		*%SP		*_static_block_limit				; Copy value
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference page
	;; Push the address of dynamic variable page

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-12		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #6 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: page_no

	;; Evaluate dynamic variable page_no
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Identifier evaluation: page

	;; Evaluate dynamic variable page
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #7 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to =:   Argument #0
	;; Identifier evaluation: block_touch

	;; Evaluate dynamic variable block_touch
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
_procedure_block_device_read_epilogue:
	;; Callee for block_device_read: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_make_new:
	;; Callee for make_new: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to =:   Argument #0
	;; Reference index
	;; Push the address of dynamic variable index

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; While 290: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_make_new_loop_290_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Push integer value 4096 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4096				; Copy the value

	;; Call to ==:   Argument #0
	;; Identifier evaluation: index

	;; Evaluate dynamic variable index
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 290: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_make_new_loop_290_end		%G0		0		; Jump if false
	;; While 290: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0x00000000 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0x00000000				; Copy the value

	;; Call to =:   Argument #0
	;; Reference pointer
	;; Push the address of dynamic variable pointer

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		0		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: index

	;; Evaluate dynamic variable index
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference index
	;; Push the address of dynamic variable index

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 290: (d) Iterate
	JUMP		_procedure_make_new_loop_290_top						; Jump to top of loop
	;; While 290: (e) Loop's end
_procedure_make_new_loop_290_end:
	NOOP								; Placeholder
_procedure_make_new_epilogue:
	;; Callee for make_new: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		8		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_set_immediate_data:
	;; Callee for set_immediate_data: (prologue) Push locals
	SUBUS		%SP		%SP		20		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0x00f00000 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0x00f00000				; Copy the value

	;; Call to =:   Argument #0
	;; Reference ramSpace
	;; Push the address of dynamic variable ramSpace

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to block_device_read: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		8		; Push pfp/ra[/rv] spaces
	;; Call to block_device_read: (prologue b) Evaluate and push arguments
	;; Call to block_device_read:   Argument #1
	;; Identifier evaluation: ramSpace

	;; Evaluate dynamic variable ramSpace
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to block_device_read:   Argument #0
	;; Identifier evaluation: inode_num

	;; Evaluate dynamic variable inode_num
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to block_device_read: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to block_device_read
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_block_device_read		*%G0				; Do call
	;; Call to block_device_read: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to block_device_read: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Identifier evaluation: offset

	;; Evaluate dynamic variable offset
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +:   Argument #0
	;; Identifier evaluation: ramSpace

	;; Evaluate dynamic variable ramSpace
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference place
	;; Push the address of dynamic variable place

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-8		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; If-then 388: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to -:   Argument #0
	;; Push integer value 2048 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		2048				; Copy the value

	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to <:   Argument #0
	;; Identifier evaluation: data_len

	;; Evaluate dynamic variable data_len
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 388: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_set_immediate_data_branch_388_end		%G0		0		; If false, jump over then-branch
	;; If-then 388: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to =:   Argument #0
	;; Reference ptr
	;; Push the address of dynamic variable ptr

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; While 386: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_set_immediate_data_loop_386_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: data_len

	;; Evaluate dynamic variable data_len
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: ptr

	;; Evaluate dynamic variable ptr
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 386: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_set_immediate_data_loop_386_end		%G0		0		; Jump if false
	;; While 386: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #351: Prelude -- evaluate the src pointer
	;; Identifier evaluation: data

	;; Evaluate dynamic variable data
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		1		; Push dst space
	COPY		%G1		%SP				; %G1 = dst
	COPY		%G2		0				; %G2 = i (words to copy)
_set_immediate_data_dereference_loop_351_top:
	BEQ		+_set_immediate_data_dereference_loop_351_end		%G2		0		; If i == 0, jump endLabel
	COPY		*%G1		*%G0				; *dst = *src
	ADDUS		%G0		%G0		4		; src++
	ADDUS		%G1		%G1		4		; dst++
	SUB		%G2		%G2		1		; i--
	JUMP		+_set_immediate_data_dereference_loop_351_top						; End loop body
_set_immediate_data_dereference_loop_351_end:
	NOOP								; Dereference copy loop end placeholder
	;; Call to =:   Argument #0
	;; Identifier evaluation: place

	;; Evaluate dynamic variable place
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		5		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		9		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		5		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		13		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: ptr

	;; Evaluate dynamic variable ptr
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference ptr
	;; Push the address of dynamic variable ptr

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: data

	;; Evaluate dynamic variable data
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference data
	;; Push the address of dynamic variable data

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		0		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: place

	;; Evaluate dynamic variable place
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference place
	;; Push the address of dynamic variable place

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-8		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #4 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference length
	;; Reference static variable length: 
	SUBUS		%SP		%SP		4		; Push pointer space
	COPY		*%SP		_static_length				; Copy address
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 386: (d) Iterate
	JUMP		_procedure_set_immediate_data_loop_386_top						; Jump to top of loop
	;; While 386: (e) Loop's end
_procedure_set_immediate_data_loop_386_end:
	NOOP								; Placeholder
	;; If-then 388: (d) End
_set_immediate_data_branch_388_end:
	NOOP								; Placeholder for if-then 388
	;; Statement #4 of begin-end statement
	;; If-then 468: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to >: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to >: (prologue b) Evaluate and push arguments
	;; Call to >:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to -:   Argument #0
	;; Push integer value 2048 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		2048				; Copy the value

	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to >:   Argument #0
	;; Identifier evaluation: data_len

	;; Evaluate dynamic variable data_len
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to >: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to >
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_>		*%G0				; Do call
	;; Call to >: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to >: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 468: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_set_immediate_data_branch_468_end		%G0		0		; If false, jump over then-branch
	;; If-then 468: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to -:   Argument #0
	;; Push integer value 2048 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		2048				; Copy the value

	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to -:   Argument #0
	;; Identifier evaluation: data_len

	;; Evaluate dynamic variable data_len
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference len_left
	;; Push the address of dynamic variable len_left

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-12		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; While 444: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_set_immediate_data_loop_444_top:
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Push integer value 2048 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		2048				; Copy the value

	;; Call to ==:   Argument #0
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; While 444: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_set_immediate_data_loop_444_end		%G0		0		; Jump if false
	;; While 444: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #417: Prelude -- evaluate the src pointer
	;; Identifier evaluation: data

	;; Evaluate dynamic variable data
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		1		; Push dst space
	COPY		%G1		%SP				; %G1 = dst
	COPY		%G2		0				; %G2 = i (words to copy)
_set_immediate_data_dereference_loop_417_top:
	BEQ		+_set_immediate_data_dereference_loop_417_end		%G2		0		; If i == 0, jump endLabel
	COPY		*%G1		*%G0				; *dst = *src
	ADDUS		%G0		%G0		4		; src++
	ADDUS		%G1		%G1		4		; dst++
	SUB		%G2		%G2		1		; i--
	JUMP		+_set_immediate_data_dereference_loop_417_top						; End loop body
_set_immediate_data_dereference_loop_417_end:
	NOOP								; Dereference copy loop end placeholder
	;; Call to =:   Argument #0
	;; Identifier evaluation: place

	;; Evaluate dynamic variable place
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		5		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		9		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		5		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		13		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: data

	;; Evaluate dynamic variable data
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference data
	;; Push the address of dynamic variable data

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		0		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: place

	;; Evaluate dynamic variable place
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference place
	;; Push the address of dynamic variable place

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-8		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference length
	;; Reference static variable length: 
	SUBUS		%SP		%SP		4		; Push pointer space
	COPY		*%SP		_static_length				; Copy address
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 444: (d) Iterate
	JUMP		_procedure_set_immediate_data_loop_444_top						; Jump to top of loop
	;; While 444: (e) Loop's end
_procedure_set_immediate_data_loop_444_end:
	NOOP								; Placeholder
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to =:   Argument #0
	;; Reference block
	;; Push the address of dynamic variable block

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-20		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #3 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0x00e00000 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0x00e00000				; Copy the value

	;; Call to =:   Argument #0
	;; Reference ramSpace
	;; Push the address of dynamic variable ramSpace

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #4 of begin-end statement
	;; Call to write: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		8		; Push pfp/ra[/rv] spaces
	;; Call to write: (prologue b) Evaluate and push arguments
	;; Call to write:   Argument #2
	;; Identifier evaluation: len_left

	;; Evaluate dynamic variable len_left
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to write:   Argument #1
	;; Identifier evaluation: data

	;; Evaluate dynamic variable data
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to write:   Argument #0
	;; Push integer value 0x00000000 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0x00000000				; Copy the value

	;; Call to write: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		12		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to write
	ADDUS		%G0		%SP		16		; %G0 = &ra
	CALL		+_procedure_write		*%G0				; Do call
	;; Call to write: (epilogue a) Restore FP
	ADDUS		%G0		%FP		12		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to write: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		20		; Pop args/pfp/ra
	;; Statement #5 of begin-end statement
	;; Call to block_device_write: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		8		; Push pfp/ra[/rv] spaces
	;; Call to block_device_write: (prologue b) Evaluate and push arguments
	;; Call to block_device_write:   Argument #1
	;; Identifier evaluation: ramSpace

	;; Evaluate dynamic variable ramSpace
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to block_device_write:   Argument #0
	;; Identifier evaluation: block

	;; Evaluate dynamic variable block
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to block_device_write: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to block_device_write
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_block_device_write		*%G0				; Do call
	;; Call to block_device_write: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to block_device_write: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #6 of begin-end statement
	;; Call to set_direct_ptr: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		8		; Push pfp/ra[/rv] spaces
	;; Call to set_direct_ptr: (prologue b) Evaluate and push arguments
	;; Call to set_direct_ptr:   Argument #0
	;; Identifier evaluation: block

	;; Evaluate dynamic variable block
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to set_direct_ptr: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to set_direct_ptr
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_set_direct_ptr		*%G0				; Do call
	;; Call to set_direct_ptr: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to set_direct_ptr: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; If-then 468: (d) End
_set_immediate_data_branch_468_end:
	NOOP								; Placeholder for if-then 468
_procedure_set_immediate_data_epilogue:
	;; Callee for set_immediate_data: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		20		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_set_direct_ptr:
	;; Callee for set_direct_ptr: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to /: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to /: (prologue b) Evaluate and push arguments
	;; Call to /:   Argument #1
	;; Push integer value 4096 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4096				; Copy the value

	;; Call to /:   Argument #0
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 2048 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		2048				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to /: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to /
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_/		*%G0				; Do call
	;; Call to /: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to /: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference toSet
	;; Push the address of dynamic variable toSet

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Identifier evaluation: direct_indicies

	;; Evaluate static variable direct_indicies: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable direct_indicies: (b) Copy single-word value
	COPY		*%SP		*_static_direct_indicies				; Copy value
	;; Call to +:   Argument #0
	;; Identifier evaluation: toSet

	;; Evaluate dynamic variable toSet
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference toSet
	;; Push the address of dynamic variable toSet

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: block_number

	;; Evaluate dynamic variable block_number
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Identifier evaluation: toSet

	;; Evaluate dynamic variable toSet
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
_procedure_set_direct_ptr_epilogue:
	;; Callee for set_direct_ptr: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		8		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_get_length:
	;; Callee for get_length: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 503 from get_length: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: length

	;; Evaluate static variable length: (a) Allocate space at the top of the stack
	SUBUS		%SP		%SP		4		; Push space
	;; Evaluate static variable length: (b) Copy single-word value
	COPY		*%SP		*_static_length				; Copy value
	;; Return statement 503 from get_length: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 503 from get_length: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_get_length_epilogue						; Return to caller
_procedure_get_length_epilogue:
	;; Callee for get_length: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		4		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_write:
	;; Callee for write: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
_procedure_write_epilogue:
	;; Callee for write: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		16		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_read:
	;; Callee for read: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
_procedure_read_epilogue:
	;; Callee for read: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		16		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_=:
	;; Callee for =: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	4	; %G0 = &value
       COPY	 %G1	*%FP		; %G1 = destination
	      COPY	 *%G1	*%G0		; *destination = value
	;; Statement #1 of begin-end statement
	;; Return statement 533 from =: (a) Evaluate the expression and prepare the destination
	;; Dereference #532: Prelude -- evaluate the src pointer
	;; Identifier evaluation: destination

	;; Evaluate dynamic variable destination
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 533 from =: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 533 from =: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_=_epilogue						; Return to caller
_procedure_=_epilogue:
	;; Callee for =: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_bitand:
	;; Callee for bitand: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      AND	 *%G0	*%FP	*%G1	; result = x & y
	;; Statement #1 of begin-end statement
	;; Return statement 545 from bitand: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 545 from bitand: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 545 from bitand: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_bitand_epilogue						; Return to caller
_procedure_bitand_epilogue:
	;; Callee for bitand: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_bitor:
	;; Callee for bitor: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      OR	 *%G0	*%FP	*%G1	; result = x | y
	;; Statement #1 of begin-end statement
	;; Return statement 557 from bitor: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 557 from bitor: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 557 from bitor: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_bitor_epilogue						; Return to caller
_procedure_bitor_epilogue:
	;; Callee for bitor: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_bitnot:
	;; Callee for bitnot: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
	      NOT	 *%G0	*%FP		; result = ~x
	;; Statement #1 of begin-end statement
	;; Return statement 567 from bitnot: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 567 from bitnot: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 567 from bitnot: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_bitnot_epilogue						; Return to caller
_procedure_bitnot_epilogue:
	;; Callee for bitnot: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		8		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_<<:
	;; Callee for <<: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      SHFTL	 *%G0	*%FP	*%G1	; result = x << y
	;; Statement #1 of begin-end statement
	;; Return statement 579 from <<: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 579 from <<: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 579 from <<: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_<<_epilogue						; Return to caller
_procedure_<<_epilogue:
	;; Callee for <<: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_>>:
	;; Callee for >>: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      SHFTR	 *%G0	*%FP	*%G1	; result = x << y
	;; Statement #1 of begin-end statement
	;; Return statement 591 from >>: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 591 from >>: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 591 from >>: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>>_epilogue						; Return to caller
_procedure_>>_epilogue:
	;; Callee for >>: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_and:
	;; Callee for and: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 612: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 612: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_612_end		%G0		0		; If false, jump over then-branch
	;; If-then 612: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 610: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 610: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_610_end		%G0		0		; If false, jump over then-branch
	;; If-then 610: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 608 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 608 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 608 from and: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_and_epilogue						; Return to caller
	;; If-then 610: (d) End
_and_branch_610_end:
	NOOP								; Placeholder for if-then 610
	;; If-then 612: (d) End
_and_branch_612_end:
	NOOP								; Placeholder for if-then 612
	;; Statement #1 of begin-end statement
	;; Return statement 614 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 614 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 614 from and: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_and_epilogue						; Return to caller
_procedure_and_epilogue:
	;; Callee for and: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_or:
	;; Callee for or: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 629: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 629: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_629_end		%G0		0		; If false, jump over then-branch
	;; If-then 629: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 627 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 627 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 627 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 629: (d) End
_or_branch_629_end:
	NOOP								; Placeholder for if-then 629
	;; Statement #1 of begin-end statement
	;; If-then 637: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 637: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_637_end		%G0		0		; If false, jump over then-branch
	;; If-then 637: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 635 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 635 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 635 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 637: (d) End
_or_branch_637_end:
	NOOP								; Placeholder for if-then 637
	;; Statement #2 of begin-end statement
	;; Return statement 639 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 639 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 639 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
_procedure_or_epilogue:
	;; Callee for or: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_not:
	;; Callee for not: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then-else 650: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; If-then-else 650: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_not_branch_650_else		%G0		0		; If false, jump to else-branch
	;; If-then-else 650: (c) Then-branch
	;; Return statement 647 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 647 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 647 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	JUMP		_not_branch_650_end						; Jump over else-branch
	;; If-then-else650: (d) Else-branch
_not_branch_650_else:
	;; Return statement 649 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 649 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 649 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	;; If-then-else 650: (e) End
_not_branch_650_end:
	NOOP								; Placeholder for if-then-else 650
_procedure_not_epilogue:
	;; Callee for not: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		8		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_+:
	;; Callee for +: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      ADD	 *%G0	*%FP	*%G1	; result = x + y
	;; Statement #1 of begin-end statement
	;; Return statement 662 from +: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 662 from +: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 662 from +: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_+_epilogue						; Return to caller
_procedure_+_epilogue:
	;; Callee for +: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_-:
	;; Callee for -: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      SUB	 *%G0	*%FP	*%G1	; result = x - y
	;; Statement #1 of begin-end statement
	;; Return statement 674 from -: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 674 from -: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 674 from -: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_-_epilogue						; Return to caller
_procedure_-_epilogue:
	;; Callee for -: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_*:
	;; Callee for *: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      MUL	 *%G0	*%FP	*%G1	; result = x * y
	;; Statement #1 of begin-end statement
	;; Return statement 686 from *: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 686 from *: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 686 from *: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_*_epilogue						; Return to caller
_procedure_*_epilogue:
	;; Callee for *: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_/:
	;; Callee for /: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      DIV	 *%G0	*%FP	*%G1	; result = x / y
	;; Statement #1 of begin-end statement
	;; Return statement 698 from /: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 698 from /: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 698 from /: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_/_epilogue						; Return to caller
_procedure_/_epilogue:
	;; Callee for /: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_==:
	;; Callee for ==: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference difference
	;; Push the address of dynamic variable difference

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Return statement 719 from ==: (a) Evaluate the expression and prepare the destination
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Identifier evaluation: difference

	;; Evaluate dynamic variable difference
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Return statement 719 from ==: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 719 from ==: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_==_epilogue						; Return to caller
_procedure_==_epilogue:
	;; Callee for ==: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_!=:
	;; Callee for !=: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference difference
	;; Push the address of dynamic variable difference

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Return statement 738 from !=: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: difference

	;; Evaluate dynamic variable difference
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 738 from !=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 738 from !=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_!=_epilogue						; Return to caller
_procedure_!=_epilogue:
	;; Callee for !=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_<:
	;; Callee for <: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference result
	;; Push the address of dynamic variable result

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Return statement 760 from <: (a) Evaluate the expression and prepare the destination
	;; Call to >>: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to >>: (prologue b) Evaluate and push arguments
	;; Call to >>:   Argument #1
	;; Push integer value 31 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		31				; Copy the value

	;; Call to >>:   Argument #0
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to >>: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to >>
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_>>		*%G0				; Do call
	;; Call to >>: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to >>: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Return statement 760 from <: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 760 from <: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_<_epilogue						; Return to caller
_procedure_<_epilogue:
	;; Callee for <: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_>:
	;; Callee for >: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 782 from >: (a) Evaluate the expression and prepare the destination
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to or: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to or: (prologue b) Evaluate and push arguments
	;; Call to or:   Argument #1
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or:   Argument #0
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to or
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_or		*%G0				; Do call
	;; Call to or: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to or: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Return statement 782 from >: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 782 from >: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>_epilogue						; Return to caller
_procedure_>_epilogue:
	;; Callee for >: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_<=:
	;; Callee for <=: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 802 from <=: (a) Evaluate the expression and prepare the destination
	;; Call to or: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to or: (prologue b) Evaluate and push arguments
	;; Call to or:   Argument #1
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or:   Argument #0
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to or
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_or		*%G0				; Do call
	;; Call to or: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to or: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Return statement 802 from <=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 802 from <=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_<=_epilogue						; Return to caller
_procedure_<=_epilogue:
	;; Callee for <=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_>=:
	;; Callee for >=: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 818 from >=: (a) Evaluate the expression and prepare the destination
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Return statement 818 from >=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 818 from >=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>=_epilogue						; Return to caller
_procedure_>=_epilogue:
	;; Callee for >=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	.Numeric

_static_leading_immediate_data:	0
_static_direct_indicies:	0
_static_length:	0
_static_block_base:	0
_static_block_limit:	0
	.Text

