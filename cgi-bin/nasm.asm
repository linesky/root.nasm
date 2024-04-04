global _start
;nasm -felf32 -o hello.o hello.asm
;gcc hello.o -o hello.elf -nostdlib
section .text
    ; Código de exemplo: imprimir uma mensagem
_start:
    mov eax, 4        ; syswrite
    mov ebx, 1        ; stdout
    mov ecx, mensagem ; endereço da mensagem
    mov edx, tamanho  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema

    ; Finalização do programa
    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; código de saída 0
    int 0x80          ; chama a interrupção do sistema

section .data
mensagem db '<html><body bgcolor="blue">Hello, world</body><html>'
tamanho equ $ - mensagem
