; Reuben Rhienhart 20112048

org 100h

jmp ejercicio4
     
;;;;;;;;;;;;;;     
; ejercicio1 ;
;;;;;;;;;;;;;;
ejercicio1:
; 1. Cargue el valor 25H en el registro AL.
mov al, 25h

; 2. Copie el valor de AL en BL.
mov bl, al

; 3. Cargue 1234H en CX.
mov cx, 1234h

; 4. Mueva el valor de CX a DX.
mov dx, cx

; 5. Almacene el contenido de BL en la direccion de memoria 2000H.
mov [2000h], bl

; 6. Cargue el valor almacenado en 2000H dentro de AH.
mov ah, [2000h]

; 7. Finalice el programa con HLT.
jmp exit

;;;;;;;;;;;;;;     
; ejercicio2 ;
;;;;;;;;;;;;;;
ejercicio2:
; 1. Cargue el valor -5 en el registro AL.
mov al, -5h

; 2. Copie el valor de AL en BL.
mov bl, al   

; 3. Cargue el valor -100 en CX.
mov cx, -100h

; 4. Mueva el valor de CX a DX.
mov dx, cx

; 5. Almacene el contenido de BL en la direccion de memoria 2000H.
mov [2000h], bl

; 6. Cargue el valor almacenado en 2000H dentro de AH.
mov ah, [2000h]

; 7. Finalice el programa con HLT.
jmp exit

;;;;;;;;;;;;;;     
; ejercicio3 ;
;;;;;;;;;;;;;;
ejercicio3:
; 1. Cargue 15H en AL.                 
mov al, 95h        

; 2. Cargue 0AH en BL.
mov bl, 7Ah

; 3. Sume AL y BL, almacenando el resultado en AL.
add al, bl 

; 4. Guarde el resultado en la direccion de memoria 2000H.
mov [2000h], al

; 5. Finalice el programa con HLT.
jmp exit


;;;;;;;;;;;;;;     
; ejercicio4 ;
;;;;;;;;;;;;;;
ejercicio4:
; Realiza un codigo donde restes 20H - 0AH y guarda el resultado en la direccion de memoria 2000H. 
; Utiliza los mismo registros que en los ejercicios anteriores. 
; Compara el resultado hexadecimal, contra el resultado convirtiendo los numeros en formato decimal.  

mov al, 0ah
mov bl, 20h
sub al, bl
mov [2000h], al

jmp exit
              
              
;;;;;;;;;;;;;;     
; ejercicio5 ;
;;;;;;;;;;;;;;
ejercicio5:
; Implementa el siguiente codigo para multiplicar dos valores sin signo
mov al, 04h
mov bl, 05h
mul bl
         
mov [2000h], al
         
jmp exit
              
;;;;;;;;        
; Exit ;
;;;;;;;;
exit:
HLT
