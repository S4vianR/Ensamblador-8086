; Reuben Rhienhart - 20112048
; Titulo: Imprimir alfabeto (MAYUSCULAS)

org 100h

.code
start:
    mov dl, 'A'
ciclo:
    mov ah, 02h          
    int 21h              
    inc dl               
    cmp dl, 'Z'          
    jbe ciclo            

exit:
HLT