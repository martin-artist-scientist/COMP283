;ex1.asm

section .bss 

char    resb    1

section .data

cr      db      0x0A

section .text
        global _start
_start:
        jmp reading

reading:
        mov     edx, 1
        mov     ecx, char
        mov     ebx, 0
        mov     eax, 3
        int     0x80

        mov     edx, 1
        mov     ecx, char
        mov     ebx, 1
        mov     eax, 4
        int     0x80

        mov     eax, [char]
        cmp     eax, [cr]
        je      exit
   
        jmp     reading

exit:
        mov     eax, 1
        int     0x80
       

