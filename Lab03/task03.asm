; Md. Mahbubur Rahman - 19101069


.MODEL SMALL
.STACK 100h
.DATA
    
    
A db "Please enter 1-6$"   


.CODE
MAIN PROC 
     
     
MOV AX, @DATA
MOV DS, AX                                
   
              
MOV ah,1
INT 21H                        ; 1st input
SUB al, 30H 
CMP al, 6                      ; checking if input is <6
jg invalid
   
   
MOV bl, al                     ; Stored in BL
   
     
MOV ah,2                       ; newline
MOV dl,0DH
INT 21h
MOV dl, 0AH
INT 21h
  
    
; odd months til 6 are of 31 days
; even months til 6 are of 30 days
; 2nd month is an exception - 28 days

    
CMP bl, 2
je special_case
MOV ax, 0
MOV al, bl
MOV bl, 2
DIV bl
CMP ah, 0
je even
jmp odd
       
       
special_case:
MOV ah, 2
MOV dl, 2
ADD dl, 30h
INT 21h
MOV dl, 8
ADD dl, 30h
INT 21h
jmp end

    
even:
MOV ah, 2
MOV dl, 3
ADD dl, 30H
INT 21h
MOV dl, 0
ADD dl, 30H
INT 21h
jmp end
    
    
odd:
MOV ah, 2
MOV dl, 3
ADD dl, 30H
INT 21h
MOV dl, 1
ADD dl, 30H
INT 21h  
jmp end
   
           
invalid:       
MOV ah,2                        ; newline             
MOV dl,0DH
INT 21H
  
  
MOV dl, 0AH                           
INT 21H  
MOV ah, 9                       ; String A out
LEA dx, A  
INT 21H


end:
MOV AX, 4C00H
INT 21H
   
   
MAIN ENDP
    END MAIN