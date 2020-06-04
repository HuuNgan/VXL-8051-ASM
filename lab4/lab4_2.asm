;Tao song vuong 1Hz tren chan P1.0 dung timer0 o che do 2

ORG 2000H
    MOV TMOD, #02H        ;Chon che do 2, su dung timer0
    MOV TH0, #-250        ;Nap tri khoi dong cho timer0
MAIN:
    SETB P1.0
    ACALL DELAY500
    CLR P1.0
    ACALL DELAY500
    SJMP MAIN
;Delay500ms ***********************************************
DELAY500:
    MOV R7, #8
L1: MOV R6, #250
L2: SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
    DJNZ R6, L2
    DJNZ R7, L1
RET
;End Delay ************************************************

END