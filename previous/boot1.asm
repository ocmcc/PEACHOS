; 在boot.asm下升级

ORG 0x7c00
BITS 16

start:
    mov si, message
    call print
    jmp $

print:
    mov bx, 0
.loop:
    ; lodsb将si寄存器中的数据，加载到al中
    lodsb
    cmp al, 0
    ; je: Jump if left Equals right	相等跳转 (左操作数=右操作数)
    je .done
    call print_char
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: db 'Hello Medi!', 0

times 510 - ($ - $$) db 0
dw 0xAA55
