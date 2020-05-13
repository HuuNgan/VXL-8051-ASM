ORG 2000H
DEF:
    VT_LED EQU 3     ;CHON VI TRI LED TU 0 - 3
    VALUE  EQU 5     ;CHON GIA TRI HIEN THI TU 0 - 9
MAIN:
    MOV R1, #VT_LED
    MOV R0, #VALUE
    ACALL DisplayLED

;Xuat gia tri luu tren R0 len LED 7 doan o vi tri luu tren R1
DisplayLED:
    MOV A, R1
    MOV DPTR, #TABLE
    MOVC A, @A+DPTR
    
    PUSH ACC
    MOV A, R0
    ANL A, #0FH
    MOV R0, A
    POP ACC
    ORL A, R0

    MOV DPTR, #0000H    ;Dia chi ngoai vi cua LED7SEG
    MOVX @DPTR, A
RET

TABLE:
    DB        11100000B, 11010000B, 10110000B, 01110000B
END