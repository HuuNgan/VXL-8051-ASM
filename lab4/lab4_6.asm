;DEFINE ***************************************************
LCD_E	BIT	P3.4   ;doi thanh P3.4 neu su dung tren proteus
LCD_RS	BIT	P3.5
LCDADDR	EQU	6000H
;END DEFINE ***********************************************

ORG 2000H
    CALL SERIAL_INIT
    CALL INIT_LCD
    CALL CLEARSCREEN

MAIN:
    CALL RECEIVE_CHAR  
    PUSH ACC

    CJNE A, #1BH, SKIP_CLRSCR    ;NEU NHAN NUT ESC
    CALL CLEARSCREEN
    POP ACC
    PUSH ACC
    SKIP_CLRSCR:

    CJNE A, #08H, SKIP_BACKSPACE ;NEU NHAN NUT BACKSPACE
    MOV A, #10H                  ;DICH CON TRO SANG TRAI
    CALL WRITECOM
    MOV A, 0H
    CALL WRITETEXT
    MOV A, #10H
    CALL WRITECOM
    POP ACC
    PUSH ACC
    SKIP_BACKSPACE:

    CJNE A, #0DH, SKIP_ENTER     ;NEU NHAN NUT ENTER
    MOV A, #0BFH
    CALL  WRITECOM
    POP ACC
    PUSH ACC
    SKIP_ENTER:

    
    CJNE A, #40H, NEXT1
    NEXT1:
    JC CONTINUE         ;NEU A < 40H THI BO QUA
    CJNE A, #5BH, NEXT2
    NEXT2:
    JNC CONTINUE        ;NEU A > 5BH THI BO QUA
        POP ACC
        CALL SENDCHAR        ;GUI KY TU LEN TERMINAL
        CALL WRITETEXT       ;GUI KY TU LEN LCD
    CONTINUE:
    
SJMP MAIN


;KHOI TAO CONG NOI TIEP ***********************************
SERIAL_INIT:
    MOV A, PCON
    SETB ACC.7
    MOV PCON, A       ;3 LENH TREN SET BIT SMOD LEN 1

    MOV SCON, #52H    ;CONG NOI TIEP, CHE DO 2, THU - PHAT
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

;NHAN 1 KY TU *********************************************
RECEIVE_CHAR:
    JNB RI, $
    CLR RI
    MOV A, SBUF
RET
;END RECEIVE_CHAR *****************************************



;THIET LAP LCD ********************************************
INIT_LCD:
    MOV	A, #38H
    ACALL  WRITECOM
    MOV	A, #0EH
    ACALL  WRITECOM
    MOV	A, #06H
    ACALL  WRITECOM
RET
;END INIT_LCD *********************************************

;XOA MAN HINH
CLEARSCREEN:
    MOV	A, #01H
    ACALL  WRITECOM		
RET
;END CLEARSCREEN ******************************************

;GHI LENH DIEU KHIEN LCD **********************************
WRITECOM:
MOV	DPTR, #LCDADDR
SETB	LCD_E
CLR		LCD_RS
MOVX	@DPTR, A
CLR		LCD_E
ACALL	WAIT_LCD
RET
;END WRITECOM *********************************************

;GHI MOT KY TU LEN LCD ************************************
WRITETEXT:
    MOV	DPTR, #LCDADDR
    SETB    LCD_E
    SETB    LCD_RS
    MOVX    @DPTR, A
    CLR     LCD_E
    ACALL   WAIT_LCD
RET
;END WRITETEXT ********************************************

;CHO QUA TRINH TRUYEN DU LIEU HOAN TAT ********************
WAIT_LCD:	
    MOV	R6,#10
DL1:			
    MOV	R7, #250
    DJNZ	R7, $
    DJNZ	R6,DL1
RET
;END WAIT_LCD *********************************************
END