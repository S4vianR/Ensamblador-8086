; Reuben Rhienhart - 20112048
; Programa: Comparacion de cadenas

org 100h

.data  
msgString1      db  'Cadena 1: $'
msgString2      db  'Cadena 2: $'
msgIgual        db  'Son iguales$'
msgDiferente    db 'Son diferentes$'
msgSalir        db  'Gracias por utilizar el programa$'
string1         db  30 dup(20h), '$'
string2         db  30 dup(20h), '$'

.code
;;;;;;;;;;
; Inicio ;
;;;;;;;;;;
inicio:
mov ah, 09h
lea dx, msgString1
int 21h

mov si, 0

escribirString1:
; Pedir el 
mov ah, 01h
int 21h

cmp al, 0Dh
je escribirString2

mov string1[si], al

inc si

jmp escribirString1

nuevaLinea:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 09h
lea dx, msgString2
int 21h

escribirString2:
mov ah, 01h
int 21h

cmp al, 0DH
je comparar

mov string2[di], al

comparar:


salir:
mov ah, 09h
lea dx, msgSalir
int 21h
ret




