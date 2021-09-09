; Md. Mahbubur Rahman Raad, ID: 19101069

.MODEL SMALL
.STACK 100h
.DATA


A db "ENTER A HEX DIGIT: $" 

B db "IN DECIMAL IT IS  $"


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
INT 21H             ; String B out        



MOV DL, 31H
MOV AH, 2
INT 21H             ; Char - 1 out through HEX 31H = 1 (because A-F = 10-15, 1 is constant)
       


SUB CH, 11H         ; ASCII Char Hex value-11H = second digit of decimal value 
MOV DL,CH           
MOV AH, 2
INT 21H             

; couldn't make it stop at 15, it works for F onwards as well. 


MOV AX, 4C00H
INT 21H
  
  
  
MAIN ENDP
    END MAIN