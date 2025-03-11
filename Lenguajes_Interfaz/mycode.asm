.MODEL SMALL  ; Modelo de memoria pequeño (64K para código y datos)
.STACK 100H   ; Definir espacio para la pila

.DATA         ; Segmento de datos
    MENSAJE DB 'Hola desde Ensamblador!$'  ; Mensaje a imprimir
    MEMVAR DB 55H  ; Variable en memoria con valor inicial 55H

.CODE
MAIN PROC
    ; Inicializar segmentos de datos
    MOV AX, @DATA
    MOV DS, AX

    ; ?? Manipulación de registros internos
    ;MOV AX, 1234H  ; Cargar valor en AX
    ;MOV BX, 5678H  ; Cargar valor en BX
    ;XCHG AX, BX    ; Intercambiar valores entre AX y BX

    ; ?? Acceso a memoria RAM
    MOV [MEMVAR], 77H  ; Guardar 77H en la variable MEMVAR
    MOV AL, [MEMVAR]   ; Recuperar valor en AL

    ; ?? Uso de interrupción para imprimir mensaje
    ;MOV AH, 09H    ; Función 09H de INT 21H (imprimir cadena)
    ;MOV DX, OFFSET MENSAJE  ; Dirección del mensaje
    ;INT 21H        ; Llamar interrupción para imprimir

    ; ?? Terminar programa correctamente
    MOV AH, 4CH    ; Función 4CH de INT 21H (salir del programa)
    INT 21H

MAIN ENDP
END MAIN




