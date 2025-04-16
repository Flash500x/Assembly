; Program to sort a set of numbers in descending order starting from 60H
; and then find the lowest even number from the sorted list.
; The result is stored in the location right after the last input number.
; Author: Abin S Manoj
; IDE: Keil µVision

ORG 0000H
MOV R3,60H
MOV R7,60H
MOV A,#60H
ADD A,R3
INC A
MOV R3,A
CLR A
L8:
MOV R0,#60H;STORE COUNT
MOV R1,60H
DEC R1
MOV @R0,01
MOV R2,60H
INC R0
L1:
MOV A,@R0
INC R0
MOV 04,@R0
CJNE A,04,L2
L2:
JC l3
JNC L4
l3:
XCH A,@R0
DEC R0
MOV @R0,A
INC R0
L4:
DJNZ R1,L1
DEC R2
MOV A,R2
CJNE A,#00H,L8
MOV B,#02H
MOV R2,07
MOV R0,03
MOV R1,#61H
L5:
	MOV A,@R1
	DIV AB
	MOV A,B
	CJNE A,#00H,NO
	MOV A,@R1
	MOV @R0,A
	INC R0
	INC R5
	NO:
	INC R1
	MOV B,#02H
	DJNZ R2,L5
CLR A
MOV R0,03
MOV 02,@R0
DEC R5
LOOP:
	INC R0
	MOV A,@R0
	CJNE A,02,SWEEP
	SWEEP:
	JC N1
	JNC N2
	N1:
	MOV 02,@R0
	N2:
	DJNZ R5,LOOP
INC R0
MOV A,R2
MOV @R0,A
END