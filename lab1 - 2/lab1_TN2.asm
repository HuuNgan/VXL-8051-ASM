; tao xung 1Hz, duty cycle = 50%
ORG 2000H
MAIN:
       CPL P1.0
;DELAY 500ms
       MOV R7, #4          ;1MC
LOOP2: MOV R6, #250        ;R7*1MC
LOOP1: MOV R5, #250        ;R6*R7*1MC
       DJNZ R5, $          ;R5*R6*R7*2MC
       DJNZ R6, LOOP1      ;R6*R7*2MC
       DJNZ R7, LOOP2      ;R7*2MC
       
       SJMP MAIN           ;2MC
END