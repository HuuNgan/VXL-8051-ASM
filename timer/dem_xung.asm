ORG 0H
MAIN:
    MOV TMOD,#00000101B       ;TIMER0, MODE1, CLOCK NGOAI
                              ;HOAT DONG DEM SU KIEN
                              ;GATE =0, C/T=1, M1 M0 = 01
    MOV TH0,#0
    MOV TL0,#0
    SETB TR0                  ;CHO PHEP TIMER
LOOP:
    MOV A,TL0                 ;DOC TIMER
    MOV P1,A                  ;HIEN THI LED THANH
    SJMP LOOP
END