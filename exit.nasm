
section .data
section .text

global _start
_start:
	mov EBX, 3
	mov EAX, 1
	int 0x80
