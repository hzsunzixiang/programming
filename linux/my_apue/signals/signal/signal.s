
signal:     file format elf32-i386


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
 8048177:	00 72 88             	add    %dh,-0x78(%edx)
 804817a:	9e                   	sahf   
 804817b:	0c 85                	or     $0x85,%al
 804817d:	c9                   	leave  
 804817e:	b1 b2                	mov    $0xb2,%cl
 8048180:	bb ca 91 53 68       	mov    $0x685391ca,%ebx
 8048185:	1c 9a                	sbb    $0x9a,%al
 8048187:	0b 48 07             	or     0x7(%eax),%ecx
 804818a:	1d                   	.byte 0x1d
 804818b:	c5                   	.byte 0xc5

Disassembly of section .gnu.hash:

0804818c <.gnu.hash>:
 804818c:	02 00                	add    (%eax),%al
 804818e:	00 00                	add    %al,(%eax)
 8048190:	09 00                	or     %eax,(%eax)
 8048192:	00 00                	add    %al,(%eax)
 8048194:	01 00                	add    %eax,(%eax)
 8048196:	00 00                	add    %al,(%eax)
 8048198:	05 00 00 00 00       	add    $0x0,%eax
 804819d:	20 02                	and    %al,(%edx)
 804819f:	22 00                	and    (%eax),%al
 80481a1:	00 00                	add    %al,(%eax)
 80481a3:	00 09                	add    %cl,(%ecx)
 80481a5:	00 00                	add    %al,(%eax)
 80481a7:	00 ac 4b e3 c0 39 f2 	add    %ch,-0xdc63f1d(%ebx,%ecx,2)
 80481ae:	8b                   	.byte 0x8b
 80481af:	1c                   	.byte 0x1c

Disassembly of section .dynsym:

080481b0 <.dynsym>:
	...
 80481c0:	35 00 00 00 00       	xor    $0x0,%eax
 80481c5:	00 00                	add    %al,(%eax)
 80481c7:	00 00                	add    %al,(%eax)
 80481c9:	00 00                	add    %al,(%eax)
 80481cb:	00 12                	add    %dl,(%edx)
 80481cd:	00 00                	add    %al,(%eax)
 80481cf:	00 01                	add    %al,(%ecx)
	...
 80481d9:	00 00                	add    %al,(%eax)
 80481db:	00 20                	add    %ah,(%eax)
 80481dd:	00 00                	add    %al,(%eax)
 80481df:	00 56 00             	add    %dl,0x0(%esi)
	...
 80481ea:	00 00                	add    %al,(%eax)
 80481ec:	12 00                	adc    (%eax),%al
 80481ee:	00 00                	add    %al,(%eax)
 80481f0:	2e 00 00             	add    %al,%cs:(%eax)
	...
 80481fb:	00 12                	add    %dl,(%edx)
 80481fd:	00 00                	add    %al,(%eax)
 80481ff:	00 4e 00             	add    %cl,0x0(%esi)
	...
 804820a:	00 00                	add    %al,(%eax)
 804820c:	12 00                	adc    (%eax),%al
 804820e:	00 00                	add    %al,(%eax)
 8048210:	41                   	inc    %ecx
	...
 8048219:	00 00                	add    %al,(%eax)
 804821b:	00 12                	add    %dl,(%edx)
 804821d:	00 00                	add    %al,(%eax)
 804821f:	00 3c 00             	add    %bh,(%eax,%eax,1)
	...
 804822a:	00 00                	add    %al,(%eax)
 804822c:	12 00                	adc    (%eax),%al
 804822e:	00 00                	add    %al,(%eax)
 8048230:	29 00                	sub    %eax,(%eax)
	...
 804823a:	00 00                	add    %al,(%eax)
 804823c:	12 00                	adc    (%eax),%al
 804823e:	00 00                	add    %al,(%eax)
 8048240:	1a 00                	sbb    (%eax),%al
 8048242:	00 00                	add    %al,(%eax)
 8048244:	5c                   	pop    %esp
 8048245:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 8048248:	04 00                	add    $0x0,%al
 804824a:	00 00                	add    %al,(%eax)
 804824c:	11 00                	adc    %eax,(%eax)
 804824e:	0f 00 47 00          	sldt   0x0(%edi)
 8048252:	00 00                	add    %al,(%eax)
 8048254:	70 98                	jo     80481ee <_init-0x16a>
 8048256:	04 08                	add    $0x8,%al
 8048258:	04 00                	add    $0x0,%al
 804825a:	00 00                	add    %al,(%eax)
 804825c:	11 00                	adc    %eax,(%eax)
 804825e:	19 00                	sbb    %eax,(%eax)

Disassembly of section .dynstr:

