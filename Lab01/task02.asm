MOV AX, 40H ; AX = M
MOV BX, 20H ; BX = N
MOV CX, 10H ; CX = O

ADD BX, CX  ; BX = N+O
SUB AX, BX  ; AX - BX
MOV CX, AX  ; O = M - (N+O)  

SUB BX, BX  ; clearing register
SUB AX, AX  ; clearing register