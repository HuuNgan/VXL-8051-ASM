ORG 2000H
    RS   BIT P3.0
    RW   BIT P3.1
    E    BIT P3.2
    DBUS EQU P1
WAIT:
    CLR RS        ;TRUY XUAT LENH
    SETB RW       ;DOC LENH
    SETB DBUS.7   ;DBUS.7 LA INPUT
    SETB E        ;CHO PHEP TRUY XUAT LCD
    CLR E
    JB DBUS.7, WAIT    ;CHO CO BF=DB7=0
    SETB RS            ;TRUY XUAT DATA
    MOV A, #'M'        ;XUAT KY TU M
    MOV DBUS, A        ;RA LCD
    CLR RW             ;GHI RA LCD
    SETB E
    CLR E
END