08048260 <.dynstr>:
 8048260:	00 5f 5f             	add    %bl,0x5f(%edi)
 8048263:	67 6d                	insl   (%dx),%es:(%di)
 8048265:	6f                   	outsl  %ds:(%esi),(%dx)
 8048266:	6e                   	outsb  %ds:(%esi),(%dx)
 8048267:	5f                   	pop    %edi
 8048268:	73 74                	jae    80482de <_init-0x7a>
 804826a:	61                   	popa   
 804826b:	72 74                	jb     80482e1 <_init-0x77>
 804826d:	5f                   	pop    %edi
 804826e:	5f                   	pop    %edi
 804826f:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 8048273:	63 2e                	arpl   %bp,(%esi)
 8048275:	73 6f                	jae    80482e6 <_init-0x72>
 8048277:	2e 36 00 5f 49       	cs add %bl,%cs:%ss:0x49(%edi)
 804827c:	4f                   	dec    %edi
 804827d:	5f                   	pop    %edi
 804827e:	73 74                	jae    80482f4 <_init-0x64>
 8048280:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
 8048287:	64 
 8048288:	00 65 78             	add    %ah,0x78(%ebp)
 804828b:	69 74 00 70 65 72 72 	imul   $0x6f727265,0x70(%eax,%eax,1),%esi
 8048292:	6f 
 8048293:	72 00                	jb     8048295 <_init-0xc3>
 8048295:	73 69                	jae    8048300 <_init-0x58>
 8048297:	67 6e                	outsb  %ds:(%si),(%dx)
 8048299:	61                   	popa   
 804829a:	6c                   	insb   (%dx),%es:(%edi)
 804829b:	00 70 75             	add    %dh,0x75(%eax)
 804829e:	74 73                	je     8048313 <_init-0x45>
 80482a0:	00 70 61             	add    %dh,0x61(%eax)
 80482a3:	75 73                	jne    8048318 <_init-0x40>
 80482a5:	65 00 73 74          	add    %dh,%gs:0x74(%ebx)
 80482a9:	64                   	fs
 80482aa:	65                   	gs
 80482ab:	72 72                	jb     804831f <_init-0x39>
 80482ad:	00 66 70             	add    %ah,0x70(%esi)
 80482b0:	72 69                	jb     804831b <_init-0x3d>
 80482b2:	6e                   	outsb  %ds:(%esi),(%dx)
 80482b3:	74 66                	je     804831b <_init-0x3d>
 80482b5:	00 5f 5f             	add    %bl,0x5f(%edi)
 80482b8:	6c                   	insb   (%dx),%es:(%edi)
 80482b9:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%edx),%esp
 80482c0:	72 74                	jb     8048336 <_init-0x22>
 80482c2:	5f                   	pop    %edi
 80482c3:	6d                   	insl   (%dx),%es:(%edi)
 80482c4:	61                   	popa   
 80482c5:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%esi),%ebp
 80482cc:	43                   	inc    %ebx
 80482cd:	5f                   	pop    %edi
 80482ce:	32 2e                	xor    (%esi),%ch
 80482d0:	30 00                	xor    %al,(%eax)

Disassembly of section .gnu.version:

080482d2 <.gnu.version>:
 80482d2:	00 00                	add    %al,(%eax)
 80482d4:	02 00                	add    (%eax),%al
 80482d6:	00 00                	add    %al,(%eax)
 80482d8:	02 00                	add    (%eax),%al
 80482da:	02 00                	add    (%eax),%al
 80482dc:	02 00                	add    (%eax),%al
 80482de:	02 00                	add    (%eax),%al
 80482e0:	02 00                	add    (%eax),%al
 80482e2:	02 00                	add    (%eax),%al
 80482e4:	01 00                	add    %eax,(%eax)
 80482e6:	02 00                	add    (%eax),%al

Disassembly of section .gnu.version_r:

080482e8 <.gnu.version_r>:
 80482e8:	01 00                	add    %eax,(%eax)
 80482ea:	01 00                	add    %eax,(%eax)
 80482ec:	10 00                	adc    %al,(%eax)
 80482ee:	00 00                	add    %al,(%eax)
 80482f0:	10 00                	adc    %al,(%eax)
 80482f2:	00 00                	add    %al,(%eax)
 80482f4:	00 00                	add    %al,(%eax)
 80482f6:	00 00                	add    %al,(%eax)
 80482f8:	10 69 69             	adc    %ch,0x69(%ecx)
 80482fb:	0d 00 00 02 00       	or     $0x20000,%eax
 8048300:	68 00 00 00 00       	push   $0x0
 8048305:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.dyn:

08048308 <.rel.dyn>:
 8048308:	3c 98                	cmp    $0x98,%al
 804830a:	04 08                	add    $0x8,%al
 804830c:	06                   	push   %es
 804830d:	02 00                	add    (%eax),%al
 804830f:	00 70 98             	add    %dh,-0x68(%eax)
 8048312:	04 08                	add    $0x8,%al
 8048314:	05                   	.byte 0x5
 8048315:	0a 00                	or     (%eax),%al
	...

Disassembly of section .rel.plt:

