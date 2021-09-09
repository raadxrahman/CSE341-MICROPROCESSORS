; Md. Mahbubur Rahman - 19101069


.MODEL SMALL
.STACK 100h
.DATA


A db "1st input:$"
B db "2nd input:$"
C db "3rd input:$"


.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX


MOV AH, 9  
LEA DX, A  
INT 21H                           ; String A print            
     
              
MOV AH,1
INT 21H                           ; 1st input
SUB AL, 30H  
MOV BH, AL                        ; 1st input stored in BH
     
      
MOV AH,2                          ; newline
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H
    
    
MOV AH, 9  
LEA DX, B  
INT 21H                           ; String B print            
     
              
MOV AH,1
INT 21H                           ; 2nd input
SUB AL, 30H  
MOV BL, AL                        ; 2nd input stored in BL
    
      
MOV AH,2                          ; newline
MOV DL,0DH
INT 21H
MOV DL, 0AH
INT 21H
    
    
MOV AH, 9  
LEA dx, C  
INT 21H                           ; String C print            
    
              
MOV AH,1
INT 21h                           ; 3rd input
SUB AL, 30H                       
MOV CL, AL                        ; 3rd input stored in CL
     
       
MOV AH,2                          ; newline
MOV DL,0DH
INT 21h
MOV DL, 0AH
INT 21H     


; cl<bl 
;   cl<bh -> cl
;   else  -> bh
; else
;   bl<bh -> bl
;   else  -> bh 
 
   
cmp CL, BL                        
jl condition_1

cmp BL,BH                         
jl condition_3

mov DL, BH
jmp exit       
     
     
condition_1 :
cmp CL, BH                         
jl condition_2
mov DL, BH
jmp exit
  
  
condition_2:
mov DL, CL
jmp exit 
   
   
condition_3:
mov DL, BL
jmp exit
   
   
exit:
ADD DL, 30H
MOV AH,2
INT 21H 
jmp end


end:
MOV AX, 4C00H
INT 21H
    
    
MAIN ENDP
    END MAIN