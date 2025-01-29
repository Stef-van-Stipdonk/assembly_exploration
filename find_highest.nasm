section .data

data_items:
	 dd 3, 67, 222, 34, 0

section .text

global _start
_start:
	mov EDI, 0 ; index register
	mov EAX, dword [data_items + EDI * 4] ; Current value to compare
	mov EBX, EAX ; Current highest value

start_loop:
	cmp EAX, 0
	je exit
	inc EDI

	mov EAX, [data_items + EDI * 4]
	cmp EAX, EBX
	jle start_loop

	mov EBX, EAX
	jmp start_loop

exit:
	mov EAX, 1
	int 0x80
