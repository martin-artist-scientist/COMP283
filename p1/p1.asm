;p1.asm

%include "system.inc"

section .bss 

char    resb    1

section .data

str1    db      'Enter 10 uppercase letters (others ignored):'
len1    equ     $ - str1
str2    db      'The smallest letter was: '
len2    equ     $ - str2
cr      db      0x0A
count   db      0
low     db      0x5B

section .text
        global _start

_start:

        mov     edx, len1      ;write prompt
        mov     ecx, str1
        mov     ebx, 1
        mov     eax, 4
        int     0x80        

startLoop:
        rawmode
        mov     edx, 1         ;read character
        mov     ecx, char
        mov     ebx, 0
        mov     eax, 3
        int     0x80
        normalmode

        mov     al, [char]     ;char greater than 'Z' ignore it
        cmp     al, 0x5A
        jg      startLoop

        mov     al, [char]     ;char less than 'A' ignore it
        cmp     al, 0x41  
        jl      startLoop

        mov     edx, 1         ;write char
        mov     ecx, char
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     al, [low]      ;compare to low
        cmp     al, [char]
        jg      setLow       

endLoop:
        mov     al, [count]    ;increment count
        add     al, 1
        cmp     al, 9
        jg      exit           ;10 chars entered
        mov     [count], al
        jmp     startLoop

setLow:
        mov     eax, [char]    ;set low to new value
        mov     [low], eax
        jmp     endLoop

exit:
        mov     edx, 1            ;new line
        mov     ecx, cr
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, len2         ;write explanation
        mov     ecx, str2
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, 1            ;write lowest character
        mov     ecx, low
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, 1            ;new line
        mov     ecx, cr     
        mov     ebx, 1
        mov     eax, 4
        int     0x80



        mov     eax, 1            ;exit
        int     0x80

       
