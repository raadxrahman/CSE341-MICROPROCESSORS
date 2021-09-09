; Md. Mahbubur Rahman, ID- 19101069


.MODEL SMALL
.STACK 100h
.DATA


A db "1st input: $"
B db "2nd input: $"
 

.CODE

MAIN PROC
MOV AX,@DATA
MOV DS,AX 
     
     
    LEA dx,A                  ; prompt A 
    mov ah,09h 
    int 21h
     
                              
    mov ah,1                  ; first input
    int 21h
    mov bl,al
    sub bl,48
     
                              
    MOV ah,2                  ; newline
    MOV DL,0AH 
    INT 21H      
    MOV DL,0DH 
    INT 21H 
    
    
    LEA dx,B                  ; prompt B
    mov ah,09h 
    int 21h
         
         
    mov ah,1                  ; second input 
    int 21h
    mov cl,al
    sub cl,48
    sub cl,bl
         
         
    MOV ah,2                  ; newline
    MOV DL,0AH 
    INT 21H     
    MOV DL,0DH 
    INT 21H
         
         
    mov al,cl
    mov ah,0
    mov cx,ax
    add cx,1
    mov al,bl
    mov bh,al
    mov bl,5                  ; divisible by 5
        
        
    start:
    div bl
    cmp ah,0                  ; divisible = yes 
    je possible_case
    add bh,1
    mov al,bh
    mov ah,0h
    loop start
    hlt
        
        
    possible_case:
    MOV ah,2                  ; newline
    MOV DL,0AH 
    INT 21H     
    MOV DL,0DH 
    INT 21H  
    
    add bh,48
    mov dl,bh
    mov ah,02h 
    int 21h
    sub bh,48
    add bh,1
    mov al,bh
    mov ah,0h
    loop start

  
MOV AX, 4C00H
INT 21H                                                      
           
MAIN ENDP
END MAIN