MOV AX, 10H ; value assign
MOV BX, 20H ; value assign

ADD CX, AX  ; moving AX to CX

ADD DX, BX  ; moving BX to DX

SUB AX, AX  ; deleting AX initial value
ADD AX, DX  ; moving BX value to AX
          
SUB BX, BX  ; deleting BX initial value        
ADD BX, CX  ; moving CX (AX) value to BX

SUB CX, CX  ; clearing register
SUB DX, DX  ; clearing register