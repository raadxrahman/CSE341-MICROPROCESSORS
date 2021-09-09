; Md. Mahbubur Rahman, ID- 19101069


.MODEL SMALL
.STACK 100h
.DATA


A db "ENTER A HEX DIGIT:$"
B db "IN DECIMAL IT IS $"
C db "DO YOU WANT TO DO IT AGAIN?:$"
D db "ILLEGAL CHARACTER, $"


.CODE


MAIN PROC
MOV AX, @DATA
MOV DS, AX


    start:           
    MOV ah, 9
    LEA dx,A
    INT 21h                        ; prompt A out        
         
           
    MOV ah,1
    INT 21h                        ; input
    MOV bl,al                      
    
  
    MOV ah,2                       ; newline
    MOV dl,0DH
    INT 21h
    MOV dl, 0AH
    INT 21h    
         
         
    cmp bl, 41h
    jge case1
    cmp bl,30h
    jge case2
    
     
        case1:                         
        cmp bl, 46h                    ; til hex F 
        jg illegal_char                
        
        MOV ah, 9
        LEA dx,B
        INT 21h                        ; string B out       
           
           
        mov dl, 31h
        mov ah, 2
        int 21h                        ; output "1"       
            
            
        sub bl, 17                     
        mov dl,bl                      
        mov ah, 2
        int 21h                        
        jmp end 
       
       
        case2:
        cmp bl, 39h                    ; til hex 9
        jg illegal_char 
        
        MOV ah, 9
        LEA dx,B
        INT 21h                        ; string B out        
         
               
        mov dl,bl                       
        mov ah, 2
        int 21h                        ; output
        jmp end
            
       
    illegal_char:  
    
    MOV ah, 9
    LEA dx,D
    INT 21h 
                           ; string D out                          
    jmp start  
    
    
    end:                           ; newline
    mov ah,2
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
       
       
    MOV ah, 9
    LEA dx,C
    INT 21h                        ; prompt C out
        
        
    mov ah,1
    int 21h                        ; input 
        
        
    cmp al, 'y' 
    mov ah,2                        
    mov dl,0DH
    int 21h
    mov dl, 0AH
    int 21h
    je start  
    
    
    cmp al, 'n'
    end 


MOV AX, 4C00H
INT 21H
    
    
MAIN ENDP
END MAIN