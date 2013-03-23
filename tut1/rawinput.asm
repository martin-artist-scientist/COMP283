;rawinput.asm

%include "system.inc"

section .bss

mychars resb    1

section .data

cr      db      0x0A
msg1    db      'Press one key : '
len1    equ     $ - msg1
msg2    db      'You pressed : '
len2    equ     $ - msg2

section .text
        global _start

_start:
        mov     edx, len1
        mov     ecx, msg1
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        rawmode
        mov     edx, 1
        mov     ecx, mychars
        mov     ebx, 0
        mov     eax, 3
        int     0x80
        normalmode

        mov     edx, 1
        mov     ecx, cr
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, len2
        mov     ecx, msg2
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     edx, 1
        mov     ecx, mychars
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
