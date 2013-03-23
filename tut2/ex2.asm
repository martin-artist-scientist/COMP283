;ex2.asm

%include "system.inc"

section .bss 

char    resb    1

section .data

cr      db      0x0A
space   db      0x20

section .text
        global _start

_start:

reading:
        rawmode
        mov     edx, 1
        mov     ecx, char
        mov     ebx, 0
        mov     eax, 3
        int     0x80
        normalmode

        mov     edx, 1
        mov     ecx, char
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     al, [char]
        cmp     al, [space]
        jne     reading

        mov     edx, 1
        mov     ecx, cr
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     eax, 1
        int     0x80
       
