ORG 0000H
    MOV R0, #0
    MOV R1, #0
    MOV DPTR, #LED7SEG

;KHOI DONG TIMER0 DEM SU KIEN
    MOV TMOD,#00000101B       ;TIMER0, MODE1, CLOCK NGOAI
                              ;HOAT DONG DEM SU KIEN
                              ;GATE =0, C/T=1, M1 M0 = 01
    MOV TH0, #0
    MOV TL0, #0
    SETB TR0

LOOP:
    MOV A, TL0
    MOV B, #10
    DIV AB
    MOV R0, B
    MOV R1, A

    MOV A, R0
    MOVC A, @A+DPTR
    MOV P1, A

    MOV A, R1
    MOVC A, @A+DPTR
    MOV P2, A
    SJMP LOOP
;END LOOP


LED7SEG:
    DB 0c0H,0f9H,0a4H,0b0H,99H,92H,82H,0f8H,80H,90H

END