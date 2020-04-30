; thay doi trang thai P1.0 sau 1s
ORG 2000H
MAIN:  		CPL P1.0		   ;lay bu P1.0
			ACALL Delay1sIns   ;delay1s
			SJMP MAIN		   ;tro ve main lap vo han

Delay1sIns:			   ;DELAY 1s
       MOV R7, #8
LOOP2: MOV R6, #250
LOOP1: MOV R5, #250	   ;T =	2MC*8*250*250 = 1000000us
       DJNZ R5, $
	   DJNZ R6, LOOP1
	   DJNZ R7, LOOP2
       RET

END