08048318 <.rel.plt>:
 8048318:	4c                   	dec    %esp
 8048319:	98                   	cwtl   
 804831a:	04 08                	add    $0x8,%al
 804831c:	07                   	pop    %es
 804831d:	01 00                	add    %eax,(%eax)
 804831f:	00 50 98             	add    %dl,-0x68(%eax)
 8048322:	04 08                	add    $0x8,%al
 8048324:	07                   	pop    %es
 8048325:	02 00                	add    (%eax),%al
 8048327:	00 54 98 04          	add    %dl,0x4(%eax,%ebx,4)
 804832b:	08 07                	or     %al,(%edi)
 804832d:	03 00                	add    (%eax),%eax
 804832f:	00 58 98             	add    %bl,-0x68(%eax)
 8048332:	04 08                	add    $0x8,%al
 8048334:	07                   	pop    %es
 8048335:	04 00                	add    $0x0,%al
 8048337:	00 5c 98 04          	add    %bl,0x4(%eax,%ebx,4)
 804833b:	08 07                	or     %al,(%edi)
 804833d:	05 00 00 60 98       	add    $0x98600000,%eax
 8048342:	04 08                	add    $0x8,%al
 8048344:	07                   	pop    %es
 8048345:	06                   	push   %es
 8048346:	00 00                	add    %al,(%eax)
 8048348:	64                   	fs
 8048349:	98                   	cwtl   
 804834a:	04 08                	add    $0x8,%al
 804834c:	07                   	pop    %es
 804834d:	07                   	pop    %es
 804834e:	00 00                	add    %al,(%eax)
 8048350:	68 98 04 08 07       	push   $0x7080498
 8048355:	08 00                	or     %al,(%eax)
	...

Disassembly of section .init:

08048358 <_init>:
 8048358:	55                   	push   %ebp
 8048359:	89 e5                	mov    %esp,%ebp
 804835b:	53                   	push   %ebx
 804835c:	83 ec 04             	sub    $0x4,%esp
 804835f:	e8 00 00 00 00       	call   8048364 <_init+0xc>
 8048364:	5b                   	pop    %ebx
 8048365:	81 c3 dc 14 00 00    	add    $0x14dc,%ebx
 804836b:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 8048371:	85 d2                	test   %edx,%edx
 8048373:	74 05                	je     804837a <_init+0x22>
 8048375:	e8 2e 00 00 00       	call   80483a8 <__gmon_start__@plt>
 804837a:	e8 31 01 00 00       	call   80484b0 <frame_dummy>
 804837f:	e8 8c 02 00 00       	call   8048610 <__do_global_ctors_aux>
 8048384:	58                   	pop    %eax
 8048385:	5b                   	pop    %ebx
 8048386:	c9                   	leave  
 8048387:	c3                   	ret    

Disassembly of section .plt:

08048388 <signal@plt-0x10>:
 8048388:	ff 35 44 98 04 08    	pushl  0x8049844
 804838e:	ff 25 48 98 04 08    	jmp    *0x8049848
 8048394:	00 00                	add    %al,(%eax)
	...

08048398 <signal@plt>:
 8048398:	ff 25 4c 98 04 08    	jmp    *0x804984c
 804839e:	68 00 00 00 00       	push   $0x0
 80483a3:	e9 e0 ff ff ff       	jmp    8048388 <_init+0x30>

080483a8 <__gmon_start__@plt>:
 80483a8:	ff 25 50 98 04 08    	jmp    *0x8049850
 80483ae:	68 08 00 00 00       	push   $0x8
 80483b3:	e9 d0 ff ff ff       	jmp    8048388 <_init+0x30>

080483b8 <__libc_start_main@plt>:
 80483b8:	ff 25 54 98 04 08    	jmp    *0x8049854
 80483be:	68 10 00 00 00       	push   $0x10
 80483c3:	e9 c0 ff ff ff       	jmp    8048388 <_init+0x30>

080483c8 <perror@plt>:
 80483c8:	ff 25 58 98 04 08    	jmp    *0x8049858
 80483ce:	68 18 00 00 00       	push   $0x18
 80483d3:	e9 b0 ff ff ff       	jmp    8048388 <_init+0x30>

080483d8 <fprintf@plt>:
 80483d8:	ff 25 5c 98 04 08    	jmp    *0x804985c
 80483de:	68 20 00 00 00       	push   $0x20
 80483e3:	e9 a0 ff ff ff       	jmp    8048388 <_init+0x30>

080483e8 <pause@plt>:
 80483e8:	ff 25 60 98 04 08    	jmp    *0x8049860
 80483ee:	68 28 00 00 00       	push   $0x28
 80483f3:	e9 90 ff ff ff       	jmp    8048388 <_init+0x30>

080483f8 <puts@plt>:
 80483f8:	ff 25 64 98 04 08    	jmp    *0x8049864
 80483fe:	68 30 00 00 00       	push   $0x30
 8048403:	e9 80 ff ff ff       	jmp    8048388 <_init+0x30>

08048408 <exit@plt>:
 8048408:	ff 25 68 98 04 08    	jmp    *0x8049868
 804840e:	68 38 00 00 00       	push   $0x38
 8048413:	e9 70 ff ff ff       	jmp    8048388 <_init+0x30>

Disassembly of section .text:

