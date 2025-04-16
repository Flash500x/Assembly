; Program to find the first odd and first even number from an array starting at 50H,
; then multiply them and store both numbers and result after the inputs.
; Author: Abin S Manoj
; IDE: Keil µVision

ORG 0000H
MOV R3,50H
MOV R1,#51H
MOV B,#02H
MOV A,#50H
ADD A,03
DEC R3
MOV R6,A;OUTPUT LOCATION
EV:
MOV A,@R1
DIV AB
MOV A,B
CJNE A,#01H,L1
INC R1
MOV B,#02H
DJNZ R3,EV
L1:
MOV A,@R1
MOV R0,06
INC R0
MOV @R0,A
MOV R3,50H
MOV R1,#51H
MOV B,#02H
DEC R3
OL:
MOV A,@R1
DIV AB
MOV A,B
CJNE A,#00H,L2
INC R1
MOV B,#02H
DJNZ R3,OL
L2:
MOV A,@R1
INC R0
MOV @R0,A
END