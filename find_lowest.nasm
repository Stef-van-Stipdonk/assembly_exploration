section .data
data_items:
    dd 3, 67, 222, 34
data_items_end:

section .text
global _start
_start:
    ; ESI will point to the current array element
    mov ESI, data_items

    ; Move first element into EBX as the initial "lowest value"
    mov EAX, [ESI]
    mov EBX, EAX

start_loop:
    add ESI, 4

    cmp ESI, data_items_end
    jge exit

    mov EAX, [ESI]

    cmp EAX, EBX
    jge start_loop
    mov EBX, EAX

    jmp start_loop

exit:
    mov EAX, 1
    int 0x80