08048420 <_start>:
 8048420:	31 ed                	xor    %ebp,%ebp
 8048422:	5e                   	pop    %esi
 8048423:	89 e1                	mov    %esp,%ecx
 8048425:	83 e4 f0             	and    $0xfffffff0,%esp
 8048428:	50                   	push   %eax
 8048429:	54                   	push   %esp
 804842a:	52                   	push   %edx
 804842b:	68 a0 85 04 08       	push   $0x80485a0
 8048430:	68 b0 85 04 08       	push   $0x80485b0
 8048435:	51                   	push   %ecx
 8048436:	56                   	push   %esi
 8048437:	68 d4 84 04 08       	push   $0x80484d4
 804843c:	e8 77 ff ff ff       	call   80483b8 <__libc_start_main@plt>
 8048441:	f4                   	hlt    
 8048442:	90                   	nop
 8048443:	90                   	nop
 8048444:	90                   	nop
 8048445:	90                   	nop
 8048446:	90                   	nop
 8048447:	90                   	nop
 8048448:	90                   	nop
 8048449:	90                   	nop
 804844a:	90                   	nop
 804844b:	90                   	nop
 804844c:	90                   	nop
 804844d:	90                   	nop
 804844e:	90                   	nop
 804844f:	90                   	nop

08048450 <__do_global_dtors_aux>:
 8048450:	55                   	push   %ebp
 8048451:	89 e5                	mov    %esp,%ebp
 8048453:	53                   	push   %ebx
 8048454:	8d 64 24 fc          	lea    -0x4(%esp),%esp
 8048458:	80 3d 74 98 04 08 00 	cmpb   $0x0,0x8049874
 804845f:	75 3e                	jne    804849f <__do_global_dtors_aux+0x4f>
 8048461:	bb 6c 97 04 08       	mov    $0x804976c,%ebx
 8048466:	a1 78 98 04 08       	mov    0x8049878,%eax
 804846b:	81 eb 68 97 04 08    	sub    $0x8049768,%ebx
 8048471:	c1 fb 02             	sar    $0x2,%ebx
 8048474:	83 eb 01             	sub    $0x1,%ebx
 8048477:	39 d8                	cmp    %ebx,%eax
 8048479:	73 1d                	jae    8048498 <__do_global_dtors_aux+0x48>
 804847b:	90                   	nop
 804847c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048480:	83 c0 01             	add    $0x1,%eax
 8048483:	a3 78 98 04 08       	mov    %eax,0x8049878
 8048488:	ff 14 85 68 97 04 08 	call   *0x8049768(,%eax,4)
 804848f:	a1 78 98 04 08       	mov    0x8049878,%eax
 8048494:	39 d8                	cmp    %ebx,%eax
 8048496:	72 e8                	jb     8048480 <__do_global_dtors_aux+0x30>
 8048498:	c6 05 74 98 04 08 01 	movb   $0x1,0x8049874
 804849f:	8d 64 24 04          	lea    0x4(%esp),%esp
 80484a3:	5b                   	pop    %ebx
 80484a4:	5d                   	pop    %ebp
 80484a5:	c3                   	ret    
 80484a6:	8d 76 00             	lea    0x0(%esi),%esi
 80484a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080484b0 <frame_dummy>:
 80484b0:	55                   	push   %ebp
 80484b1:	89 e5                	mov    %esp,%ebp
 80484b3:	8d 64 24 e8          	lea    -0x18(%esp),%esp
 80484b7:	a1 70 97 04 08       	mov    0x8049770,%eax
 80484bc:	85 c0                	test   %eax,%eax
 80484be:	74 12                	je     80484d2 <frame_dummy+0x22>
 80484c0:	b8 00 00 00 00       	mov    $0x0,%eax
 80484c5:	85 c0                	test   %eax,%eax
 80484c7:	74 09                	je     80484d2 <frame_dummy+0x22>
 80484c9:	c7 04 24 70 97 04 08 	movl   $0x8049770,(%esp)
 80484d0:	ff d0                	call   *%eax
 80484d2:	c9                   	leave  
 80484d3:	c3                   	ret    

080484d4 <main>:
 80484d4:	55                   	push   %ebp
 80484d5:	89 e5                	mov    %esp,%ebp
 80484d7:	83 e4 f0             	and    $0xfffffff0,%esp
 80484da:	83 ec 10             	sub    $0x10,%esp
 80484dd:	c7 44 24 04 46 85 04 	movl   $0x8048546,0x4(%esp)
 80484e4:	08 
 80484e5:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 80484ec:	e8 a7 fe ff ff       	call   8048398 <signal@plt>
 80484f1:	83 f8 ff             	cmp    $0xffffffff,%eax
 80484f4:	75 18                	jne    804850e <main+0x3a>
 80484f6:	c7 04 24 64 86 04 08 	movl   $0x8048664,(%esp)
 80484fd:	e8 c6 fe ff ff       	call   80483c8 <perror@plt>
 8048502:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048509:	e8 fa fe ff ff       	call   8048408 <exit@plt>
 804850e:	c7 44 24 04 46 85 04 	movl   $0x8048546,0x4(%esp)
 8048515:	08 
 8048516:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 804851d:	e8 76 fe ff ff       	call   8048398 <signal@plt>
 8048522:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048525:	75 18                	jne    804853f <main+0x6b>
 8048527:	c7 04 24 78 86 04 08 	movl   $0x8048678,(%esp)
 804852e:	e8 95 fe ff ff       	call   80483c8 <perror@plt>
 8048533:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804853a:	e8 c9 fe ff ff       	call   8048408 <exit@plt>
 804853f:	e8 a4 fe ff ff       	call   80483e8 <pause@plt>
 8048544:	eb f9                	jmp    804853f <main+0x6b>

