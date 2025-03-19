ORG 100h  ; Inicio del programa
MOV CX, 10  ; Cargar el contador con 10


CICLO:
    MOV AH, 02h  ; Función para imprimir un carácter
    ADD DL, 'A'  ; Convertir número a carácter ASCII
    INT 21h      ; Llamada al sistema para mostrar en pantalla
    SUB DL, 'A'  ; Restaurar el valor original
    DEC DL       ; Decrementar número
    LOOP CICLO   ; Repetir hasta que CX = 0

RET  ; Termina el programa
