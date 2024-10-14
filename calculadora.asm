; Reuben Rhienhart - 20112048  | Calculadora basica

org 100h

.data
menuMsg db '                                   '     , 10, 10, 13
        db '-----------------------------------'     , 10, 13
        db '-   Calculadora basica            -'     , 10, 13
        db '-      1. Suma                    -'     , 10, 13
        db '-      2. Resta                   -'     , 10, 13
        db '-      3. Multiplicacion          -'     , 10, 13
        db '-      4. Division                -'     , 10,13
        db '-      5. Salir                   -'     , 10,13
        db '-----------------------------------'     , 10, 10,13
        db 'Que operacion desea realizar? $'         , 10, 13           
        
msg1 db 'Teclee el primer numero $'
msg2 db 'Teclee el segundo numero $'
msgSuma db 'Suma $'
msgResta db 'Resta $'
msgMult db 'Multiplicacion $'
msgDivi db 'Division $'
msgSalir db ' Gracias por usar la aplicacion $'
msgResultado db 'El resultado es $'
num1 db ?   
unidades db ?
decenas db ?
resultado db ?

.code

inicio:
jmp menu       
             
menu:
; Mostrar el menu
mov ah, 09h
lea dx, menuMsg
int 21h

; Leer la opcion
mov ah, 01h
int 21h
sub al, 30h

; Comparar las opciones
cmp al, 01h
je suma

cmp al, 02h
je resta

cmp al, 03h
je multiplicacion

cmp al, 04h
je division

cmp al, 05h
je salir


;;;;;;;;;
; Suma  ;
;;;;;;;;;

suma: 
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mover cursor
mov ah, 02h
mov dh, 0
mov dl, 1
mov bh, 0 
int 10h

; Mostrar el mensaje de bienvenida de suma
mov ah, 09h
lea dx, msgSuma
int 21h

; Mover cursor
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0 
int 10h
; Mostrar el mensaje
mov ah, 09h
lea dx, msg1
int 21h

; Pedir el primer numero
mov ah, 01h
int 21h

sub al, 30h
mov num1, al

; Mover cursor
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0 
int 10h                                 
; Mostrar el mensaje
mov ah, 09h
lea dx, msg2
int 21h

; Pedir el segundo numero
mov ah, 01h
int 21h

; Mover cursor
mov ah, 02h
mov dh, 3
mov dl, 5
mov bh, 0 
int 10h

; Hacer la suma
sub al, 30h

add al, num1

; Ajuste
aam

; Comprobar si las decenas estan en 0
cmp ah, 0h
je unidadesBloque
           
; Si no, solo seguir su curso normal           
mov unidades, al
mov decenas, ah

add unidades, 30h
add decenas, 30h

; Mostrar el mensaje de los resultados
mov ah, 09h
lea dx, msgResultado
int 21h

; Mostrar el numero
mov ah, 02h
mov dl, decenas
int 21h        

mov ah, 02h
mov dl, unidades
int 21h

jmp menu



;;;;;;;;;
; Resta ;
;;;;;;;;;

resta:
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mover cursor
mov ah, 02h
mov dh, 0
mov dl, 1
mov bh, 0 
int 10h

; Mostrar el mensaje de bienvenida de resta
mov ah, 09h
lea dx, msgResta
int 21h

; Mover cursor
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0 
int 10h

; Mostrar el mensaje para pedir el primer numero
mov ah, 09h
lea dx, msg1
int 21h                                         

; Pedir el primer numero
mov ah, 01h
int 21h

; Mover cursor
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0 
int 10h                                 
; Mostrar el mensaje
mov ah, 09h
lea dx, msg2
int 21h

; Pedir el segundo numero
mov ah, 01h
int 21h

; Mover cursor
mov ah, 02h
mov dh, 3
mov dl, 5
mov bh, 0 
int 10h

; Hacer la resta
sub al, 30h

sub al, num1

; Ajuste
aam

; Comprobar si las decenas estan en 0
cmp ah, 0h
je unidadesBloque

; Si no, solo seguir su curso normal
mov unidades, al
mov decenas, ah