08048546 <sig_usr>:
 8048546:	55                   	push   %ebp
 8048547:	89 e5                	mov    %esp,%ebp
 8048549:	83 ec 18             	sub    $0x18,%esp
 804854c:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
 8048550:	75 0e                	jne    8048560 <sig_usr+0x1a>
 8048552:	c7 04 24 8c 86 04 08 	movl   $0x804868c,(%esp)
 8048559:	e8 9a fe ff ff       	call   80483f8 <puts@plt>
 804855e:	eb 31                	jmp    8048591 <sig_usr+0x4b>
 8048560:	83 7d 08 0c          	cmpl   $0xc,0x8(%ebp)
 8048564:	75 0e                	jne    8048574 <sig_usr+0x2e>
 8048566:	c7 04 24 9c 86 04 08 	movl   $0x804869c,(%esp)
 804856d:	e8 86 fe ff ff       	call   80483f8 <puts@plt>
 8048572:	eb 1d                	jmp    8048591 <sig_usr+0x4b>
 8048574:	ba ac 86 04 08       	mov    $0x80486ac,%edx
 8048579:	a1 70 98 04 08       	mov    0x8049870,%eax
 804857e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048581:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048585:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048589:	89 04 24             	mov    %eax,(%esp)
 804858c:	e8 47 fe ff ff       	call   80483d8 <fprintf@plt>
 8048591:	c9                   	leave  
 8048592:	c3                   	ret    
 8048593:	90                   	nop
 8048594:	90                   	nop
 8048595:	90                   	nop
 8048596:	90                   	nop
 8048597:	90                   	nop
 8048598:	90                   	nop
 8048599:	90                   	nop
 804859a:	90                   	nop
 804859b:	90                   	nop
 804859c:	90                   	nop
 804859d:	90                   	nop
 804859e:	90                   	nop
 804859f:	90                   	nop

080485a0 <__libc_csu_fini>:
 80485a0:	55                   	push   %ebp
 80485a1:	89 e5                	mov    %esp,%ebp
 80485a3:	5d                   	pop    %ebp
 80485a4:	c3                   	ret    
 80485a5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%eax,%eax,1)
 80485ac:	00 00 00 00 

080485b0 <__libc_csu_init>:
 80485b0:	55                   	push   %ebp
 80485b1:	89 e5                	mov    %esp,%ebp
 80485b3:	57                   	push   %edi
 80485b4:	56                   	push   %esi
 80485b5:	53                   	push   %ebx
 80485b6:	e8 4f 00 00 00       	call   804860a <__i686.get_pc_thunk.bx>
 80485bb:	81 c3 85 12 00 00    	add    $0x1285,%ebx
 80485c1:	83 ec 1c             	sub    $0x1c,%esp
 80485c4:	e8 8f fd ff ff       	call   8048358 <_init>
 80485c9:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 80485cf:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 80485d5:	29 c7                	sub    %eax,%edi
 80485d7:	c1 ff 02             	sar    $0x2,%edi
 80485da:	85 ff                	test   %edi,%edi
 80485dc:	74 24                	je     8048602 <__libc_csu_init+0x52>
 80485de:	31 f6                	xor    %esi,%esi
 80485e0:	8b 45 10             	mov    0x10(%ebp),%eax
 80485e3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80485ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485ee:	8b 45 08             	mov    0x8(%ebp),%eax
 80485f1:	89 04 24             	mov    %eax,(%esp)
 80485f4:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 80485fb:	83 c6 01             	add    $0x1,%esi
 80485fe:	39 fe                	cmp    %edi,%esi
 8048600:	72 de                	jb     80485e0 <__libc_csu_init+0x30>
 8048602:	83 c4 1c             	add    $0x1c,%esp
 8048605:	5b                   	pop    %ebx
 8048606:	5e                   	pop    %esi
 8048607:	5f                   	pop    %edi
 8048608:	5d                   	pop    %ebp
 8048609:	c3                   	ret    

0804860a <__i686.get_pc_thunk.bx>:
 804860a:	8b 1c 24             	mov    (%esp),%ebx
 804860d:	c3                   	ret    
 804860e:	90                   	nop
 804860f:	90                   	nop

