;KIEM TRA SO 8 BIT NEU LA SO DUONG THI XUAT RA LED7SEG
;NEU LA SO AM THI LUU VAO RAM NOI
ORG 0000H
MAIN:
    MOV DPTR, #0000H
LOOP:
    JNB P1.7, SO_DUONG
    MOV 20H, P1
    SJMP LOOP
SO_DUONG:
    MOV A, P1
    CALL SCAN_LED
    SJMP LOOP
;END LOOP
    

SCAN_LED:
    MOV R1, #0
SCAN_LOOP:
    MOV B, #10
    DIV AB
    PUSH ACC
    MOV R0, B
    CALL DisplayLED
    CALL Delay8ms
    INC R1
    POP ACC
    CJNE R1, #3, SCAN_LOOP
RET

;Xuat gia tri luu tren R0 len LED 7 doan o vi tri luu tren R1
DisplayLED:
    MOV B, R1
    INC B
    MOV A, #11110111B
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

;DELAY 8ms
Delay8ms:
       MOV R7, #16
LOOP1: MOV R6, #250
       DJNZ R6, $
       DJNZ R7, LOOP1
RET

END