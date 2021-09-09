; Md. Mahbubur Rahman Raad, ID: 19101069

.MODEL SMALL
.STACK 100h
.DATA

.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
    
MOV AH,1
int 21h     ; taking input


MOV CL, AL  
ADD CL, 32  ; converting  UpperCase to LowerCase (UpperCase + 32 = LowerCase)
  
  
MOV AH,2    ; going to a new line
MOV DL,0DH
INT 21h
MOV dl, 0AH
INT 21h

MOV DL, CL  
MOV AH, 2  
INT 21h     ; output      


MOV AX, 4C00H
INT 21H
   
   
MAIN ENDP
    END MAIN