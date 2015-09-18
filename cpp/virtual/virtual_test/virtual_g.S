	.file	"virtual.cpp"
	.text
.Ltext0:
	.section	.text._ZN6ClassA6func_aEv,"axG",@progbits,_ZN6ClassA6func_aEv,comdat
	.align 2
	.weak	_ZN6ClassA6func_aEv
	.type	_ZN6ClassA6func_aEv, @function
_ZN6ClassA6func_aEv:
.LFB0:
	.file 1 "virtual.cpp"
	.loc 1 11 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	.loc 1 11 0
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
	.loc 1 1 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
.LBB2:
	.loc 1 1 0
	movl	8(%ebp), %eax
	movl	$_ZTV6ClassA+8, (%eax)
.LBE2:
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
	.loc 1 17 0
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
.LBB3:
	.loc 1 18 0
	subl	$12, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	call	_ZN6ClassAC1Ev
	addl	$16, %esp
	.loc 1 19 0
	movl	$0, %eax
.LBE3:
	.loc 1 21 0
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
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x160
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF1
	.byte	0x4
	.long	.LASF2
	.long	.LASF3
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.long	0x25
	.long	0x9d
	.uleb128 0x3
	.long	.LASF4
	.long	0xaf
	.byte	0
	.byte	0x1
	.uleb128 0x4
	.long	.LASF5
	.byte	0x1
	.byte	0x7
	.long	0xa8
	.byte	0x4
	.byte	0x1
	.uleb128 0x5
	.long	.LASF0
	.byte	0x1
	.long	0x5b
	.long	0x66
	.uleb128 0x6
	.long	0xbf
	.uleb128 0x7
	.long	0xc5
	.byte	0
	.uleb128 0x5
	.long	.LASF0
	.byte	0x1
	.long	0x74
	.long	0x7a
	.uleb128 0x6
	.long	0xbf
	.byte	0
	.uleb128 0x8
	.long	.LASF6
	.byte	0x1
	.byte	0xb
	.long	.LASF7
	.long	0xa8
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0x25
	.byte	0x1
	.long	0x96
	.uleb128 0x6
	.long	0xbf
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xa8
	.long	0xa8
	.uleb128 0xa
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xc
	.byte	0x4
	.long	0xb5
	.uleb128 0xd
	.byte	0x4
	.long	.LASF8
	.long	0x9d
	.uleb128 0xc
	.byte	0x4
	.long	0x25
	.uleb128 0xe
	.byte	0x4
	.long	0xcb
	.uleb128 0xf
	.long	0x25
	.uleb128 0x10
	.long	0x7a
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0xe7
	.long	0xf4
	.uleb128 0x11
	.long	.LASF9
	.long	0xf4
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.long	0xbf
	.uleb128 0x12
	.long	0x66
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.long	0x109
	.long	0x113
	.uleb128 0x13
	.long	.LASF9
	.long	0xf4
	.byte	0
	.uleb128 0x14
	.long	0xf9
	.long	.LASF10
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x12e
	.long	0x137
	.uleb128 0x15
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.long	.LASF11
	.byte	0x1
	.byte	0xf
	.long	0xa8
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x18
	.string	"a"
	.byte	0x1
	.byte	0x12
	.long	0x25
	.uleb128 0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	.LFB3
	.long	.LFE3-.LFB3
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB0
	.long	.LFE0
	.long	.LFB3
	.long	.LFE3
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"_ZN6ClassA6func_aEv"
.LASF8:
	.string	"__vtbl_ptr_type"
.LASF10:
	.string	"_ZN6ClassAC2Ev"
.LASF3:
	.string	"/root/programming/cpp/virtual/virtual_test"
.LASF2:
	.string	"virtual.cpp"
.LASF6:
	.string	"func_a"
.LASF1:
	.string	"GNU C++ 4.9.2 -mtune=generic -march=i586 -g"
.LASF9:
	.string	"this"
.LASF4:
	.string	"_vptr.ClassA"
.LASF11:
	.string	"main"
.LASF5:
	.string	"dataA"
.LASF0:
	.string	"ClassA"
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
