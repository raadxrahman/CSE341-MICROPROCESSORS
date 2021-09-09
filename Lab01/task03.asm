MOV AX, 20H ; AX = D
MOV BX, 10H ; BX = E
MOV CX, 2H  ; CX = F

DIV BX ; D/E
MUL CX ; (D/E) * F