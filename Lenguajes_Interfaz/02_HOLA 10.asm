
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h

.data
    mensaje db 'Hola$'
.code

    ; Inicializacion del segmento de datos
    mov ax, @data
    mov ds, ax

    ; Inicializacion del contador (10 veces)
    mov cx, 10

imprimir:
    ; Mostrar el mensaje
    mov ah, 09h        ; Funcion para imprimir cadena
    lea dx, mensaje    ; Direccion del mensaje
    int 21h            ; Interrupcion DOS para mostrar el mensaje

    ; Decrementar el contador CX
    loop imprimir

ret




