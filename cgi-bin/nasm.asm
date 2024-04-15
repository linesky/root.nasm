global putss
global exitss
global strlens
global strcps
global strcats
;nasm -felf32 -o hello.o hello.asm
;gcc hello.o -o hello.elf -nostdlib
section .text
strcats:
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    strcats2:
        mov al,[edi]
        inc edi
        cmp al,0
        jnz strcats2
     dec edi
     strcats3:
        mov al,[esi]
        mov [edi],al
        inc esi
        inc edi
        cmp al,0
        jnz strcats3
    ret
strcps:
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    strcps2:
        mov al,[esi]
        mov [edi],al
        inc esi
        inc edi
        cmp al,0
        jnz strcps2
    ret
strlens:
    mov ebx, [esp+4]  ; endereço da mensagem
    mov ecx,0 ; tamanho da mensagem
    dec ecx
    strlens2:
        mov al,[ebx]
        inc ebx
        inc ecx
        cmp al,0
        jnz strlens2
    mov eax,ecx
    ret
    ; Código de exemplo: imprimir uma mensagem
putss:
    mov eax, 4        ; syswrite
    mov ebx, 1        ; stdout
    mov ecx, [esp+4] ; endereço da mensagem
    mov edx, [esp+8]  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
exitss:    ; Finalização do programa
    mov eax, 1        ; sys_exit
    mov ebx,[esp+4]      ; código de saída 0
    int 0x80          ; chama a interrupção do sistema
    ret
section .data
db 0
