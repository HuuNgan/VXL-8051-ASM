ORG 0000H
    LJMP CTCHINH
ORG 001BH
    LJMP CTNGATTIMER1
ORG 0030H
CTCHINH:
    MOV TMOD,#10H
    SETB EA
    SETB ET1
    SETB TF1
    SJMP $
CTNGATTIMER1:
    CPL P1.5
    CLR TR1
    MOV TH1,#HIGH(-20)
    MOV TL1,#LOW(-20)
    SETB TR1
    RETI
END