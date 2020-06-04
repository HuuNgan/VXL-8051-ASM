;Tao song vuong 1Hz tren chan P1.0 dung timer0 o che do 1

ORG 2000H
    MOV TMOD, #01H        ;Chon che do 1, su dung timer0
MAIN:
    SETB P1.0
    ACALL DELAY500
    CLR P1.0
    ACALL DELAY500
    SJMP MAIN

;Delay 500ms **********************************************
DELAY500:
    MOV R7, #10
AGAIN:
    MOV TH0, #HIGH(-50000)
    MOV TL0, #LOW(-50000)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
    DJNZ R7, AGAIN
RET
;End Delay ************************************************
END