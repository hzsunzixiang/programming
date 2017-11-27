	.file	"Point3d_virtual.cpp"
	.text
.Ltext0:
	.section	.text._ZN7Point3d3funEv,"axG",@progbits,_ZN7Point3d3funEv,comdat
	.align 2
	.weak	_ZN7Point3d3funEv
	.type	_ZN7Point3d3funEv, @function
_ZN7Point3d3funEv:
.LFB86:
	.file 1 "Point3d_virtual.cpp"
	.loc 1 10 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 10 0
	movl	$10, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE86:
	.size	_ZN7Point3d3funEv, .-_ZN7Point3d3funEv
	.text
	.align 2
	.globl	_ZNK7Point3d9magnitudeEv
	.type	_ZNK7Point3d9magnitudeEv, @function
_ZNK7Point3d9magnitudeEv:
.LFB87:
	.loc 1 20 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 21 0
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm2
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm2
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	.loc 1 22 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE87:
	.size	_ZNK7Point3d9magnitudeEv, .-_ZNK7Point3d9magnitudeEv
	.section	.text._ZN7Point3dC2Ev,"axG",@progbits,_ZN7Point3dC5Ev,comdat
	.align 2
	.weak	_ZN7Point3dC2Ev
	.type	_ZN7Point3dC2Ev, @function
_ZN7Point3dC2Ev:
.LFB90:
	.loc 1 4 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
.LBB2:
	.loc 1 4 0
	movq	-8(%rbp), %rax
	movq	$_ZTV7Point3d+16, (%rax)
.LBE2:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE90:
	.size	_ZN7Point3dC2Ev, .-_ZN7Point3dC2Ev
	.weak	_ZN7Point3dC1Ev
	.set	_ZN7Point3dC1Ev,_ZN7Point3dC2Ev
	.text
	.align 2
	.globl	_ZN7Point3d9normalizeEv
	.type	_ZN7Point3d9normalizeEv, @function
_ZN7Point3d9normalizeEv:
.LFB88:
	.loc 1 26 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
