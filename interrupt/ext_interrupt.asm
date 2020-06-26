      ORG 0000H
      LJMP MAIN
      ORG 0013H
LOOP:
      CPL A
      MOV P1,A
      JB IE1,LOOP
      RETI
      ORG 0030H
MAIN:
      SETB EA
      SETB EX1
      SETB IT1
      MOV A,#0AAH
LOOP1:
      MOV P1,A
      SJMP LOOP1
      END
