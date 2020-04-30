;tao hieu ung quay led, thoi gian chuyen trang thai 1s
ORG 2000H
MAIN:
    MOV A, #0FFH
	CLR C
LOOP:
	RLC A
	MOV P1, A
	ACALL Delay1sIns
SJMP LOOP				;lap vo han CT trong LOOP

Delay1sIns:			   ;DELAY 1s
       MOV R7, #8
LOOP2: MOV R6, #250
LOOP1: MOV R5, #250	   ;T =	2MC*8*250*250 = 1000000us
       DJNZ R5, $
	   DJNZ R6, LOOP1
	   DJNZ R7, LOOP2
RET

END