; Program to find the first odd and first even number from an array starting at 50H,
; then multiply them and store both numbers and result after the inputs.
; Author: Abin S Manoj
; IDE: Keil µVision

ORG 0000H
MOV R3,50H             ; Get the count of numbers
MOV R1,#51H            ; Start from address 51H
MOV B,#02H             ; Set divisor B = 2 (for checking even/odd)
MOV A,#50H             
ADD A,03               ; Prepare for storing result
DEC R3                 ; Adjust count
MOV R6,A               ; Save output location pointer

EV:                    ; Find first odd number
MOV A,@R1
DIV AB
MOV A,B
CJNE A,#01H,L1         ; If remainder not 1, not odd
INC R1
MOV B,#02H
DJNZ R3,EV

L1:
MOV A,@R1              ; Store first odd number
MOV R0,06
INC R0
MOV @R0,A

MOV R3,50H             ; Reload count
MOV R1,#51H            ; Reset to start of inputs
MOV B,#02H
DEC R3

OL:                    ; Find first even number
MOV A,@R1
DIV AB
MOV A,B
CJNE A,#00H,L2         ; If remainder not 0, not even
INC R1
MOV B,#02H
DJNZ R3,OL

L2:
MOV A,@R1              ; Store first even number
INC R0
MOV @R0,A
END