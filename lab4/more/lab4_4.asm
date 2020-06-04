ORG 2000H
MAIN:
    ACALL SERIAL_INIT    ;KHOI TAO GIAO TIEP SERIAL
	MOV A, #'X'
	ACALL SENDCHAR
    ACALL SENDSTRING
	SJMP $               ;DUNG CHUONG TRINH

;LOOP:
;    MOV A, #'A'
;    ACALL SENDCHAR
;    MOV A, #'X'
;    ACALL SENDCHAR

;    ACALL DELAY500
;    SJMP LOOP

;KHOI TAO CONG NOI TIEP ***********************************
SERIAL_INIT:
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A       ;3 LENH TREN SET BIT SMOD LEN 1

    MOV SCON, #52H    ;CONG NOI TIEP, CHE DO 1
    MOV TMOD, #20H    ;TIMER1, CHE DO 2
    MOV TH1, #-3      ;TRI NAP LAI CHO 19200 BAUD
    SETB TR1          ;CHO TIMER1 CHAY    
RET
;END SERIAL_INIT ******************************************

;GUI KY 1 TU **********************************************
SENDCHAR:
    MOV C, P        ;DAT BIT KIEM TRA CHAN LE VAO CO C
    CPL C           ;DOI SANG KIEM TRA LE
    MOV ACC.7, C    ;THEM VAO MA KY TU
    JNB TI, $       ;TX TRONG? NEU KHONG THI KIEM TRA LAI
    CLR TI			;TX TRONG THI XOA CO TI
    MOV SBUF, A     ;GUI KY TU
    CLR ACC.7       ;BO BIT KIEM TRA LE
RET
;END SENDCHAR *********************************************

;Delay500ms ***********************************************
DELAY500:
    MOV R7, #8
L1: MOV R6, #250
L2: SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
    DJNZ R6, L2
    DJNZ R7, L1
RET
;End Delay ************************************************

;Send string **********************************************
SENDSTRING:
    MOV A, #0
  CONT:
    MOV DPTR, #STRING
    ;MOV R0, A
    MOVC A, @A+DPTR
    JZ  EXIT
    ACALL SENDCHAR
    ;MOV A, R0
    INC A
    SJMP CONT
EXIT:
RET
;END SENDSTRING *******************************************

STRING:
    DB "Hello world!", 0

END
