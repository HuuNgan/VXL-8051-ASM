ORG 2000H
DEF:
    HANG_Y EQU 2            ;VI TRI HANG CAN SANG LED: CHON 1-8
    Y_DATA EQU 0FAH         ;TRANG THAI LED TREN HANG Y: CHON 0H-FFH (MSB BEN TRAI LED MATRIX)

MAIN:
    MOV R1, #HANG_Y
    MOV R0, #Y_DATA

;HIEN THI DATA LEN HANG THU Y CUA LED MATRIX
DISPLAY:
    MOV B, R1
    MOV A, #01111111B        ;NAP GIA TRI DAU DUNG DE CHON HANG
SHIFTLOOP:
    RL A
    DJNZ B, SHIFTLOOP

    MOV DPTR, #0A000H
    MOVX @DPTR, A
    MOV A, R0
    MOV DPTR, #8000H
    MOVX @DPTR, A
;END DISPLAY
END