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

    MOV R0, #1    ;HANG 1
    MOV R1, #5    ;COT 5
    ACALL GOTOXY
    ACALL DISPLAYNAME1
    ACALL DELAY1S
    ACALL CLEARSCREEN
    MOV R0, #2    ;HANG 2
    MOV R1, #5    ;COT 5
    ACALL GOTOXY
    ACALL DISPLAYNAME2
    ACALL DELAY1S
    ACALL CLEARSCREEN

    MOV R0, #1    ;HANG 1
    MOV R1, #5    ;COT 5
    ACALL GOTOXY
    ACALL DISPLAYNAME1
    MOV R0, #2    ;HANG 2
    MOV R1, #5    ;COT 5
    ACALL GOTOXY
    ACALL DISPLAYNAME2

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

;IN TEN RA LCD ********************************************
DISPLAYNAME1:
    MOV		A,#0		
LOOP_1:
    MOV		DPTR, #NAME_1
    MOV		R0,A
    MOVC	A,@A+DPTR
    JZ		EXIT_1
    ACALL	WRITETEXT
    MOV		A,R0
    INC		A
    DJNZ	B,	LOOP_1
EXIT_1:			
RET
;END DISPLAYNAME1 ******************************************

;IN TEN RA LCD ********************************************
DISPLAYNAME2:
    MOV		A,#0		
LOOP_2:
    MOV		DPTR, #NAME_2
    MOV		R0,A
    MOVC	A,@A+DPTR
    JZ		EXIT_2
    ACALL	WRITETEXT
    MOV		A,R0
    INC		A
    DJNZ	B,	LOOP_2
EXIT_2:			
RET
;END DISPLAYNAME2 *****************************************

;CHO QUA TRINH TRUYEN DU LIEU HOAN TAT ********************
WAIT_LCD:	
    MOV	R6,#10
DL:			
    MOV	R7, #250
    DJNZ	R7, $
    DJNZ	R6,DL
RET
;END WAIT_LCD *********************************************

;DELAY1S **************************************************
DELAY1S:
      MOV R7, #8
DL1:  MOV R6, #250
DL2:  MOV R5, #250
      DJNZ R5, $
      DJNZ R6, DL2
      DJNZ R7, DL1
RET
;END DELAY1S **********************************************

NAME_1:
    DB "HUU NGAN",0
NAME_2:
    DB "QUOC MINH",0


END