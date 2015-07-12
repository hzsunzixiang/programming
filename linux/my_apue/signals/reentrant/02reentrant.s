
02reentrant:     file format elf32-i386


Disassembly of section .interp:

08048134 <.interp>:
 8048134:	2f                   	das    
 8048135:	6c                   	insb   (%dx),%es:(%edi)
 8048136:	69 62 2f 6c 64 2d 6c 	imul   $0x6c2d646c,0x2f(%edx),%esp
 804813d:	69 6e 75 78 2e 73 6f 	imul   $0x6f732e78,0x75(%esi),%ebp
 8048144:	2e 32 00             	xor    %cs:(%eax),%al

Disassembly of section .note.ABI-tag:

08048148 <.note.ABI-tag>:
 8048148:	04 00                	add    $0x0,%al
 804814a:	00 00                	add    %al,(%eax)
 804814c:	10 00                	adc    %al,(%eax)
 804814e:	00 00                	add    %al,(%eax)
 8048150:	01 00                	add    %eax,(%eax)
 8048152:	00 00                	add    %al,(%eax)
 8048154:	47                   	inc    %edi
 8048155:	4e                   	dec    %esi
 8048156:	55                   	push   %ebp
 8048157:	00 00                	add    %al,(%eax)
 8048159:	00 00                	add    %al,(%eax)
 804815b:	00 02                	add    %al,(%edx)
 804815d:	00 00                	add    %al,(%eax)
 804815f:	00 06                	add    %al,(%esi)
 8048161:	00 00                	add    %al,(%eax)
 8048163:	00 12                	add    %dl,(%edx)
 8048165:	00 00                	add    %al,(%eax)
	...

Disassembly of section .note.gnu.build-id:

08048168 <.note.gnu.build-id>:
 8048168:	04 00                	add    $0x0,%al
 804816a:	00 00                	add    %al,(%eax)
 804816c:	14 00                	adc    $0x0,%al
 804816e:	00 00                	add    %al,(%eax)
 8048170:	03 00                	add    (%eax),%eax
 8048172:	00 00                	add    %al,(%eax)
 8048174:	47                   	inc    %edi
 8048175:	4e                   	dec    %esi
 8048176:	55                   	push   %ebp
 8048177:	00 03                	add    %al,(%ebx)
 8048179:	62                   	(bad)  
 804817a:	c6                   	(bad)  
 804817b:	e6 17                	out    %al,$0x17
 804817d:	f9                   	stc    
 804817e:	2d 1e 81 7b cc       	sub    $0xcc7b811e,%eax
 8048183:	76 b5                	jbe    804813a <_init-0x1da>
 8048185:	e6 62                	out    %al,$0x62
 8048187:	de 6d 3a             	fisubr 0x3a(%ebp)
 804818a:	39 23                	cmp    %esp,(%ebx)

Disassembly of section .gnu.hash:

0804818c <.gnu.hash>:
 804818c:	02 00                	add    (%eax),%al
 804818e:	00 00                	add    %al,(%eax)
 8048190:	08 00                	or     %al,(%eax)
 8048192:	00 00                	add    %al,(%eax)
 8048194:	01 00                	add    %eax,(%eax)
 8048196:	00 00                	add    %al,(%eax)
 8048198:	05 00 00 00 00       	add    $0x0,%eax
 804819d:	20 00                	and    %al,(%eax)
 804819f:	20 00                	and    %al,(%eax)
 80481a1:	00 00                	add    %al,(%eax)
 80481a3:	00 08                	add    %cl,(%eax)
 80481a5:	00 00                	add    %al,(%eax)
 80481a7:	00                   	.byte 0x0
 80481a8:	ad                   	lods   %ds:(%esi),%eax
 80481a9:	4b                   	dec    %ebx
 80481aa:	e3 c0                	jecxz  804816c <_init-0x1a8>

Disassembly of section .dynsym:

080481ac <.dynsym>:
	...
 80481bc:	35 00 00 00 00       	xor    $0x0,%eax
 80481c1:	00 00                	add    %al,(%eax)
 80481c3:	00 00                	add    %al,(%eax)
 80481c5:	00 00                	add    %al,(%eax)
 80481c7:	00 12                	add    %dl,(%edx)
 80481c9:	00 00                	add    %al,(%eax)
 80481cb:	00 01                	add    %al,(%ecx)
	...
 80481d5:	00 00                	add    %al,(%eax)
 80481d7:	00 20                	add    %ah,(%eax)
 80481d9:	00 00                	add    %al,(%eax)
 80481db:	00 49 00             	add    %cl,0x0(%ecx)
	...
 80481e6:	00 00                	add    %al,(%eax)
 80481e8:	12 00                	adc    (%eax),%al
 80481ea:	00 00                	add    %al,(%eax)
 80481ec:	2e 00 00             	add    %al,%cs:(%eax)
	...
 80481f7:	00 12                	add    %dl,(%edx)
 80481f9:	00 00                	add    %al,(%eax)
 80481fb:	00 43 00             	add    %al,0x0(%ebx)
	...
 8048206:	00 00                	add    %al,(%eax)
 8048208:	12 00                	adc    (%eax),%al
 804820a:	00 00                	add    %al,(%eax)
 804820c:	3c 00                	cmp    $0x0,%al
	...
 8048216:	00 00                	add    %al,(%eax)
 8048218:	12 00                	adc    (%eax),%al
 804821a:	00 00                	add    %al,(%eax)
 804821c:	29 00                	sub    %eax,(%eax)
	...
 8048226:	00 00                	add    %al,(%eax)
 8048228:	12 00                	adc    (%eax),%al
 804822a:	00 00                	add    %al,(%eax)
 804822c:	1a 00                	sbb    (%eax),%al
 804822e:	00 00                	add    %al,(%eax)
 8048230:	2c 86                	sub    $0x86,%al
 8048232:	04 08                	add    $0x8,%al
 8048234:	04 00                	add    $0x0,%al
 8048236:	00 00                	add    %al,(%eax)
 8048238:	11 00                	adc    %eax,(%eax)
 804823a:	0f                   	.byte 0xf
	...

Disassembly of section .dynstr:

0804823c <.dynstr>:
 804823c:	00 5f 5f             	add    %bl,0x5f(%edi)
 804823f:	67 6d                	insl   (%dx),%es:(%di)
 8048241:	6f                   	outsl  %ds:(%esi),(%dx)
 8048242:	6e                   	outsb  %ds:(%esi),(%dx)
 8048243:	5f                   	pop    %edi
 8048244:	73 74                	jae    80482ba <_init-0x5a>
 8048246:	61                   	popa   
 8048247:	72 74                	jb     80482bd <_init-0x57>
 8048249:	5f                   	pop    %edi
 804824a:	5f                   	pop    %edi
 804824b:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 804824f:	63 2e                	arpl   %bp,(%esi)
 8048251:	73 6f                	jae    80482c2 <_init-0x52>
 8048253:	2e 36 00 5f 49       	cs add %bl,%cs:%ss:0x49(%edi)
 8048258:	4f                   	dec    %edi
 8048259:	5f                   	pop    %edi
 804825a:	73 74                	jae    80482d0 <_init-0x44>
 804825c:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
 8048263:	64 
 8048264:	00 65 78             	add    %ah,0x78(%ebp)
 8048267:	69 74 00 70 65 72 72 	imul   $0x6f727265,0x70(%eax,%eax,1),%esi
 804826e:	6f 
 804826f:	72 00                	jb     8048271 <_init-0xa3>
 8048271:	73 69                	jae    80482dc <_init-0x38>
 8048273:	67 6e                	outsb  %ds:(%si),(%dx)
 8048275:	61                   	popa   
 8048276:	6c                   	insb   (%dx),%es:(%edi)
 8048277:	00 70 72             	add    %dh,0x72(%eax)
 804827a:	69 6e 74 66 00 61 6c 	imul   $0x6c610066,0x74(%esi),%ebp
 8048281:	61                   	popa   
 8048282:	72 6d                	jb     80482f1 <_init-0x23>
 8048284:	00 5f 5f             	add    %bl,0x5f(%edi)
 8048287:	6c                   	insb   (%dx),%es:(%edi)
 8048288:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%edx),%esp
 804828f:	72 74                	jb     8048305 <_init-0xf>
 8048291:	5f                   	pop    %edi
 8048292:	6d                   	insl   (%dx),%es:(%edi)
 8048293:	61                   	popa   
 8048294:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%esi),%ebp
 804829b:	43                   	inc    %ebx
 804829c:	5f                   	pop    %edi
 804829d:	32 2e                	xor    (%esi),%ch
 804829f:	30 00                	xor    %al,(%eax)

