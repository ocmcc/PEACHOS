ORG 0
BITS 16

start:
    cli ; Clear Interupts
    mov ax, 0x7c0
    mov ds, ax
    mov es, ax
    mov ax, 0x00
    mov ss, ax
    mov sp, 0x7c00
    sti ; Enables Interrupts

    mov si, message
    call print
    jmp $

print:
    mov bx, 0
.loop:
    lodsb   ; lodsb将si寄存器中的数据，加载到al中
    cmp al, 0   ; je: Jump if left Equals right	相等跳转 (左操作数=右操作数)
    je .done
    call print_char
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: db 'Hello, Medi!', 0

times 510 - ($ - $$) db 0
dw 0xAA55