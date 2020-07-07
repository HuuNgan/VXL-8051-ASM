ORG 0000H
;KHOI DONG TIMER0 DEM SU KIEN
    MOV TMOD,#00000101B       ;TIMER0, MODE1, CLOCK NGOAI
                              ;HOAT DONG DEM SU KIEN
                              ;GATE =0, C/T=1, M1 M0 = 01
    MOV TH0, #0
    MOV TL0, #0
    SETB TR0
;==========================================================

LOOP:
    MOV A, TL0
    ACALL DEC_2_BCD_NEN
    MOV P0, A
SJMP LOOP
;END LOOP

;CHUYEN A SANG SO BCD NEN VA LUU TRO LAI A
DEC_2_BCD_NEN:
    MOV B, #10
    DIV AB
    SWAP A
    ADD A, B
RET

END