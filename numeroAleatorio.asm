; Reuben Rhienhart - 20112048

org 100h

.data
msgInicial      db 'Juego para adivinar un numero oculto $'
msgOportunidad3 db 'Tienes 3 oportunidades $'
msgCapturar     db 'Adivina el numero: $'
msgOportunidad2 db 'Tienes 2 oportunidades $'
msgOportunidad1 db 'Tienes 1 oportunidades $'
msgPerdida      db 'Fin del juego... $' 
msgGana         db 'Has ganado, felicidades $'
msgVolverJugar  db 'Gustas jugar de nuevo? (1=Si/2=NO) $'
numeroAleatorio db ? 
numeroCapturado db ?
vidas           db 3

.code     
;;;;;;;;;;
; Inicio ;
;;;;;;;;;; 
inicio: 
; Limpiar pantalla
mov ax, 0003h
int 10h
; Mostrar el mensaje inicial
mov ah, 09h
lea dx, msgInicial 
int 21h

; Mover el cursor
mov ah, 02h
mov dh, 1 ; num. renglon
mov dl, 0 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h

; Mostrar el primer mensaje con las 3 oportunidades
mov ah, 09h
lea dx, msgOportunidad3
int 21h
 
;;;;;;;;;;;;;
; Aleatorio ;
;;;;;;;;;;;;; 
aleatorio:
mov ah, 2ch ; CH - Horas, CL - Minutos, DH - Segundos, DL - Milisegundos
int 21h

; Mover lo que tiene CX (horas y minutos) a AX donde se hara el ajuste 
mov ax, cx

aam

; Mover lo que tiene al (el segundo digito de los segundos que va de 0-9)
mov numeroAleatorio, al
 
;;;;;;;;;
; Juego ;
;;;;;;;;;
juego:
; Mover el cursor
mov ah, 02h
mov dh, 3 ; num. renglon
mov dl, 0 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h  

; Pedir el numero y revisar su respectivo mensaje
mov ah, 09h
lea dx, msgCapturar 
int 21h

mov ah, 01h
int 21h
        
; Ajuste del numero                       
sub al, 30h
                       
; Comparar los numeros
cmp al, numeroAleatorio
jl numeroMenor
je ganaste

;;;;;;;;;;;;;;;;
; Numero menor ;
;;;;;;;;;;;;;;;;
numeroMenor:
; Mover el cursor
mov ah, 02h
mov dh, 5 ; num. renglon
mov dl, 0 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h

dec vidas
cmp vidas, 02h
je oportunidad2
cmp vidas, 01h
je oportunidad1
cmp vidas, 00h
je perdiste

;;;;;;;;;;;;;;;;;
; Oportunidad 2 ;
;;;;;;;;;;;;;;;;;
oportunidad2:
; Mostrar mensaje de la oportunidad no. 2
mov ah, 09h                              
lea dx, msgOportunidad2 
int 21h
jmp juego

;;;;;;;;;;;;;;;;;
; Oportunidad 1 ;
;;;;;;;;;;;;;;;;;       
oportunidad1:
; Mostrar mensaje de la oportunidad no. 1
mov ah, 09h                              
lea dx, msgOportunidad1 
int 21h
jmp juego       


;;;;;;;;;;;;
; Perdiste ;
;;;;;;;;;;;;
perdiste:
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mostrar mensaje de derrota
mov ah, 09h
lea dx, msgPerdida 
int 21h

jmp salir


;;;;;;;;;;;
; Ganaste ;
;;;;;;;;;;;
ganaste:
; Limpiar pantalla
mov ax, 0003h
int 10h

; Mostrar mensaje de victoria
mov ah, 09h
lea dx, msgGana 
int 21h

; Mover el cursor
mov ah, 02h
mov dh, 1 ; num. renglon
mov dl, 5 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h

; Preguntar si se desea jugar o no
mov ah, 09h
lea dx, msgVolverJugar
int 21h

mov ah, 01h
int 21h

sub al, 30h

cmp al, 01h
je inicio
cmp al, 02h
je salir

;;;;;;;;;
; Salir ;
;;;;;;;;;
salir:
ret