;;; Bios
	;;  by Madison Burke

.Code

	COPY 	%G0	*0x1028	;%G0 holds kernal base
	COPY	%G1	*0x102c	;%G1 holds kernal limit
	COPY	%G2	*0x1010	;%G2 holds ram base
	COPY	%G3	*0x1014	;%G3 holds ram limit
	COPY	%G4	*0x1010	;%G4 also holds ram base
	COPY	%G5	0x0000	;%G5 will be ramkernal.length

more:	BGTE	+done	%G0	%G1	;While G0 is less than G1
	COPY	*%G2	*%G0	    	;Copy Kernal to Ram
	ADD	%G2	%G2	4   	;Increment ram pointer
	ADD	%G0	%G0	4   	;Increment kernal pointer
	ADD	%G5	%G5	4   	;Increment ramkernal.length
	JUMP	+more
	
done:	JUMP	%G4	
	HALT
