            ORG	    2000H
            LJMP    MAIN
            ORG	    200BH
            LJMP    TIMER0_ISR
            ORG	    2030H
MAIN:
            MOV	    TMOD,#01H
            MOV	    IE	,#82H
            MOV	    DPTR,#0000H
            SETB    TF0
            MOV     R1, #24H
LOOP:		
            ACALL   CHUYEN_DOI
            JB      P1.7,$
            ACALL   DELAY
            JB      P1.7,$
            JNB	    P1.7,$
            ACALL   DELAY
			
            INC     23H
            MOV     A, 23H
            CJNE    A, #10, LOOP
            MOV     23H, #0
            INC     22H
            MOV     A, 22H
            CJNE    A, #10, LOOP
            MOV     22H, #0
            INC     21H
            MOV     A, 21H
            CJNE    A, #10, LOOP
            MOV     21H, #0
            INC     20H
            MOV     A, 20H
            CJNE    A, #10, LOOP
            MOV     20H, #0
            SJMP    LOOP
TIMER0_ISR:
            CLR	    TR0
            MOV	    TH0,#HIGH(-3000)
            MOV	    TL0, #LOW(-3000)
            SETB    TR0
            MOV	    A,@R1
            MOVX    @DPTR,A
            INC	    R1
            CJNE    R1,#28H,SKIP
            MOV	    R1,#24H
SKIP:       RETI

CHUYEN_DOI:
            MOV     A, 20H
            ADD     A, #01110000B
            MOV     24H, A
            MOV     A, 21H
            ADD     A, #10110000B
            MOV     25H, A
            MOV     A, 22H
            ADD     A, #11010000B
            MOV     26H, A
            MOV     A, 23H
            ADD     A, #11100000B
            MOV     27H, A
            RET

DELAY:
            MOV	    R7,#50
LOOP1:
            MOV	    R6,#250
            DJNZ    R6,$
            DJNZ    R7,LOOP1
            RET
END