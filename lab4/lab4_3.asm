;Chong rung nut nhan, nhan lan 1 led sang, nhan tiep led tat

COUNT1 EQU -50000
COUNT2 EQU -5000
ORG 2000H
    MOV TMOD, #01H    ;Chon che do 1, su dung timer0
MAIN:
    SETB P1.1

LOOP:
    JB P1.0, $
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
    ACALL DELAY5ms
    SJMP LOOP
;Delay 50ms ***********************************************
DELAY:
    MOV TH0, #HIGH(COUNT1)
    MOV TL0, #LOW(COUNT1)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
RET
;End Delay ************************************************

;Delay 5ms ***********************************************
DELAY5ms:
    MOV TH0, #HIGH(COUNT2)
    MOV TL0, #LOW(COUNT2)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
RET
;End Delay ************************************************

END
