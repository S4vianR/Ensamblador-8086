ORG 100h  ; Inicio del programa
MOV CX, 5  ; Cargar el contador con 5


CICLO:
    MOV AH, 02h  ; Funcion para imprimir un caracter
    MOV DL, '@'  ; Mueve el valor ASCII del caracter '@' a DL
    INT 21h      ; Llamada al sistema para mostrar en pantalla
    LOOP CICLO   ; Repetir hasta que CX = 0

RET  ; Termina el programa
