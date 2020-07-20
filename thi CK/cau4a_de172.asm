ORG 0000H
    MOV SCON, #0C2H
    MOV TMOD, #20H
    MOV TH1, #-3
    SETB TR1
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A
    

LOOP:
    MOV R0, P2
    ANL 0H, #0FH
    MOV A, P1
    ANL A, #0FH
    SWAP A
    ADD A, R0
    MOV C, P2.4
    MOV TB8, C
    
    JNB TI, $
    CLR TI
    MOV SBUF, A
    SJMP LOOP
END
