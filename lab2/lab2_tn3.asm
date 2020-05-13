ORG 2000H
MAIN:
    MOV R1, #0			;Chon LED sang la LED 0
    MOV R0, #0			;Xoa R0
LOOP:					;Vong lap vo han
    ACALL DisplayLED    ;Xuat R0 ra LED 0
    ACALL Delay1sIns    ;delay 1s
    INC R0
    CJNE R0, #10, LOOP
    MOV R0, #0
    SJMP LOOP
;END MAIN

;Xuat gia tri luu tren R0 len LED 7 doan o vi tri luu tren R1
DisplayLED:
    MOV B, R1
    INC B
    MOV A, #11110111B
SHIFTLOOP:
    RL A
    DJNZ B, SHIFTLOOP
    
    ANL A, #0F0H
    PUSH ACC
    MOV A, R0
    ANL A, #0FH
    MOV R0, A
    POP ACC
    ORL A, R0

    MOV DPTR, #0000H    ;Dia chi ngoai vi cua LED7SEG
    MOVX @DPTR, A
RET

;DELAY 1s
Delay1sIns:
       MOV R7, #8
LOOP2: MOV R6, #250
LOOP1: MOV R5, #250	   ;T =	2MC*8*250*250 = 1000000us
       DJNZ R5, $
       DJNZ R6, LOOP1
       DJNZ R7, LOOP2
       RET
END