Disassembly of section .gnu.version:

080482a2 <.gnu.version>:
 80482a2:	00 00                	add    %al,(%eax)
 80482a4:	02 00                	add    (%eax),%al
 80482a6:	00 00                	add    %al,(%eax)
 80482a8:	02 00                	add    (%eax),%al
 80482aa:	02 00                	add    (%eax),%al
 80482ac:	02 00                	add    (%eax),%al
 80482ae:	02 00                	add    (%eax),%al
 80482b0:	02 00                	add    (%eax),%al
 80482b2:	01 00                	add    %eax,(%eax)

Disassembly of section .gnu.version_r:

080482b4 <.gnu.version_r>:
 80482b4:	01 00                	add    %eax,(%eax)
 80482b6:	01 00                	add    %eax,(%eax)
 80482b8:	10 00                	adc    %al,(%eax)
 80482ba:	00 00                	add    %al,(%eax)
 80482bc:	10 00                	adc    %al,(%eax)
 80482be:	00 00                	add    %al,(%eax)
 80482c0:	00 00                	add    %al,(%eax)
 80482c2:	00 00                	add    %al,(%eax)
 80482c4:	10 69 69             	adc    %ch,0x69(%ecx)
 80482c7:	0d 00 00 02 00       	or     $0x20000,%eax
 80482cc:	5b                   	pop    %ebx
 80482cd:	00 00                	add    %al,(%eax)
 80482cf:	00 00                	add    %al,(%eax)
 80482d1:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.dyn:

080482d4 <.rel.dyn>:
 80482d4:	c4 97 04 08 06 02    	les    0x2060804(%edi),%edx
	...

Disassembly of section .rel.plt:

080482dc <.rel.plt>:
 80482dc:	d4 97                	aam    $0xffffff97
 80482de:	04 08                	add    $0x8,%al
 80482e0:	07                   	pop    %es
 80482e1:	01 00                	add    %eax,(%eax)
 80482e3:	00 d8                	add    %bl,%al
 80482e5:	97                   	xchg   %eax,%edi
 80482e6:	04 08                	add    $0x8,%al
 80482e8:	07                   	pop    %es
 80482e9:	02 00                	add    (%eax),%al
 80482eb:	00 dc                	add    %bl,%ah
 80482ed:	97                   	xchg   %eax,%edi
 80482ee:	04 08                	add    $0x8,%al
 80482f0:	07                   	pop    %es
 80482f1:	03 00                	add    (%eax),%eax
 80482f3:	00 e0                	add    %ah,%al
 80482f5:	97                   	xchg   %eax,%edi
 80482f6:	04 08                	add    $0x8,%al
 80482f8:	07                   	pop    %es
 80482f9:	04 00                	add    $0x0,%al
 80482fb:	00 e4                	add    %ah,%ah
 80482fd:	97                   	xchg   %eax,%edi
 80482fe:	04 08                	add    $0x8,%al
 8048300:	07                   	pop    %es
 8048301:	05 00 00 e8 97       	add    $0x97e80000,%eax
 8048306:	04 08                	add    $0x8,%al
 8048308:	07                   	pop    %es
 8048309:	06                   	push   %es
 804830a:	00 00                	add    %al,(%eax)
 804830c:	ec                   	in     (%dx),%al
 804830d:	97                   	xchg   %eax,%edi
 804830e:	04 08                	add    $0x8,%al
 8048310:	07                   	pop    %es
 8048311:	07                   	pop    %es
	...

Disassembly of section .init:

08048314 <_init>:
 8048314:	55                   	push   %ebp
 8048315:	89 e5                	mov    %esp,%ebp
 8048317:	53                   	push   %ebx
 8048318:	83 ec 04             	sub    $0x4,%esp
 804831b:	e8 00 00 00 00       	call   8048320 <_init+0xc>
 8048320:	5b                   	pop    %ebx
 8048321:	81 c3 a8 14 00 00    	add    $0x14a8,%ebx
 8048327:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 804832d:	85 d2                	test   %edx,%edx
 804832f:	74 05                	je     8048336 <_init+0x22>
 8048331:	e8 2e 00 00 00       	call   8048364 <__gmon_start__@plt>
 8048336:	e8 25 01 00 00       	call   8048460 <frame_dummy>
 804833b:	e8 a0 02 00 00       	call   80485e0 <__do_global_ctors_aux>
 8048340:	58                   	pop    %eax
 8048341:	5b                   	pop    %ebx
 8048342:	c9                   	leave  
 8048343:	c3                   	ret    

Disassembly of section .plt:

08048344 <signal@plt-0x10>:
 8048344:	ff 35 cc 97 04 08    	pushl  0x80497cc
 804834a:	ff 25 d0 97 04 08    	jmp    *0x80497d0
 8048350:	00 00                	add    %al,(%eax)
	...

08048354 <signal@plt>:
 8048354:	ff 25 d4 97 04 08    	jmp    *0x80497d4
 804835a:	68 00 00 00 00       	push   $0x0
 804835f:	e9 e0 ff ff ff       	jmp    8048344 <_init+0x30>

08048364 <__gmon_start__@plt>:
 8048364:	ff 25 d8 97 04 08    	jmp    *0x80497d8
 804836a:	68 08 00 00 00       	push   $0x8
 804836f:	e9 d0 ff ff ff       	jmp    8048344 <_init+0x30>

08048374 <__libc_start_main@plt>:
 8048374:	ff 25 dc 97 04 08    	jmp    *0x80497dc
 804837a:	68 10 00 00 00       	push   $0x10
 804837f:	e9 c0 ff ff ff       	jmp    8048344 <_init+0x30>

08048384 <perror@plt>:
 8048384:	ff 25 e0 97 04 08    	jmp    *0x80497e0
 804838a:	68 18 00 00 00       	push   $0x18
 804838f:	e9 b0 ff ff ff       	jmp    8048344 <_init+0x30>

08048394 <alarm@plt>:
 8048394:	ff 25 e4 97 04 08    	jmp    *0x80497e4
 804839a:	68 20 00 00 00       	push   $0x20
 804839f:	e9 a0 ff ff ff       	jmp    8048344 <_init+0x30>

080483a4 <printf@plt>:
 80483a4:	ff 25 e8 97 04 08    	jmp    *0x80497e8
 80483aa:	68 28 00 00 00       	push   $0x28
 80483af:	e9 90 ff ff ff       	jmp    8048344 <_init+0x30>

080483b4 <exit@plt>:
 80483b4:	ff 25 ec 97 04 08    	jmp    *0x80497ec
 80483ba:	68 30 00 00 00       	push   $0x30
 80483bf:	e9 80 ff ff ff       	jmp    8048344 <_init+0x30>

Disassembly of section .text:

080483d0 <_start>:
 80483d0:	31 ed                	xor    %ebp,%ebp
 80483d2:	5e                   	pop    %esi
 80483d3:	89 e1                	mov    %esp,%ecx
 80483d5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483d8:	50                   	push   %eax
 80483d9:	54                   	push   %esp
 80483da:	52                   	push   %edx
 80483db:	68 70 85 04 08       	push   $0x8048570
 80483e0:	68 80 85 04 08       	push   $0x8048580
 80483e5:	51                   	push   %ecx
 80483e6:	56                   	push   %esi
 80483e7:	68 84 84 04 08       	push   $0x8048484
 80483ec:	e8 83 ff ff ff       	call   8048374 <__libc_start_main@plt>
 80483f1:	f4                   	hlt    
 80483f2:	90                   	nop
 80483f3:	90                   	nop
 80483f4:	90                   	nop
 80483f5:	90                   	nop
 80483f6:	90                   	nop
 80483f7:	90                   	nop
 80483f8:	90                   	nop
 80483f9:	90                   	nop
 80483fa:	90                   	nop
 80483fb:	90                   	nop
 80483fc:	90                   	nop
 80483fd:	90                   	nop
 80483fe:	90                   	nop
 80483ff:	90                   	nop