08048610 <__do_global_ctors_aux>:
 8048610:	55                   	push   %ebp
 8048611:	89 e5                	mov    %esp,%ebp
 8048613:	53                   	push   %ebx
 8048614:	8d 64 24 fc          	lea    -0x4(%esp),%esp
 8048618:	a1 60 97 04 08       	mov    0x8049760,%eax
 804861d:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048620:	74 12                	je     8048634 <__do_global_ctors_aux+0x24>
 8048622:	bb 60 97 04 08       	mov    $0x8049760,%ebx
 8048627:	90                   	nop
 8048628:	8d 5b fc             	lea    -0x4(%ebx),%ebx
 804862b:	ff d0                	call   *%eax
 804862d:	8b 03                	mov    (%ebx),%eax
 804862f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048632:	75 f4                	jne    8048628 <__do_global_ctors_aux+0x18>
 8048634:	8d 64 24 04          	lea    0x4(%esp),%esp
 8048638:	5b                   	pop    %ebx
 8048639:	5d                   	pop    %ebp
 804863a:	c3                   	ret    
 804863b:	90                   	nop

Disassembly of section .fini:

0804863c <_fini>:
 804863c:	55                   	push   %ebp
 804863d:	89 e5                	mov    %esp,%ebp
 804863f:	53                   	push   %ebx
 8048640:	83 ec 04             	sub    $0x4,%esp
 8048643:	e8 00 00 00 00       	call   8048648 <_fini+0xc>
 8048648:	5b                   	pop    %ebx
 8048649:	81 c3 f8 11 00 00    	add    $0x11f8,%ebx
 804864f:	e8 fc fd ff ff       	call   8048450 <__do_global_dtors_aux>
 8048654:	59                   	pop    %ecx
 8048655:	5b                   	pop    %ebx
 8048656:	c9                   	leave  
 8048657:	c3                   	ret    

Disassembly of section .rodata:

08048658 <_fp_hw>:
 8048658:	03 00                	add    (%eax),%eax
	...

0804865c <_IO_stdin_used>:
 804865c:	01 00                	add    %eax,(%eax)
 804865e:	02 00                	add    (%eax),%al

08048660 <__dso_handle>:
 8048660:	00 00                	add    %al,(%eax)
 8048662:	00 00                	add    %al,(%eax)
 8048664:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 8048667:	27                   	daa    
 8048668:	74 20                	je     804868a <__dso_handle+0x2a>
 804866a:	63 61 74             	arpl   %sp,0x74(%ecx)
 804866d:	63 68 20             	arpl   %bp,0x20(%eax)
 8048670:	53                   	push   %ebx
 8048671:	49                   	dec    %ecx
 8048672:	47                   	inc    %edi
 8048673:	55                   	push   %ebp
 8048674:	53                   	push   %ebx
 8048675:	52                   	push   %edx
 8048676:	31 00                	xor    %eax,(%eax)
 8048678:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 804867b:	27                   	daa    
 804867c:	74 20                	je     804869e <__dso_handle+0x3e>
 804867e:	63 61 74             	arpl   %sp,0x74(%ecx)
 8048681:	63 68 20             	arpl   %bp,0x20(%eax)
 8048684:	53                   	push   %ebx
 8048685:	49                   	dec    %ecx
 8048686:	47                   	inc    %edi
 8048687:	55                   	push   %ebp
 8048688:	53                   	push   %ebx
 8048689:	52                   	push   %edx
 804868a:	32 00                	xor    (%eax),%al
 804868c:	72 65                	jb     80486f3 <__dso_handle+0x93>
 804868e:	63 69 76             	arpl   %bp,0x76(%ecx)
 8048691:	65 64 20 53 49       	gs and %dl,%fs:%gs:0x49(%ebx)
 8048696:	47                   	inc    %edi
 8048697:	55                   	push   %ebp
 8048698:	53                   	push   %ebx
 8048699:	52                   	push   %edx
 804869a:	31 00                	xor    %eax,(%eax)
 804869c:	72 65                	jb     8048703 <__dso_handle+0xa3>
 804869e:	63 69 76             	arpl   %bp,0x76(%ecx)
 80486a1:	65 64 20 53 49       	gs and %dl,%fs:%gs:0x49(%ebx)
 80486a6:	47                   	inc    %edi
 80486a7:	55                   	push   %ebp
 80486a8:	53                   	push   %ebx
 80486a9:	52                   	push   %edx
 80486aa:	32 00                	xor    (%eax),%al
 80486ac:	72 65                	jb     8048713 <__dso_handle+0xb3>
 80486ae:	63 65 69             	arpl   %sp,0x69(%ebp)
 80486b1:	76 65                	jbe    8048718 <__dso_handle+0xb8>
 80486b3:	64 20 73 69          	and    %dh,%fs:0x69(%ebx)
 80486b7:	67 6e                	outsb  %ds:(%si),(%dx)
 80486b9:	61                   	popa   
 80486ba:	6c                   	insb   (%dx),%es:(%edi)
 80486bb:	3a                   	.byte 0x3a
 80486bc:	25                   	.byte 0x25
 80486bd:	64 0a 00             	or     %fs:(%eax),%al

Disassembly of section .eh_frame_hdr:

