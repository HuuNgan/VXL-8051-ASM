			ORG		2000H
			LJMP	MAIN
			ORG		200BH
			LJMP	TIMER0
			
			ORG		2030H
MAIN:
			MOV		TMOD,#01H
			MOV		IE	,#82H
			MOV		R0,#56
			MOV		R1,#20H
			MOV		DPTR,#0000H
			ACALL	CHUYEN_DOI
			SETB	TF0
			SJMP	$
TIMER0:
			CLR		TR0
			MOV		TH0,#HIGH(-3000)
			MOV		TL0, #LOW(-3000)
			SETB	TR0
			MOV		A,@R1
			MOVX	@DPTR,A
			INC		R1
			CJNE	R1,#24H,SKIP
			MOV		R1,#20H
SKIP:		RETI

;INPUT R0
CHUYEN_DOI:
			MOV		20H,#01110000B
			MOV		R1,#21H
			MOV		A,R0
			MOV		B,#100	
			DIV		AB
			ADD		A,#10110000B
			MOV		@R1,A
			MOV		A,B
			MOV		B,#10
			DIV		AB
			ADD		A,#11010000B
			INC		R1
			MOV		@R1,A
			MOV		A,B
			ADD		A,#11100000B
			INC		R1
			MOV		@R1,A
			RET
			
END