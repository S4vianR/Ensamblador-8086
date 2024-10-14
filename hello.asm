org 100h

.data
msg1 db 'Hoy es juebebes $'

.code
mov ah, 09h
lea dx, msg1
int 21h