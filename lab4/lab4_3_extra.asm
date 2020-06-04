;Dem so lan nhan nut va hien thi len LCD

LCD_E	BIT	P3.3        ;doi thanh P3.4 neu dung tren proteus
LCD_RS	BIT	P3.5
LCDADDR	EQU	6000H

COUNT1 EQU -50000
COUNT2 EQU -5000

ORG 2000H
    MOV TMOD, #01H    ;Chon che do 1, su dung timer0
MAIN:
    ;SETB P1.1
    MOV R1, #0        ;XOA R1
    MOV	DPTR, #LCDADDR
    ACALL	CLEARSCREEN
    ACALL	INIT_LCD
    MOV A, #'0'
    ACALL	WRITETEXT
	;SJMP $

CHECK_SW:
    JB P1.0, $
    ACALL DELAY
    JB P1.0, CHECK_SW

    INC R1
    ;CPL P1.1
    ACALL	CLEARSCREEN
    MOV A, R1
    ADD A, #30H
    ACALL   WRITETEXT
    JNB P1.0, $
    ACALL DELAY5ms
    SJMP CHECK_SW
;END MAIN

;Delay 50ms ***********************************************
DELAY:
    MOV TH0, #HIGH(COUNT1)
    MOV TL0, #LOW(COUNT1)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
RET
;End Delay ************************************************

;Delay 5ms ***********************************************
DELAY5ms:
    MOV TH0, #HIGH(COUNT2)
    MOV TL0, #LOW(COUNT2)
    SETB TR0
    JNB TF0, $
    CLR TR0
    CLR TF0
RET
;End Delay ************************************************

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

END
