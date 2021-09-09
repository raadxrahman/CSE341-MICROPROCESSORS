; Md. Mahbubur Rahman Raad, ID: 19101069

.MODEL SMALL
.STACK 100h
.DATA

A db "Enter First Initial:$"
B db "Enter Second Initial:$"
C db "Enter Third Initial:$"


.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
 
  
           
MOV AH, 9
LEA DX,A
INT 21H             ; String A prompt      
       
       
       
MOV AH,1
INT 21H             ; input 
MOV CH,AL           

      
                    ; newline
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H

     
     
MOV AH, 9
LEA DX,B
INT 21H             ; String B prompt         
      
      
       
MOV AH,1
INT 21H             ; input 
MOV CL,AL 

      
                    ; newline
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H  
      
      

MOV AH, 9
LEA DX,C
INT 21H             ; String C prompt         
      
      
       
MOV AH,1
INT 21H             ; input
MOV BH,AL           


                    ; newline
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H 
     
     
                    ; single line down
MOV AH,2
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H



MOV AH,2
MOV DL, CH  
INT 21H     ; Char A out


MOV AH,2
MOV DL, CL  
INT 21H     ; Char B out


MOV AH,2
MOV DL, BH  
INT 21H     ; Char C out



MOV AX, 4C00H
INT 21H
 
 
 
MAIN ENDP
    END MAIN