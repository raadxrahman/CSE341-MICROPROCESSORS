; Md. Mahbubur Rahman, ID- 19101069


.MODEL SMALL
.STACK 100h
.DATA


user_inputs db 3 dup(?) 
   
   
X db "Enter Three numbers:$"
Y db "Largest Number:$" 


.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

    
    MOV AH, 9
    LEA DX,X
    INT 21H                    ; String X out
    
    
    MOV CX,3                   ; Loop running 3x
    MOV SI,0
    
                                      
        loop_run:                 
        MOV AH,1
        INT 21h
        MOV user_inputs[SI],AL
        ADD SI,1
        LOOP loop_run
    
                                
    MOV AH,2                   ; newline
    MOV DL,0DH
    INT 21h
    MOV DL, 0AH
    INT 21h 
    
                               
    MOV CX,3                   ; Loop running 3x
    MOV SI,0                   
    MOV BL,0
    
    
    start:
    MOV DL,user_inputs[SI]
    CMP DL, BL                 ; DL>BL?
    JG new_largest             ; DL>BL
    JMP remaining              
    
    
    new_largest:               ; new largest
    MOV BL, DL
    JMP remaining
    
    
    remaining:
    ADD SI,1
    LOOP start
    
    
    MOV AH, 9
    LEA DX,Y
    INT 21h                    ; String Y out
    
    
    MOV AH, 2
    MOV DL, BL
    INT 21h

 
 
end: 

MOV AX, 4C00H
INT 21H


MAIN ENDP
END MAIN