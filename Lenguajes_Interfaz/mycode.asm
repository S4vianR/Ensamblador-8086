.MODEL SMALL  ; Modelo de memoria peque�o (64K para c�digo y datos)
.STACK 100H   ; Definir espacio para la pila

.DATA         ; Segmento de datos
    MENSAJE DB 'Hola desde Ensamblador!$'  ; Mensaje a imprimir
    MEMVAR DB 55H  ; Variable en memoria con valor inicial 55H

.CODE
MAIN PROC
    ; Inicializar segmentos de datos
    MOV AX, @DATA
    MOV DS, AX

    ; ?? Manipulaci�n de registros internos
    ;MOV AX, 1234H  ; Cargar valor en AX
    ;MOV BX, 5678H  ; Cargar valor en BX
    ;XCHG AX, BX    ; Intercambiar valores entre AX y BX

    ; ?? Acceso a memoria RAM
    MOV [MEMVAR], 77H  ; Guardar 77H en la variable MEMVAR
    MOV AL, [MEMVAR]   ; Recuperar valor en AL

    ; ?? Uso de interrupci�n para imprimir mensaje
    ;MOV AH, 09H    ; Funci�n 09H de INT 21H (imprimir cadena)
    ;MOV DX, OFFSET MENSAJE  ; Direcci�n del mensaje
    ;INT 21H        ; Llamar interrupci�n para imprimir

    ; ?? Terminar programa correctamente
    MOV AH, 4CH    ; Funci�n 4CH de INT 21H (salir del programa)
    INT 21H

MAIN ENDP
END MAIN




