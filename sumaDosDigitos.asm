; Reuben Rhienhart - 20112048      
; Suma de dos digitos

org 100h

.data
msg1 db 'Teclear el primer numero: $'
msg2 db 'Teclear el segundo numero: $'
msg3 db 'La suma es: $'
msg4 db 'Quiere volver a capturar? (1=Si/2=No) $'   
msg5 db 'Programa terminado $'  
msg6 db 'Opcion invalida.... $'
num1 db ?
num2 db ?
suma db ?

.code
inicio:  

mov ax, 0003h
int 10h

mov ah, 09h
lea dx,  msg1
int 21h

; Leer primer numero de dos digitos
mov ah, 01h
int 21h
sub al, 30h
mov bl, al

mov ah, 01h
int 21h
sub al, 30h
mov bh, al

; Convertir numero de dos digitos a decimal
mov al, bl
mov bl, 10
mul bl
add al, bh
mov bl, al  ; Guardar el resultado en BL

; Leer segundo numero de dos digitos
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0
int 10h
mov ah, 09h
lea dx,  msg2
int 21h

mov ah, 01h
int 21h
sub al, 30h
mov cl, al

mov ah, 01h
int 21h
sub al, 30h
mov ch, al

; Convertir segundo numero de dos digitos a decimal
mov al, cl
mov cl, 10
mul cl
add al, ch
mov cl, al  ; Guardar el resultado en CL

; Realizar suma
mov al, bl
add al, cl

; Convertir suma a cadena de caracteres
mov ah, 0
mov bl, 10
div bl
add al, 30h
mov num1, al
add ah, 30h
mov suma, ah

; Mostrar suma
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0
int 10h

; Mostrar mensaje de texto
mov ah, 09h
lea dx,  msg3
int 21h

; Mostrar número
mov ah, 02h
mov dl, num1
int 21h

mov ah, 02h
mov dl, suma
int 21h

; Preguntar si quiere volver a capturar
mov ah, 02h
mov dh, 5
mov dl, 5
mov bh, 0
int 10h

mov ah, 09h
lea dx,  msg4
int 21h

mov ah, 01h
int 21h

jmp comparar

comparar:    

cmp al, 31h
je inicio

cmp al, 32h
je salir  

jmp error

salir:

mov ax, 0003h
int 10h

mov ah, 09h
lea dx,  msg5
int 21h

ret

error:

mov ah, 02h
mov dh, 7
mov dl, 5
mov bh, 0
int 10h

mov ah, 09h
lea dx,  msg6
int 21h  
 
; Delay timer de aprox. 3seg
mov ah, 86h
mov cx, 0022h   ; 0022h -> Son 3seg | 0000h -> Son 1seg | 0011h -> Son 2seg
mov dx, 03D1h
int 15h
; Fin del delay

jmp inicio