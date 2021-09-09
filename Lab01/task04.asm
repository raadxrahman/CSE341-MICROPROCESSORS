MOV CH,1
MOV CL,2
MOV DH,3
MOV DL,5



MOV AL, DH   ; moving 3 into AL
DIV DL       ; AL = AL/DH
MOV BH, AL   ; BH = AL (3/5)
MOV AH, 0
           
MOV BL,CH
ADD BL,CL    ; BL = 1+2

MOV AL, CH   ; moving 1 into AL
DIV CL       ; AL = AL/CL
MOV CH, AL   ; CH = 1/2 
MOV AH, 0

MOV AL, BL   ; AL = 1/2
MUL BH       ; AL = (1/2) * (3/5)

SUB AL, CL   ; AL = AL - CL = (1/2) * (3/5) - 2
SUB AL, DH   ; AL = AL - CL = (1/2) * (3/5) - 2 - 3
ADD AL, CL   ; AL = AL - CL = (1/2) * (3/5) - 2 - 3 + 2
SUB AL, CH   ; AL = AL - CL = (1/2) * (3/5) - 2 - 3 + 2 - (1/2)

