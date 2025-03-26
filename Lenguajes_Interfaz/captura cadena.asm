code segment
    assume cs:code, ds:code

    ; Definimos los datos
    mensaje db 'Ingresa un texto: $'
    salto db 13, 10, '$'  ; Salto de línea (CR + LF)
    Buffer db 10          ; Tamaño máximo de la cadena (10 caracteres)
           db ?           ; Espacio para almacenar la longitud real ingresada
           db 10 dup('$') ; Espacio para la cadena

start:
    ; Inicializar el segmento de datos
    mov ax, code
    mov ds, ax

    ; Mostrar mensaje de solicitud
    mov ah, 09h
    mov dx, offset mensaje
    int 21h

    ; Capturar la cadena
    mov ah, 0Ah
    mov dx, offset Buffer
    int 21h
    
    

    ; Imprimir salto de línea
    mov ah, 09h
    mov dx, offset salto
    int 21h

    ; Mostrar la cadena ingresada
    mov ah, 09h
    mov dx, offset Buffer+2  ; Omitimos los dos primeros bytes del buffer
    int 21h

    ; Finalizar programa
    mov ah, 4Ch
    int 21h

code ends
end start
