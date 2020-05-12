ORG 2000H
MAIN:
    MOV R1, #0        ;R1 LUU VI TRI THAM CHIEU TABLE
    MOV B, #7FH      ;VI TRI HANG QUET
LOOP:                 ;VONG LAP VO HAN
    MOV A, R1
    MOV DPTR, #TABLE
    MOVC A,@A+DPTR
    MOV R0, A         ;LUU DATA VAO R0
    
    MOV A,B           ;NAP VI TRI HANG VAO A
    ACALL DISPLAY
    ACALL Delay1ms

    MOV A,B
    RL A              ;CHUYEN DEN HANG KE TIEP
    MOV B,A
    INC R1            ;TANG R1 DE LAY DATA HANG KE TIEP
    CJNE R1, #9, LOOP
    MOV R1, #0        ;XOA R1 NEU R1=9
SJMP LOOP

;***********************************************************
;HIEN THI DATA LEN HANG THU Y CUA LED MATRIX
;DATA LUU TREN R0, DUNG THANH GHI A DE QUET
DISPLAY:
    MOV DPTR, #0A000H ;DIA CHI HANG
    MOVX @DPTR, A     ;CHOT HANG
    MOV A, R0
    MOV DPTR, #8000H  ;DIA CHI COT
    MOVX @DPTR, A     ;CHOT DATA
RET
;END DISPLAY
;***********************************************************

;***********************************************************
;DELAY 1ms
Delay1ms:
       MOV R7, #250
DL1:   MOV R6, #250
       DJNZ R6, $
       DJNZ R7, DL1        ;DL1: 'DELAY LOOP 1'
RET
;END Delay1ms
;***********************************************************

TABLE:
    DB    0FH, 11H, 11H, 0FH, 0FH, 11H, 11H, 0FH
END