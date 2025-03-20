; Reuben Rhienhart - 20112048
; Titulo: ...

org 100h
        
mov cx, 10        
        
inicio:

    mov ah, 02h
    add dl, 'A'
    int 21h
    sub dl, 'A'
    dec dl
    loop inicio
    
    jmp exit

exit:
    HLT



