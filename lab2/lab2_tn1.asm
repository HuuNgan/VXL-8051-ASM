;hien thi so 9 len LED0 dung CT con DisplayLED
ORG 2000H
MAIN:
    ACALL DisplayLED
;xuat 9 ra LED0
DisplayLED:
    MOV A, #11101001B
    MOV DPTR, #0000H
    MOVX @DPTR, A
RET
END