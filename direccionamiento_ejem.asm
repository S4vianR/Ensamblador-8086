.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DB 4AH    ; Definir una variable en memoria
    VAR2 DB 2CH
.CODE
MAIN PROC
    MOV AX, @DATA  ; Inicializar segmento de datos
    MOV DS, AX

    ; ?? Modo inmediato
    MOV AL, 5AH    ; Cargar un valor directo en AL

    ; ?? Modo de registro
    MOV BL, AL     ; Copiar AL en BL

    ; ?? Modo directo
    MOV AL, [VAR1] ; Cargar en AL el valor de VAR1

    ; ?? Modo indirecto
    MOV SI, OFFSET VAR2
    MOV AL, [SI]   ; Cargar en AL el valor almacenado en VAR2

    ; ?? Modo indexado
    MOV SI, OFFSET VAR1
    MOV AL, [SI+2] ; Cargar en AL el valor en VAR1 + 1 byte

    ; ?? Finalizar el programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
