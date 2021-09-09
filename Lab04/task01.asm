; Md. Mahbubur Rahman, Id- 19101069


.model small
.stack 100h
.data


f db "1st input: $"
s db "2nd input: $"


.code


MAIN PROC
MOV AX, @DATA
MOV DS, AX
   
                               ; prompt f print
    LEA dx,f 
    mov ah,09h 
    int 21h 

  
    mov ah,1
    int 21h                    ; First input
    sub al, 30h
    mov bl,al                  

                           
    mov ah,2                   ; newline
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
  
                               ; prompt s print
    LEA dx,s 
    mov ah,09h 
    int 21h

  
    mov ah,1
    int 21h                    ; second input
    sub al, 30h
    mov cl,al 
    
      
    mov ah,2                   ; newline
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h

    cmp bl, cl
    jg bl_greaterthan_cl
    
    start:
    cmp bl, cl
    jg end
    
    mov ah, 0
    mov al, bl
    
    mov bh, 5                  ; divisible by 5? 
    div bh
    
    cmp ah, 0
    jne divisible_0
    mov ah, 2
    mov dl, bl
    add dl, 30h
    int 21h
    
    
                                   
    mov ah,2                    ; newline
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
    jmp divisible_0
    
    divisible_0:
    inc bl
    jmp start
                       
                       
    bl_greaterthan_cl:
    
    startx:
    cmp cl, bl
    jg end
    
    mov ah, 0
    mov al, cl
    
    mov bh, 5
    div bh
    
    cmp ah, 0
    jne divisible_01
    mov ah, 2
    mov dl, cl
    add dl, 48
    int 21h
    
                                  ; newline
    mov ah,2
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
    jmp divisible_01
     
     
    not_divisible2:
    inc cl
    jmp startx                   
    

end:
MOV AX, 4C00H
INT 21H
  
  
MAIN ENDP
    END MAIN