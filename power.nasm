
section text

global _start
_start:
	push 3
	push 2
	call power
	add ESP, 8
	
	push EAX

	push 2
	push 5
	call power
	add ESP, 8
	
	pop EBX
	add EBX, EAX
	mov EAX, 1
	int 0x80

power:
	push EBP
	mov EBP, ESP
	sub ESP, 4

	mov EAX, [EBP + 8]
	mov ECX, [EBP + 12]

	mov [EBP - 4], EBX

power_loop_start:
	cmp ECX, 1
	je end_power
	
	mov EAX, [EBP - 4]
	imul EAX, EBX

	mov [EBP - 4], EAX

	dec ECX
	jmp power_loop_start

end_power:
	mov EAX, [EBP - 4]
	mov ESP, EBP
	pop EBP
	ret
