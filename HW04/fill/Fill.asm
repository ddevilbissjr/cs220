    @status
    M=-1                // 0xFFFF
    D=0
    @SETSCREEN
    0;JMP

(LOOP)
    @KBD
        D=M
    @SETSCREEN
        D;JEQ           // If no key detected, set screen to 0
        D=-1            // If key detected, set screen to 1
    
(SETSCREEN)
    @ARG
        M=D
    @status             // black = FFFF, white = 0
        D=D-M
    @LOOP
        D;JEQ           // Reset
    
    @ARG
        D=M
    @status
        M=D
    
    @SCREEN
        D=A
    @8192
        D=D+A
    @i
        M=D
    
(SETLOOP)    
    @i
        D=M-1
        M=D             // i=i-1
    @LOOP
        D;JLT           // if i<0 then LOOP
    
    @status
        D=M
    @i
        A=M
        M=D         // M[address]=status
    @SETLOOP
        0;JMP