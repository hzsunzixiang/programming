	.file	"virtual.cpp"
	.section	.text._ZN6ClassA6func_aEv,"axG",@progbits,_ZN6ClassA6func_aEv,comdat
	.align 2
	.weak	_ZN6ClassA6func_aEv
	.type	_ZN6ClassA6func_aEv, @function
_ZN6ClassA6func_aEv:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_ZN6ClassA6func_aEv, .-_ZN6ClassA6func_aEv
	.section	.text._ZN6ClassAC2Ev,"axG",@progbits,_ZN6ClassAC5Ev,comdat
	.align 2
	.weak	_ZN6ClassAC2Ev
	.type	_ZN6ClassAC2Ev, @function
_ZN6ClassAC2Ev:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	$_ZTV6ClassA+8, (%eax)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_ZN6ClassAC2Ev, .-_ZN6ClassAC2Ev
	.weak	_ZN6ClassAC1Ev
	.set	_ZN6ClassAC1Ev,_ZN6ClassAC2Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZN6ClassAC1Ev
	addl	$16, %esp
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.weak	_ZTV6ClassA
	.section	.rodata._ZTV6ClassA,"aG",@progbits,_ZTV6ClassA,comdat
	.align 8
	.type	_ZTV6ClassA, @object
	.size	_ZTV6ClassA, 12
_ZTV6ClassA:
	.long	0
	.long	_ZTI6ClassA
	.long	_ZN6ClassA6func_aEv
	.weak	_ZTS6ClassA
	.section	.rodata._ZTS6ClassA,"aG",@progbits,_ZTS6ClassA,comdat
	.type	_ZTS6ClassA, @object
	.size	_ZTS6ClassA, 8
_ZTS6ClassA:
	.string	"6ClassA"
	.weak	_ZTI6ClassA
	.section	.rodata._ZTI6ClassA,"aG",@progbits,_ZTI6ClassA,comdat
	.align 4
	.type	_ZTI6ClassA, @object
	.size	_ZTI6ClassA, 8
_ZTI6ClassA:
	.long	_ZTVN10__cxxabiv117__class_type_infoE+8
	.long	_ZTS6ClassA
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
