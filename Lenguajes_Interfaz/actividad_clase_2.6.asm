
; Reuben Rhienhart
; Titulo: Actividad en clase 2.6. Captura de Cadenas

org 100h  

.data
msg db "Ingrese un numero: $"
msg2 db "Mensaje a mostrar: $"
msgStringFrase    db 'Escribe el mensaje: $'
msgFrase          db 'Este es el mensaje escrito: $'
stringFrase db 50 dup(0) ; Espacio para almacenar la cadena, 50char  
numRepeticiones db 0 ; Variable para almacenar el numero de repeticiones


.code
inicio:
; Cambiar ejercicio1 o ejercicio2 como sea necesario
jmp ejercicio2

ejercicio1:
mov ah, 02h
mov dh, 0 ; num. renglon
mov dl, 0 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h

mov ah, 09h
lea dx, msg
int 21h

mov ah, 01h
int 21h

mov bl, al ; Guardar el caracter leido en Al

mov ah, 02h
mov dh, 2 ; num. renglon
mov dl, 0 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h

mov ah, 09h
lea dx, msg2
int 21h

mov ah, 02h
mov dh, 2 ; num. renglon
mov dl, 21 ; num. columna
mov bh, 0 ; num. pagina de memoria
int 10h

mov cx, 10h

loop_letras:
mov ah, 02h
mov dl, bl
int 21h

inc bl ; Incrementar bl

loop loop_letras

; Modificar el programa que muestra un mensaje   ;
; varias veces con un ciclo, de tal manera que   ;
; en vez de que sea un mensaje fijo, se capture  ;
; la cadena que se va a mostrar multiples veces. ;

ejercicio2:
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
je pedirRepeticiones

; Escribir el caracter en el string
mov stringFrase[si], al
inc si
jmp pedirMensaje

continuarPedirMensaje:
jmp pedirMensaje

pedirRepeticiones:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

; Mostrar mensaje para pedir el numero de repeticiones
mov ah, 09h
lea dx, msg
int 21h

; Leer el numero de repeticiones
mov ah, 01h
int 21h
sub al, '0'          ; Convertir de ASCII a numero
mov numRepeticiones, al ; Almacenar el numero de repeticiones

; Imprimir el mensaje
mov cl, al ; Mover el numero de repeticiones a CL
jmp imprimirFrase

imprimirFrase:
; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 09h
lea dx, msgFrase
int 21h

; Imprimir la cadena el numero de veces especificado
mov si, 0

mostrarStringFrase:
; Imprimir el caracter
mov dl, stringFrase[si]
mov ah, 02h
int 21h

inc si
cmp byte ptr stringFrase[si], 0 ; Verificar si hemos llegado al final de la cadena
jne mostrarStringFrase ; Si no es el final, continuar imprimiendo

; Decrementar el contador de repeticiones
dec cl
jnz imprimirFrase ; Si CL no es cero, repetir la impresión

exit:
HLT