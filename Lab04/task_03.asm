; Md. Mahbubur Rahman, ID- 19101069


.MODEL SMALL
.STACK 100h
.DATA
 

A db "1st input: $"
B db "2nd input: $"    
                   
                   
.CODE


MAIN PROC 
    
    
MOV AX, @DATA
MOV DS, AX
 
 
    LEA dx,A                  ; prompt A 
    mov ah,09h 
    int 21h
      
      
    mov ah,1                  ; input 1
    int 21h
    sub al, 30H
    
    
    mov bl, al
    
      
    mov ah,2                  ; newline      
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
    
    
    LEA dx,B                  ; prompt B
    mov ah,09h 
    int 21h
    
    
    mov ah,1                  ; input 2
    int 21h
    sub al, 30H
    mov ah, 0
    
    
    mov dx, 0
    mov cx, bx
    
    
    start:
    add dx, ax                ; 3*2 = 3+3
    loop start
    
    
    mov bx, dx
    
                              
    mov ah,2                  ; newline
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
    
    
    mov dx, bx                ; result out
    add dl, 30H
    mov ah, 2
    int 21h
     
     
end:     
MOV AX, 4C00H
INT 21H
      
      
MAIN ENDP
END MAIN