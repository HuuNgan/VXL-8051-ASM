ORG 2000H
MAIN:
    MOV R1, #0			
    MOV R0, #1			
LOOP:					;Vong lap vo han
    ACALL DisplayLED    ;Xuat R0 ra LED 0
    ACALL Delay4ms    
    INC R0
	INC R1
    CJNE R0, #5, LOOP
    MOV R0, #1
    MOV R1, #0
    SJMP LOOP
;END MAIN

;Xuat gia tri luu tren R0 len LED 7 doan o vi tri luu tren R1
DisplayLED:
	MOV B, R1
    MOV A, #11101111B
SHIFTLOOP:
    RL A
    DJNZ B, SHIFTLOOP
    
    ANL A, #0F0H
    PUSH ACC
    MOV A, R0
    ANL A, #0FH
    MOV R0, A
    POP ACC
    ORL A, R0

    MOV DPTR, #0000H    ;Dia chi ngoai vi cua LED7SEG
    MOVX @DPTR, A
RET

;DELAY 4ms
Delay4ms:
       MOV R7, #16
LOOP1: MOV R6, #250
       DJNZ R6, $
       DJNZ R7, LOOP1
RET
END