08048400 <__do_global_dtors_aux>:
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	53                   	push   %ebx
 8048404:	8d 64 24 fc          	lea    -0x4(%esp),%esp
 8048408:	80 3d f4 97 04 08 00 	cmpb   $0x0,0x80497f4
 804840f:	75 3e                	jne    804844f <__do_global_dtors_aux+0x4f>
 8048411:	bb f4 96 04 08       	mov    $0x80496f4,%ebx
 8048416:	a1 f8 97 04 08       	mov    0x80497f8,%eax
 804841b:	81 eb f0 96 04 08    	sub    $0x80496f0,%ebx
 8048421:	c1 fb 02             	sar    $0x2,%ebx
 8048424:	83 eb 01             	sub    $0x1,%ebx
 8048427:	39 d8                	cmp    %ebx,%eax
 8048429:	73 1d                	jae    8048448 <__do_global_dtors_aux+0x48>
 804842b:	90                   	nop
 804842c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048430:	83 c0 01             	add    $0x1,%eax
 8048433:	a3 f8 97 04 08       	mov    %eax,0x80497f8
 8048438:	ff 14 85 f0 96 04 08 	call   *0x80496f0(,%eax,4)
 804843f:	a1 f8 97 04 08       	mov    0x80497f8,%eax
 8048444:	39 d8                	cmp    %ebx,%eax
 8048446:	72 e8                	jb     8048430 <__do_global_dtors_aux+0x30>
 8048448:	c6 05 f4 97 04 08 01 	movb   $0x1,0x80497f4
 804844f:	8d 64 24 04          	lea    0x4(%esp),%esp
 8048453:	5b                   	pop    %ebx
 8048454:	5d                   	pop    %ebp
 8048455:	c3                   	ret    
 8048456:	8d 76 00             	lea    0x0(%esi),%esi
 8048459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048460 <frame_dummy>:
 8048460:	55                   	push   %ebp
 8048461:	89 e5                	mov    %esp,%ebp
 8048463:	8d 64 24 e8          	lea    -0x18(%esp),%esp
 8048467:	a1 f8 96 04 08       	mov    0x80496f8,%eax
 804846c:	85 c0                	test   %eax,%eax
 804846e:	74 12                	je     8048482 <frame_dummy+0x22>
 8048470:	b8 00 00 00 00       	mov    $0x0,%eax
 8048475:	85 c0                	test   %eax,%eax
 8048477:	74 09                	je     8048482 <frame_dummy+0x22>
 8048479:	c7 04 24 f8 96 04 08 	movl   $0x80496f8,(%esp)
 8048480:	ff d0                	call   *%eax
 8048482:	c9                   	leave  
 8048483:	c3                   	ret    

08048484 <main>:
 8048484:	55                   	push   %ebp
 8048485:	89 e5                	mov    %esp,%ebp
 8048487:	83 e4 f0             	and    $0xfffffff0,%esp
 804848a:	83 ec 20             	sub    $0x20,%esp
 804848d:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
 8048494:	00 
 8048495:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 804849c:	00 
 804849d:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
 80484a4:	00 
 80484a5:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
 80484ac:	00 
 80484ad:	c7 44 24 04 4e 85 04 	movl   $0x804854e,0x4(%esp)
 80484b4:	08 
 80484b5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 80484bc:	e8 93 fe ff ff       	call   8048354 <signal@plt>
 80484c1:	83 f8 ff             	cmp    $0xffffffff,%eax
 80484c4:	75 18                	jne    80484de <main+0x5a>
 80484c6:	c7 04 24 34 86 04 08 	movl   $0x8048634,(%esp)
 80484cd:	e8 b2 fe ff ff       	call   8048384 <perror@plt>
 80484d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80484d9:	e8 d6 fe ff ff       	call   80483b4 <exit@plt>
 80484de:	8b 44 24 18          	mov    0x18(%esp),%eax
 80484e2:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 80484e6:	a3 fc 97 04 08       	mov    %eax,0x80497fc
 80484eb:	89 15 00 98 04 08    	mov    %edx,0x8049800
 80484f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80484f8:	e8 97 fe ff ff       	call   8048394 <alarm@plt>
 80484fd:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048501:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 8048505:	a3 fc 97 04 08       	mov    %eax,0x80497fc
 804850a:	89 15 00 98 04 08    	mov    %edx,0x8049800
 8048510:	8b 44 24 10          	mov    0x10(%esp),%eax
 8048514:	8b 54 24 14          	mov    0x14(%esp),%edx
 8048518:	a3 fc 97 04 08       	mov    %eax,0x80497fc
 804851d:	89 15 00 98 04 08    	mov    %edx,0x8049800
 8048523:	eb d8                	jmp    80484fd <main+0x79>

08048525 <unsafe_fun>:
 8048525:	55                   	push   %ebp
 8048526:	89 e5                	mov    %esp,%ebp
 8048528:	83 ec 18             	sub    $0x18,%esp
 804852b:	8b 0d 00 98 04 08    	mov    0x8049800,%ecx
 8048531:	8b 15 fc 97 04 08    	mov    0x80497fc,%edx
 8048537:	b8 41 86 04 08       	mov    $0x8048641,%eax
 804853c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048540:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048544:	89 04 24             	mov    %eax,(%esp)
 8048547:	e8 58 fe ff ff       	call   80483a4 <printf@plt>
 804854c:	c9                   	leave  
 804854d:	c3                   	ret    

0804854e <handler>:
 804854e:	55                   	push   %ebp
 804854f:	89 e5                	mov    %esp,%ebp
 8048551:	83 ec 18             	sub    $0x18,%esp
 8048554:	e8 cc ff ff ff       	call   8048525 <unsafe_fun>
 8048559:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048560:	e8 2f fe ff ff       	call   8048394 <alarm@plt>
 8048565:	c9                   	leave  
 8048566:	c3                   	ret    
 8048567:	90                   	nop
 8048568:	90                   	nop
 8048569:	90                   	nop
 804856a:	90                   	nop
 804856b:	90                   	nop
 804856c:	90                   	nop
 804856d:	90                   	nop
 804856e:	90                   	nop
 804856f:	90                   	nop

08048570 <__libc_csu_fini>:
 8048570:	55                   	push   %ebp
 8048571:	89 e5                	mov    %esp,%ebp
 8048573:	5d                   	pop    %ebp
 8048574:	c3                   	ret    
 8048575:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 804857c:	00 00 00 00 

08048580 <__libc_csu_init>:
 8048580:	55                   	push   %ebp
 8048581:	89 e5                	mov    %esp,%ebp
 8048583:	57                   	push   %edi
 8048584:	56                   	push   %esi
 8048585:	53                   	push   %ebx
 8048586:	e8 4f 00 00 00       	call   80485da <__i686.get_pc_thunk.bx>
 804858b:	81 c3 3d 12 00 00    	add    $0x123d,%ebx
 8048591:	83 ec 1c             	sub    $0x1c,%esp
 8048594:	e8 7b fd ff ff       	call   8048314 <_init>
 8048599:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804859f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 80485a5:	29 c7                	sub    %eax,%edi
 80485a7:	c1 ff 02             	sar    $0x2,%edi
 80485aa:	85 ff                	test   %edi,%edi
 80485ac:	74 24                	je     80485d2 <__libc_csu_init+0x52>
 80485ae:	31 f6                	xor    %esi,%esi
 80485b0:	8b 45 10             	mov    0x10(%ebp),%eax
 80485b3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80485ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485be:	8b 45 08             	mov    0x8(%ebp),%eax
 80485c1:	89 04 24             	mov    %eax,(%esp)
 80485c4:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 80485cb:	83 c6 01             	add    $0x1,%esi
 80485ce:	39 fe                	cmp    %edi,%esi
 80485d0:	72 de                	jb     80485b0 <__libc_csu_init+0x30>
 80485d2:	83 c4 1c             	add    $0x1c,%esp
 80485d5:	5b                   	pop    %ebx
 80485d6:	5e                   	pop    %esi
 80485d7:	5f                   	pop    %edi
 80485d8:	5d                   	pop    %ebp
 80485d9:	c3                   	ret    

080485da <__i686.get_pc_thunk.bx>:
 80485da:	8b 1c 24             	mov    (%esp),%ebx
 80485dd:	c3                   	ret    
 80485de:	90                   	nop
 80485df:	90                   	nop

