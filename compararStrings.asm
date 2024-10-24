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
  
;;;;;;;;;;;;;;;;;;;;;;;
; Esribir el string 1 ;
;;;;;;;;;;;;;;;;;;;;;;;  
escribirString1:
; Pedir el caracter 
mov ah, 01h
int 21h

; Comparar si el caracter es igual al enter
cmp al, 0Dh
je nuevaLinea

mov string1[si], al

inc si

jmp escribirString1

;;;;;;;;;;;;;;;
; Nueva linea ;
;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;
; Esribir el string 2 ;
;;;;;;;;;;;;;;;;;;;;;;;
escribirString2:
mov ah, 01h
int 21h

cmp al, 0DH
je comparar

mov string2[di], al 

inc di

jmp escribirString2

comparar:
mov cx, 30
lea si, string1
lea di, string2

rep cmpsb
jne diferentes

; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h
           
; Si son iguales mostrar el mensaje de igual
mov ah, 09h
lea dx, msgIgual
int 21h

jmp salir
           
diferentes:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 09h
lea dx, msgDiferente
int 21h 

jmp salir

salir:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 09h
lea dx, msgSalir
int 21h
ret




