; Reuben Rhienhart - 20112048

org 100h

.data
hola db 'Hola mundo $'
.code 
inicio: 
mov ah, 09h
lea dx, hola
int 21h

; Salto de linea
mov ah, 02h
mov dl, 0AH ; Nueva linea
int 21h    

mov ah, 02h
mov dl, 0DH ; Regresa el cursor al inicio del renglon
int 21h

mov ah, 01h
int 21h    
ret