080485e0 <__do_global_ctors_aux>:
 80485e0:	55                   	push   %ebp
 80485e1:	89 e5                	mov    %esp,%ebp
 80485e3:	53                   	push   %ebx
 80485e4:	8d 64 24 fc          	lea    -0x4(%esp),%esp
 80485e8:	a1 e8 96 04 08       	mov    0x80496e8,%eax
 80485ed:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485f0:	74 12                	je     8048604 <__do_global_ctors_aux+0x24>
 80485f2:	bb e8 96 04 08       	mov    $0x80496e8,%ebx
 80485f7:	90                   	nop
 80485f8:	8d 5b fc             	lea    -0x4(%ebx),%ebx
 80485fb:	ff d0                	call   *%eax
 80485fd:	8b 03                	mov    (%ebx),%eax
 80485ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048602:	75 f4                	jne    80485f8 <__do_global_ctors_aux+0x18>
 8048604:	8d 64 24 04          	lea    0x4(%esp),%esp
 8048608:	5b                   	pop    %ebx
 8048609:	5d                   	pop    %ebp
 804860a:	c3                   	ret    
 804860b:	90                   	nop

Disassembly of section .fini:

0804860c <_fini>:
 804860c:	55                   	push   %ebp
 804860d:	89 e5                	mov    %esp,%ebp
 804860f:	53                   	push   %ebx
 8048610:	83 ec 04             	sub    $0x4,%esp
 8048613:	e8 00 00 00 00       	call   8048618 <_fini+0xc>
 8048618:	5b                   	pop    %ebx
 8048619:	81 c3 b0 11 00 00    	add    $0x11b0,%ebx
 804861f:	e8 dc fd ff ff       	call   8048400 <__do_global_dtors_aux>
 8048624:	59                   	pop    %ecx
 8048625:	5b                   	pop    %ebx
 8048626:	c9                   	leave  
 8048627:	c3                   	ret    

Disassembly of section .rodata:

08048628 <_fp_hw>:
 8048628:	03 00                	add    (%eax),%eax
	...

0804862c <_IO_stdin_used>:
 804862c:	01 00                	add    %eax,(%eax)
 804862e:	02 00                	add    (%eax),%al

08048630 <__dso_handle>:
 8048630:	00 00                	add    %al,(%eax)
 8048632:	00 00                	add    %al,(%eax)
 8048634:	73 69                	jae    804869f <__dso_handle+0x6f>
 8048636:	67 6e                	outsb  %ds:(%si),(%dx)
 8048638:	61                   	popa   
 8048639:	6c                   	insb   (%dx),%es:(%edi)
 804863a:	20 65 72             	and    %ah,0x72(%ebp)
 804863d:	72 6f                	jb     80486ae <__dso_handle+0x7e>
 804863f:	72 00                	jb     8048641 <__dso_handle+0x11>
 8048641:	25 64 20 25 64       	and    $0x64252064,%eax
 8048646:	0a 00                	or     (%eax),%al

Disassembly of section .eh_frame_hdr:

08048648 <.eh_frame_hdr>:
 8048648:	01 1b                	add    %ebx,(%ebx)
 804864a:	03 3b                	add    (%ebx),%edi
 804864c:	20 00                	and    %al,(%eax)
 804864e:	00 00                	add    %al,(%eax)
 8048650:	03 00                	add    (%eax),%eax
 8048652:	00 00                	add    %al,(%eax)
 8048654:	28 ff                	sub    %bh,%bh
 8048656:	ff                   	(bad)  
 8048657:	ff                   	(bad)  
 8048658:	3c 00                	cmp    $0x0,%al
 804865a:	00 00                	add    %al,(%eax)
 804865c:	38 ff                	cmp    %bh,%bh
 804865e:	ff                   	(bad)  
 804865f:	ff 5c 00 00          	lcall  *0x0(%eax,%eax,1)
 8048663:	00 92 ff ff ff 88    	add    %dl,-0x77000001(%edx)
 8048669:	00 00                	add    %al,(%eax)
	...

Disassembly of section .eh_frame:

0804866c <__FRAME_END__-0x78>:
 804866c:	14 00                	adc    $0x0,%al
 804866e:	00 00                	add    %al,(%eax)
 8048670:	00 00                	add    %al,(%eax)
 8048672:	00 00                	add    %al,(%eax)
 8048674:	01 7a 52             	add    %edi,0x52(%edx)
 8048677:	00 01                	add    %al,(%ecx)
 8048679:	7c 08                	jl     8048683 <__dso_handle+0x53>
 804867b:	01 1b                	add    %ebx,(%ebx)
 804867d:	0c 04                	or     $0x4,%al
 804867f:	04 88                	add    $0x88,%al
 8048681:	01 00                	add    %eax,(%eax)
 8048683:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048686:	00 00                	add    %al,(%eax)
 8048688:	1c 00                	sbb    $0x0,%al
 804868a:	00 00                	add    %al,(%eax)
 804868c:	e4 fe                	in     $0xfe,%al
 804868e:	ff                   	(bad)  
 804868f:	ff 05 00 00 00 00    	incl   0x0
 8048695:	41                   	inc    %ecx
 8048696:	0e                   	push   %cs
 8048697:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 804869d:	41                   	inc    %ecx
 804869e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80486a1:	04 00                	add    $0x0,%al
 80486a3:	00 28                	add    %ch,(%eax)
 80486a5:	00 00                	add    %al,(%eax)
 80486a7:	00 3c 00             	add    %bh,(%eax,%eax,1)
 80486aa:	00 00                	add    %al,(%eax)
 80486ac:	d4 fe                	aam    $0xfffffffe
 80486ae:	ff                   	(bad)  
 80486af:	ff 5a 00             	lcall  *0x0(%edx)
 80486b2:	00 00                	add    %al,(%eax)
 80486b4:	00 41 0e             	add    %al,0xe(%ecx)
 80486b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80486bd:	43                   	inc    %ebx
 80486be:	83 05 86 04 87 03 02 	addl   $0x2,0x3870486
 80486c5:	50                   	push   %eax
 80486c6:	c3                   	ret    
 80486c7:	41                   	inc    %ecx
 80486c8:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
 80486cc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80486cf:	04 10                	add    $0x10,%al
 80486d1:	00 00                	add    %al,(%eax)
 80486d3:	00 68 00             	add    %ch,0x0(%eax)
 80486d6:	00 00                	add    %al,(%eax)
 80486d8:	02 ff                	add    %bh,%bh
 80486da:	ff                   	(bad)  
 80486db:	ff 04 00             	incl   (%eax,%eax,1)
 80486de:	00 00                	add    %al,(%eax)
 80486e0:	00 00                	add    %al,(%eax)
	...

080486e4 <__FRAME_END__>:
 80486e4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .ctors:

080496e8 <__CTOR_LIST__>:
 80496e8:	ff                   	(bad)  
 80496e9:	ff                   	(bad)  
 80496ea:	ff                   	(bad)  
 80496eb:	ff 00                	incl   (%eax)

080496ec <__CTOR_END__>:
 80496ec:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dtors:

080496f0 <__DTOR_LIST__>:
 80496f0:	ff                   	(bad)  
 80496f1:	ff                   	(bad)  
 80496f2:	ff                   	(bad)  
 80496f3:	ff 00                	incl   (%eax)

080496f4 <__DTOR_END__>:
 80496f4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .jcr:

080496f8 <__JCR_END__>:
 80496f8:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

