ORG 0000H
    MOV TMOD, #05H
    MOV TH0, #0
    MOV TL0, #0
    MOV DPTR, #2000H
    MOV A, #0
    MOVX @DPTR, A      ; XOA O NHO 2000H
    CLR P1.0
    SETB TR0

LOOP:
    MOV A, TH0
    CJNE A, #0EH, LOOP
LOOP1:    
    MOV A, TL0
    CJNE A, #10H, LOOP1
    MOV TH0, #0
    MOV TL0, #0
    MOVX A, @DPTR
    INC A
    MOVX @DPTR, A
    CJNE A, #110, LOOP
    SETB P1.0
    SJMP $
END