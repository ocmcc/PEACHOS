; Org指令表示下一行汇编代码在汇编成 机器指令 时,第一条指令从Org后指定的地址开始存放
ORG 0X7C00
; 在实模式下，CPU总是进行16位的跳转，即当它在解析跳转的目标时，总是读取内存中的16位的值作为跳转目标。为此，汇编器要配合CPU，产生这种用16位表示偏移量的代码。
BITS 16


start:
    ; 在int10调用bios中断前，需对子参数进行设置。ah值设为0eh表示在Teletype模式下显示字符；al表示要显示的字符；bh和bl分别表示页码（默认当前页）和前景色（仅图形模式），这里不需要，因此直接将bx设置为0
    mov ah, 0eh
    mov al, 'A'
    mov bx, 0
    int 0x10

    ; 在汇编中 $ 的作用是取 $ 所在处的地址。所以jmp $就是一个死循环
    jmp $

; db，保留空间，并且指定空间的内容
times 510 - ($ - $$) db 0  ;$ means current address and $$ means the first address of the current section
dw 0xAA55

