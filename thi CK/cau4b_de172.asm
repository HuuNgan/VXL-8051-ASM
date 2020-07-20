ORG 0000H
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A
    MOV SCON, #0D0H
    MOV TMOD, #20H
    MOV TH1, #-3
    SETB TR1

LOOP:
    JNB RI, $
    CLR RI
    MOV A, SBUF
    MOV R0, A
    ANL 0H, #0FH
    ANL A, #0F0H
    SWAP A
    MOV C, RB8
    JC TRU
    ADD A, R0
    SJMP LOOP
    
TRU:
    SUBB A, R0
    JNC SKIP
    CPL A
    INC A
SKIP:
    SJMP LOOP
END
    