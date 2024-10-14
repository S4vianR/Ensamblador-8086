; Reuben Rhienhart - 20112048

org 100h

.data
msg1 db 'Teclear el primer numero: $'
msg2 db 'Teclear el segundo numero: $'
msg3 db 'La suma es: $'
msg4 db 'Quiere volver a capturar? (1=Si/2=No) $'   
msg5 db 'Programa terminado $'  
msg6 db 'Opcion invalida.... $'
num  db ?
uni  db ?
dece db ?

.code
inicio:  

mov ax, 0003h
int 10h

mov ah, 09h
mov dx, offset msg1
int 21h

mov ah, 01h
int 21h

sub al, 30h   ; O los 48 en decimal
mov num, al

mov ah, 02h
mov dh, 1
mov dl, 0
mov bh, 0
int 10h  

mov ah, 09h
lea dx, msg2
int 21h

mov ah, 01h
int 21h    

sub al, 30h
add al, num

aam

cmp ah, 0   ; Si ah es 0 no hay decenas
je  unidades 
            
mov uni, al
mov dece, ah
   
mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0
int 10h
    
; mov ax, 0003h
; int 10h 
    
mov ah, 09h
lea dx, msg3
int 21h

add uni, 30h
add dece, 30h

mov ah, 02h
mov dl, dece
int 21h
       
mov ah, 02h
mov dl, uni
int 21h       
       
mov ah, 02h
mov dh, 5
mov dl, 5
mov bh, 0
int 10h

mov ah, 09h
lea dx, msg4
int 21h
     
mov ah, 01h
int 21h

jmp comparar

unidades:

mov uni, al
add uni, 30h

mov ah, 02h
mov dh, 2
mov dl, 0
mov bh, 0
int 10h

mov ah, 09h
lea dx, msg3
int 21h

mov ah, 02h
mov dl, uni
int 21h 
   
mov ah, 02h
mov dh, 5
mov dl, 5
mov bh, 0
int 10h   

mov ah, 09h
lea dx, msg4
int 21h
     
mov ah, 01h
int 21h

comparar:    

cmp al, 31h
je inicio

cmp al, 32h
je salir  

jmp error

salir:

mov ax, 0003h
int 10h

mov ah, 09h
lea dx, msg5
int 21h

ret

error:

mov ah, 02h
mov dh, 7
mov dl, 5
mov bh, 0
int 10h

mov ah, 09h
lea dx, msg6
int 21h  
 
; Delay timer de aprox. 3seg
mov ah, 86h
mov cx, 0022h   ; 0022h -> Son 3seg | 0000h -> Son 1seg | 0011h -> Son 2seg
mov dx, 03D1h
int 15h
; Fin del delay

jmp inicio




