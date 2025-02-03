section .data

data_items:
	dd 3, 3, 3
data_items_end:

section .text
global _start
_start:
	mov ESI, data_items ; index register
	mov EAX, [ESI] ; current value
	mov EBX, EAX ; Accumulator
	add ESI, 4

start_loop:
	cmp ESI, data_items_end
	je exit

	mov EAX, [ESI]
	add EBX, EAX
	
	add ESI, 4
	jmp start_loop
exit:
	mov EAX, 1 ; return succes
	int 0x80