add unidades, 30h
add decenas, 30h

; Mostrar el mensaje de los resultados
mov ah, 09h
lea dx, msgResultado
int 21h

; Mostrar el numero
mov ah, 02h
mov dl, decenas
int 21h        

mov ah, 02h
mov dl, unidades
int 21h

jmp menu

;;;;;;;;;;;;;;;;;;
; Multiplicacion ;
;;;;;;;;;;;;;;;;;;

multiplicacion:
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mover cursor
mov ah, 02h
mov dh, 0
mov dl, 1
mov bh, 0 
int 10h

; Mostrar el mensaje de bienvenida a la multiplicacion 
mov ah, 09h
lea dx, msgMult
int 21h

; Mover cursor
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0 
int 10h

; Mostrar el mensaje para pedir el primer numero
mov ah, 09h
lea dx, msg1
int 21h

; Pedir el primer numero
mov ah, 01h
int 21h
sub al, 30h
mov num1, al

; Mover cursor
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0 
int 10h                                 
; Mostrar el mensaje
mov ah, 09h
lea dx, msg2
int 21h

; Pedir el segundo numero
mov ah, 01h
int 21h
sub al, 30h
mov bl, al

; Hacer la multiplicacion
mov al, num1
mul bl

; Ajuste
aam

; Comprobar si las decenas estan en 0
cmp ah, 0h
je unidadesBloque

; Si no, solo seguir su curso normal
mov unidades, al
mov decenas, ah

add unidades, 30h
add decenas, 30h

; Mover cursor
mov ah, 02h
mov dh, 3
mov dl, 0
mov bh, 0 
int 10h

; Mostrar el mensaje de los resultados
mov ah, 09h
lea dx, msgResultado
int 21h

; Mostrar el numero
mov ah, 02h
mov dl, decenas
int 21h        

mov ah, 02h
mov dl, unidades
int 21h 
jmp menu 
 
;;;;;;;;;;;;
; Division ;
;;;;;;;;;;;; 
division:
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mover cursor
mov ah, 02h
mov dh, 0
mov dl, 1
mov bh, 0 
int 10h

; Mostrar el mensaje de bienvenida a la division
mov ah, 09h
lea dx, msgDivi
int 21h

; Mover cursor
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0 
int 10h

; Mostrar el mensaje para pedir el primer numero
mov ah, 09h
lea dx, msg1
int 21h

; Pedir el primer numero
mov ah, 01h
int 21h
sub al, 30h
mov num1, al

; Mover cursor
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0 
int 10h                                 
; Mostrar el mensaje
mov ah, 09h
lea dx, msg2
int 21h

; Pedir el segundo numero
mov ah, 01h
int 21h
sub al, 30h
mov bl, al

; Hacer la division
mov ax, 0
mov al, num1
div bl

; Ajuste
aam

; Comprobar si las decenas estan en 0
cmp ah, 0h
je unidadesBloque

; Si no, solo seguir su curso normal
mov unidades, al
mov decenas, ah

add unidades, 30h
add decenas, 30h

; Mover cursor
mov ah, 02h
mov dh, 3
mov dl, 0
mov bh, 0 
int 10h

; Mostrar el mensaje de los resultados
mov ah, 09h
lea dx, msgResultado
int 21h

; Mostrar el numero
mov ah, 02h
mov dl, decenas
int 21h        

mov ah, 02h
mov dl, unidades
int 21h 
jmp menu 

;;;;;;;;;;;;
; Unidades ;
;;;;;;;;;;;; 
unidadesBloque:   
mov unidades, al
add unidades, 30h

mov ah, 02h
mov dh, 3
mov dl, 5
mov bh, 0
int 10h

mov ah, 09h
lea dx, msgResultado
int 21h

mov ah, 02h
mov dl, unidades
int 21h

jmp menu

;;;;;;;;;
; Salir ;
;;;;;;;;; 
salir:
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mover cursor
mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0 
int 10h

; Mostrar mensaje de salida 
mov ah, 09h
lea dx, msgSalir
int 21h
ret
