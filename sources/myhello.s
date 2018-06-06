	.global _start
	.text

_start:
	nop
	mov	$5, %r8
	nop
	mov	x, %r9
	nop
	add	%r9, %r8
	nop
	mov	%r8, %r10
	nop

nend:	nop
	nop
	jmp	nend

end:
	nop
	nop

	.data

x:	.quad	3
y:	.quad	4



