
section .data
section .text

global _start
_start:
	mov EAX, 1
	int 0x80
