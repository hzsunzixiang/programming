	.file	"stack4test.cpp"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZN5StackISsLi40EED2Ev,"axG",@progbits,_ZN5StackISsLi40EED5Ev,comdat
	.align 2
	.weak	_ZN5StackISsLi40EED2Ev
	.type	_ZN5StackISsLi40EED2Ev, @function
_ZN5StackISsLi40EED2Ev:
.LFB1032:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	testl	%eax, %eax
	je	.L1
	movl	8(%ebp), %eax
	leal	160(%eax), %ebx
.L3:
	movl	8(%ebp), %eax
	cmpl	%eax, %ebx
	je	.L1
	subl	$4, %ebx
	subl	$12, %esp
	pushl	%ebx
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L3
.L1:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1032:
	.size	_ZN5StackISsLi40EED2Ev, .-_ZN5StackISsLi40EED2Ev
	.weak	_ZN5StackISsLi40EED1Ev
	.set	_ZN5StackISsLi40EED1Ev,_ZN5StackISsLi40EED2Ev
	.section	.rodata
.LC0:
	.string	"hello"
.LC1:
	.string	"Exception: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1030:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1030
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$444, %esp
	subl	$12, %esp
	leal	-456(%ebp), %eax
	pushl	%eax
	call	_ZN5StackIiLi20EEC1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-372(%ebp), %eax
	pushl	%eax
	call	_ZN5StackIiLi40EEC1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-208(%ebp), %eax
	pushl	%eax
.LEHB0:
	.cfi_escape 0x2e,0x10
	call	_ZN5StackISsLi40EEC1Ev
.LEHE0:
	addl	$16, %esp
	movl	$7, -44(%ebp)
	subl	$8, %esp
	leal	-44(%ebp), %eax
	pushl	%eax
	leal	-456(%ebp), %eax
	pushl	%eax
.LEHB1:
	call	_ZN5StackIiLi20EE4pushERKi
	addl	$16, %esp
	subl	$12, %esp
	leal	-456(%ebp), %eax
	pushl	%eax
	call	_ZNK5StackIiLi20EE3topEv
	addl	$16, %esp
	subl	$8, %esp
	pushl	%eax
	pushl	$_ZSt4cout
	call	_ZNSolsEi
	addl	$16, %esp
	subl	$8, %esp
	pushl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	pushl	%eax
	call	_ZNSolsEPFRSoS_E
	addl	$16, %esp
	subl	$12, %esp
	leal	-456(%ebp), %eax
	pushl	%eax
	call	_ZN5StackIiLi20EE3popEv
