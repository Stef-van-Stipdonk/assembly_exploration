section .data
data_items:
	 dd 3, 67, 222, 34
data_items_end:

section .text
global _start
_start:
	mov ESI, data_items ; index register
	mov EAX, [ESI] ; Current value to compare
	mov EBX, EAX ; Current highest value

start_loop:
	add ESI, 4

	cmp ESI, data_items_end
	je exit

	mov EAX, [ESI]

	cmp EAX, EBX
	jle start_loop

	mov EBX, EAX
	jmp start_loop

exit:
	mov EAX, 1
	int 0x80
