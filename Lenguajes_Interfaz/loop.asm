; Reuben Rhienhart - 20112048
; Ciclos
org 100h

mov cx, 5 ; Contador 5

ciclo:
    mov ah, 02h
    mov dl, '@'
    int 21h
    loop ciclo
ret




