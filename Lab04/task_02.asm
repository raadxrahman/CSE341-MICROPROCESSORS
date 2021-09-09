; Md. Mahbubur Rahman, ID- 19101069


.MODEL SMALL
.STACK 100h
.DATA
      
      
.CODE 

MAIN PROC
    
    
MOV AX, @DATA
MOV DS, AX
     
     
    MOV BX, 1
    MOV CX, 2    
    MOV DH, 1
       
       
    start:
    CMP CX, 512                 ; ....+512
    jg terminate
    MOV AL, DH
    MOV AH, 0
    MOV DL, 2                   ; divisible by 2
    DIV DL
    CMP AH, 0
    je addition
    SUB BX, CX                  ; - subtraction
    ADD CX, CX                  ; n * 2 = n + n 
    inc DH
    jmp start
        
        
    addition:
    ADD BX, CX                  ; + addition
    ADD CX, CX                  ; n * 2 = n + n
    inc DH
    jmp start
    
    
    terminate:
    MOV AH, 2
    MOV DX, BX
    int 21h


MOV AX, 4C00H
INT 21H
     
     
MAIN ENDP
END MAIN