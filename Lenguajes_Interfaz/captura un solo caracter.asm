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

    ; Capturar un solo carácter
    mov ah, 01h  ; Función 01h: Lee un carácter de teclado
    int 21h      ; El carácter queda en AL

    ; Guardar el carácter en memoria
    mov caracter, al  

    ; Imprimir salto de línea
    mov ah, 09h
    mov dx, offset salto
    int 21h

    ; Mostrar el carácter capturado
    mov ah, 02h  ; Función 02h: Imprimir un solo carácter
    mov dl, caracter
    int 21h

    ; Finalizar programa
    mov ah, 4Ch
    int 21h

; Datos
mensaje db 'Ingresa un caracter: $'
salto db 13, 10, '$'  ; Salto de línea (CR + LF)
caracter db ?          ; Variable para almacenar el carácter

code ends
end start
