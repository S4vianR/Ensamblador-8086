; Reuben Rhienhart - 20112048
; Titulo: Conteo regresivo del 9 al 1

org 100h

mov cx, 9          ; Inicializamos CX con 9 para contar del 9 al 1
mov dl, '9'        ; Inicializamos DL con el car�cter '9'

inicio:
    mov ah, 02h    ; Funci�n para imprimir un car�cter
    int 21h        ; Llamamos a la interrupci�n para imprimir el car�cter
    
    dec dl         ; Decrementamos DL para que apunte al car�cter anterior
    loop inicio     ; Decrementamos CX y repetimos hasta que llegue a 0

exit:
    HLT             ; Finalizamos el programa