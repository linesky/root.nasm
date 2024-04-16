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
global openss
global getreadss
global getwritess
global getreadwritess
;nasm -felf32 -o hello.o hello.asm
;gcc hello.o -o hello.elf -nostdlib
section .text
openss:
    mov eax, 5       ; syswrite
    mov ebx, [esp+4]  ; stdout
    mov ecx, [esp+8] ; endereço da mensagem
    mov ecx, [esp+12] ; endereço da mensagem
    int 0x80          ; chama a interrupção do sistema
    ret
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
getreadss:
    mov ebx,readsss
    mov eax,[ebx]
    ret
getwritess:
    mov ebx,writesss
    mov eax,[ebx]
    ret
getreadswritess:
    mov ebx,readwritesss
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
        rep
        movsb
    memcps3:
    ret
strncps:
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    mov ecx, [esp+12] ;size
    cmp ecx,0
    jz strncps3
    cld
    strncps2:
    
        rep
        movsb
    strncps3:
    ret
strcats:
    mov edi, [esp+4]  ; endereço da mensagem
    mov esi, [esp+4]  ; endereço da mensagem
    mov ecx,0xffff ; tamanho da mensagem
    cld
    mov eax,0
    strcats4:
        repnz
        scasb
    mov eax,0xffff
    clc
    sub eax,ecx
    
    mov ebx,[esp+4]
    add eax,ebx
    dec eax
    mov [esp+4],eax 
    
    mov edi, [esp+8]  ; endereço da mensagem
    mov esi, [esp+8]  ; endereço da mensagem
    mov ecx,0xffff ; tamanho da mensagem
    cld
    mov eax,0
    strcats5:
        repnz
        scasb
    mov eax,0xffff
    clc
    sub eax,ecx
    mov ecx,eax
    cmp ecx,0
    jz strcats3
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    strcats2:
       rep
       movsb
    strcats3:
    ret
    
strcps:
    mov edi, [esp+8]  ; endereço da mensagem
    mov esi, [esp+8]  ; endereço da mensagem
    mov ecx,0xffff ; tamanho da mensagem
    cld
    mov eax,0
    strcps4:
        repnz
        scasb
    mov eax,0xffff
    clc
    sub eax,ecx
    mov ecx,eax
    cmp ecx,0
    jz strcps3
    mov esi, [esp+8]  ; endereço da mensagem
    mov edi, [esp+4]  ; endereço da mensagem
    strcps2:
       rep
       movsb
    strcps3:
    ret
strlens:
    mov edi, [esp+4]  ; endereço da mensagem
    mov esi, [esp+4]  ; endereço da mensagem
    mov ecx,0xffff ; tamanho da mensagem
    cld
    mov eax,0
    strlens2:
        repnz
        scasb
    mov eax,0xffff
    clc
    sub eax,ecx
    dec eax
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
readsss: dd 0
writesss: dd 1
readwritesss: dd 2
enters: db 10
