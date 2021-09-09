; Md. Mahbubur Rahman - 19101069


.MODEL SMALL
.STACK 100h
.DATA


A db "1st input:$"
B db "2nd input:$"
X db "Divisible$"
Y db "Not Divisible$"
     
     
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX


MOV AH, 9  
LEA DX, A  
INT 21H                        ; String A print            
       
              
MOV AH,1
INT 21H                        ; 1st input
SUB al, 30H  
MOV BL, AL                     ; stored in BL
       
         
MOV AH,2                       ; newline
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H
   
   
MOV AH, 9  
LEA DX, B  
INT 21H                        ; String B print            
   
              
MOV AH,1
INT 21H                        ; 2nd input
SUB AL, 30H  
MOV BH, AL                     ; stored in BH

                               
MOV AH,2                       ; newline
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H
   
   
MOV AH, 0
MOV AL, BL
MUL BH                         ; AH*BH
MOV CX, AX                     
   
   
MOV BL, 5
MOV BH, 3
   
   
DIV BL
CMP AH,0                       ; %5=0?
je D5                          ; %5=0              
jmp XX              
   
   
D5:
MOV AX, CX
DIV BH
CMP AH, 0                      ; %3=0?
je D3                          ; %3=0
jmp XX              
   
   
D3:
MOV AH, 9  
LEA DX, X                      
INT 21H                        ; String X print
jmp end
   
                               ; not divisible 
XX:
mov ah, 9  
lea dx, Y                      
int 21h                        ; String Y print

      

end:
MOV AX, 4C00H
INT 21H
   
   
MAIN ENDP
    END MAIN