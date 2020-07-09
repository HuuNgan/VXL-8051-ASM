ORG 0000H
MAIN:
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A       ;3 LENH TREN SET BIT SMOD LEN 1

    MOV SCON, #0C2H    ;CONG NOI TIEP, CHE DO 3
    MOV TMOD, #20H    ;TIMER1, CHE DO 2
    MOV TH1, #-3      ;TRI NAP LAI CHO 19200 BAUD
    SETB TR1          ;CHO TIMER1 CHAY    

;        MOV P1, #7EH    ;DUNG DE TEST
;        MOV 30H, #80H

LOOP:
    MOV A, P1
    CJNE A, #20H, TT1
TT1:
    CLR C
    JC SKIP
    CJNE A, #7EH, TT2
TT2:
    SETB C
    JNC SKIP
    
    CALL SENDCHAR
    JMP LOOP
SKIP:
    MOV P2, A
    JMP LOOP

;GUI 1 KY TU **********************************************
SENDCHAR:
    PUSH ACC
    MOV 30H, A
    MOV C, P
    MOV TB8, C
    POP ACC

;    MOV A, 30H
;    MOV C, P        ;DAT BIT KIEM TRA CHAN LE VAO CO C
;    CPL C           ;DOI SANG KIEM TRA LE
;    POP ACC
;    MOV ACC.7, C    ;THEM VAO MA KY TU

    JNB TI, $       ;TX TRONG? NEU KHONG THI KIEM TRA LAI
    CLR TI			;TX TRONG THI XOA CO TI
    MOV SBUF, A     ;GUI KY TU
;    CLR ACC.7       ;BO BIT KIEM TRA LE
RET
;END SENDCHAR *********************************************

END