.LBB3:
	.loc 1 27 0
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	.loc 1 28 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Point3dC1Ev
	.loc 1 29 0
	movq	-32(%rbp), %rax
	movsd	8(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rdx)
	.loc 1 30 0
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 16(%rdx)
	.loc 1 31 0
	movq	-32(%rbp), %rax
	movsd	24(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 24(%rdx)
	.loc 1 32 0
	nop
.LBE3:
	.loc 1 33 0
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE88:
	.size	_ZN7Point3d9normalizeEv, .-_ZN7Point3d9normalizeEv
	.globl	main
	.type	main, @function
main:
.LFB95:
	.loc 1 37 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
.LBB4:
	.loc 1 38 0
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Point3dC1Ev
	.loc 1 39 0
	leaq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 40 0
	movq	$0, -16(%rbp)
	.loc 1 43 0
	leaq	-80(%rbp), %rax
	leaq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7Point3d9normalizeEv
	.loc 1 46 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-80(%rbp), %rdx
	movq	-8(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	.loc 1 52 0
	movl	$0, %eax
.LBE4:
	.loc 1 53 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE95:
	.size	main, .-main
	.weak	_ZTV7Point3d
	.section	.rodata._ZTV7Point3d,"aG",@progbits,_ZTV7Point3d,comdat
	.align 32
	.type	_ZTV7Point3d, @object
	.size	_ZTV7Point3d, 40
_ZTV7Point3d:
	.quad	0
	.quad	_ZTI7Point3d
	.quad	_ZNK7Point3d9magnitudeEv
	.quad	_ZN7Point3d9normalizeEv
	.quad	_ZN7Point3d3funEv
	.weak	_ZTI7Point3d
	.section	.rodata._ZTI7Point3d,"aG",@progbits,_ZTI7Point3d,comdat
	.align 16
	.type	_ZTI7Point3d, @object
	.size	_ZTI7Point3d, 16
_ZTI7Point3d:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS7Point3d
	.weak	_ZTS7Point3d
	.section	.rodata._ZTS7Point3d,"aG",@progbits,_ZTS7Point3d,comdat
	.type	_ZTS7Point3d, @object
	.size	_ZTS7Point3d, 9
_ZTS7Point3d:
	.string	"7Point3d"
	.text
.Letext0:
	.file 2 "/usr/include/c++/4.9/bits/cpp_type_traits.h"
	.file 3 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x36d
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.long	.LASF26
	.long	.LASF27
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.string	"std"
	.byte	0x3
	.byte	0
	.long	0xa0
	.uleb128 0x3
	.long	.LASF0
	.byte	0x1
	.byte	0x2
	.byte	0x88
	.long	0x59
	.uleb128 0x4
	.byte	0x4
	.byte	0x2
	.byte	0x8a
	.long	0x4f
	.uleb128 0x5
	.long	.LASF2
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.string	"_Tp"
	.long	0xed
	.byte	0
	.uleb128 0x3
	.long	.LASF1
	.byte	0x1
	.byte	0x2
	.byte	0x88
	.long	0x7e
	.uleb128 0x4
	.byte	0x4
	.byte	0x2
	.byte	0x8a
	.long	0x74
	.uleb128 0x5
	.long	.LASF2
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.string	"_Tp"
	.long	0xf4
	.byte	0
	.uleb128 0x7
	.long	.LASF28
	.byte	0x1
	.byte	0x2
	.byte	0x88
	.uleb128 0x4
	.byte	0x4
	.byte	0x2
	.byte	0x8a
	.long	0x95
	.uleb128 0x5
	.long	.LASF2
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.string	"_Tp"
	.long	0xfb
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	.LASF29
	.byte	0x2
	.byte	0x45
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x9
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x9
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x9
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x9
	.byte	0x10
	.byte	0x4
	.long	.LASF12
	.uleb128 0x9
	.byte	0x8
	.byte	0x4
	.long	.LASF13
	.uleb128 0x9
	.byte	0x4
	.byte	0x4
	.long	.LASF14
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0xb
	.long	.LASF17
	.byte	0x20
	.byte	0x1
	.byte	0x4
	.long	0x109
	.long	0x1e1
	.uleb128 0xc
	.long	.LASF16
	.long	0x1ec
	.byte	0
	.byte	0x1
	.uleb128 0xd
	.string	"_x"
	.byte	0x1
	.byte	0xd
	.long	0xf4
	.byte	0x8
	.uleb128 0xd
	.string	"_y"
	.byte	0x1
	.byte	0xe
	.long	0xf4
	.byte	0x10
	.uleb128 0xd
	.string	"_z"
	.byte	0x1
	.byte	0xf
	.long	0xf4
	.byte	0x18
	.uleb128 0xe
	.long	.LASF17
	.byte	0x1
	.long	0x153
	.long	0x15e
	.uleb128 0xf
	.long	0x1fc
	.uleb128 0x10
	.long	0x202
	.byte	0
	.uleb128 0xe
	.long	.LASF17
	.byte	0x1
	.long	0x16c
	.long	0x172
	.uleb128 0xf
	.long	0x1fc
	.byte	0
	.uleb128 0x11
	.long	.LASF18
	.byte	0x1
	.byte	0x13
	.long	.LASF20
	.long	0xf4
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0x109
	.byte	0x1
	.long	0x192
	.long	0x198
	.uleb128 0xf
	.long	0x20d
	.byte	0
	.uleb128 0x11
	.long	.LASF19
	.byte	0x1
	.byte	0x19
	.long	.LASF21
	.long	0x109
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x1
	.long	0x109
	.byte	0x1
	.long	0x1b8
	.long	0x1be
	.uleb128 0xf
	.long	0x1fc
	.byte	0
	.uleb128 0x12
	.string	"fun"
	.byte	0x1
	.byte	0xa
	.long	.LASF30
	.long	0xd8
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x2
	.long	0x109
	.byte	0x1
	.long	0x1da
	.uleb128 0xf
	.long	0x1fc
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0xd8
	.long	0x1ec
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.byte	0x8
	.long	0x1f2
	.uleb128 0x16
	.byte	0x8
	.long	.LASF31
	.long	0x1e1
	.uleb128 0x15
	.byte	0x8
	.long	0x109
	.uleb128 0x17
	.byte	0x8
	.long	0x208
	.uleb128 0x18
	.long	0x109
	.uleb128 0x15
	.byte	0x8
	.long	0x208
	.uleb128 0x19
	.long	0x1be
	.quad	.LFB86
	.quad	.LFE86-.LFB86
	.uleb128 0x1
	.byte	0x9c
	.long	0x232
	.long	0x23f
	.uleb128 0x1a
	.long	.LASF22
	.long	0x23f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	0x1fc
	.uleb128 0x1b
	.long	0x172
	.quad	.LFB87
	.quad	.LFE87-.LFB87
	.uleb128 0x1
	.byte	0x9c
	.long	0x263
	.long	0x270
	.uleb128 0x1a
	.long	.LASF22
	.long	0x270
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.long	0x20d
	.uleb128 0x1c
	.long	0x15e
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.long	0x285
	.long	0x28f
	.uleb128 0x1d
	.long	.LASF22
	.long	0x23f
	.byte	0
	.uleb128 0x1e
	.long	0x275
	.long	.LASF32
	.quad	.LFB90
	.quad	.LFE90-.LFB90
	.uleb128 0x1
	.byte	0x9c
	.long	0x2b2
	.long	0x2bb
	.uleb128 0x1f
	.long	0x285
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	0x198
	.quad	.LFB88
	.quad	.LFE88-.LFB88
	.uleb128 0x1
	.byte	0x9c
	.long	0x2da
	.long	0x316
	.uleb128 0x1a
	.long	.LASF22
	.long	0x23f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x21
	.string	"mag"
	.byte	0x1
	.byte	0x1b
	.long	0xf4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF23
	.byte	0x1
	.byte	0x1c
	.long	0x109
	.uleb128 0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF33
	.byte	0x1
	.byte	0x24
	.long	0xd8
	.quad	.LFB95
	.quad	.LFE95-.LFB95
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x21
	.string	"obj"
	.byte	0x1
	.byte	0x26
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x21
	.string	"ptr"
	.byte	0x1
	.byte	0x27
	.long	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x22
	.long	.LASF24
	.byte	0x1
	.byte	0x28
	.long	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
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
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x23
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
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x4c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB86
	.quad	.LFE86-.LFB86
	.quad	.LFB90
	.quad	.LFE90-.LFB90
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB86
	.quad	.LFE86
	.quad	.LFB90
	.quad	.LFE90
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"__value"
.LASF25:
	.string	"GNU C++ 4.9.2 -fpreprocessed -mtune=generic -march=x86-64 -g"
.LASF17:
	.string	"Point3d"
.LASF9:
	.string	"short int"
.LASF19:
	.string	"normalize"
.LASF33:
	.string	"main"
.LASF14:
	.string	"float"
.LASF11:
	.string	"long long int"
.LASF10:
	.string	"long int"
.LASF24:
	.string	"nullPtr"
.LASF26:
	.string	"Point3d_virtual.cpp"
.LASF18:
	.string	"magnitude"
.LASF12:
	.string	"long double"
.LASF3:
	.string	"unsigned char"
.LASF29:
	.string	"__gnu_cxx"
.LASF8:
	.string	"signed char"
.LASF7:
	.string	"long long unsigned int"
.LASF5:
	.string	"unsigned int"
.LASF20:
	.string	"_ZNK7Point3d9magnitudeEv"
.LASF4:
	.string	"short unsigned int"
.LASF1:
	.string	"__is_integer<double>"
.LASF15:
	.string	"char"
.LASF32:
	.string	"_ZN7Point3dC2Ev"
.LASF28:
	.string	"__is_integer<float>"
.LASF22:
	.string	"this"
.LASF23:
	.string	"normal"
.LASF6:
	.string	"long unsigned int"
.LASF13:
	.string	"double"
.LASF0:
	.string	"__is_integer<long double>"
.LASF30:
	.string	"_ZN7Point3d3funEv"
.LASF16:
	.string	"_vptr.Point3d"
.LASF31:
	.string	"__vtbl_ptr_type"
.LASF21:
	.string	"_ZN7Point3d9normalizeEv"
.LASF27:
	.string	"/home/StephenSun/programming/cpp/insideObjectModel/semanticsFunction/member_function"
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
