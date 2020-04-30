;Doc trang thai P1.0 va xuat ra P3.0
ORG 2000H
SETB P1.0		;SET bit P1.0 de cau hinh la input
LOOP: MOV C, P1.0
      MOV P3.0, C
	  SJMP LOOP
END