.LEHE1:
	addl	$16, %esp
	subl	$12, %esp
	leal	-33(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-33(%ebp), %eax
	pushl	%eax
	pushl	$.LC0
	leal	-40(%ebp), %eax
	pushl	%eax
.LEHB2:
	call	_ZNSsC1EPKcRKSaIcE
.LEHE2:
	addl	$16, %esp
	subl	$8, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	leal	-208(%ebp), %eax
	pushl	%eax
.LEHB3:
	call	_ZN5StackISsLi40EE4pushERKSs
.LEHE3:
	addl	$16, %esp
	subl	$12, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
.LEHB4:
	call	_ZNSsD1Ev
.LEHE4:
	addl	$16, %esp
	subl	$12, %esp
	leal	-33(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	leal	-32(%ebp), %eax
	subl	$8, %esp
	leal	-208(%ebp), %edx
	pushl	%edx
	pushl	%eax
.LEHB5:
	call	_ZNK5StackISsLi40EE3topEv
.LEHE5:
	addl	$12, %esp
	subl	$8, %esp
	leal	-32(%ebp), %eax
	pushl	%eax
	pushl	$_ZSt4cout
.LEHB6:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKSbIS4_S5_T1_E
	addl	$16, %esp
	subl	$8, %esp
	pushl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	pushl	%eax
	call	_ZNSolsEPFRSoS_E
.LEHE6:
	addl	$16, %esp
	subl	$12, %esp
	leal	-32(%ebp), %eax
	pushl	%eax
.LEHB7:
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-208(%ebp), %eax
	pushl	%eax
	call	_ZN5StackISsLi40EE3popEv
	addl	$16, %esp
	subl	$12, %esp
	leal	-208(%ebp), %eax
	pushl	%eax
	call	_ZN5StackISsLi40EE3popEv
.LEHE7:
	addl	$16, %esp
	subl	$12, %esp
	leal	-208(%ebp), %eax
	pushl	%eax
.LEHB8:
	call	_ZN5StackISsLi40EED1Ev
.LEHE8:
	addl	$16, %esp
	movl	$0, %ebx
.L6:
	movl	%ebx, %eax
	jmp	.L21
.L17:
	movl	%eax, %esi
	movl	%edx, %ebx
	subl	$12, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L8
.L16:
	movl	%eax, %esi
	movl	%edx, %ebx
.L8:
	subl	$12, %esp
	leal	-33(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	jmp	.L9
.L18:
	movl	%eax, %esi
	movl	%edx, %ebx
	subl	$12, %esp
	leal	-32(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L9
.L15:
	movl	%eax, %esi
	movl	%edx, %ebx
.L9:
	subl	$12, %esp
	leal	-208(%ebp), %eax
	pushl	%eax
	call	_ZN5StackISsLi40EED1Ev
	addl	$16, %esp
	movl	%esi, %eax
	movl	%ebx, %edx
	jmp	.L11
.L20:
	movl	%eax, %ebx
	call	__cxa_end_catch
	movl	%ebx, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB9:
	call	_Unwind_Resume
.L19:
.L11:
	cmpl	$1, %edx
	je	.L14
	subl	$12, %esp
	pushl	%eax
	call	_Unwind_Resume
.LEHE9:
.L14:
	subl	$12, %esp
	pushl	%eax
	call	__cxa_begin_catch
	addl	$16, %esp
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	-28(%ebp)
	call	*%eax
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$8, %esp
	pushl	$.LC1
	pushl	$_ZSt4cerr
.LEHB10:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	addl	$16, %esp
	subl	$8, %esp
	pushl	%ebx
	pushl	%eax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	addl	$16, %esp
	subl	$8, %esp
	pushl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	pushl	%eax
	call	_ZNSolsEPFRSoS_E
.LEHE10:
	addl	$16, %esp
	movl	$1, %ebx
	call	__cxa_end_catch
	jmp	.L6
.L21:
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1030:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
	.align 4
.LLSDA1030:
	.byte	0xff
	.byte	0
	.uleb128 .LLSDATT1030-.LLSDATTD1030
.LLSDATTD1030:
	.byte	0x1
	.uleb128 .LLSDACSE1030-.LLSDACSB1030
.LLSDACSB1030:
	.uleb128 .LEHB0-.LFB1030
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L19-.LFB1030
	.uleb128 0x1
	.uleb128 .LEHB1-.LFB1030
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L15-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB2-.LFB1030
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L16-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB3-.LFB1030
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L17-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB4-.LFB1030
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L16-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB5-.LFB1030
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L15-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB6-.LFB1030
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L18-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB7-.LFB1030
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L15-.LFB1030
	.uleb128 0x3
	.uleb128 .LEHB8-.LFB1030
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L19-.LFB1030
	.uleb128 0x1
	.uleb128 .LEHB9-.LFB1030
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB1030
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L20-.LFB1030
	.uleb128 0
.LLSDACSE1030:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	_ZTISt9exception
.LLSDATT1030:
	.text
	.size	main, .-main
	.section	.text._ZN5StackIiLi20EEC2Ev,"axG",@progbits,_ZN5StackIiLi20EEC5Ev,comdat
	.align 2
	.weak	_ZN5StackIiLi20EEC2Ev
	.type	_ZN5StackIiLi20EEC2Ev, @function
_ZN5StackIiLi20EEC2Ev:
.LFB1035:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	$0, 80(%eax)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1035:
	.size	_ZN5StackIiLi20EEC2Ev, .-_ZN5StackIiLi20EEC2Ev
	.weak	_ZN5StackIiLi20EEC1Ev
	.set	_ZN5StackIiLi20EEC1Ev,_ZN5StackIiLi20EEC2Ev
	.section	.text._ZN5StackIiLi40EEC2Ev,"axG",@progbits,_ZN5StackIiLi40EEC5Ev,comdat
	.align 2
	.weak	_ZN5StackIiLi40EEC2Ev
	.type	_ZN5StackIiLi40EEC2Ev, @function
_ZN5StackIiLi40EEC2Ev:
.LFB1038:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	$0, 160(%eax)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1038:
	.size	_ZN5StackIiLi40EEC2Ev, .-_ZN5StackIiLi40EEC2Ev
	.weak	_ZN5StackIiLi40EEC1Ev
	.set	_ZN5StackIiLi40EEC1Ev,_ZN5StackIiLi40EEC2Ev
	.section	.text._ZN5StackISsLi40EEC2Ev,"axG",@progbits,_ZN5StackISsLi40EEC5Ev,comdat
	.align 2
	.weak	_ZN5StackISsLi40EEC2Ev
	.type	_ZN5StackISsLi40EEC2Ev, @function
_ZN5StackISsLi40EEC2Ev:
.LFB1041:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1041
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %ebx
	movl	$39, %esi
	movl	%ebx, %edi
	jmp	.L25
.L26:
	subl	$12, %esp
	pushl	%edi
.LEHB11:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1Ev
.LEHE11:
	addl	$16, %esp
	addl	$4, %edi
	subl	$1, %esi
.L25:
	cmpl	$-1, %esi
	jne	.L26
	movl	8(%ebp), %eax
	movl	$0, 160(%eax)
	jmp	.L31
.L30:
	movl	%eax, %edi
	testl	%ebx, %ebx
	je	.L28
	movl	$39, %eax
	subl	%esi, %eax
	sall	$2, %eax
	leal	(%ebx,%eax), %esi
.L29:
	cmpl	%ebx, %esi
	je	.L28
	subl	$4, %esi
	subl	$12, %esp
	pushl	%esi
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L29
.L28:
	movl	%edi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB12:
	call	_Unwind_Resume
.LEHE12:
.L31:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1041:
	.section	.gcc_except_table
.LLSDA1041:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1041-.LLSDACSB1041
.LLSDACSB1041:
	.uleb128 .LEHB11-.LFB1041
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L30-.LFB1041
	.uleb128 0
	.uleb128 .LEHB12-.LFB1041
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE1041:
	.section	.text._ZN5StackISsLi40EEC2Ev,"axG",@progbits,_ZN5StackISsLi40EEC5Ev,comdat
	.size	_ZN5StackISsLi40EEC2Ev, .-_ZN5StackISsLi40EEC2Ev
	.weak	_ZN5StackISsLi40EEC1Ev
	.set	_ZN5StackISsLi40EEC1Ev,_ZN5StackISsLi40EEC2Ev
	.section	.rodata
	.align 4
.LC2:
	.string	"Stack<>::push(): stack is full"
	.section	.text._ZN5StackIiLi20EE4pushERKi,"axG",@progbits,_ZN5StackIiLi20EE4pushERKi,comdat
	.align 2
	.weak	_ZN5StackIiLi20EE4pushERKi
	.type	_ZN5StackIiLi20EE4pushERKi, @function
_ZN5StackIiLi20EE4pushERKi:
.LFB1049:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1049
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	cmpl	$20, %eax
	jne	.L33
	subl	$12, %esp
	pushl	$8
	call	__cxa_allocate_exception
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	leal	-16(%ebp), %eax
	pushl	%eax
.LEHB13:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1EPKcRKSaIcE
.LEHE13:
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
.LEHB14:
	call	_ZNSt12out_of_rangeC1ERKSs
.LEHE14:
	addl	$16, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$_ZNSt12out_of_rangeD1Ev
	pushl	$_ZTISt12out_of_range
	pushl	%ebx
.LEHB15:
	call	__cxa_throw
.LEHE15:
.L33:
	movl	8(%ebp), %eax
	movl	80(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %eax
	movl	%ecx, (%eax,%edx,4)
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
	jmp	.L38
.L37:
	movl	%eax, %esi
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L35
.L36:
	movl	%eax, %esi
.L35:
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$12, %esp
	pushl	%ebx
	call	__cxa_free_exception
	addl	$16, %esp
	movl	%esi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB16:
	call	_Unwind_Resume
.LEHE16:
.L38:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1049:
	.section	.gcc_except_table
.LLSDA1049:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1049-.LLSDACSB1049
.LLSDACSB1049:
	.uleb128 .LEHB13-.LFB1049
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L36-.LFB1049
	.uleb128 0
	.uleb128 .LEHB14-.LFB1049
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L37-.LFB1049
	.uleb128 0
	.uleb128 .LEHB15-.LFB1049
	.uleb128 .LEHE15-.LEHB15
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB16-.LFB1049
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
.LLSDACSE1049:
	.section	.text._ZN5StackIiLi20EE4pushERKi,"axG",@progbits,_ZN5StackIiLi20EE4pushERKi,comdat
	.size	_ZN5StackIiLi20EE4pushERKi, .-_ZN5StackIiLi20EE4pushERKi
	.section	.rodata
.LC3:
	.string	"Stack<>::top(): empty stack"
	.section	.text._ZNK5StackIiLi20EE3topEv,"axG",@progbits,_ZNK5StackIiLi20EE3topEv,comdat
	.align 2
	.weak	_ZNK5StackIiLi20EE3topEv
	.type	_ZNK5StackIiLi20EE3topEv, @function
_ZNK5StackIiLi20EE3topEv:
.LFB1059:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1059
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	testl	%eax, %eax
	jg	.L40
	subl	$12, %esp
	pushl	$8
	call	__cxa_allocate_exception
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC3
	leal	-16(%ebp), %eax
	pushl	%eax
.LEHB17:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1EPKcRKSaIcE
.LEHE17:
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
.LEHB18:
	call	_ZNSt12out_of_rangeC1ERKSs
.LEHE18:
	addl	$16, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$_ZNSt12out_of_rangeD1Ev
	pushl	$_ZTISt12out_of_range
	pushl	%ebx
.LEHB19:
	call	__cxa_throw
.LEHE19:
.L40:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	jmp	.L46
.L45:
	movl	%eax, %esi
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L43
.L44:
	movl	%eax, %esi
.L43:
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$12, %esp
	pushl	%ebx
	call	__cxa_free_exception
	addl	$16, %esp
	movl	%esi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB20:
	call	_Unwind_Resume
.LEHE20:
.L46:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1059:
	.section	.gcc_except_table
.LLSDA1059:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1059-.LLSDACSB1059
.LLSDACSB1059:
	.uleb128 .LEHB17-.LFB1059
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L44-.LFB1059
	.uleb128 0
	.uleb128 .LEHB18-.LFB1059
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L45-.LFB1059
	.uleb128 0
	.uleb128 .LEHB19-.LFB1059
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB20-.LFB1059
	.uleb128 .LEHE20-.LEHB20
	.uleb128 0
	.uleb128 0
.LLSDACSE1059:
	.section	.text._ZNK5StackIiLi20EE3topEv,"axG",@progbits,_ZNK5StackIiLi20EE3topEv,comdat
	.size	_ZNK5StackIiLi20EE3topEv, .-_ZNK5StackIiLi20EE3topEv
	.section	.rodata
.LC4:
	.string	"Stack<>::pop(): empty stack"
	.section	.text._ZN5StackIiLi20EE3popEv,"axG",@progbits,_ZN5StackIiLi20EE3popEv,comdat
	.align 2
	.weak	_ZN5StackIiLi20EE3popEv
	.type	_ZN5StackIiLi20EE3popEv, @function
_ZN5StackIiLi20EE3popEv:
.LFB1062:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1062
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	testl	%eax, %eax
	jg	.L48
	subl	$12, %esp
	pushl	$8
	call	__cxa_allocate_exception
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC4
	leal	-16(%ebp), %eax
	pushl	%eax
.LEHB21:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1EPKcRKSaIcE
.LEHE21:
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
.LEHB22:
	call	_ZNSt12out_of_rangeC1ERKSs
.LEHE22:
	addl	$16, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$_ZNSt12out_of_rangeD1Ev
	pushl	$_ZTISt12out_of_range
	pushl	%ebx
.LEHB23:
	call	__cxa_throw
.LEHE23:
.L48:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
	jmp	.L53
.L52:
	movl	%eax, %esi
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L50
.L51:
	movl	%eax, %esi
.L50:
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$12, %esp
	pushl	%ebx
	call	__cxa_free_exception
	addl	$16, %esp
	movl	%esi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB24:
	call	_Unwind_Resume
.LEHE24:
.L53:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1062:
	.section	.gcc_except_table
.LLSDA1062:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1062-.LLSDACSB1062
.LLSDACSB1062:
	.uleb128 .LEHB21-.LFB1062
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L51-.LFB1062
	.uleb128 0
	.uleb128 .LEHB22-.LFB1062
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L52-.LFB1062
	.uleb128 0
	.uleb128 .LEHB23-.LFB1062
	.uleb128 .LEHE23-.LEHB23
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB24-.LFB1062
	.uleb128 .LEHE24-.LEHB24
	.uleb128 0
	.uleb128 0
.LLSDACSE1062:
	.section	.text._ZN5StackIiLi20EE3popEv,"axG",@progbits,_ZN5StackIiLi20EE3popEv,comdat
	.size	_ZN5StackIiLi20EE3popEv, .-_ZN5StackIiLi20EE3popEv
	.section	.text._ZN5StackISsLi40EE4pushERKSs,"axG",@progbits,_ZN5StackISsLi40EE4pushERKSs,comdat
	.align 2
	.weak	_ZN5StackISsLi40EE4pushERKSs
	.type	_ZN5StackISsLi40EE4pushERKSs, @function
_ZN5StackISsLi40EE4pushERKSs:
.LFB1069:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1069
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	160(%eax), %eax
	cmpl	$40, %eax
	jne	.L55
	subl	$12, %esp
	pushl	$8
	call	__cxa_allocate_exception
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	leal	-16(%ebp), %eax
	pushl	%eax
.LEHB25:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1EPKcRKSaIcE
.LEHE25:
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
.LEHB26:
	call	_ZNSt12out_of_rangeC1ERKSs
.LEHE26:
	addl	$16, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$_ZNSt12out_of_rangeD1Ev
	pushl	$_ZTISt12out_of_range
	pushl	%ebx
.LEHB27:
	call	__cxa_throw
.L55:
	movl	8(%ebp), %eax
	movl	160(%eax), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	%eax
	call	_ZNSsaSERKSs
.LEHE27:
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	160(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 160(%eax)
	jmp	.L60
.L59:
	movl	%eax, %esi
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L57
.L58:
	movl	%eax, %esi
.L57:
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$12, %esp
	pushl	%ebx
	call	__cxa_free_exception
	addl	$16, %esp
	movl	%esi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB28:
	call	_Unwind_Resume
.LEHE28:
.L60:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1069:
	.section	.gcc_except_table
.LLSDA1069:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1069-.LLSDACSB1069
.LLSDACSB1069:
	.uleb128 .LEHB25-.LFB1069
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L58-.LFB1069
	.uleb128 0
	.uleb128 .LEHB26-.LFB1069
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L59-.LFB1069
	.uleb128 0
	.uleb128 .LEHB27-.LFB1069
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB28-.LFB1069
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
.LLSDACSE1069:
	.section	.text._ZN5StackISsLi40EE4pushERKSs,"axG",@progbits,_ZN5StackISsLi40EE4pushERKSs,comdat
	.size	_ZN5StackISsLi40EE4pushERKSs, .-_ZN5StackISsLi40EE4pushERKSs
	.section	.text._ZNK5StackISsLi40EE3topEv,"axG",@progbits,_ZNK5StackISsLi40EE3topEv,comdat
	.align 2
	.weak	_ZNK5StackISsLi40EE3topEv
	.type	_ZNK5StackISsLi40EE3topEv, @function
_ZNK5StackISsLi40EE3topEv:
.LFB1070:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1070
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	12(%ebp), %eax
	movl	160(%eax), %eax
	testl	%eax, %eax
	jg	.L62
	subl	$12, %esp
	pushl	$8
	call	__cxa_allocate_exception
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC3
	leal	-16(%ebp), %eax
	pushl	%eax
.LEHB29:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1EPKcRKSaIcE
.LEHE29:
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
.LEHB30:
	call	_ZNSt12out_of_rangeC1ERKSs
.LEHE30:
	addl	$16, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$_ZNSt12out_of_rangeD1Ev
	pushl	$_ZTISt12out_of_range
	pushl	%ebx
.LEHB31:
	call	__cxa_throw
.L62:
	movl	12(%ebp), %eax
	movl	160(%eax), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	_ZNSsC1ERKSs
.LEHE31:
	addl	$16, %esp
	jmp	.L68
.L67:
	movl	%eax, %esi
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L65
.L66:
	movl	%eax, %esi
.L65:
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$12, %esp
	pushl	%ebx
	call	__cxa_free_exception
	addl	$16, %esp
	movl	%esi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB32:
	call	_Unwind_Resume
.LEHE32:
.L68:
	movl	8(%ebp), %eax
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE1070:
	.section	.gcc_except_table
.LLSDA1070:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1070-.LLSDACSB1070
.LLSDACSB1070:
	.uleb128 .LEHB29-.LFB1070
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L66-.LFB1070
	.uleb128 0
	.uleb128 .LEHB30-.LFB1070
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L67-.LFB1070
	.uleb128 0
	.uleb128 .LEHB31-.LFB1070
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB32-.LFB1070
	.uleb128 .LEHE32-.LEHB32
	.uleb128 0
	.uleb128 0
.LLSDACSE1070:
	.section	.text._ZNK5StackISsLi40EE3topEv,"axG",@progbits,_ZNK5StackISsLi40EE3topEv,comdat
	.size	_ZNK5StackISsLi40EE3topEv, .-_ZNK5StackISsLi40EE3topEv
	.section	.text._ZN5StackISsLi40EE3popEv,"axG",@progbits,_ZN5StackISsLi40EE3popEv,comdat
	.align 2
	.weak	_ZN5StackISsLi40EE3popEv
	.type	_ZN5StackISsLi40EE3popEv, @function
_ZN5StackISsLi40EE3popEv:
.LFB1072:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1072
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	movl	160(%eax), %eax
	testl	%eax, %eax
	jg	.L70
	subl	$12, %esp
	pushl	$8
	call	__cxa_allocate_exception
	addl	$16, %esp
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC4
	leal	-16(%ebp), %eax
	pushl	%eax
.LEHB33:
	.cfi_escape 0x2e,0x10
	call	_ZNSsC1EPKcRKSaIcE
.LEHE33:
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	%ebx
.LEHB34:
	call	_ZNSt12out_of_rangeC1ERKSs
.LEHE34:
	addl	$16, %esp
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$_ZNSt12out_of_rangeD1Ev
	pushl	$_ZTISt12out_of_range
	pushl	%ebx
.LEHB35:
	call	__cxa_throw
.LEHE35:
.L70:
	movl	8(%ebp), %eax
	movl	160(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 160(%eax)
	jmp	.L75
.L74:
	movl	%eax, %esi
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZNSsD1Ev
	addl	$16, %esp
	jmp	.L72
.L73:
	movl	%eax, %esi
.L72:
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	subl	$12, %esp
	pushl	%ebx
	call	__cxa_free_exception
	addl	$16, %esp
	movl	%esi, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB36:
	call	_Unwind_Resume
.LEHE36:
.L75:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1072:
	.section	.gcc_except_table
.LLSDA1072:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1072-.LLSDACSB1072
.LLSDACSB1072:
	.uleb128 .LEHB33-.LFB1072
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L73-.LFB1072
	.uleb128 0
	.uleb128 .LEHB34-.LFB1072
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L74-.LFB1072
	.uleb128 0
	.uleb128 .LEHB35-.LFB1072
	.uleb128 .LEHE35-.LEHB35
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB36-.LFB1072
	.uleb128 .LEHE36-.LEHB36
	.uleb128 0
	.uleb128 0
.LLSDACSE1072:
	.section	.text._ZN5StackISsLi40EE3popEv,"axG",@progbits,_ZN5StackISsLi40EE3popEv,comdat
	.size	_ZN5StackISsLi40EE3popEv, .-_ZN5StackISsLi40EE3popEv
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1107:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	cmpl	$1, 8(%ebp)
	jne	.L76
	cmpl	$65535, 12(%ebp)
	jne	.L76
	subl	$12, %esp
	pushl	$_ZStL8__ioinit
	call	_ZNSt8ios_base4InitC1Ev
	addl	$16, %esp
	subl	$4, %esp
	pushl	$__dso_handle
	pushl	$_ZStL8__ioinit
	pushl	$_ZNSt8ios_base4InitD1Ev
	call	__cxa_atexit
	addl	$16, %esp
.L76:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1107:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB1108:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$8, %esp
	pushl	$65535
	pushl	$1
	call	_Z41__static_initialization_and_destruction_0ii
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1108:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I_main
	.section	.rodata
	.align 4
	.type	_ZZL18__gthread_active_pvE20__gthread_active_ptr, @object
	.size	_ZZL18__gthread_active_pvE20__gthread_active_ptr, 4
_ZZL18__gthread_active_pvE20__gthread_active_ptr:
	.long	_ZL28__gthrw___pthread_key_createPjPFvPvE
	.weakref	_ZL28__gthrw___pthread_key_createPjPFvPvE,__pthread_key_create
	.hidden	__dso_handle
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
