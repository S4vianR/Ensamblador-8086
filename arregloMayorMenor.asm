; Reuben Rhienhart - 20112048
; Escribir un arreglo de 6 numeros
; De esos numeros sacar el menor y el mayor

org 100h

.data                                                     
msgNumeros db 'Numeros que desea guardar en el arreglo:$'   
msgMayor db 'El numero mayor es:$'
msgMenor db 'El numero menor es:$'
msgSalir db 'Gracias por utilizar el programa$'
miArreglo db 6 dup(0)
numMayor db ?     
numMenor db ?
     
.code 
    
;;;;;;;;;;
; Inicio ;
;;;;;;;;;;
inicio:
; Mostrar el mensaje para pedir numeros
mov ah, 09h
lea dx, msgNumeros
int 21h

; Asegurar que el indice este en 0
mov si, 0

; Preparar el contador
mov cx, 6
 
;;;;;;;;;;; 
; Captura ;
;;;;;;;;;;;
captura:
; Dar un espacio entre numeros
mov ah, 02h
mov dl, 20h
int 21h

; Leer los valores
mov ah, 01h
int 21h

; Ajuste necesario
sub al, 30h

; Guardar el numero el arreglo
mov miArreglo[si], al

; Indice ++
inc si

; Repetir el ciclo
loop captura

; Inicializar variables y preparar registros
mov al, miArreglo[0]
mov numMayor, al ; Cargar numMayor con el primer numero del arreglo
mov numMenor, 9 ; Cargar al numMenor ese 9
                    
mov si, 0
mov cx, 6                   
;;;;;;;;;;;;;;;;;;;;
; Comparar numeros ;
;;;;;;;;;;;;;;;;;;;;
compararNumeros:
; Cargar el siguiente numero al registro AL
mov al, miArreglo[si]

; Comparar si el numero cargado es mayor a numMayor
cmp al, numMayor
jg actualizarMayor
                                                   
; Comparar si el numero cargado es menor a numMenor
cmp al, numMenor
jl actualizarMenor

; Si no se cumple ninguna seguir a la siguiente iteracion
jmp iteracionSiguiente
                                                   
;;;;;;;;;;;;;;;;;;;;                    
; Actualizar mayor ;
;;;;;;;;;;;;;;;;;;;;
actualizarMayor:                    
mov numMayor, al
jmp iteracionSiguiente

;;;;;;;;;;;;;;;;;;;;                    
; Actualizar menor ;
;;;;;;;;;;;;;;;;;;;;
actualizarMenor:
mov numMenor, al
jmp iteracionSiguiente


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Iteracion siguiente en comprobarNumeros ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
iteracionSiguiente:
inc si
loop compararNumeros
                    
;;;;;;;;;
; Mayor ;
;;;;;;;;;
mayor:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 09
lea dx , msgMayor
int 21h

; Ajuste necesario para mostrar el numero
add numMayor, 30h
mov ah, 02h
mov dl, numMayor
int 21h

sub numMayor, 30h ; Restaurar el valor original

jmp menor

;;;;;;;;;
; Menor ;
;;;;;;;;;
menor:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 09
lea dx, msgMenor
int 21h

; Ajuste necesario para mostrar el numero
add numMenor, 30h
mov ah, 02h
mov dl, numMenor
int 21h

sub numMenor, 30h ; Restaurar el valor original

jmp salir
     
;;;;;;;;;
; Salir ;
;;;;;;;;;
salir:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

; Tabulacion
mov ah, 02h
mov dl,09h
int 21h

; Mostrar el mensaje de salida
mov ah, 09h
lea dx, msgSalir
int 21h
ret