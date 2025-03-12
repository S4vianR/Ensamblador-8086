; Reuben Rhienhart 20112048

org 100h

jmp ejercicio1
     
;;;;;;;;;;;;;;     
; ejercicio1 ;
;;;;;;;;;;;;;;
ejercicio1:
; 1. Carga los registros con los valores:
;   - Carga el valor 9 en el registro AL (primer numero).
mov al, 09h

;   - Carga el valor 11 en el registro BL (segundo numero).               
mov bl, 11h

;   - Carga el valor 50 en el registro DL (numero adicional para la resta).
mov dl, 50h

; 2. Multiplica los valores en AL y BL sin signo utilizando la instruccion mul.
mul bl

; 3. Resta el valor en DL del resultado de la multiplicacion (que esta en AX).
; 4. Almacena el resultado final en el registro AX.
sub al, dl                                         

; 5. Finaliza el programa.
         
jmp exit
              
;;;;;;;;        
; Exit ;
;;;;;;;;
exit:
HLT
