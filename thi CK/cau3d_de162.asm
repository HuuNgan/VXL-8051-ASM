DISPLAY:
    MOV A, 40H
    MOV B, #100
    DIV AB
    PUSH ACC
    MOV A, B
    MOV B, #10
    DIV AB
    SWAP A
    ADD A, B
    MOV P1, A
    POP ACC
    SWAP A
    ANL P2, #0FH
    ADD A, P2
    MOV P2, A
    RET