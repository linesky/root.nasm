global writess
global putss
global fputss
global exitss
global strlens
global strcps
global strcats
global strncps
global memcps
global prints
global memfills
global getout
global getin
global fgetss
global creatss
global closess
global strchrreplace
;nasm -felf32 -o hello.o hello.asm
;gcc hello.o -o hello.elf -nostdlib
section .text
closess:
    mov eax, 6        ; syswrite
    mov ebx, [esp+4]  ; stdout
    int 0x80          ; chama a interrupção do sistema
    ret
creatss:
    mov eax, 8        ; syswrite
    mov ebx, [esp+4]  ; stdout
    mov ecx, [esp+8] ; endereço da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
getin:
    mov ebx,stdinss
    mov eax,[ebx]
    ret
getout:
    mov ebx,stdoutss
    mov eax,[ebx]
    ret
strchrreplace:
    
    mov edi, [esp+4]  ; endereço da mensagem
    mov ah, [esp+8] ;char
    mov bl, [esp+12] ;char

    strchrreplace2:
        mov al,[edi]
        cmp al,ah
        jnz strchrreplace3
        mov [edi],bl
        strchrreplace3:
        inc edi
        dec ecx
        cmp al,0
        jnz strchrreplace2
    
    ret    
memfills:
    
    mov edi, [esp+4]  ; endereço da mensagem
    mov ecx, [esp+8] ;size
    mov al, [esp+12] ;char
    cmp ecx,0
    jz memfills3
    memfills2:
        mov [edi],al
        inc edi
        dec ecx
        cmp ecx,0
        jnz memfills2
    memfills3:
    ret
memcps:
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    mov ecx, [esp+12] ;size
    cmp ecx,0
    jz strncps3
    memcps2:
        mov al,[esi]
        mov [edi],al
        inc esi
        inc edi
        dec ecx
        cmp ecx,0
        jnz memcps2
    memcps3:
    ret
strncps:
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    mov ecx, [esp+12] ;size
    cmp ecx,0
    jz strncps3
    strncps2:
        mov al,[esi]
        mov [edi],al
        inc esi
        inc edi
        dec ecx
        cmp ecx,0
        jnz strncps2
    mov al,0
    mov [edi],al
    strncps3:
    ret
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
writess:
    mov eax, 4        ; syswrite
    mov ebx, [esp+12]  ; stdout
    mov ecx, [esp+4] ; endereço da mensagem
    mov edx, [esp+8]  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
fgetss:
    mov eax, 3        ; sysread
    mov ebx, [esp+12]  ; stdin
    mov ecx, [esp+4] ; endereço da mensagem
    mov edx, [esp+8]  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
fputss:
    mov eax, 4        ; syswrite
    mov ebx, [esp+12]  ; stdout
    mov ecx, [esp+4] ; endereço da mensagem
    mov edx, [esp+8]  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
prints:
    mov eax, 4        ; syswrite
    mov ebx, 1        ; stdout
    mov ecx, [esp+4] ; endereço da mensagem
    mov edx, [esp+8]  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema
    mov eax, 4        ; syswrite
    mov ebx, 1        ; stdout
    mov ecx, enters ; endereço da mensagem
    mov edx, 1  ; tamanho da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
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
stdoutss: dd 1
stdinss: dd 2
enters: db 10
