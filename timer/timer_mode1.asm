ORG 0H
    MOV TMOD, #01H
LOOP:
    CPL P1.0
    ACALL DELAY
    SJMP LOOP
DELAY:
    MOV TH0, #HIGH(-20)
    MOV TL0, #LOW(-20)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
    RET
END