	COUNT	EQU	-50000
	LCD_E	BIT	P3.3
	LCD_RS	BIT	P3.5
	LCDADDR	EQU	6000H
	ORG	2000H
	MOV		R0,#0
	MOV		TMOD,#01H
	MOV		SCON,#50H
	MOV		TMOD,#20H
	MOV		TH1,#20H
	MOV		A,PCON
	SETB	ACC.7
	MOV		PCON,A
	
	MAIN:				
		MOV		A,#'M'
		MOV		SBUF,A
		
		
INIT_LCD:
		MOV	A, #38H
		ACALL	WRITECOM
		MOV	A, #0EH
		ACALL	WRITECOM
		MOV	A, #06H
		ACALL	WRITECOM
		RET
	CLEAR:
		MOV	A, #01H
		ACALL	WRITECOM		
		RET
WRITECOM:
		MOV	DPTR, #LCDADDR
		SETB	LCD_E
		CLR		LCD_RS
		MOVX	@DPTR, A
		CLR		LCD_E
		ACALL	WAIT_LCD
		RET
WRITETEXT:
		MOV	DPTR, #LCDADDR
		SETB	LCD_E
		SETB	LCD_RS
		MOVX	@DPTR, A
		CLR		LCD_E
		ACALL	WAIT_LCD
		RET
WAIT_LCD:	
		MOV	R6,#10
	DL1:			
		MOV	R7, #250
		DJNZ	R7, $
		DJNZ	R6,DL1
		RET
		
DELAY_5u:
	MOV		TH0,#HIGH(COUNT)
	MOV		TL0,#LOW(COUNT)
	SETB	TR0
	JNB		TF0,$
	CLR		TR0
	CLR		TF0
RET

DELAY_200m:
	MOV		R7,#4
LOOP:
	ACALL	DELAY_5u
	DJNZ	R7,LOOP
	RET
END
		END