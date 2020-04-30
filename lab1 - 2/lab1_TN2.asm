; tao xung 1Hz, duty cycle = 50%
ORG 2000H
MAIN:
	   CPL P1.0
;DELAY 500ms
       MOV R7, #4
LOOP2: MOV R6, #250
LOOP1: MOV R5, #250
       DJNZ R5, $
	   DJNZ R6, LOOP1
	   DJNZ R7, LOOP2
       
	   SJMP MAIN
END