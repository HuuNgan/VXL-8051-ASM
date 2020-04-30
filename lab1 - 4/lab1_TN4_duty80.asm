; tao xung vuong 2Hz, duty cycle = 80% tai chan P1.0
ORG 2000H
MAIN:
    SETB P1.0
	ACALL DELAY_400	   ; 80% T
	CLR P1.0		   
	ACALL DELAY_100	   ; 20% T
SJMP MAIN ; lap vo han chuong trinh MAIN

DELAY_400:	  ;DELAY 400ms
	   MOV R7, #4
LOOP2: MOV R6, #200
LOOP1: MOV R5, #250	   ;T =	2MC*4*200*250 = 400 000us
       DJNZ R5, $
	   DJNZ R6, LOOP1
	   DJNZ R7, LOOP2
RET

DELAY_100:	  ;DELAY 100ms
       MOV R6, #200
LOOP3: MOV R5, #250	   ;T =	2MC*200*250 = 100 000us
       DJNZ R5, $
	   DJNZ R6, LOOP3
RET

END