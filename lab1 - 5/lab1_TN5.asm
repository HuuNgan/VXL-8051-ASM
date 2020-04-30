; tao 2 xung vuong 0.5Hz va 1Hz voi duty cycle =50%
; tren cac chan P1.0 va P1.1
ORG 2000H
MAIN:
    CPL P1.0
	CPL P1.1
	ACALL DELAY_500
	CPL P1.1
	ACALL DELAY_500
SJMP MAIN				   ;lap vo han CT MAIN

DELAY_500:				   ;DELAY 500ms
       MOV R7, #4
LOOP2: MOV R6, #250
LOOP1: MOV R5, #250
       DJNZ R5, $
	   DJNZ R6, LOOP1
	   DJNZ R7, LOOP2
RET

END