080496fc <_DYNAMIC>:
 80496fc:	01 00                	add    %eax,(%eax)
 80496fe:	00 00                	add    %al,(%eax)
 8049700:	10 00                	adc    %al,(%eax)
 8049702:	00 00                	add    %al,(%eax)
 8049704:	0c 00                	or     $0x0,%al
 8049706:	00 00                	add    %al,(%eax)
 8049708:	14 83                	adc    $0x83,%al
 804970a:	04 08                	add    $0x8,%al
 804970c:	0d 00 00 00 0c       	or     $0xc000000,%eax
 8049711:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 8049714:	f5                   	cmc    
 8049715:	fe                   	(bad)  
 8049716:	ff 6f 8c             	ljmp   *-0x74(%edi)
 8049719:	81 04 08 05 00 00 00 	addl   $0x5,(%eax,%ecx,1)
 8049720:	3c 82                	cmp    $0x82,%al
 8049722:	04 08                	add    $0x8,%al
 8049724:	06                   	push   %es
 8049725:	00 00                	add    %al,(%eax)
 8049727:	00 ac 81 04 08 0a 00 	add    %ch,0xa0804(%ecx,%eax,4)
 804972e:	00 00                	add    %al,(%eax)
 8049730:	65 00 00             	add    %al,%gs:(%eax)
 8049733:	00 0b                	add    %cl,(%ebx)
 8049735:	00 00                	add    %al,(%eax)
 8049737:	00 10                	add    %dl,(%eax)
 8049739:	00 00                	add    %al,(%eax)
 804973b:	00 15 00 00 00 00    	add    %dl,0x0
 8049741:	00 00                	add    %al,(%eax)
 8049743:	00 03                	add    %al,(%ebx)
 8049745:	00 00                	add    %al,(%eax)
 8049747:	00 c8                	add    %cl,%al
 8049749:	97                   	xchg   %eax,%edi
 804974a:	04 08                	add    $0x8,%al
 804974c:	02 00                	add    (%eax),%al
 804974e:	00 00                	add    %al,(%eax)
 8049750:	38 00                	cmp    %al,(%eax)
 8049752:	00 00                	add    %al,(%eax)
 8049754:	14 00                	adc    $0x0,%al
 8049756:	00 00                	add    %al,(%eax)
 8049758:	11 00                	adc    %eax,(%eax)
 804975a:	00 00                	add    %al,(%eax)
 804975c:	17                   	pop    %ss
 804975d:	00 00                	add    %al,(%eax)
 804975f:	00 dc                	add    %bl,%ah
 8049761:	82                   	(bad)  
 8049762:	04 08                	add    $0x8,%al
 8049764:	11 00                	adc    %eax,(%eax)
 8049766:	00 00                	add    %al,(%eax)
 8049768:	d4 82                	aam    $0xffffff82
 804976a:	04 08                	add    $0x8,%al
 804976c:	12 00                	adc    (%eax),%al
 804976e:	00 00                	add    %al,(%eax)
 8049770:	08 00                	or     %al,(%eax)
 8049772:	00 00                	add    %al,(%eax)
 8049774:	13 00                	adc    (%eax),%eax
 8049776:	00 00                	add    %al,(%eax)
 8049778:	08 00                	or     %al,(%eax)
 804977a:	00 00                	add    %al,(%eax)
 804977c:	fe                   	(bad)  
 804977d:	ff                   	(bad)  
 804977e:	ff 6f b4             	ljmp   *-0x4c(%edi)
 8049781:	82                   	(bad)  
 8049782:	04 08                	add    $0x8,%al
 8049784:	ff                   	(bad)  
 8049785:	ff                   	(bad)  
 8049786:	ff 6f 01             	ljmp   *0x1(%edi)
 8049789:	00 00                	add    %al,(%eax)
 804978b:	00 f0                	add    %dh,%al
 804978d:	ff                   	(bad)  
 804978e:	ff 6f a2             	ljmp   *-0x5e(%edi)
 8049791:	82                   	(bad)  
 8049792:	04 08                	add    $0x8,%al
	...

Disassembly of section .got:

080497c4 <.got>:
 80497c4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .got.plt:

080497c8 <_GLOBAL_OFFSET_TABLE_>:
 80497c8:	fc                   	cld    
 80497c9:	96                   	xchg   %eax,%esi
 80497ca:	04 08                	add    $0x8,%al
	...
 80497d4:	5a                   	pop    %edx
 80497d5:	83 04 08 6a          	addl   $0x6a,(%eax,%ecx,1)
 80497d9:	83 04 08 7a          	addl   $0x7a,(%eax,%ecx,1)
 80497dd:	83 04 08 8a          	addl   $0xffffff8a,(%eax,%ecx,1)
 80497e1:	83 04 08 9a          	addl   $0xffffff9a,(%eax,%ecx,1)
 80497e5:	83 04 08 aa          	addl   $0xffffffaa,(%eax,%ecx,1)
 80497e9:	83 04 08 ba          	addl   $0xffffffba,(%eax,%ecx,1)
 80497ed:	83                   	.byte 0x83
 80497ee:	04 08                	add    $0x8,%al

Disassembly of section .data:

080497f0 <__data_start>:
 80497f0:	00 00                	add    %al,(%eax)
	...

Disassembly of section .bss:

080497f4 <completed.5974>:
 80497f4:	00 00                	add    %al,(%eax)
	...

080497f8 <dtor_idx.5976>:
 80497f8:	00 00                	add    %al,(%eax)
	...

