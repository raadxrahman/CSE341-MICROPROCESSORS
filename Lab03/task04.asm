; Md. Mahbubur Rahman - 19101069


.MODEL SMALL
.STACK 100h
.DATA 


A db "1st Side:$"
B db "2nd Side:$"
C db "3rd Side:$"
D db "4th Side:$"
Y db "Y$"
N db "N$"


.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX


MOV ah, 9  
LEA dx, A  
INT 21h               ; String A out           
 
              
MOV ah,1
INT 21h               ; 1st input
SUB al, 30h  
MOV bh, al            ; Side 1 stored in BH 
 
    
MOV ah,2              ; newline
MOV dl,0DH
INT 21h
MOV dl, 0AH
INT 21h
 
 
MOV ah, 9  
LEA dx, B  
INT 21h               ; String B out            
 
              
MOV ah,1
INT 21h               ; 2nd input
SUB al, 30h           
MOV bl, al            ; Side 2 stored in BL
  
  
MOV ah,2              ; newline
MOV dl,0DH
INT 21h
MOV dl, 0AH
INT 21h
 
 
MOV ah, 9  
LEA dx, C  
INT 21h               ; String C out            
 
              
MOV ah,1
INT 21h               ; 3rd input
SUB al, 30h  
MOV ch, al            ; Side 3 stored in CH

  
MOV ah,2              ; newline
MOV dl,0DH
INT 21h
MOV dl, 0AH
INT 21h
 
 
MOV ah, 9  
LEA dx, D  
INT 21h               ; String D out            
 
              
MOV ah,1
INT 21h               ; 4th input
SUB al, 30h  
MOV cl, al            ; Side 4 stored in CL

  
MOV ah,2              ; newline
MOV dl,0DH
INT 21h
MOV dl, 0AH
INT 21h

 
; to be a rectangle, opposite sides should be equal

 
cmp bh, ch            ; bh=ch? 
je second_check
jmp no
 
 
second_check:         
cmp bl, cl            ; bl=cl?
je yes
jmp no
 
 
yes:
MOV ah, 9
LEA dx, Y             ; String Y out
INT 21h
jmp end
 
 
no:
MOV ah, 9             ; String N out
LEA dx, N
INT 21h
jmp end


end:
MOV AX, 4C00H
INT 21H
 
 
MAIN ENDP
    END MAIN