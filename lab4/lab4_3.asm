;Chong rung nut nhan, nhan lan 1 led sang, nhan tiep led tat

COUNT EQU -50000
ORG 2000H
    MOV TMOD, #01H    ;Chon che do 1, su dung timer0
MAIN:
    SETB P1.1
LOOP_FOREVER:
    JB P1.0, $
LOOP:
    MOV C, P1.0
    ACALL DELAY
    ANL C,/P1.0
    MOV F0, C
    CPL C    
    ANL C,P1.0
    ORL C,F0
    JC LOOP
    
    CPL P1.1
    JNB P1.0, $
    SJMP LOOP_FOREVER
;Delay 50ms ***********************************************
DELAY:
    MOV TH0, #HIGH(COUNT)
    MOV TL0, #LOW(COUNT)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
RET
;End Delay ************************************************

END
