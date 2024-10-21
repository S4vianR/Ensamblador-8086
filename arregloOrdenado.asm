; Reuben Rhienhart - 20112048
; Sorting the array

org 100h

.data
array       db 6 dup(0)          ; Array to hold input numbers
msgWelcome  db 'Welcome to the array sorting program$'
msgWrite    db 'Write the numbers to the array (0-9): $'
msgSorted   db 'The sorted array: $'
msgExit     db 'Thanks for using the program$'

.code    
;;;;;;;;;;;
; Welcome ;
;;;;;;;;;;;
welcome:
    ; Show the welcome message
    mov ah, 09h
    lea dx, msgWelcome
    int 21h

    ; Line jump
    call NewLine

    ; Prepare the index and counter
    mov si, 0
    mov cx, 6

;;;;;;;;;;;;;;;;;;;;;;
; Write to the array ;
;;;;;;;;;;;;;;;;;;;;;;
writeMsg:      
    ; Show the message to write the numbers
    mov ah, 09h
    lea dx, msgWrite
    int 21h

write:
    ; Write the numbers
    mov ah, 01h
    int 21h

    ; Adjust the number
    sub al, 30h        ; Convert ASCII to integer

    ; Store the number in the array
    mov array[si], al

    ; Add a space between the numbers
    mov ah, 02h
    mov dl, 20h
    int 21h

    ; si++
    inc si
    loop write

;;;;;;;;;;;;;;;
; Bubble sort ;
;;;;;;;;;;;;;;; 
bubbleSort:
    mov cx, 6          ; Number of elements
outerLoop:
    mov si, 0          ; Reset index for inner loop
    mov di, cx         ; Set di to the number of elements
    dec di             ; Last element to compare
innerLoop:
    mov al, array[si]  ; Load current element
    mov bl, array[si + 1] ; Load next element
    cmp al, bl         ; Compare current and next
    jbe noSwap         ; If current <= next, no swap
    ; Swap elements
    mov array[si], bl  ; Move next to current
    mov array[si + 1], al ; Move current to next
noSwap:
    inc si             ; Move to the next element
    dec di             ; Decrease the count of elements to check
    jnz innerLoop      ; Repeat inner loop if not done
    dec cx             ; Decrease the count of outer loop
    jnz outerLoop      ; Repeat outer loop if not done
    ret

;;;;;;;;;;;;;;;;
; Print sorted ;
;;;;;;;;;;;;;;;;
printSorted:
    ; Show sorted message
    mov ah, 09h
    lea dx, msgSorted
    int 21h

    ; Print sorted array
    mov cx, 6          ; Number of elements
    mov si, 0          ; Reset index
printSortedArray:
    mov al, array[si]  ; Load sorted element
    add al, 30h        ; Convert back to ASCII
    mov ah, 02h
    int 21h            ; Print the character
    ; Print space
    mov dl, 20h        ; Space character
    int 21h
    inc si             ; Move to the next element
    loop printSortedArray
   
printSortedAray:
mov ah, 02h
mov dl, array[si]

;;;;;;;;
; Exit ;
;;;;;;;;
exit:
    ; Line jump
    call NewLine

    ; Print exit msg
    mov ah, 09h
    lea dx, msgExit
    int 21h

    ret

; Subroutine to print a new line
NewLine:
    mov ah, 02h
    mov dl, 0AH ; New line
    int 21h
    mov dl, 0DH ; Return the cursor to the beginning of the screen
    int 21h
    ret