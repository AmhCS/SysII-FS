;;; Init Program 

.Code
COPY %G0 1
  SYSC			; Call's system call

.Numeric
  0x01			; System call type (arg 0)
