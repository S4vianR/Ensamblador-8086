
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AL, 0
CICLO:
    INC AL
    CMP AL, 10
    JL CICLO

ret




