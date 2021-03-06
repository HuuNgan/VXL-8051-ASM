ORG 2000H
MAIN:
    ACALL SERIAL_INIT    ;KHOI TAO GIAO TIEP SERIAL
LOOP:
    JB P1.0, $
    ACALL SENDSTRING
    JNB P1.0, $
    SJMP LOOP
;END LOOP
;END MAIN

;KHOI TAO CONG NOI TIEP ***********************************
SERIAL_INIT:
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A       ;3 LENH TREN SET BIT SMOD LEN 1

    MOV SCON, #42H    ;CONG NOI TIEP, CHE DO 1
    MOV TMOD, #20H    ;TIMER1, CHE DO 2
    MOV TH1, #-3      ;TRI NAP LAI CHO 19200 BAUD
    SETB TR1          ;CHO TIMER1 CHAY    
RET
;END SERIAL_INIT ******************************************

;GUI 1 KY TU **********************************************
SENDCHAR:
;    MOV C, P        ;DAT BIT KIEM TRA CHAN LE VAO CO C
;    CPL C           ;DOI SANG KIEM TRA LE
;    MOV ACC.7, C    ;THEM VAO MA KY TU
    JNB TI, $       ;TX TRONG? NEU KHONG THI KIEM TRA LAI
    CLR TI			;TX TRONG THI XOA CO TI
    MOV SBUF, A     ;GUI KY TU
;    CLR ACC.7       ;BO BIT KIEM TRA LE
RET
;END SENDCHAR *********************************************

;Send string **********************************************
SENDSTRING:
    MOV A, #0
  CONT:
    MOV DPTR, #STRING
    MOV R0, A
    MOVC A, @A+DPTR
    JZ  EXIT
    ACALL SENDCHAR
    MOV A, R0
    INC A
    SJMP CONT
EXIT:
RET
;END SENDSTRING *******************************************

STRING:
    DB "Hello world!", 0DH, 0

END
