; Md. Mahbubur Rahman Raad, ID: 19101069

.MODEL SMALL
.STACK 100h
.DATA  
            
            
x db "The Answer:$"   ; string


.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

    
MOV AH,1
INT 21h      ; taking first input
SUB AL, 30h  ; ASCII to HEX
MOV BL, AL   
  
  
MOV AH,2     ; newline
MOV DL,0DH
INT 21h
MOV DL, 0AH
INT 21h
     
     
MOV AH,1  
INT 21h      ; taking second input
SUB AL, 30h  ; ASCII to HEX
MOV CL,AL    


MOV AH,2     ; newline
MOV DL,0DH
INT 21h
MOV DL, 0AH
INT 21h
    
    
MOV AH, 9  
LEA DX, x    
INT 21h      
 
           
MOV AH,2     ; newline
MOV DL,0DH
INT 21h
MOV DL, 0AH
INT 21h
     
     
MOV AL, CL       
MUL BL       
ADD AL, 30h  ; HEX to ASCII
     
     
MOV DL, AL   ; 
MOV AH, 2  
INT 21h      ; print(output) result       


MOV AX, 4C00h
INT 21h
            
      
MAIN ENDP
    END MAIN