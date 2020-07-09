ORG 0000H
    LJMP MAIN
ORG 0003H
    LJMP EXTI0_ISR
ORG 0030H
MAIN:
    MOV IE, #81H
    MOV TMOD, #01H
    CLR F0
    CALL SANG_DAN
    CALL TAT_DAN
    
    SJMP $

SANG_DAN:
    MOV R0, #8
    MOV A, #0FFH
LOOP1:
    CLR C
    RRC A
    MOV P1, A
    CALL DELAY
    DJNZ R0, LOOP1    
RET

TAT_DAN:
    MOV R0, #8
    MOV A, #0H
LOOP2:
    SETB C
    RLC A
    MOV P1, A
    CALL DELAY
    DJNZ R0, LOOP2    
RET

EXTI0_ISR:
    MOV C, F0
    CPL F0
    JC TAT
    CALL SANG_DAN
    SJMP SKIP
TAT:
    CALL TAT_DAN
SKIP:
RETI

DELAY:
    CLR TR0
    MOV TH0, #HIGH(-50000)
    MOV TL0, #LOW(-50000)
    SETB TR0
    JNB TF0, $
    CLR TF0
RET

END