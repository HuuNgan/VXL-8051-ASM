ORG 0000H
    JMP MAIN
ORG 0003H           ;DIA CHI NGAT NGOAI 0
    CLR P1.7
    CALL DELAY1S
    SETB P1.7
    RETI
ORG 000BH           ;DIA CHI NGAT TIMER 0
    
ORG 0030H
;==========================================================
MAIN:
;TIMER INIT
    MOV     TMOD, #02H      ;TIMER0, CHE DO 2
    MOV     TH0, #-250
    MOV     TL0, #0
    SETB    TR0             ;KHOI DONG TIMER
;INTERRUPT INIT
    MOV IE, #81H            ;NGAT NGOAI 0
    SETB IT0                ;CHON NGAT CANH XUONG
;    SETB PX0                ;UU TIEN NGAT NGOAI 0

LOOP:
    MOV     C, P1.6
    MOV     P3.2, C
SJMP LOOP

;END MAIN =================================================

;DELAY 1 SECOND ===========================================
DELAY1S:
    MOV R7, #16
L1: MOV R6, #250
L2: JNB TF0, $
    CLR TF0
    DJNZ R6, L2
    DJNZ R7, L1
RET
;END DELAY ================================================

END