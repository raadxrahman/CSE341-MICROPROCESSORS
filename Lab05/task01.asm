; Md. Mahbubur Rahman , ID- 19101069

.MODEL SMALL
.STACK 100h
.DATA


nm db "Mahbubur Rahman"


.CODE
MAIN PROC  
    
MOV AX, @DATA
MOV DS, AX


    MOV CX,15                  ; char length of Name
    MOV AH,2
    MOV SI,0 
    
    
    name_array:
    MOV DL,nm[SI]
     
     
    cmp DL, 32                 ; space
    JE print_name
       
       
    cmp DL, 97                 ; a
    JGE small_char
      
      
    cmp DL, 65                 ; A
    JGE capital_char

    capital_char:              
    CMP DL, 90                 ; Z
    JG print_name
    add DL, 32                 ; space
    JMP print_name 
    
    
    small_char:
    cmp DL, 122                ; z
    
    JG print_name
    sub DL, 32                 ; space
    
    JMP print_name
     
    
    print_name:
    int 21h
    add SI,1
    loop name_array    
       

end:

MOV AX, 4C00H
INT 21H


MAIN ENDP
END MAIN