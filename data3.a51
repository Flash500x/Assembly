; Program to find the two largest numbers from a set starting at 60H,
; subtract the second largest from the largest,
; and store the result just after the input values.
; Author: Abin S Manoj
; IDE: Keil µVision

ORG 0000H
MOV R3,60H
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
MOV R1,03
MOV A,61H
SUBB A,62H
MOV @R1,A
END