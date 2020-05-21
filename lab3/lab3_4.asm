;DEFINE ***************************************************
LCD_E	BIT	P3.3   ;doi thanh P3.4 neu su dung tren proteus
LCD_RS	BIT	P3.5
LCDADDR	EQU	6000H
;END DEFINE ***********************************************
ORG 2000H
MAIN:
    MOV  @R0, 30H
    MOV	DPTR, #LCDADDR
    ACALL    CLEARSCREEN
    ACALL    INIT_LCD

    ACALL READ_ADC
    ACALL DISPLAY_ADC

    SJMP $

;CHUYEN CON TRO DEN HANG X, COT Y *************************
;VOI X LUU O R0, Y LUU O R1 *******************************
GOTOXY:
    MOV    A,#80H
    CJNE   R0,#02,SKIP1
    MOV    A,#0C0H
SKIP1:
    ADD    A,R1
    DEC    A
    ACALL  WRITECOM
RET
;END GOTOXY ***********************************************

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
DL:			
    MOV	R7, #250
    DJNZ	R7, $
    DJNZ	R6,DL
RET
;END WAIT_LCD *********************************************

;DOC GI TRI ADC *******************************************
READ_ADC:
    MOV		A,#0
    MOV		DPTR,#4000H
    MOVX	@DPTR,A
    ACALL	DELAY_100US
    MOVX	A,@DPTR
    MOV		R0,A
RET 
;END READ_ADC *********************************************

;HIEN THI GIA TRI ADC LEN LCD
DISPLAY_ADC:
    MOV B, #10
    MOV A, R0
    DIV AB
    MOV R1, B
    MOV B, #10
    DIV AB
    
    ADD A, #30H
    ACALL WRITETEXT
    MOV A, B
    ADD A, #30H
    ACALL WRITETEXT
    MOV A, R1
    ADD A, #30H
    ACALL WRITETEXT
RET
;END DISPLAY_ADC



;DELAY 100 MICRO SECONDS **********************************
DELAY_100US:
    MOV		R7,#50
    DJNZ	R7,$
RET
;END DELAY100US
END