080486c0 <.eh_frame_hdr>:
 80486c0:	01 1b                	add    %ebx,(%ebx)
 80486c2:	03 3b                	add    (%ebx),%edi
 80486c4:	20 00                	and    %al,(%eax)
 80486c6:	00 00                	add    %al,(%eax)
 80486c8:	03 00                	add    (%eax),%eax
 80486ca:	00 00                	add    %al,(%eax)
 80486cc:	e0 fe                	loopne 80486cc <__dso_handle+0x6c>
 80486ce:	ff                   	(bad)  
 80486cf:	ff                   	(bad)  
 80486d0:	3c 00                	cmp    $0x0,%al
 80486d2:	00 00                	add    %al,(%eax)
 80486d4:	f0 fe                	lock (bad) 
 80486d6:	ff                   	(bad)  
 80486d7:	ff 5c 00 00          	lcall  *0x0(%eax,%eax,1)
 80486db:	00 4a ff             	add    %cl,-0x1(%edx)
 80486de:	ff                   	(bad)  
 80486df:	ff                   	.byte 0xff
 80486e0:	88 00                	mov    %al,(%eax)
	...

Disassembly of section .eh_frame:

080486e4 <__FRAME_END__-0x78>:
 80486e4:	14 00                	adc    $0x0,%al
 80486e6:	00 00                	add    %al,(%eax)
 80486e8:	00 00                	add    %al,(%eax)
 80486ea:	00 00                	add    %al,(%eax)
 80486ec:	01 7a 52             	add    %edi,0x52(%edx)
 80486ef:	00 01                	add    %al,(%ecx)
 80486f1:	7c 08                	jl     80486fb <__dso_handle+0x9b>
 80486f3:	01 1b                	add    %ebx,(%ebx)
 80486f5:	0c 04                	or     $0x4,%al
 80486f7:	04 88                	add    $0x88,%al
 80486f9:	01 00                	add    %eax,(%eax)
 80486fb:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80486fe:	00 00                	add    %al,(%eax)
 8048700:	1c 00                	sbb    $0x0,%al
 8048702:	00 00                	add    %al,(%eax)
 8048704:	9c                   	pushf  
 8048705:	fe                   	(bad)  
 8048706:	ff                   	(bad)  
 8048707:	ff 05 00 00 00 00    	incl   0x0
 804870d:	41                   	inc    %ecx
 804870e:	0e                   	push   %cs
 804870f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048715:	41                   	inc    %ecx
 8048716:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8048719:	04 00                	add    $0x0,%al
 804871b:	00 28                	add    %ch,(%eax)
 804871d:	00 00                	add    %al,(%eax)
 804871f:	00 3c 00             	add    %bh,(%eax,%eax,1)
 8048722:	00 00                	add    %al,(%eax)
 8048724:	8c fe                	mov    %?,%esi
 8048726:	ff                   	(bad)  
 8048727:	ff 5a 00             	lcall  *0x0(%edx)
 804872a:	00 00                	add    %al,(%eax)
 804872c:	00 41 0e             	add    %al,0xe(%ecx)
 804872f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048735:	43                   	inc    %ebx
 8048736:	83 05 86 04 87 03 02 	addl   $0x2,0x3870486
 804873d:	50                   	push   %eax
 804873e:	c3                   	ret    
 804873f:	41                   	inc    %ecx
 8048740:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
 8048744:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8048747:	04 10                	add    $0x10,%al
 8048749:	00 00                	add    %al,(%eax)
 804874b:	00 68 00             	add    %ch,0x0(%eax)
 804874e:	00 00                	add    %al,(%eax)
 8048750:	ba fe ff ff 04       	mov    $0x4fffffe,%edx
 8048755:	00 00                	add    %al,(%eax)
 8048757:	00 00                	add    %al,(%eax)
 8048759:	00 00                	add    %al,(%eax)
	...

0804875c <__FRAME_END__>:
 804875c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .ctors:

08049760 <__CTOR_LIST__>:
 8049760:	ff                   	(bad)  
 8049761:	ff                   	(bad)  
 8049762:	ff                   	(bad)  
 8049763:	ff 00                	incl   (%eax)

08049764 <__CTOR_END__>:
 8049764:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dtors:

08049768 <__DTOR_LIST__>:
 8049768:	ff                   	(bad)  
 8049769:	ff                   	(bad)  
 804976a:	ff                   	(bad)  
 804976b:	ff 00                	incl   (%eax)

0804976c <__DTOR_END__>:
 804976c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .jcr:

08049770 <__JCR_END__>:
 8049770:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

