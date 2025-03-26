code segment
    assume cs:code, ds:code

start:
    ; Inicializar el segmento de datos
    mov ax, code
    mov ds, ax

    ; Mostrar mensaje de solicitud
    mov ah, 09h
    mov dx, offset mensaje
    int 21h

    ; Capturar un solo car�cter
    mov ah, 01h  ; Funci�n 01h: Lee un car�cter de teclado
    int 21h      ; El car�cter queda en AL

    ; Guardar el car�cter en memoria
    mov caracter, al  

    ; Imprimir salto de l�nea
    mov ah, 09h
    mov dx, offset salto
    int 21h

    ; Mostrar el car�cter capturado
    mov ah, 02h  ; Funci�n 02h: Imprimir un solo car�cter
    mov dl, caracter
    int 21h

    ; Finalizar programa
    mov ah, 4Ch
    int 21h

; Datos
mensaje db 'Ingresa un caracter: $'
salto db 13, 10, '$'  ; Salto de l�nea (CR + LF)
caracter db ?          ; Variable para almacenar el car�cter

code ends
end start
