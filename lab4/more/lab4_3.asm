;Chong rung nut nhan, nhan lan 1 led sang, nhan tiep led tat

COUNT EQU -10000
ORG 2000H
    MOV TMOD, #01H    ;Chon che do 1, su dung timer0
MAIN:
    SETB P1.1
LOOP_FOREVER:
    JB P1.4, $
LOOP:
    MOV C, P1.4
    ACALL DELAY
    ANL C,/P1.4
    MOV F0, C
    CPL C    
    ANL C,P1.4
    ORL C,F0
    JC LOOP
    
    CPL P1.1
	JNB P1.4
	, $
	ACALL DELAY5m
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
DELAY5m:
	MOV	TH0,#HIGH(-5000)
	MOV	TL0,#LOW(-5000)
	SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
RET
;End Delay ************************************************

END