08049774 <_DYNAMIC>:
 8049774:	01 00                	add    %eax,(%eax)
 8049776:	00 00                	add    %al,(%eax)
 8049778:	10 00                	adc    %al,(%eax)
 804977a:	00 00                	add    %al,(%eax)
 804977c:	0c 00                	or     $0x0,%al
 804977e:	00 00                	add    %al,(%eax)
 8049780:	58                   	pop    %eax
 8049781:	83 04 08 0d          	addl   $0xd,(%eax,%ecx,1)
 8049785:	00 00                	add    %al,(%eax)
 8049787:	00 3c 86             	add    %bh,(%esi,%eax,4)
 804978a:	04 08                	add    $0x8,%al
 804978c:	f5                   	cmc    
 804978d:	fe                   	(bad)  
 804978e:	ff 6f 8c             	ljmp   *-0x74(%edi)
 8049791:	81 04 08 05 00 00 00 	addl   $0x5,(%eax,%ecx,1)
 8049798:	60                   	pusha  
 8049799:	82                   	(bad)  
 804979a:	04 08                	add    $0x8,%al
 804979c:	06                   	push   %es
 804979d:	00 00                	add    %al,(%eax)
 804979f:	00 b0 81 04 08 0a    	add    %dh,0xa080481(%eax)
 80497a5:	00 00                	add    %al,(%eax)
 80497a7:	00 72 00             	add    %dh,0x0(%edx)
 80497aa:	00 00                	add    %al,(%eax)
 80497ac:	0b 00                	or     (%eax),%eax
 80497ae:	00 00                	add    %al,(%eax)
 80497b0:	10 00                	adc    %al,(%eax)
 80497b2:	00 00                	add    %al,(%eax)
 80497b4:	15 00 00 00 00       	adc    $0x0,%eax
 80497b9:	00 00                	add    %al,(%eax)
 80497bb:	00 03                	add    %al,(%ebx)
 80497bd:	00 00                	add    %al,(%eax)
 80497bf:	00 40 98             	add    %al,-0x68(%eax)
 80497c2:	04 08                	add    $0x8,%al
 80497c4:	02 00                	add    (%eax),%al
 80497c6:	00 00                	add    %al,(%eax)
 80497c8:	40                   	inc    %eax
 80497c9:	00 00                	add    %al,(%eax)
 80497cb:	00 14 00             	add    %dl,(%eax,%eax,1)
 80497ce:	00 00                	add    %al,(%eax)
 80497d0:	11 00                	adc    %eax,(%eax)
 80497d2:	00 00                	add    %al,(%eax)
 80497d4:	17                   	pop    %ss
 80497d5:	00 00                	add    %al,(%eax)
 80497d7:	00 18                	add    %bl,(%eax)
 80497d9:	83 04 08 11          	addl   $0x11,(%eax,%ecx,1)
 80497dd:	00 00                	add    %al,(%eax)
 80497df:	00 08                	add    %cl,(%eax)
 80497e1:	83 04 08 12          	addl   $0x12,(%eax,%ecx,1)
 80497e5:	00 00                	add    %al,(%eax)
 80497e7:	00 10                	add    %dl,(%eax)
 80497e9:	00 00                	add    %al,(%eax)
 80497eb:	00 13                	add    %dl,(%ebx)
 80497ed:	00 00                	add    %al,(%eax)
 80497ef:	00 08                	add    %cl,(%eax)
 80497f1:	00 00                	add    %al,(%eax)
 80497f3:	00 fe                	add    %bh,%dh
 80497f5:	ff                   	(bad)  
 80497f6:	ff 6f e8             	ljmp   *-0x18(%edi)
 80497f9:	82                   	(bad)  
 80497fa:	04 08                	add    $0x8,%al
 80497fc:	ff                   	(bad)  
 80497fd:	ff                   	(bad)  
 80497fe:	ff 6f 01             	ljmp   *0x1(%edi)
 8049801:	00 00                	add    %al,(%eax)
 8049803:	00 f0                	add    %dh,%al
 8049805:	ff                   	(bad)  
 8049806:	ff 6f d2             	ljmp   *-0x2e(%edi)
 8049809:	82                   	(bad)  
 804980a:	04 08                	add    $0x8,%al
	...

Disassembly of section .got:

0804983c <.got>:
 804983c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .got.plt:

08049840 <_GLOBAL_OFFSET_TABLE_>:
 8049840:	74 97                	je     80497d9 <_DYNAMIC+0x65>
 8049842:	04 08                	add    $0x8,%al
	...
 804984c:	9e                   	sahf   
 804984d:	83 04 08 ae          	addl   $0xffffffae,(%eax,%ecx,1)
 8049851:	83 04 08 be          	addl   $0xffffffbe,(%eax,%ecx,1)
 8049855:	83 04 08 ce          	addl   $0xffffffce,(%eax,%ecx,1)
 8049859:	83 04 08 de          	addl   $0xffffffde,(%eax,%ecx,1)
 804985d:	83 04 08 ee          	addl   $0xffffffee,(%eax,%ecx,1)
 8049861:	83 04 08 fe          	addl   $0xfffffffe,(%eax,%ecx,1)
 8049865:	83 04 08 0e          	addl   $0xe,(%eax,%ecx,1)
 8049869:	84 04 08             	test   %al,(%eax,%ecx,1)

Disassembly of section .data:

0804986c <__data_start>:
 804986c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .bss:

08049870 <stderr@@GLIBC_2.0>:
 8049870:	00 00                	add    %al,(%eax)
	...

08049874 <completed.5974>:
 8049874:	00 00                	add    %al,(%eax)
	...

08049878 <dtor_idx.5976>:
 8049878:	00 00                	add    %al,(%eax)
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
  21:	74 20                	je     43 <_init-0x8048315>
  23:	34 2e                	xor    $0x2e,%al
  25:	34 2e                	xor    $0x2e,%al
  27:	37                   	aaa    
  28:	2d 31 36 29 00       	sub    $0x293631,%eax
