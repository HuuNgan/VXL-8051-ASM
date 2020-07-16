ORG 0000H
MAIN:
    MOV R7, #55H
    MOV R6, #55H
    MOV R5, #44H
    MOV R4, #44H

    CALL SO_SANH
    SJMP $

SO_SANH:
    MOV A, R5
    CPL A
    MOV R5, A
    MOV A, R4
    CPL A
    INC A
    MOV R4, A
    CJNE A, #0, SKIP
    INC R5
SKIP:
    MOV A, R7
    ADD A, R5
    MOV R3, A

    MOV A, R6
    ADD A, R4
    MOV R2, A

    JNC SKIP1
    INC R3
SKIP1:
    MOV A, R3
    MOV C, ACC.7
    CPL C
    MOV F0, C
RET
END