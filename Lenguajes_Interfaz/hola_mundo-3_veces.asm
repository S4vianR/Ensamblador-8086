; Reuben Rhienhart - 20112048
; Titulo: Imprimir "hola mundo" 3 veces

org 100h

mensaje db 'hola mundo$', 0 ; Definimos la cadena a imprimir, terminada con '$'

mov cx, 03h          ; Inicializamos CX con 3 para imprimir 3 veces
mov dx, offset mensaje ; Cargamos la direcci�n de la cadena en DX

inicio:
    mov ah, 09h    ; Funci�n para imprimir una cadena
    int 21h        ; Llamamos a la interrupci�n para imprimir la cadena
    
    loop inicio     ; Decrementamos CX y repetimos hasta que llegue a 0

exit:
    HLT             ; Finalizamos el programa