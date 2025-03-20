; Reuben Rhienhart - 20112048
; Titulo: Imprimir n�meros pares del 0 al 8

org 100h

mov cx, 5          ; Inicializamos CX con 5, ya que hay 5 n�meros pares (0, 2, 4, 6, 8)
mov dl, '0'        ; Inicializamos DL con el car�cter '0'

inicio:
    mov ah, 02h    ; Funci�n para imprimir un car�cter
    int 21h        ; Llamamos a la interrupci�n para imprimir el car�cter
    
    add dl, 2      ; Incrementamos DL en 2 para obtener el siguiente n�mero par
    loop inicio     ; Decrementamos CX y repetimos hasta que llegue a 0

exit:
    HLT             ; Finalizamos el programa