ORG 2000H

;KHOI TAO CONG NOI TIEP ***********************************
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A       ;3 LENH TREN SET BIT SMOD LEN 1

    MOV SCON, #42H    ;CONG NOI TIEP, CHE DO 1
    MOV TMOD, #20H    ;TIMER1, CHE DO 2
    MOV TH1, #-3      ;TRI NAP LAI CHO 19200 BAUD
    SETB TR1          ;CHO TIMER1 CHAY    
;END SERIAL_INIT ******************************************

    MOV A, #'A'

;GUI KY 1 TU **********************************************
    JNB TI, $       ;TX TRONG? NEU KHONG THI KIEM TRA LAI
    CLR TI			;TX TRONG THI XOA CO TI
    MOV SBUF, A     ;GUI KY TU
;END SENDCHAR *********************************************

END