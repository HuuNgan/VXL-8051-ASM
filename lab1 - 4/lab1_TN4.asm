; tao xung vuong 2Hz, duty cycle = 70% tai chan P1.0
ORG 2000H
MAIN:
    SETB P1.0
	ACALL DELAY_350	   ; 70% T
	CLR P1.0		   
	ACALL DELAY_150	   ; 30% T
SJMP MAIN ; lap vo han chuong trinh MAIN

DELAY_350:	  ;DELAY 350ms
	   MOV R7, #4
LOOP2: MOV R6, #175
LOOP1: MOV R5, #250	   ;T =	2MC*4*175*250 = 350 000us
       DJNZ R5, $
	   DJNZ R6, LOOP1
	   DJNZ R7, LOOP2
RET

DELAY_150:	  ;DELAY 150ms
       MOV R7, #3
LOOP4: MOV R6, #100
LOOP3: MOV R5, #250	   ;T =	2MC*3*100*250 = 150 000us
       DJNZ R5, $
	   DJNZ R6, LOOP3
	   DJNZ R7, LOOP4
RET

END