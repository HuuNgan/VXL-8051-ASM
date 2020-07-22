ORG 0000H
    LJMP MAIN
ORG 000BH
    LJMP TIM0_ISR
ORG 0030H
MAIN:
    MOV IE, #82H
    MOV TMOD, #01H
    MOV R7, #1
    SETB TF0
    SJMP $

TIM0_ISR:
    CLR TR0
    CLR TF0
    MOV TH0, #HIGH(-40000)
    MOV TL0, #LOW(-40000)
    SETB TR0
    DJNZ R7, SKIP
    JB P1.0, FALLING
    MOV R7, #20
    SETB P1.0
    RETI
FALLING:
    MOV R7, #30
    CLR P1.0
SKIP:
    RETI
    
END