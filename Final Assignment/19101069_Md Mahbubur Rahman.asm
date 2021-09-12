; Md. Mahbubur Rahman, ID: 19101069

;1^m + 2^m - 3^m + 4^m - ........ +/- n^m.   

; m=3, n=2, output=9
; m=4, n=3, output=-64

; base cases: 
; if n==0, output=0 (0^m = 0)
; if m==0, output=1 (if numbers=odd), output=2 (if numbers=even)


.MODEL SMALL
.STACK 100h
.DATA


A db "Value of m: $"
B db "Value of n: $"
  
  
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
  
          
MOV AH, 9
LEA DX,A                        ; prompt A out
INT 21H 
  
          
mov ah,1
int 21h                         ; input m
mov bl,al                         
sub bl, 48

                                  
mov ah,2                        ; newline
mov dl,0DH
int 21h
mov dl, 0AH
int 21h     
  
  
MOV AH, 9
LEA DX,B                        ; prompt B out
INT 21H 
 
          
mov ah,1
int 21h                         ; input n
mov bh,al                       
sub bh, 30h

 
mov ah,2                        ; newline
mov dl,0DH
int 21h
mov dl, 0AH
int 21h      
           
            
    cmp bl, 0                       ; m==0?
    je case2                        ; m==0  
    
    cmp bh, 0h                      ; n==0?
    je case1                        ; n==0  
    
    jmp case3                       ; m,n != 0
               
               
               
    case1:
    mov ah, 2
    mov dl, 30h                     ; n == 0, ans = 0
    int 21h                         
    jmp exit  
             
            
    case2:
    mov ax,0                        ; m==0
    mov al, bh
    mov ch, 2h
    div ch                          ; al(m)/ch(2) [even/odd test]
    mov dx, 0 
    
    cmp ah, 1                       ; remainder 1?
    je odd                          ; remainder 1(odd)
    mov dl, ah                      ; n=even
    add dl, 32h                     ; 0 + 32h(2) = 2 
    jmp proceed
    
    odd:
    mov dl, ah
    add dl, 30h                     ; 1 + 30h(0) = 1
    jmp proceed        
            
    proceed:
    mov ah, 2
    int 21h
    jmp exit         
               
    
    case3:
    mov cl,2h                       ; start from 2^m
    mov si, 0 
    mov di, 0
          
          
        loop0:                          ; m>n?
        cmp cl, bh                      ; m>n 
        jg result 
        
        
        mov ch,1                        ; m starts from 1, goes until original m/bl
        mov ax,0
        mov al, 1h                      ; al = 1
        multiply:
        cmp ch, bl                      ; m>bl?
        jg continue           
        mul cl                          ; al=al*cl
        inc ch
        jmp multiply                    ; loop
           
           
    continue:                       ; m>bl
    cmp si, 0           
    je addition                     ; switch
    cmp si, 1
    je subtraction                  ; switch
         
         
    addition:
    add di, ax                      ; storing in di
    mov si, 1                       ; switch
    jmp loop3
         
         
    subtraction:
    sub di, ax                      ; storing in di
    mov si, 0                       ; switch
    jmp loop3
         
         
    loop3: 
    inc cl                          ; n++
    jmp loop0             
    
    
    result:
    add di, 1h                      ; adding initial 1^m=1 w result


mov ax, di                      
mov cx, ax                      ; dl -> ax -> cx

cmp cx, 0                       ; +cx?
jge continue2                   ; +cx
mov ah, 2                       ; -cx
mov dl, 2Dh                     ; (-)
int 21h
mov ax, cx
neg ax                          ; negate


continue2:
mov cx,0
mov dx,0


stackloop:
cmp ax,0                        ; ax>0?
je print                        ; ax>0


; Stack  
      
    mov bx,10                                      
    div bx                 
                                    
    push dx                         ; stack push
    inc cx                          ; cx++
             
                                    
    xor dx,dx                       ; dx=0
    jmp stackloop
    
    
    print:                          
    cmp cx,0                        ; cx>0?
    je exit                         ; cx>0
                                    
    pop dx                          ; stack pop
    
                                    
    add dx,30h
    mov ah,2
    int 21h
             
                                    
    dec cx                          ; cx--
    jmp print

   
   
           
exit:
MOV AX, 4C00H
INT 21H
  

  
MAIN ENDP
END MAIN