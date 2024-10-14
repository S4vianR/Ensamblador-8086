
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; Reuben Rhienhart - 20112048
; Comparacion de tres numeros

org 100h

.data

num1  db ?
num2  db ?
num3  db ?
msg1  db 'Digite el primer numero: $'
msg2  db 'Digite el segundo numero: $'
msg3  db 'Digite el tercer numero: $'
msg4  db 'El mayor es: $'
mayor db ?

.code 

; Bloque inicio
inicio:

; Mostrar primer mensaje
mov ah, 09h
lea dx, msg1
int 21h

; Guardar primer numero
mov ah, 01h 
int 21h
mov num1, al

; Asumir que el primer numero es mayor al principio
mov cl, num1
mov mayor, cl

; Mostrar segundo mensaje
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0
int 10h

mov ah, 09h
lea dx, msg2
int 21h

; Guardar segundo numero
mov ah, 01h
int 21h
mov num2, al

; Mostrar tercer mensaje
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0
int 10h

mov ah, 09h
lea dx, msg3
int 21h

; Guardar tercer numero
mov ah, 01h
int 21h
mov num3, al

jmp inicioComparar

inicioComparar:
; Bloque comparar
compararPrimero:

; CMP por defecto hace if n1 > mayor
mov al, num1

cmp al, mayor
; JL es if n1 < mayor y se va a un bloque
jl compararSegundo

mov al, num1
mov mayor, al
jmp compararSegundo

compararSegundo:

; CMP por defecto hace if n2 > mayor
mov al, num2

cmp al, mayor
; JL es if n2 < mayor y se va a un bloque
jl compararTercero

mov al, num2
mov mayor, al
jmp compararTercero

compararTercero:

; CMP por defecto hace if n3 > mayor
mov al, num3

cmp al, mayor

jle escribirMayor

mov al, num3
mov mayor, al
jmp escribirMayor

; Bloque para mostrar el resultado
escribirMayor:                    

; Imprimir mensaje 4
mov ah, 02h
mov dh, 3
mov dl, 0
mov bh, 0
int 10h

mov ah, 09h
lea dx, msg4
int 21h     

; Imprimir caracter
mov ah, 02h
mov dl, mayor
int 21h


ret