080497fc <g_data>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 47 4e             	sub    %al,0x4e(%edi)
   8:	55                   	push   %ebp
   9:	29 20                	sub    %esp,(%eax)
   b:	34 2e                	xor    $0x2e,%al
   d:	34 2e                	xor    $0x2e,%al
   f:	37                   	aaa    
  10:	20 32                	and    %dh,(%edx)
  12:	30 31                	xor    %dh,(%ecx)
  14:	32 30                	xor    (%eax),%dh
  16:	33 31                	xor    (%ecx),%esi
  18:	33 20                	xor    (%eax),%esp
  1a:	28 52 65             	sub    %dl,0x65(%edx)
  1d:	64 20 48 61          	and    %cl,%fs:0x61(%eax)
  21:	74 20                	je     43 <_init-0x80482d1>
  23:	34 2e                	xor    $0x2e,%al
  25:	34 2e                	xor    $0x2e,%al
  27:	37                   	aaa    
  28:	2d 31 36 29 00       	sub    $0x293631,%eax

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	84 84 04 08 e3 00 00 	test   %al,0xe308(%esp,%eax,1)
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	3d 00 00 00 02       	cmp    $0x2000000,%eax
   5:	00 00                	add    %al,(%eax)
   7:	00 00                	add    %al,(%eax)
   9:	00 6f 01             	add    %ch,0x1(%edi)
   c:	00 00                	add    %al,(%eax)
   e:	bd 00 00 00 6d       	mov    $0x6d000000,%ebp
  13:	61                   	popa   
  14:	69 6e 00 17 01 00 00 	imul   $0x117,0x0(%esi),%ebp
  1b:	75 6e                	jne    8b <_init-0x8048289>
  1d:	73 61                	jae    80 <_init-0x8048294>
  1f:	66                   	data16
  20:	65                   	gs
  21:	5f                   	pop    %edi
  22:	66                   	data16
  23:	75 6e                	jne    93 <_init-0x8048281>
  25:	00 29                	add    %ch,(%ecx)
  27:	01 00                	add    %eax,(%eax)
  29:	00 68 61             	add    %ch,0x61(%eax)
  2c:	6e                   	outsb  %ds:(%esi),(%dx)
  2d:	64                   	fs
  2e:	6c                   	insb   (%dx),%es:(%edi)
  2f:	65                   	gs
  30:	72 00                	jb     32 <_init-0x80482e2>
  32:	5c                   	pop    %esp
  33:	01 00                	add    %eax,(%eax)
  35:	00 67 5f             	add    %ah,0x5f(%edi)
  38:	64                   	fs
  39:	61                   	popa   
  3a:	74 61                	je     9d <_init-0x8048277>
  3c:	00 00                	add    %al,(%eax)
  3e:	00 00                	add    %al,(%eax)
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	6b 01 00             	imul   $0x0,(%ecx),%eax
   3:	00 03                	add    %al,(%ebx)
   5:	00 00                	add    %al,(%eax)
   7:	00 00                	add    %al,(%eax)
   9:	00 04 01             	add    %al,(%ecx,%eax,1)
   c:	40                   	inc    %eax
   d:	00 00                	add    %al,(%eax)
   f:	00 01                	add    %al,(%ecx)
  11:	1d 00 00 00 b5       	sbb    $0xb5000000,%eax
  16:	00 00                	add    %al,(%eax)
  18:	00 84 84 04 08 67 85 	add    %al,-0x7a98f7fc(%esp,%eax,4)
  1f:	04 08                	add    $0x8,%al
  21:	00 00                	add    %al,(%eax)
  23:	00 00                	add    %al,(%eax)
  25:	02 01                	add    (%ecx),%al
  27:	08 7f 00             	or     %bh,0x0(%edi)
  2a:	00 00                	add    %al,(%eax)
  2c:	02 02                	add    (%edx),%al
  2e:	07                   	pop    %es
  2f:	97                   	xchg   %eax,%edi
  30:	00 00                	add    %al,(%eax)
  32:	00 02                	add    %al,(%edx)
  34:	04 07                	add    $0x7,%al
  36:	72 00                	jb     38 <_init-0x80482dc>
  38:	00 00                	add    %al,(%eax)
  3a:	02 04 07             	add    (%edi,%eax,1),%al
  3d:	6d                   	insl   (%dx),%es:(%edi)
  3e:	00 00                	add    %al,(%eax)
  40:	00 02                	add    %al,(%edx)
  42:	01 06                	add    %eax,(%esi)
  44:	81 00 00 00 02 02    	addl   $0x2020000,(%eax)
  4a:	05 ed 00 00 00       	add    $0xed,%eax
  4f:	03 04 05 69 6e 74 00 	add    0x746e69(,%eax,1),%eax
  56:	02 08                	add    (%eax),%cl
  58:	05 00 00 00 00       	add    $0x0,%eax
  5d:	02 08                	add    (%eax),%cl
  5f:	07                   	pop    %es
  60:	68 00 00 00 02       	push   $0x2000000
  65:	04 05                	add    $0x5,%al
  67:	05 00 00 00 04       	add    $0x4000000,%eax
  6c:	04 71                	add    $0x71,%al
  6e:	00 00                	add    %al,(%eax)
  70:	00 02                	add    %al,(%edx)
  72:	01 06                	add    %eax,(%esi)
  74:	88 00                	mov    %al,(%eax)
  76:	00 00                	add    %al,(%eax)
  78:	05 31 00 00 00       	add    $0x31,%eax
  7d:	02 54 83 00          	add    0x0(%ebx,%eax,4),%dl
  81:	00 00                	add    %al,(%eax)
  83:	04 04                	add    $0x4,%al
  85:	89 00                	mov    %eax,(%eax)
  87:	00 00                	add    %al,(%eax)
  89:	06                   	push   %es
  8a:	01 95 00 00 00 07    	add    %edx,0x7000000(%ebp)
  90:	4f                   	dec    %edi
  91:	00 00                	add    %al,(%eax)
  93:	00 00                	add    %al,(%eax)
  95:	08 08                	or     %cl,(%eax)
  97:	01 12                	add    %edx,(%edx)
  99:	b2 00                	mov    $0x0,%dl
  9b:	00 00                	add    %al,(%eax)
  9d:	09 61 00             	or     %esp,0x0(%ecx)
  a0:	01 13                	add    %edx,(%ebx)
  a2:	4f                   	dec    %edi
  a3:	00 00                	add    %al,(%eax)
  a5:	00 00                	add    %al,(%eax)
  a7:	09 62 00             	or     %esp,0x0(%edx)
  aa:	01 14 4f             	add    %edx,(%edi,%ecx,2)
  ad:	00 00                	add    %al,(%eax)
  af:	00 04 00             	add    %al,(%eax,%eax,1)
  b2:	05 e8 00 00 00       	add    $0xe8,%eax
  b7:	01 15 95 00 00 00    	add    %edx,0x95
  bd:	0a 01                	or     (%ecx),%al
  bf:	8d 00                	lea    (%eax),%eax
  c1:	00 00                	add    %al,(%eax)
  c3:	01 1a                	add    %ebx,(%edx)
  c5:	01 4f 00             	add    %ecx,0x0(%edi)
  c8:	00 00                	add    %al,(%eax)
  ca:	84 84 04 08 25 85 04 	test   %al,0x4852508(%esp,%eax,1)
  d1:	08 01                	or     %al,(%ecx)
  d3:	9c                   	pushf  
  d4:	11 01                	adc    %eax,(%ecx)
  d6:	00 00                	add    %al,(%eax)
  d8:	0b 92 00 00 00 01    	or     0x1000000(%edx),%edx
  de:	1a 4f 00             	sbb    0x0(%edi),%cl
  e1:	00 00                	add    %al,(%eax)
  e3:	02 91 00 0b fc 00    	add    0xfc0b00(%ecx),%dl
  e9:	00 00                	add    %al,(%eax)
  eb:	01 1a                	add    %ebx,(%edx)
  ed:	11 01                	adc    %eax,(%ecx)
  ef:	00 00                	add    %al,(%eax)
  f1:	02 91 04 0c 2b 00    	add    0x2b0c04(%ecx),%dl
  f7:	00 00                	add    %al,(%eax)
  f9:	01 1c b2             	add    %ebx,(%edx,%esi,4)
  fc:	00 00                	add    %al,(%eax)
  fe:	00 02                	add    %al,(%edx)
 100:	74 18                	je     11a <_init-0x80481fa>
 102:	0c f7                	or     $0xf7,%al
 104:	00 00                	add    %al,(%eax)
 106:	00 01                	add    %al,(%ecx)
 108:	1d b2 00 00 00       	sbb    $0xb2,%eax
 10d:	02 74 10 00          	add    0x0(%eax,%edx,1),%dh
 111:	04 04                	add    $0x4,%al
 113:	6b 00 00             	imul   $0x0,(%eax),%eax
 116:	00 0d 01 aa 00 00    	add    %cl,0xaa01
 11c:	00 01                	add    %al,(%ecx)
 11e:	2b 25 85 04 08 4e    	sub    0x4e080485,%esp
 124:	85 04 08             	test   %eax,(%eax,%ecx,1)
 127:	01 9c 0e 01 0e 00 00 	add    %ebx,0xe01(%esi,%ecx,1)
 12e:	00 01                	add    %al,(%ecx)
 130:	30 01                	xor    %al,(%ecx)
 132:	4e                   	dec    %esi
 133:	85 04 08             	test   %eax,(%eax,%ecx,1)
 136:	67 85 04             	test   %eax,(%si)
 139:	08 01                	or     %al,(%ecx)
 13b:	9c                   	pushf  
 13c:	4f                   	dec    %edi
 13d:	01 00                	add    %eax,(%eax)
 13f:	00 0f                	add    %cl,(%edi)
 141:	73 69                	jae    1ac <_init-0x8048168>
 143:	67 00 01             	add    %al,(%bx,%di)
 146:	30 4f 00             	xor    %cl,0x0(%edi)
 149:	00 00                	add    %al,(%eax)
 14b:	02 91 00 00 10 16    	add    0x16100000(%ecx),%dl
 151:	00 00                	add    %al,(%eax)
 153:	00 01                	add    %al,(%ecx)
 155:	17                   	pop    %ss
 156:	b2 00                	mov    $0x0,%dl
 158:	00 00                	add    %al,(%eax)
 15a:	01 01                	add    %eax,(%ecx)
 15c:	11 16                	adc    %edx,(%esi)
 15e:	00 00                	add    %al,(%eax)
 160:	00 01                	add    %al,(%ecx)
 162:	17                   	pop    %ss
 163:	b2 00                	mov    $0x0,%dl
 165:	00 00                	add    %al,(%eax)
 167:	01 05 03 fc 97 04    	add    %eax,0x497fc03
 16d:	08 00                	or     %al,(%eax)

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
   8:	0e                   	push   %cs
   9:	1b 0e                	sbb    (%esi),%ecx
   b:	11 01                	adc    %eax,(%ecx)
   d:	12 01                	adc    (%ecx),%al
   f:	10 06                	adc    %al,(%esi)
  11:	00 00                	add    %al,(%eax)
  13:	02 24 00             	add    (%eax,%eax,1),%ah
  16:	0b 0b                	or     (%ebx),%ecx
  18:	3e 0b 03             	or     %ds:(%ebx),%eax
  1b:	0e                   	push   %cs
  1c:	00 00                	add    %al,(%eax)
  1e:	03 24 00             	add    (%eax,%eax,1),%esp
  21:	0b 0b                	or     (%ebx),%ecx
  23:	3e 0b 03             	or     %ds:(%ebx),%eax
  26:	08 00                	or     %al,(%eax)
  28:	00 04 0f             	add    %al,(%edi,%ecx,1)
  2b:	00 0b                	add    %cl,(%ebx)
  2d:	0b 49 13             	or     0x13(%ecx),%ecx
  30:	00 00                	add    %al,(%eax)
  32:	05 16 00 03 0e       	add    $0xe030016,%eax
  37:	3a 0b                	cmp    (%ebx),%cl
  39:	3b 0b                	cmp    (%ebx),%ecx
  3b:	49                   	dec    %ecx
  3c:	13 00                	adc    (%eax),%eax
  3e:	00 06                	add    %al,(%esi)
  40:	15 01 27 0c 01       	adc    $0x10c2701,%eax
  45:	13 00                	adc    (%eax),%eax
  47:	00 07                	add    %al,(%edi)
  49:	05 00 49 13 00       	add    $0x134900,%eax
  4e:	00 08                	add    %cl,(%eax)
  50:	13 01                	adc    (%ecx),%eax
  52:	0b 0b                	or     (%ebx),%ecx
  54:	3a 0b                	cmp    (%ebx),%cl
  56:	3b 0b                	cmp    (%ebx),%ecx
  58:	01 13                	add    %edx,(%ebx)
  5a:	00 00                	add    %al,(%eax)
  5c:	09 0d 00 03 08 3a    	or     %ecx,0x3a080300
  62:	0b 3b                	or     (%ebx),%edi
  64:	0b 49 13             	or     0x13(%ecx),%ecx
  67:	38 0d 00 00 0a 2e    	cmp    %cl,0x2e0a0000
  6d:	01 3f                	add    %edi,(%edi)
  6f:	0c 03                	or     $0x3,%al
  71:	0e                   	push   %cs
  72:	3a 0b                	cmp    (%ebx),%cl
  74:	3b 0b                	cmp    (%ebx),%ecx
  76:	27                   	daa    
  77:	0c 49                	or     $0x49,%al
  79:	13 11                	adc    (%ecx),%edx
  7b:	01 12                	add    %edx,(%edx)
  7d:	01 40 0a             	add    %eax,0xa(%eax)
  80:	01 13                	add    %edx,(%ebx)
  82:	00 00                	add    %al,(%eax)
  84:	0b 05 00 03 0e 3a    	or     0x3a0e0300,%eax
  8a:	0b 3b                	or     (%ebx),%edi
  8c:	0b 49 13             	or     0x13(%ecx),%ecx
  8f:	02 0a                	add    (%edx),%cl
  91:	00 00                	add    %al,(%eax)
  93:	0c 34                	or     $0x34,%al
  95:	00 03                	add    %al,(%ebx)
  97:	0e                   	push   %cs
  98:	3a 0b                	cmp    (%ebx),%cl
  9a:	3b 0b                	cmp    (%ebx),%ecx
  9c:	49                   	dec    %ecx
  9d:	13 02                	adc    (%edx),%eax
  9f:	0a 00                	or     (%eax),%al
  a1:	00 0d 2e 00 3f 0c    	add    %cl,0xc3f002e
  a7:	03 0e                	add    (%esi),%ecx
  a9:	3a 0b                	cmp    (%ebx),%cl
  ab:	3b 0b                	cmp    (%ebx),%ecx
  ad:	11 01                	adc    %eax,(%ecx)
  af:	12 01                	adc    (%ecx),%al
  b1:	40                   	inc    %eax
  b2:	0a 00                	or     (%eax),%al
  b4:	00 0e                	add    %cl,(%esi)
  b6:	2e 01 3f             	add    %edi,%cs:(%edi)
  b9:	0c 03                	or     $0x3,%al
  bb:	0e                   	push   %cs
  bc:	3a 0b                	cmp    (%ebx),%cl
  be:	3b 0b                	cmp    (%ebx),%ecx
  c0:	27                   	daa    
  c1:	0c 11                	or     $0x11,%al
  c3:	01 12                	add    %edx,(%edx)
  c5:	01 40 0a             	add    %eax,0xa(%eax)
  c8:	01 13                	add    %edx,(%ebx)
  ca:	00 00                	add    %al,(%eax)
  cc:	0f 05                	syscall 
  ce:	00 03                	add    %al,(%ebx)
  d0:	08 3a                	or     %bh,(%edx)
  d2:	0b 3b                	or     (%ebx),%edi
  d4:	0b 49 13             	or     0x13(%ecx),%ecx
  d7:	02 0a                	add    (%edx),%cl
  d9:	00 00                	add    %al,(%eax)
  db:	10 34 00             	adc    %dh,(%eax,%eax,1)
  de:	03 0e                	add    (%esi),%ecx
  e0:	3a 0b                	cmp    (%ebx),%cl
  e2:	3b 0b                	cmp    (%ebx),%ecx
  e4:	49                   	dec    %ecx
  e5:	13 3f                	adc    (%edi),%edi
  e7:	0c 3c                	or     $0x3c,%al
  e9:	0c 00                	or     $0x0,%al
  eb:	00 11                	add    %dl,(%ecx)
  ed:	34 00                	xor    $0x0,%al
  ef:	03 0e                	add    (%esi),%ecx
  f1:	3a 0b                	cmp    (%ebx),%cl
  f3:	3b 0b                	cmp    (%ebx),%ecx
  f5:	49                   	dec    %ecx
  f6:	13 3f                	adc    (%edi),%edi
  f8:	0c 02                	or     $0x2,%al
  fa:	0a 00                	or     (%eax),%al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	68 00 00 00 02       	push   $0x2000000
   5:	00 3d 00 00 00 01    	add    %bh,0x1000000
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	2f                   	das    
  1c:	75 73                	jne    91 <_init-0x8048283>
  1e:	72 2f                	jb     4f <_init-0x80482c5>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  27:	00 00                	add    %al,(%eax)
  29:	30 32                	xor    %dh,(%edx)
  2b:	72 65                	jb     92 <_init-0x8048282>
  2d:	65 6e                	outsb  %gs:(%esi),(%dx)
  2f:	74 72                	je     a3 <_init-0x8048271>
  31:	61                   	popa   
  32:	6e                   	outsb  %ds:(%esi),(%dx)
  33:	74 2e                	je     63 <_init-0x80482b1>
  35:	63 00                	arpl   %ax,(%eax)
  37:	00 00                	add    %al,(%eax)
  39:	00 73 69             	add    %dh,0x69(%ebx)
  3c:	67 6e                	outsb  %ds:(%si),(%dx)
  3e:	61                   	popa   
  3f:	6c                   	insb   (%dx),%es:(%edi)
  40:	2e                   	cs
  41:	68 00 01 00 00       	push   $0x100
  46:	00 00                	add    %al,(%eax)
  48:	05 02 84 84 04       	add    $0x4848402,%eax
  4d:	08 03                	or     %al,(%ebx)
  4f:	1a 01                	sbb    (%ecx),%al
  51:	91                   	xchg   %eax,%ecx
  52:	f3 f3 08 83 08 76 08 	repz repz or %al,0x2f087608(%ebx)
  59:	2f 
  5a:	bd 08 2f 08 2f       	mov    $0x2f082f08,%ebp
  5f:	33 67 08             	xor    0x8(%edi),%esp
  62:	f3 31 67 59          	repz xor %esp,0x59(%edi)
  66:	bb 02 02 00 01       	mov    $0x1000202,%ebx
  6b:	01                   	.byte 0x1

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	10 00                	adc    %al,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	ff                   	(bad)  
   5:	ff                   	(bad)  
   6:	ff                   	(bad)  
   7:	ff 01                	incl   (%ecx)
   9:	00 01                	add    %al,(%ecx)
   b:	7c 08                	jl     15 <_init-0x80482ff>
   d:	0c 04                	or     $0x4,%al
   f:	04 88                	add    $0x88,%al
  11:	01 00                	add    %eax,(%eax)
  13:	00 14 00             	add    %dl,(%eax,%eax,1)
  16:	00 00                	add    %al,(%eax)
  18:	00 00                	add    %al,(%eax)
  1a:	00 00                	add    %al,(%eax)
  1c:	84 84 04 08 a1 00 00 	test   %al,0xa108(%esp,%eax,1)
  23:	00 41 0e             	add    %al,0xe(%ecx)
  26:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  2c:	1c 00                	sbb    $0x0,%al
  2e:	00 00                	add    %al,(%eax)
  30:	00 00                	add    %al,(%eax)
  32:	00 00                	add    %al,(%eax)
  34:	25 85 04 08 29       	and    $0x29080485,%eax
  39:	00 00                	add    %al,(%eax)
  3b:	00 41 0e             	add    %al,0xe(%ecx)
  3e:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  44:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  48:	04 00                	add    $0x0,%al
  4a:	00 00                	add    %al,(%eax)
  4c:	1c 00                	sbb    $0x0,%al
  4e:	00 00                	add    %al,(%eax)
  50:	00 00                	add    %al,(%eax)
  52:	00 00                	add    %al,(%eax)
  54:	4e                   	dec    %esi
  55:	85 04 08             	test   %eax,(%eax,%ecx,1)
  58:	19 00                	sbb    %eax,(%eax)
  5a:	00 00                	add    %al,(%eax)
  5c:	41                   	inc    %ecx
  5d:	0e                   	push   %cs
  5e:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  64:	55                   	push   %ebp
  65:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  68:	04 00                	add    $0x0,%al
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	insb   (%dx),%es:(%edi)
   1:	6f                   	outsl  %ds:(%esi),(%dx)
   2:	6e                   	outsb  %ds:(%esi),(%dx)
   3:	67 20 6c 6f          	and    %ch,0x6f(%si)
   7:	6e                   	outsb  %ds:(%esi),(%dx)
   8:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
   c:	74 00                	je     e <_init-0x8048306>
   e:	68 61 6e 64 6c       	push   $0x6c646e61
  13:	65                   	gs
  14:	72 00                	jb     16 <_init-0x80482fe>
  16:	67 5f                	addr16 pop %edi
  18:	64                   	fs
  19:	61                   	popa   
  1a:	74 61                	je     7d <_init-0x8048297>
  1c:	00 30                	add    %dh,(%eax)
  1e:	32 72 65             	xor    0x65(%edx),%dh
  21:	65 6e                	outsb  %gs:(%esi),(%dx)
  23:	74 72                	je     97 <_init-0x804827d>
  25:	61                   	popa   
  26:	6e                   	outsb  %ds:(%esi),(%dx)
  27:	74 2e                	je     57 <_init-0x80482bd>
  29:	63 00                	arpl   %ax,(%eax)
  2b:	7a 65                	jp     92 <_init-0x8048282>
  2d:	72 6f                	jb     9e <_init-0x8048276>
  2f:	73 00                	jae    31 <_init-0x80482e3>
  31:	5f                   	pop    %edi
  32:	5f                   	pop    %edi
  33:	73 69                	jae    9e <_init-0x8048276>
  35:	67 68 61 6e 64 6c    	addr16 push $0x6c646e61
  3b:	65                   	gs
  3c:	72 5f                	jb     9d <_init-0x8048277>
  3e:	74 00                	je     40 <_init-0x80482d4>
  40:	47                   	inc    %edi
  41:	4e                   	dec    %esi
  42:	55                   	push   %ebp
  43:	20 43 20             	and    %al,0x20(%ebx)
  46:	34 2e                	xor    $0x2e,%al
  48:	34 2e                	xor    $0x2e,%al
  4a:	37                   	aaa    
  4b:	20 32                	and    %dh,(%edx)
  4d:	30 31                	xor    %dh,(%ecx)
  4f:	32 30                	xor    (%eax),%dh
  51:	33 31                	xor    (%ecx),%esi
  53:	33 20                	xor    (%eax),%esp
  55:	28 52 65             	sub    %dl,0x65(%edx)
  58:	64 20 48 61          	and    %cl,%fs:0x61(%eax)
  5c:	74 20                	je     7e <_init-0x8048296>
  5e:	34 2e                	xor    $0x2e,%al
  60:	34 2e                	xor    $0x2e,%al
  62:	37                   	aaa    
  63:	2d 31 36 29 00       	sub    $0x293631,%eax
  68:	6c                   	insb   (%dx),%es:(%edi)
  69:	6f                   	outsl  %ds:(%esi),(%dx)
  6a:	6e                   	outsb  %ds:(%esi),(%dx)
  6b:	67 20 6c 6f          	and    %ch,0x6f(%si)
  6f:	6e                   	outsb  %ds:(%esi),(%dx)
  70:	67 20 75 6e          	and    %dh,0x6e(%di)
  74:	73 69                	jae    df <_init-0x8048235>
  76:	67 6e                	outsb  %ds:(%si),(%dx)
  78:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%ecx)
  7d:	74 00                	je     7f <_init-0x8048295>
  7f:	75 6e                	jne    ef <_init-0x8048225>
  81:	73 69                	jae    ec <_init-0x8048228>
  83:	67 6e                	outsb  %ds:(%si),(%dx)
  85:	65 64 20 63 68       	gs and %ah,%fs:%gs:0x68(%ebx)
  8a:	61                   	popa   
  8b:	72 00                	jb     8d <_init-0x8048287>
  8d:	6d                   	insl   (%dx),%es:(%edi)
  8e:	61                   	popa   
  8f:	69 6e 00 61 72 67 63 	imul   $0x63677261,0x0(%esi),%ebp
  96:	00 73 68             	add    %dh,0x68(%ebx)
  99:	6f                   	outsl  %ds:(%esi),(%dx)
  9a:	72 74                	jb     110 <_init-0x8048204>
  9c:	20 75 6e             	and    %dh,0x6e(%ebp)
  9f:	73 69                	jae    10a <_init-0x804820a>
  a1:	67 6e                	outsb  %ds:(%si),(%dx)
  a3:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%ecx)
  a8:	74 00                	je     aa <_init-0x804826a>
  aa:	75 6e                	jne    11a <_init-0x80481fa>
  ac:	73 61                	jae    10f <_init-0x8048205>
  ae:	66                   	data16
  af:	65                   	gs
  b0:	5f                   	pop    %edi
  b1:	66                   	data16
  b2:	75 6e                	jne    122 <_init-0x80481f2>
  b4:	00 2f                	add    %ch,(%edi)
  b6:	72 6f                	jb     127 <_init-0x80481ed>
  b8:	6f                   	outsl  %ds:(%esi),(%dx)
  b9:	74 2f                	je     ea <_init-0x804822a>
  bb:	70 72                	jo     12f <_init-0x80481e5>
  bd:	6f                   	outsl  %ds:(%esi),(%dx)
  be:	67 72 61             	addr16 jb 122 <_init-0x80481f2>
  c1:	6d                   	insl   (%dx),%es:(%edi)
  c2:	6d                   	insl   (%dx),%es:(%edi)
  c3:	69 6e 67 2f 6c 69 6e 	imul   $0x6e696c2f,0x67(%esi),%ebp
  ca:	75 78                	jne    144 <_init-0x80481d0>
  cc:	2f                   	das    
  cd:	6d                   	insl   (%dx),%es:(%edi)
  ce:	79 5f                	jns    12f <_init-0x80481e5>
  d0:	61                   	popa   
  d1:	70 75                	jo     148 <_init-0x80481cc>
  d3:	65                   	gs
  d4:	2f                   	das    
  d5:	73 69                	jae    140 <_init-0x80481d4>
  d7:	67 6e                	outsb  %ds:(%si),(%dx)
  d9:	61                   	popa   
  da:	6c                   	insb   (%dx),%es:(%edi)
  db:	73 2f                	jae    10c <_init-0x8048208>
  dd:	72 65                	jb     144 <_init-0x80481d0>
  df:	65 6e                	outsb  %gs:(%esi),(%dx)
  e1:	74 72                	je     155 <_init-0x80481bf>
  e3:	61                   	popa   
  e4:	6e                   	outsb  %ds:(%esi),(%dx)
  e5:	74 31                	je     118 <_init-0x80481fc>
  e7:	00 54 45 53          	add    %dl,0x53(%ebp,%eax,2)
  eb:	54                   	push   %esp
  ec:	00 73 68             	add    %dh,0x68(%ebx)
  ef:	6f                   	outsl  %ds:(%esi),(%dx)
  f0:	72 74                	jb     166 <_init-0x80481ae>
  f2:	20 69 6e             	and    %ch,0x6e(%ecx)
  f5:	74 00                	je     f7 <_init-0x804821d>
  f7:	6f                   	outsl  %ds:(%esi),(%dx)
  f8:	6e                   	outsb  %ds:(%esi),(%dx)
  f9:	65                   	gs
  fa:	73 00                	jae    fc <_init-0x8048218>
  fc:	61                   	popa   
  fd:	72 67                	jb     166 <_init-0x80481ae>
  ff:	76 00                	jbe    101 <_init-0x8048213>

Disassembly of section .debug_pubtypes:

00000000 <.debug_pubtypes>:
   0:	2a 00                	sub    (%eax),%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	6f                   	outsl  %ds:(%esi),(%dx)
   b:	01 00                	add    %eax,(%eax)
   d:	00 78 00             	add    %bh,0x0(%eax)
  10:	00 00                	add    %al,(%eax)
  12:	5f                   	pop    %edi
  13:	5f                   	pop    %edi
  14:	73 69                	jae    7f <_init-0x8048295>
  16:	67 68 61 6e 64 6c    	addr16 push $0x6c646e61
  1c:	65                   	gs
  1d:	72 5f                	jb     7e <_init-0x8048296>
  1f:	74 00                	je     21 <_init-0x80482f3>
  21:	b2 00                	mov    $0x0,%dl
  23:	00 00                	add    %al,(%eax)
  25:	54                   	push   %esp
  26:	45                   	inc    %ebp
  27:	53                   	push   %ebx
  28:	54                   	push   %esp
  29:	00 00                	add    %al,(%eax)
  2b:	00 00                	add    %al,(%eax)
	...
