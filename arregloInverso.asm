; Reuben Rhienhart - 20112048

org 100h

.data
msgNumeros db 'Numeros que desea guardar en el arreglo $'
msgInverso db 'Datos guardados en orden inverso.... $'
miArreglo db 5 dup(0)

.code
inicio:  
; Mensaje para pedir numeros
mov ah, 09h
lea dx, msgNumeros
int 21h

; Asegurar que el indice esta en 0
mov si, 0h

; Mover a CX un 5 para pedir los numeros, preparando contador
mov cx, 5                               

; Ciclo llamado captura
captura:    
; Leer valor
mov ah, 01h
int 21h
           
; Ajuste necesario                 
sub al, 30h       

; Guardar el numero al arreglo                 
mov miArreglo[si], al

; Incrementar si en 1 (si++)
inc si
loop captura

; Mover el cursor
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0
int 10h

; Invetir el arreglo
mov ah, 09
lea dx, msgInverso
int 21h   

imprimir:
; Invertir el arreglo
add miArreglo[si-1], 30h

; Imprimir el arreglo invertido
mov ah, 02h
mov dl, miArreglo[si-1]
int 21h

; Decrementar si en 1 (si--)
dec si
jz salir
loop imprimir

salir:
ret




