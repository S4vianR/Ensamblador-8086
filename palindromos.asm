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

; Pedir mensaje
pedirMensaje:
; Pedir el caracter
mov ah, 01h
int 21h

; Comparar si el caracter es igual al retorno (enter)
cmp al, 0DH
je nuevaLinea

; Comparar si hay algún espacio en el mensaje
cmp al, 32H
; Si es igual, no guardar ese espacio
je pedirMensaje

; Si no es igual, escribir el caracter en el string
mov stringFrase[si], al

inc si

jmp pedirMensaje
               
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

imprimirFrase:
mov ah, 09h
lea dx, msgFrase
int 21h

mov si, 0

mostrarStringFrase:
mov ah, 02h
mov dl, stringFrase[si]
int 21h      

inc si

jmp mostrarStringFrase


salir:
mov ah, 09h
lea dx, msgFinalizado
int 21h
ret




