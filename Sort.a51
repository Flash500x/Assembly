;------------------------------------------------------------------------------
; Program Description:
; This 8051 Assembly program, authored by Abin S Manoj and written for the
; Keil µVision IDE, demonstrates a basic sorting routine followed by data 
; processing and carry detection logic. Initially, it loads data from RAM 
; location 50H and performs an addition. Then, it stores and sorts data 
; using a nested loop approach resembling bubble sort. After sorting, 
; the program performs a simple sum of values from addresses 51H and 52H, 
; checks for carry, and updates register R7 accordingly. Finally, it stores 
; the sum and a constant (07H) in sequential memory.
;
; IDE Used: Keil µVision
; Author: Abin S Manoj
;------------------------------------------------------------------------------

ORG 0000H
MOV R3,50H
MOV A,#50H
ADD A,R3
INC A
MOV R3,A
CLR A
L8:
MOV R0,#50H ;STORE COUNT
MOV R1,50H
DEC R1
MOV @R0,01
MOV R2,50H
INC R0
L1:
MOV A,@R0
INC R0
MOV 04,@R0
CJNE A,04,L2
L2:
JC l3
JNC L4
l4:
XCH A,@R0
DEC R0
MOV @R0,A
INC R0
L3:
DJNZ R1,L1
DEC R2
MOV A,R2
CJNE A,#00H,L8
EXIT:
MOV A,51H
MOV R0,03
MOV @R0,A
INC R0
MOV A,52H
MOV @R0,A
DEC R0
MOV A,@R0
INC R0
ADD A,@R0
JC CARRY
JNC NO
CARRY:
INC R7
NO:
INC R0
MOV @R0,A
INC R0
MOV @R0,07
END