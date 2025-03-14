; Reuben Rhienhart - 20112048
; Programa: Detectar palindromos

org 100h

.data
stringFrase       db 60 dup(20h), '$'
stringInvertido   db 60 dup(20h), '$'   
msgTitulo         db 'Programa para detectar palindromos$'
msgStringFrase    db 'Escribe el mensaje: $'
msgEsPalindromo   db 'El mensaje si es palindromo$'
msgNoEsPalindromo db 'El mensaje no es palindromo$'
msgFinalizado     db 'Gracias por utilizar el programa$'
msgFrase          db 'Este es el mensaje escrito: $'
msgFraseInvertido db 'Este es el mensaje invertido: $'

.code     
;;;;;;;;;;
; Inicio ;
;;;;;;;;;;
inicio:
; Mostrar mensaje de inicio (titulo)
mov ah, 09h
lea dx, msgTitulo
int 21h             

;;;;;;;;;;;;;;;;;;;;
; Pedir el mensaje ;
;;;;;;;;;;;;;;;;;;;;

; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

; Preparar el contador
mov si, 0

; Mostrar mensaje para pedir
mov ah, 09h
lea dx, msgStringFrase
int 21h

pedirMensaje:
; Pedir el caracter
mov ah, 01h
int 21h

; Comparar si el caracter es igual al espacio o al retorno (enter)
cmp al, ' '
je continuarPedirMensaje
cmp al, 0DH
je invertir

; Escribir el caracter en el string
mov stringFrase[si], al

inc si

jmp pedirMensaje

continuarPedirMensaje:
jmp pedirMensaje

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Invertir el stringFrase ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov di, 0

invertir:  
dec si              ; Decrementar el indice de stringFrase
; Comparar si hemos invertido todos los caracteres
cmp si, -1         ; si cx es -1, hemos terminado
je nuevaLinea

; Leer el caracter desde el final de stringFrase
mov al, stringFrase[si]
mov stringInvertido[di], al

inc di              ; Incrementar el indice de stringInvertido

jmp invertir
               
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

; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h  

;;;;;;;;;;;;;;;;;;;;;;;               
; Imprimir el mensaje ;
;;;;;;;;;;;;;;;;;;;;;;;
imprimirFrase:
mov ah, 09h
lea dx, msgFrase
int 21h

mov si, 0

mostrarStringFrase:
mov ah, 02h
cmp al, 20h ; Compara con espacio (20h)
je continuarMostrarStringFrase
; Imprimir el caracter
mov dl, stringFrase[si]
int 21h      

inc si

jmp mostrarStringFrase

continuarMostrarStringFrase:
inc si

; Comparar si "SI" es igual a 60, que es la longuitud del arreglo
cmp si, 60
je imprimirFraseInvertido

jmp mostrarStringFrase

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;               
; Imprimir el mensaje invertido ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
imprimirFraseInvertido: 
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h 

mov ah, 09h
lea dx, msgFraseInvertido
int 21h

mov si, 0

mostrarStringInvertido:
mov ah, 02h
cmp al, 20h ; Compara con espacio (20h)
je continuarMostrarStringInvertido
; Imprimir el caracter
mov dl, stringInvertido[si]
int 21h      

inc si

jmp mostrarStringInvertido

continuarMostrarStringInvertido:
inc si

; Comparar si "SI" es igual a 60, que es la longuitud del arreglo
cmp si, 60
je palindromo

jmp mostrarStringInvertido
              
;;;;;;;;;;;;;;              
; Palindromo ;
;;;;;;;;;;;;;;
palindromo:  
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

mov cx, 60
lea si, stringFrase
lea di, stringInvertido

rep cmpsb
jne noPalindromo

; Mostrar el mensaje si es un palindromos
mov ah, 09h
lea dx, msgEsPalindromo
int 21h

jmp salir

noPalindromo:
; Mostrar el mensaje si no es un palindromo
mov ah, 09h
lea dx, msgNoEsPalindromo
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

; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

; Mostrar mensaje de finalizacion del programa
mov ah, 09h
lea dx, msgFinalizado
int 21h
ret