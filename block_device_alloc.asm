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
_procedure_block_device_alloc:
	;; Callee for block_device_alloc: (prologue) Push locals
	SUBUS		%SP		%SP		28		; Push locals

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
	;; Reference device
	;; Push the address of dynamic variable device

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
	;; Statement #1 of begin-end statement
	;; While 39: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_block_device_alloc_loop_39_top:
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
	;; Dereference #26: Prelude -- evaluate the src pointer
	;; Identifier evaluation: device

	;; Evaluate dynamic variable device
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
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
	;; While 39: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_block_device_alloc_loop_39_end		%G0		0		; Jump if false
	;; While 39: (c) Body

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
	;; Identifier evaluation: device

	;; Evaluate dynamic variable device
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
	;; Reference device
	;; Push the address of dynamic variable device

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
	;; While 39: (d) Iterate
	JUMP		_procedure_block_device_alloc_loop_39_top						; Jump to top of loop
	;; While 39: (e) Loop's end
_procedure_block_device_alloc_loop_39_end:
	NOOP								; Placeholder
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #48: Prelude -- evaluate the src pointer
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: device

	;; Evaluate dynamic variable device
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
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference base
	;; Push the address of dynamic variable base

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
	;; Statement #3 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #58: Prelude -- evaluate the src pointer
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 8 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		8				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: device

	;; Evaluate dynamic variable device
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
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference limit
	;; Push the address of dynamic variable limit

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
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #68: Prelude -- evaluate the src pointer
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: limit

	;; Evaluate dynamic variable limit
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
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
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference trigger
	;; Push the address of dynamic variable trigger

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-24		; src = %FP + offset
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
	;; Dereference #78: Prelude -- evaluate the src pointer
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Push integer value 8 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		8				; Copy the value

	;; Call to -:   Argument #0
	;; Identifier evaluation: limit

	;; Evaluate dynamic variable limit
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
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
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference blocknum
	;; Push the address of dynamic variable blocknum

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
	;; Statement #6 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to =:   Argument #0
	;; Dereference #83: Prelude -- evaluate the src pointer
	;; Identifier evaluation: blocknum

	;; Evaluate dynamic variable blocknum
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
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
	;; Dereference #89: Prelude -- evaluate the src pointer
	;; Identifier evaluation: trigger

	;; Evaluate dynamic variable trigger
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-24		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
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
	;; Statement #8 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #100: Prelude -- evaluate the src pointer
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 12 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		12				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: limit

	;; Evaluate dynamic variable limit
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
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference freeadd
	;; Push the address of dynamic variable freeadd

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-28		; src = %FP + offset
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
	;; Statement #9 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Dereference #107: Prelude -- evaluate the src pointer
	;; Identifier evaluation: freeadd

	;; Evaluate dynamic variable freeadd
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-28		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference free
	;; Push the address of dynamic variable free

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
	;; Statement #10 of begin-end statement
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
	;; Identifier evaluation: free

	;; Evaluate dynamic variable free
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
	;; Dereference #112: Prelude -- evaluate the src pointer
	;; Identifier evaluation: freeadd

	;; Evaluate dynamic variable freeadd
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-28		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
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
	;; Statement #11 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Call to =:   Argument #0
	;; Dereference #121: Prelude -- evaluate the src pointer
	;; Identifier evaluation: trigger

	;; Evaluate dynamic variable trigger
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-24		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
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
	;; Statement #12 of begin-end statement
	;; Return statement 125 from block_device_alloc: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: free

	;; Evaluate dynamic variable free
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 125 from block_device_alloc: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 125 from block_device_alloc: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_block_device_alloc_epilogue						; Return to caller
_procedure_block_device_alloc_epilogue:
	;; Callee for block_device_alloc: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		4		; %G0 = &ra
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
	;; Return statement 137 from =: (a) Evaluate the expression and prepare the destination
	;; Dereference #136: Prelude -- evaluate the src pointer
	;; Identifier evaluation: destination

	;; Evaluate dynamic variable destination
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 137 from =: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 137 from =: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 149 from bitand: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 149 from bitand: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 149 from bitand: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 161 from bitor: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 161 from bitor: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 161 from bitor: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 171 from bitnot: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 171 from bitnot: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 171 from bitnot: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 183 from <<: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 183 from <<: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 183 from <<: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 195 from >>: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 195 from >>: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 195 from >>: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; If-then 216: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 216: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_216_end		%G0		0		; If false, jump over then-branch
	;; If-then 216: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 214: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 214: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_214_end		%G0		0		; If false, jump over then-branch
	;; If-then 214: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 212 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 212 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 212 from and: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_and_epilogue						; Return to caller
	;; If-then 214: (d) End
_and_branch_214_end:
	NOOP								; Placeholder for if-then 214
	;; If-then 216: (d) End
_and_branch_216_end:
	NOOP								; Placeholder for if-then 216
	;; Statement #1 of begin-end statement
	;; Return statement 218 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 218 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 218 from and: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; If-then 233: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 233: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_233_end		%G0		0		; If false, jump over then-branch
	;; If-then 233: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 231 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 231 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 231 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 233: (d) End
_or_branch_233_end:
	NOOP								; Placeholder for if-then 233
	;; Statement #1 of begin-end statement
	;; If-then 241: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 241: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_241_end		%G0		0		; If false, jump over then-branch
	;; If-then 241: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 239 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 239 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 239 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 241: (d) End
_or_branch_241_end:
	NOOP								; Placeholder for if-then 241
	;; Statement #2 of begin-end statement
	;; Return statement 243 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 243 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 243 from or: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; If-then-else 254: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; If-then-else 254: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_not_branch_254_else		%G0		0		; If false, jump to else-branch
	;; If-then-else 254: (c) Then-branch
	;; Return statement 251 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 251 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 251 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	JUMP		_not_branch_254_end						; Jump over else-branch
	;; If-then-else254: (d) Else-branch
_not_branch_254_else:
	;; Return statement 253 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 253 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 253 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	;; If-then-else 254: (e) End
_not_branch_254_end:
	NOOP								; Placeholder for if-then-else 254
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
	;; Return statement 266 from +: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 266 from +: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 266 from +: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 278 from -: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 278 from -: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 278 from -: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 290 from *: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 290 from *: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 290 from *: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 302 from /: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 302 from /: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 302 from /: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 323 from ==: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 323 from ==: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 323 from ==: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 342 from !=: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: difference

	;; Evaluate dynamic variable difference
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 342 from !=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 342 from !=: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 364 from <: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 364 from <: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 364 from <: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 386 from >: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 386 from >: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 386 from >: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 406 from <=: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 406 from <=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 406 from <=: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 422 from >=: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 422 from >=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 422 from >=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>=_epilogue						; Return to caller
_procedure_>=_epilogue:
	;; Callee for >=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	.Numeric

	.Text

