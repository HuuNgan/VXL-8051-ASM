ORG 0000H
    JMP MAIN
ORG 0003H
    INC R0              ;TANG R0 KHI NHAN NUT
    RETI
ORG 0030H
MAIN:
    MOV     IE, #81H
    SETB    IT0            ;KICH HOAT NGAT CANH XUONG CHO INTERRUPT0
    MOV     R0, #0      ;RO LUU SO LAN NHAN NUT
LOOP:
    MOV     A, R0
    CALL    DEC2BCD    
    MOV     P0, A  
SJMP LOOP

;CHUYEN A SANG SO BCD NEN VA LUU TRO LAI A
DEC2BCD:
    MOV     B, #10
    DIV     AB
    SWAP    A
    ADD     A, B
RET

;EXTERNAL INTERRUPT 0 SERVICE ROUTINE

END
