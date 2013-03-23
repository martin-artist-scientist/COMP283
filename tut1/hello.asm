;hello.asm

section .bss
chars   resb     6


section .data

cr      db     0x0a
msg1    db      'Enter 5 characters then <Return> : '
len1    equ     $ - msg1
msg2    db      'You entered : '
len2    equ     $ - msg2

section .text
        global _start

_start:

        mov     edx, len1
        mov     ecx, msg1
        mov     ebx, 1
        mov     eax, 4
        int     0x80
        
        mov     edx, 6
        mov     ecx, chars
        mov     ebx, 0
        mov     eax, 3
        int     0x80
      
        mov     edx, len2
        mov     ecx, msg2
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, 5
        mov     ecx, chars
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, 1
        mov     ecx, cr
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     eax, 1
        int     0x80

           
