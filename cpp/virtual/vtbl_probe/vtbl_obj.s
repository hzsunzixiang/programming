
vtbl:     file format elf32-i386


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
 8048163:	00 20                	add    %ah,(%eax)
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
 8048177:	00 56 7b             	add    %dl,0x7b(%esi)
 804817a:	77 b3                	ja     804812f <_init-0x511>
 804817c:	4f                   	dec    %edi
 804817d:	4c                   	dec    %esp
 804817e:	90                   	nop
 804817f:	5f                   	pop    %edi
 8048180:	f6                   	(bad)  
 8048181:	4f                   	dec    %edi
 8048182:	c4 1c dc             	les    (%esp,%ebx,8),%ebx
 8048185:	47                   	inc    %edi
 8048186:	eb 48                	jmp    80481d0 <_init-0x470>
 8048188:	c6                   	(bad)  
 8048189:	71 7a                	jno    8048205 <_init-0x43b>
 804818b:	13                   	.byte 0x13

Disassembly of section .gnu.hash:

0804818c <.gnu.hash>:
 804818c:	03 00                	add    (%eax),%eax
 804818e:	00 00                	add    %al,(%eax)
 8048190:	0c 00                	or     $0x0,%al
 8048192:	00 00                	add    %al,(%eax)
 8048194:	02 00                	add    (%eax),%al
 8048196:	00 00                	add    %al,(%eax)
 8048198:	06                   	push   %es
 8048199:	00 00                	add    %al,(%eax)
 804819b:	00 81 41 10 20 21    	add    %al,0x21201041(%ecx)
 80481a1:	61                   	popa   
 80481a2:	10 01                	adc    %al,(%ecx)
 80481a4:	0c 00                	or     $0x0,%al
 80481a6:	00 00                	add    %al,(%eax)
 80481a8:	0e                   	push   %cs
 80481a9:	00 00                	add    %al,(%eax)
 80481ab:	00 10                	add    %dl,(%eax)
 80481ad:	00 00                	add    %al,(%eax)
 80481af:	00 c8                	add    %cl,%al
 80481b1:	81 0a d2 9d 63 bd    	orl    $0xbd639dd2,(%edx)
 80481b7:	c5 ac 4b e3 c0 21 fd 	lds    -0x2de3f1d(%ebx,%ecx,2),%ebp
 80481be:	f4                   	hlt    
 80481bf:	09 28                	or     %ebp,(%eax)
 80481c1:	45                   	inc    %ebp
 80481c2:	d5 4c                	aad    $0x4c
 80481c4:	14 98                	adc    $0x98,%al
 80481c6:	0c 43                	or     $0x43,%al
 80481c8:	79 49                	jns    8048213 <_init-0x42d>
 80481ca:	6b                   	.byte 0x6b
 80481cb:	b6                   	.byte 0xb6

Disassembly of section .dynsym:

080481cc <.dynsym>:
	...
 80481dc:	d2 01                	rolb   %cl,(%ecx)
	...
 80481e6:	00 00                	add    %al,(%eax)
 80481e8:	12 00                	adc    (%eax),%al
 80481ea:	00 00                	add    %al,(%eax)
 80481ec:	10 00                	adc    %al,(%eax)
	...
 80481f6:	00 00                	add    %al,(%eax)
 80481f8:	20 00                	and    %al,(%eax)
 80481fa:	00 00                	add    %al,(%eax)
 80481fc:	1f                   	pop    %ds
	...
 8048205:	00 00                	add    %al,(%eax)
 8048207:	00 20                	add    %ah,(%eax)
 8048209:	00 00                	add    %al,(%eax)
 804820b:	00 27                	add    %ah,(%edi)
 804820d:	01 00                	add    %eax,(%eax)
	...
 8048217:	00 12                	add    %dl,(%edx)
 8048219:	00 00                	add    %al,(%eax)
 804821b:	00 0f                	add    %cl,(%edi)
 804821d:	01 00                	add    %eax,(%eax)
	...
 8048227:	00 12                	add    %dl,(%edx)
 8048229:	00 00                	add    %al,(%eax)
 804822b:	00 df                	add    %bl,%bh
 804822d:	01 00                	add    %eax,(%eax)
	...
 8048237:	00 12                	add    %dl,(%edx)
 8048239:	00 00                	add    %al,(%eax)
 804823b:	00 33                	add    %dh,(%ebx)
	...
 8048245:	00 00                	add    %al,(%eax)
 8048247:	00 20                	add    %ah,(%eax)
 8048249:	00 00                	add    %al,(%eax)
 804824b:	00 d7                	add    %dl,%bh
	...
 8048255:	00 00                	add    %al,(%eax)
 8048257:	00 12                	add    %dl,(%edx)
 8048259:	00 00                	add    %al,(%eax)
 804825b:	00 4f 00             	add    %cl,0x0(%edi)
	...
 8048266:	00 00                	add    %al,(%eax)
 8048268:	20 00                	and    %al,(%eax)
 804826a:	00 00                	add    %al,(%eax)
 804826c:	46                   	inc    %esi
 804826d:	01 00                	add    %eax,(%eax)
	...
 8048277:	00 12                	add    %dl,(%edx)
 8048279:	00 00                	add    %al,(%eax)
 804827b:	00 aa 01 00 00 00    	add    %ch,0x1(%edx)
 8048281:	00 00                	add    %al,(%eax)
 8048283:	00 00                	add    %al,(%eax)
 8048285:	00 00                	add    %al,(%eax)
 8048287:	00 12                	add    %dl,(%edx)
 8048289:	00 00                	add    %al,(%eax)
 804828b:	00 6c 01 00          	add    %ch,0x0(%ecx,%eax,1)
 804828f:	00 00                	add    %al,(%eax)
 8048291:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 8048292:	04 08                	add    $0x8,%al
 8048294:	2c 00                	sub    $0x0,%al
 8048296:	00 00                	add    %al,(%eax)
 8048298:	21 00                	and    %eax,(%eax)
 804829a:	1a 00                	sbb    (%eax),%al
 804829c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 804829d:	00 00                	add    %al,(%eax)
 804829f:	00 e0                	add    %ah,%al
 80482a1:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 80482a2:	04 08                	add    $0x8,%al
 80482a4:	2c 00                	sub    $0x0,%al
 80482a6:	00 00                	add    %al,(%eax)
 80482a8:	21 00                	and    %eax,(%eax)
 80482aa:	1a 00                	sbb    (%eax),%al
 80482ac:	c3                   	ret    
 80482ad:	01 00                	add    %eax,(%eax)
 80482af:	00 3c 8f             	add    %bh,(%edi,%ecx,4)
 80482b2:	04 08                	add    $0x8,%al
 80482b4:	04 00                	add    $0x0,%al
 80482b6:	00 00                	add    %al,(%eax)
 80482b8:	11 00                	adc    %eax,(%eax)
 80482ba:	0f 00 69 00          	verw   0x0(%ecx)
 80482be:	00 00                	add    %al,(%eax)
 80482c0:	00 87 04 08 00 00    	add    %al,0x804(%edi)
 80482c6:	00 00                	add    %al,(%eax)
 80482c8:	12 00                	adc    (%eax),%al
 80482ca:	00 00                	add    %al,(%eax)
 80482cc:	2e 01 00             	add    %eax,%cs:(%eax)
 80482cf:	00 d0                	add    %dl,%al
 80482d1:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 80482d4:	00 00                	add    %al,(%eax)
 80482d6:	00 00                	add    %al,(%eax)
 80482d8:	12 00                	adc    (%eax),%al
 80482da:	00 00                	add    %al,(%eax)
 80482dc:	cd 00                	int    $0x0
 80482de:	00 00                	add    %al,(%eax)
 80482e0:	40                   	inc    %eax
 80482e1:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 80482e2:	04 08                	add    $0x8,%al
 80482e4:	8c 00                	mov    %es,(%eax)
 80482e6:	00 00                	add    %al,(%eax)
 80482e8:	11 00                	adc    %eax,(%eax)
 80482ea:	1a 00                	sbb    (%eax),%al
 80482ec:	57                   	push   %edi
 80482ed:	01 00                	add    %eax,(%eax)
 80482ef:	00 10                	add    %dl,(%eax)
 80482f1:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 80482f4:	00 00                	add    %al,(%eax)
 80482f6:	00 00                	add    %al,(%eax)
 80482f8:	12 00                	adc    (%eax),%al
	...

Disassembly of section .dynstr:

080482fc <.dynstr>:
 80482fc:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 8048300:	73 74                	jae    8048376 <_init-0x2ca>
 8048302:	64 63 2b             	arpl   %bp,%fs:(%ebx)
 8048305:	2b 2e                	sub    (%esi),%ebp
 8048307:	73 6f                	jae    8048378 <_init-0x2c8>
 8048309:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%edi)
 804830e:	67 6d                	insl   (%dx),%es:(%di)
 8048310:	6f                   	outsl  %ds:(%esi),(%dx)
 8048311:	6e                   	outsb  %ds:(%esi),(%dx)
 8048312:	5f                   	pop    %edi
 8048313:	73 74                	jae    8048389 <_init-0x2b7>
 8048315:	61                   	popa   
 8048316:	72 74                	jb     804838c <_init-0x2b4>
 8048318:	5f                   	pop    %edi
 8048319:	5f                   	pop    %edi
 804831a:	00 5f 4a             	add    %bl,0x4a(%edi)
 804831d:	76 5f                	jbe    804837e <_init-0x2c2>
 804831f:	52                   	push   %edx
 8048320:	65 67 69 73 74 65 72 	imul   $0x6c437265,%gs:0x74(%bp,%di),%esi
 8048327:	43 6c 
 8048329:	61                   	popa   
 804832a:	73 73                	jae    804839f <_init-0x2a1>
 804832c:	65 73 00             	gs jae 804832f <_init-0x311>
 804832f:	5f                   	pop    %edi
 8048330:	49                   	dec    %ecx
 8048331:	54                   	push   %esp
 8048332:	4d                   	dec    %ebp
 8048333:	5f                   	pop    %edi
 8048334:	64 65 72 65          	fs gs jb 804839d <_init-0x2a3>
 8048338:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%bp,%di),%esi
 804833f:	4d 
 8048340:	43                   	inc    %ebx
 8048341:	6c                   	insb   (%dx),%es:(%edi)
 8048342:	6f                   	outsl  %ds:(%esi),(%dx)
 8048343:	6e                   	outsb  %ds:(%esi),(%dx)
 8048344:	65 54                	gs push %esp
 8048346:	61                   	popa   
 8048347:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 804834b:	5f                   	pop    %edi
 804834c:	49                   	dec    %ecx
 804834d:	54                   	push   %esp
 804834e:	4d                   	dec    %ebp
 804834f:	5f                   	pop    %edi
 8048350:	72 65                	jb     80483b7 <_init-0x289>
 8048352:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%bp,%di),%esi
 8048359:	4d 
 804835a:	43                   	inc    %ebx
 804835b:	6c                   	insb   (%dx),%es:(%edi)
 804835c:	6f                   	outsl  %ds:(%esi),(%dx)
 804835d:	6e                   	outsb  %ds:(%esi),(%dx)
 804835e:	65 54                	gs push %esp
 8048360:	61                   	popa   
 8048361:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 8048365:	5f                   	pop    %edi
 8048366:	5a                   	pop    %edx
 8048367:	53                   	push   %ebx
 8048368:	74 34                	je     804839e <_init-0x2a2>
 804836a:	65 6e                	outsb  %gs:(%esi),(%dx)
 804836c:	64 6c                	fs insb (%dx),%es:(%edi)
 804836e:	49                   	dec    %ecx
 804836f:	63 53 74             	arpl   %dx,0x74(%ebx)
 8048372:	31 31                	xor    %esi,(%ecx)
 8048374:	63 68 61             	arpl   %bp,0x61(%eax)
 8048377:	72 5f                	jb     80483d8 <_init-0x268>
 8048379:	74 72                	je     80483ed <_init-0x253>
 804837b:	61                   	popa   
 804837c:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%ebx,%esi,2),%esi
 8048383:	52 
 8048384:	53                   	push   %ebx
 8048385:	74 31                	je     80483b8 <_init-0x288>
 8048387:	33 62 61             	xor    0x61(%edx),%esp
 804838a:	73 69                	jae    80483f5 <_init-0x24b>
 804838c:	63 5f 6f             	arpl   %bx,0x6f(%edi)
 804838f:	73 74                	jae    8048405 <_init-0x23b>
 8048391:	72 65                	jb     80483f8 <_init-0x248>
 8048393:	61                   	popa   
 8048394:	6d                   	insl   (%dx),%es:(%edi)
 8048395:	49                   	dec    %ecx
 8048396:	54                   	push   %esp
 8048397:	5f                   	pop    %edi
 8048398:	54                   	push   %esp
 8048399:	30 5f 45             	xor    %bl,0x45(%edi)
 804839c:	53                   	push   %ebx
 804839d:	36 5f                	ss pop %edi
 804839f:	00 5f 5a             	add    %bl,0x5a(%edi)
 80483a2:	54                   	push   %esp
 80483a3:	56                   	push   %esi
 80483a4:	4e                   	dec    %esi
 80483a5:	31 30                	xor    %esi,(%eax)
 80483a7:	5f                   	pop    %edi
 80483a8:	5f                   	pop    %edi
 80483a9:	63 78 78             	arpl   %di,0x78(%eax)
 80483ac:	61                   	popa   
 80483ad:	62 69 76             	bound  %ebp,0x76(%ecx)
 80483b0:	31 32                	xor    %esi,(%edx)
 80483b2:	30 5f 5f             	xor    %bl,0x5f(%edi)
 80483b5:	73 69                	jae    8048420 <_init-0x220>
 80483b7:	5f                   	pop    %edi
 80483b8:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 80483bc:	73 5f                	jae    804841d <_init-0x223>
 80483be:	74 79                	je     8048439 <_init-0x207>
 80483c0:	70 65                	jo     8048427 <_init-0x219>
 80483c2:	5f                   	pop    %edi
 80483c3:	69 6e 66 6f 45 00 5f 	imul   $0x5f00456f,0x66(%esi),%ebp
 80483ca:	5a                   	pop    %edx
 80483cb:	53                   	push   %ebx
 80483cc:	74 34                	je     8048402 <_init-0x23e>
 80483ce:	63 6f 75             	arpl   %bp,0x75(%edi)
 80483d1:	74 00                	je     80483d3 <_init-0x26d>
 80483d3:	5f                   	pop    %edi
 80483d4:	5a                   	pop    %edx
 80483d5:	53                   	push   %ebx
 80483d6:	74 6c                	je     8048444 <_init-0x1fc>
 80483d8:	73 49                	jae    8048423 <_init-0x21d>
 80483da:	53                   	push   %ebx
 80483db:	74 31                	je     804840e <_init-0x232>
 80483dd:	31 63 68             	xor    %esp,0x68(%ebx)
 80483e0:	61                   	popa   
 80483e1:	72 5f                	jb     8048442 <_init-0x1fe>
 80483e3:	74 72                	je     8048457 <_init-0x1e9>
 80483e5:	61                   	popa   
 80483e6:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%ebx,%esi,2),%esi
 80483ed:	52 
 80483ee:	53                   	push   %ebx
 80483ef:	74 31                	je     8048422 <_init-0x21e>
 80483f1:	33 62 61             	xor    0x61(%edx),%esp
 80483f4:	73 69                	jae    804845f <_init-0x1e1>
 80483f6:	63 5f 6f             	arpl   %bx,0x6f(%edi)
 80483f9:	73 74                	jae    804846f <_init-0x1d1>
 80483fb:	72 65                	jb     8048462 <_init-0x1de>
 80483fd:	61                   	popa   
 80483fe:	6d                   	insl   (%dx),%es:(%edi)
 80483ff:	49                   	dec    %ecx
 8048400:	63 54 5f 45          	arpl   %dx,0x45(%edi,%ebx,2)
 8048404:	53                   	push   %ebx
 8048405:	35 5f 50 4b 63       	xor    $0x634b505f,%eax
 804840a:	00 5f 5a             	add    %bl,0x5a(%edi)
 804840d:	4e                   	dec    %esi
 804840e:	53                   	push   %ebx
 804840f:	74 38                	je     8048449 <_init-0x1f7>
 8048411:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 8048418:	65 34 49             	gs xor $0x49,%al
 804841b:	6e                   	outsb  %ds:(%esi),(%dx)
 804841c:	69 74 43 31 45 76 00 	imul   $0x5f007645,0x31(%ebx,%eax,2),%esi
 8048423:	5f 
 8048424:	5a                   	pop    %edx
 8048425:	64 6c                	fs insb (%dx),%es:(%edi)
 8048427:	50                   	push   %eax
 8048428:	76 00                	jbe    804842a <_init-0x216>
 804842a:	5f                   	pop    %edi
 804842b:	5a                   	pop    %edx
 804842c:	4e                   	dec    %esi
 804842d:	53                   	push   %ebx
 804842e:	74 38                	je     8048468 <_init-0x1d8>
 8048430:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 8048437:	65 34 49             	gs xor $0x49,%al
 804843a:	6e                   	outsb  %ds:(%esi),(%dx)
 804843b:	69 74 44 31 45 76 00 	imul   $0x5f007645,0x31(%esp,%eax,2),%esi
 8048442:	5f 
 8048443:	5a                   	pop    %edx
 8048444:	4e                   	dec    %esi
 8048445:	53                   	push   %ebx
 8048446:	6f                   	outsl  %ds:(%esi),(%dx)
 8048447:	6c                   	insb   (%dx),%es:(%edi)
 8048448:	73 45                	jae    804848f <_init-0x1b1>
 804844a:	50                   	push   %eax
 804844b:	46                   	inc    %esi
 804844c:	52                   	push   %edx
 804844d:	53                   	push   %ebx
 804844e:	6f                   	outsl  %ds:(%esi),(%dx)
 804844f:	53                   	push   %ebx
 8048450:	5f                   	pop    %edi
 8048451:	45                   	inc    %ebp
 8048452:	00 5f 5f             	add    %bl,0x5f(%edi)
 8048455:	67 78 78             	addr16 js 80484d0 <_init-0x170>
 8048458:	5f                   	pop    %edi
 8048459:	70 65                	jo     80484c0 <_init-0x180>
 804845b:	72 73                	jb     80484d0 <_init-0x170>
 804845d:	6f                   	outsl  %ds:(%esi),(%dx)
 804845e:	6e                   	outsb  %ds:(%esi),(%dx)
 804845f:	61                   	popa   
 8048460:	6c                   	insb   (%dx),%es:(%edi)
 8048461:	69 74 79 5f 76 30 00 	imul   $0x5f003076,0x5f(%ecx,%edi,2),%esi
 8048468:	5f 
 8048469:	5a                   	pop    %edx
 804846a:	54                   	push   %esp
 804846b:	56                   	push   %esi
 804846c:	4e                   	dec    %esi
 804846d:	31 30                	xor    %esi,(%eax)
 804846f:	5f                   	pop    %edi
 8048470:	5f                   	pop    %edi
 8048471:	63 78 78             	arpl   %di,0x78(%eax)
 8048474:	61                   	popa   
 8048475:	62 69 76             	bound  %ebp,0x76(%ecx)
 8048478:	31 31                	xor    %esi,(%ecx)
 804847a:	37                   	aaa    
 804847b:	5f                   	pop    %edi
 804847c:	5f                   	pop    %edi
 804847d:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048481:	73 5f                	jae    80484e2 <_init-0x15e>
 8048483:	74 79                	je     80484fe <_init-0x142>
 8048485:	70 65                	jo     80484ec <_init-0x154>
 8048487:	5f                   	pop    %edi
 8048488:	69 6e 66 6f 45 00 6c 	imul   $0x6c00456f,0x66(%esi),%ebp
 804848f:	69 62 6d 2e 73 6f 2e 	imul   $0x2e6f732e,0x6d(%edx),%esp
 8048496:	36 00 6c 69 62       	add    %ch,%ss:0x62(%ecx,%ebp,2)
 804849b:	67 63 63 5f          	arpl   %sp,0x5f(%bp,%di)
 804849f:	73 2e                	jae    80484cf <_init-0x171>
 80484a1:	73 6f                	jae    8048512 <_init-0x12e>
 80484a3:	2e 31 00             	xor    %eax,%cs:(%eax)
 80484a6:	5f                   	pop    %edi
 80484a7:	55                   	push   %ebp
 80484a8:	6e                   	outsb  %ds:(%esi),(%dx)
 80484a9:	77 69                	ja     8048514 <_init-0x12c>
 80484ab:	6e                   	outsb  %ds:(%esi),(%dx)
 80484ac:	64 5f                	fs pop %edi
 80484ae:	52                   	push   %edx
 80484af:	65 73 75             	gs jae 8048527 <_init-0x119>
 80484b2:	6d                   	insl   (%dx),%es:(%edi)
 80484b3:	65 00 6c 69 62       	add    %ch,%gs:0x62(%ecx,%ebp,2)
 80484b8:	63 2e                	arpl   %bp,(%esi)
 80484ba:	73 6f                	jae    804852b <_init-0x115>
 80484bc:	2e 36 00 5f 49       	cs add %bl,%ss:0x49(%edi)
 80484c1:	4f                   	dec    %edi
 80484c2:	5f                   	pop    %edi
 80484c3:	73 74                	jae    8048539 <_init-0x107>
 80484c5:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
 80484cc:	64 
 80484cd:	00 5f 5f             	add    %bl,0x5f(%edi)
 80484d0:	63 78 61             	arpl   %di,0x61(%eax)
 80484d3:	5f                   	pop    %edi
 80484d4:	61                   	popa   
 80484d5:	74 65                	je     804853c <_init-0x104>
 80484d7:	78 69                	js     8048542 <_init-0xfe>
 80484d9:	74 00                	je     80484db <_init-0x165>
 80484db:	5f                   	pop    %edi
 80484dc:	5f                   	pop    %edi
 80484dd:	6c                   	insb   (%dx),%es:(%edi)
 80484de:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%edx),%esp
 80484e5:	72 74                	jb     804855b <_init-0xe5>
 80484e7:	5f                   	pop    %edi
 80484e8:	6d                   	insl   (%dx),%es:(%edi)
 80484e9:	61                   	popa   
 80484ea:	69 6e 00 47 43 43 5f 	imul   $0x5f434347,0x0(%esi),%ebp
 80484f1:	33 2e                	xor    (%esi),%ebp
 80484f3:	30 00                	xor    %al,(%eax)
 80484f5:	43                   	inc    %ebx
 80484f6:	58                   	pop    %eax
 80484f7:	58                   	pop    %eax
 80484f8:	41                   	inc    %ecx
 80484f9:	42                   	inc    %edx
 80484fa:	49                   	dec    %ecx
 80484fb:	5f                   	pop    %edi
 80484fc:	31 2e                	xor    %ebp,(%esi)
 80484fe:	33 00                	xor    (%eax),%eax
 8048500:	47                   	inc    %edi
 8048501:	4c                   	dec    %esp
 8048502:	49                   	dec    %ecx
 8048503:	42                   	inc    %edx
 8048504:	43                   	inc    %ebx
 8048505:	58                   	pop    %eax
 8048506:	58                   	pop    %eax
 8048507:	5f                   	pop    %edi
 8048508:	33 2e                	xor    (%esi),%ebp
 804850a:	34 00                	xor    $0x0,%al
 804850c:	47                   	inc    %edi
 804850d:	4c                   	dec    %esp
 804850e:	49                   	dec    %ecx
 804850f:	42                   	inc    %edx
 8048510:	43                   	inc    %ebx
 8048511:	5f                   	pop    %edi
 8048512:	32 2e                	xor    (%esi),%ch
 8048514:	30 00                	xor    %al,(%eax)
 8048516:	47                   	inc    %edi
 8048517:	4c                   	dec    %esp
 8048518:	49                   	dec    %ecx
 8048519:	42                   	inc    %edx
 804851a:	43                   	inc    %ebx
 804851b:	5f                   	pop    %edi
 804851c:	32 2e                	xor    (%esi),%ch
 804851e:	31 2e                	xor    %ebp,(%esi)
 8048520:	33 00                	xor    (%eax),%eax

Disassembly of section .gnu.version:

08048522 <.gnu.version>:
 8048522:	00 00                	add    %al,(%eax)
 8048524:	02 00                	add    (%eax),%al
 8048526:	00 00                	add    %al,(%eax)
 8048528:	00 00                	add    %al,(%eax)
 804852a:	03 00                	add    (%eax),%eax
 804852c:	03 00                	add    (%eax),%eax
 804852e:	04 00                	add    $0x0,%al
 8048530:	00 00                	add    %al,(%eax)
 8048532:	03 00                	add    (%eax),%eax
 8048534:	00 00                	add    %al,(%eax)
 8048536:	03 00                	add    (%eax),%eax
 8048538:	06                   	push   %es
 8048539:	00 05 00 05 00 01    	add    %al,0x1000500
 804853f:	00 03                	add    %al,(%ebx)
 8048541:	00 03                	add    %al,(%ebx)
 8048543:	00 03                	add    %al,(%ebx)
 8048545:	00                   	.byte 0x0
 8048546:	05                   	.byte 0x5
	...

Disassembly of section .gnu.version_r:

08048548 <.gnu.version_r>:
 8048548:	01 00                	add    %eax,(%eax)
 804854a:	01 00                	add    %eax,(%eax)
 804854c:	9c                   	pushf  
 804854d:	01 00                	add    %eax,(%eax)
 804854f:	00 10                	add    %dl,(%eax)
 8048551:	00 00                	add    %al,(%eax)
 8048553:	00 20                	add    %ah,(%eax)
 8048555:	00 00                	add    %al,(%eax)
 8048557:	00 50 26             	add    %dl,0x26(%eax)
 804855a:	79 0b                	jns    8048567 <_init-0xd9>
 804855c:	00 00                	add    %al,(%eax)
 804855e:	06                   	push   %es
 804855f:	00 f1                	add    %dh,%cl
 8048561:	01 00                	add    %eax,(%eax)
 8048563:	00 00                	add    %al,(%eax)
 8048565:	00 00                	add    %al,(%eax)
 8048567:	00 01                	add    %al,(%ecx)
 8048569:	00 02                	add    %al,(%edx)
 804856b:	00 01                	add    %al,(%ecx)
 804856d:	00 00                	add    %al,(%eax)
 804856f:	00 10                	add    %dl,(%eax)
 8048571:	00 00                	add    %al,(%eax)
 8048573:	00 30                	add    %dh,(%eax)
 8048575:	00 00                	add    %al,(%eax)
 8048577:	00 d3                	add    %dl,%bl
 8048579:	af                   	scas   %es:(%edi),%eax
 804857a:	6b 05 00 00 05 00 f9 	imul   $0xfffffff9,0x50000,%eax
 8048581:	01 00                	add    %eax,(%eax)
 8048583:	00 10                	add    %dl,(%eax)
 8048585:	00 00                	add    %al,(%eax)
 8048587:	00 74 29 92          	add    %dh,-0x6e(%ecx,%ebp,1)
 804858b:	08 00                	or     %al,(%eax)
 804858d:	00 03                	add    %al,(%ebx)
 804858f:	00 04 02             	add    %al,(%edx,%eax,1)
 8048592:	00 00                	add    %al,(%eax)
 8048594:	00 00                	add    %al,(%eax)
 8048596:	00 00                	add    %al,(%eax)
 8048598:	01 00                	add    %eax,(%eax)
 804859a:	02 00                	add    (%eax),%al
 804859c:	b9 01 00 00 10       	mov    $0x10000001,%ecx
 80485a1:	00 00                	add    %al,(%eax)
 80485a3:	00 00                	add    %al,(%eax)
 80485a5:	00 00                	add    %al,(%eax)
 80485a7:	00 10                	add    %dl,(%eax)
 80485a9:	69 69 0d 00 00 04 00 	imul   $0x40000,0xd(%ecx),%ebp
 80485b0:	10 02                	adc    %al,(%edx)
 80485b2:	00 00                	add    %al,(%eax)
 80485b4:	10 00                	adc    %al,(%eax)
 80485b6:	00 00                	add    %al,(%eax)
 80485b8:	73 1f                	jae    80485d9 <_init-0x67>
 80485ba:	69 09 00 00 02 00    	imul   $0x20000,(%ecx),%ecx
 80485c0:	1a 02                	sbb    (%edx),%al
 80485c2:	00 00                	add    %al,(%eax)
 80485c4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.dyn:

080485c8 <.rel.dyn>:
 80485c8:	b8 a6 04 08 06       	mov    $0x60804a6,%eax
 80485cd:	02 00                	add    (%eax),%al
 80485cf:	00 00                	add    %al,(%eax)
 80485d1:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 80485d2:	04 08                	add    $0x8,%al
 80485d4:	05 0c 00 00 40       	add    $0x4000000c,%eax
 80485d9:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 80485da:	04 08                	add    $0x8,%al
 80485dc:	05 11 00 00 e0       	add    $0xe0000011,%eax
 80485e1:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 80485e2:	04 08                	add    $0x8,%al
 80485e4:	05                   	.byte 0x5
 80485e5:	0d                   	.byte 0xd
	...

Disassembly of section .rel.plt:

080485e8 <.rel.plt>:
 80485e8:	c8 a6 04 08          	enter  $0x4a6,$0x8
 80485ec:	07                   	pop    %es
 80485ed:	01 00                	add    %eax,(%eax)
 80485ef:	00 cc                	add    %cl,%ah
 80485f1:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 80485f2:	04 08                	add    $0x8,%al
 80485f4:	07                   	pop    %es
 80485f5:	02 00                	add    (%eax),%al
 80485f7:	00 d0                	add    %dl,%al
 80485f9:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 80485fa:	04 08                	add    $0x8,%al
 80485fc:	07                   	pop    %es
 80485fd:	04 00                	add    $0x0,%al
 80485ff:	00 d4                	add    %dl,%ah
 8048601:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 8048602:	04 08                	add    $0x8,%al
 8048604:	07                   	pop    %es
 8048605:	05 00 00 d8 a6       	add    $0xa6d80000,%eax
 804860a:	04 08                	add    $0x8,%al
 804860c:	07                   	pop    %es
 804860d:	06                   	push   %es
 804860e:	00 00                	add    %al,(%eax)
 8048610:	dc a6 04 08 07 10    	fsubl  0x10070804(%esi)
 8048616:	00 00                	add    %al,(%eax)
 8048618:	e0 a6                	loopne 80485c0 <_init-0x80>
 804861a:	04 08                	add    $0x8,%al
 804861c:	07                   	pop    %es
 804861d:	08 00                	or     %al,(%eax)
 804861f:	00 e4                	add    %ah,%ah
 8048621:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 8048622:	04 08                	add    $0x8,%al
 8048624:	07                   	pop    %es
 8048625:	0a 00                	or     (%eax),%al
 8048627:	00 e8                	add    %ch,%al
 8048629:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804862a:	04 08                	add    $0x8,%al
 804862c:	07                   	pop    %es
 804862d:	0f 00 00             	sldt   (%eax)
 8048630:	ec                   	in     (%dx),%al
 8048631:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 8048632:	04 08                	add    $0x8,%al
 8048634:	07                   	pop    %es
 8048635:	12 00                	adc    (%eax),%al
 8048637:	00 f0                	add    %dh,%al
 8048639:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804863a:	04 08                	add    $0x8,%al
 804863c:	07                   	pop    %es
 804863d:	0b 00                	or     (%eax),%eax
	...

Disassembly of section .init:

08048640 <_init>:
 8048640:	53                   	push   %ebx
 8048641:	83 ec 08             	sub    $0x8,%esp
 8048644:	e8 17 01 00 00       	call   8048760 <__x86.get_pc_thunk.bx>
 8048649:	81 c3 73 20 00 00    	add    $0x2073,%ebx
 804864f:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048655:	85 c0                	test   %eax,%eax
 8048657:	74 05                	je     804865e <_init+0x1e>
 8048659:	e8 32 00 00 00       	call   8048690 <__gmon_start__@plt>
 804865e:	83 c4 08             	add    $0x8,%esp
 8048661:	5b                   	pop    %ebx
 8048662:	c3                   	ret    

Disassembly of section .plt:

08048670 <__cxa_atexit@plt-0x10>:
 8048670:	ff 35 c0 a6 04 08    	pushl  0x804a6c0
 8048676:	ff 25 c4 a6 04 08    	jmp    *0x804a6c4
 804867c:	00 00                	add    %al,(%eax)
	...

08048680 <__cxa_atexit@plt>:
 8048680:	ff 25 c8 a6 04 08    	jmp    *0x804a6c8
 8048686:	68 00 00 00 00       	push   $0x0
 804868b:	e9 e0 ff ff ff       	jmp    8048670 <_init+0x30>

08048690 <__gmon_start__@plt>:
 8048690:	ff 25 cc a6 04 08    	jmp    *0x804a6cc
 8048696:	68 08 00 00 00       	push   $0x8
 804869b:	e9 d0 ff ff ff       	jmp    8048670 <_init+0x30>

080486a0 <_ZdlPv@plt>:
 80486a0:	ff 25 d0 a6 04 08    	jmp    *0x804a6d0
 80486a6:	68 10 00 00 00       	push   $0x10
 80486ab:	e9 c0 ff ff ff       	jmp    8048670 <_init+0x30>

080486b0 <_ZNSt8ios_base4InitC1Ev@plt>:
 80486b0:	ff 25 d4 a6 04 08    	jmp    *0x804a6d4
 80486b6:	68 18 00 00 00       	push   $0x18
 80486bb:	e9 b0 ff ff ff       	jmp    8048670 <_init+0x30>

080486c0 <__libc_start_main@plt>:
 80486c0:	ff 25 d8 a6 04 08    	jmp    *0x804a6d8
 80486c6:	68 20 00 00 00       	push   $0x20
 80486cb:	e9 a0 ff ff ff       	jmp    8048670 <_init+0x30>

080486d0 <_ZNSt8ios_base4InitD1Ev@plt>:
 80486d0:	ff 25 dc a6 04 08    	jmp    *0x804a6dc
 80486d6:	68 28 00 00 00       	push   $0x28
 80486db:	e9 90 ff ff ff       	jmp    8048670 <_init+0x30>

080486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
 80486e0:	ff 25 e0 a6 04 08    	jmp    *0x804a6e0
 80486e6:	68 30 00 00 00       	push   $0x30
 80486eb:	e9 80 ff ff ff       	jmp    8048670 <_init+0x30>

080486f0 <_ZNSolsEPFRSoS_E@plt>:
 80486f0:	ff 25 e4 a6 04 08    	jmp    *0x804a6e4
 80486f6:	68 38 00 00 00       	push   $0x38
 80486fb:	e9 70 ff ff ff       	jmp    8048670 <_init+0x30>

08048700 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
 8048700:	ff 25 e8 a6 04 08    	jmp    *0x804a6e8
 8048706:	68 40 00 00 00       	push   $0x40
 804870b:	e9 60 ff ff ff       	jmp    8048670 <_init+0x30>

08048710 <__gxx_personality_v0@plt>:
 8048710:	ff 25 ec a6 04 08    	jmp    *0x804a6ec
 8048716:	68 48 00 00 00       	push   $0x48
 804871b:	e9 50 ff ff ff       	jmp    8048670 <_init+0x30>

08048720 <_Unwind_Resume@plt>:
 8048720:	ff 25 f0 a6 04 08    	jmp    *0x804a6f0
 8048726:	68 50 00 00 00       	push   $0x50
 804872b:	e9 40 ff ff ff       	jmp    8048670 <_init+0x30>

Disassembly of section .text:

08048730 <_start>:
 8048730:	31 ed                	xor    %ebp,%ebp
 8048732:	5e                   	pop    %esi
 8048733:	89 e1                	mov    %esp,%ecx
 8048735:	83 e4 f0             	and    $0xfffffff0,%esp
 8048738:	50                   	push   %eax
 8048739:	54                   	push   %esp
 804873a:	52                   	push   %edx
 804873b:	68 20 8f 04 08       	push   $0x8048f20
 8048740:	68 b0 8e 04 08       	push   $0x8048eb0
 8048745:	51                   	push   %ecx
 8048746:	56                   	push   %esi
 8048747:	68 2b 88 04 08       	push   $0x804882b
 804874c:	e8 6f ff ff ff       	call   80486c0 <__libc_start_main@plt>
 8048751:	f4                   	hlt    
 8048752:	66 90                	xchg   %ax,%ax
 8048754:	66 90                	xchg   %ax,%ax
 8048756:	66 90                	xchg   %ax,%ax
 8048758:	66 90                	xchg   %ax,%ax
 804875a:	66 90                	xchg   %ax,%ax
 804875c:	66 90                	xchg   %ax,%ax
 804875e:	66 90                	xchg   %ax,%ax

08048760 <__x86.get_pc_thunk.bx>:
 8048760:	8b 1c 24             	mov    (%esp),%ebx
 8048763:	c3                   	ret    
 8048764:	66 90                	xchg   %ax,%ax
 8048766:	66 90                	xchg   %ax,%ax
 8048768:	66 90                	xchg   %ax,%ax
 804876a:	66 90                	xchg   %ax,%ax
 804876c:	66 90                	xchg   %ax,%ax
 804876e:	66 90                	xchg   %ax,%ax

08048770 <deregister_tm_clones>:
 8048770:	b8 ff a6 04 08       	mov    $0x804a6ff,%eax
 8048775:	2d fc a6 04 08       	sub    $0x804a6fc,%eax
 804877a:	83 f8 06             	cmp    $0x6,%eax
 804877d:	76 1a                	jbe    8048799 <deregister_tm_clones+0x29>
 804877f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048784:	85 c0                	test   %eax,%eax
 8048786:	74 11                	je     8048799 <deregister_tm_clones+0x29>
 8048788:	55                   	push   %ebp
 8048789:	89 e5                	mov    %esp,%ebp
 804878b:	83 ec 14             	sub    $0x14,%esp
 804878e:	68 fc a6 04 08       	push   $0x804a6fc
 8048793:	ff d0                	call   *%eax
 8048795:	83 c4 10             	add    $0x10,%esp
 8048798:	c9                   	leave  
 8048799:	f3 c3                	repz ret 
 804879b:	90                   	nop
 804879c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080487a0 <register_tm_clones>:
 80487a0:	b8 fc a6 04 08       	mov    $0x804a6fc,%eax
 80487a5:	2d fc a6 04 08       	sub    $0x804a6fc,%eax
 80487aa:	c1 f8 02             	sar    $0x2,%eax
 80487ad:	89 c2                	mov    %eax,%edx
 80487af:	c1 ea 1f             	shr    $0x1f,%edx
 80487b2:	01 d0                	add    %edx,%eax
 80487b4:	d1 f8                	sar    %eax
 80487b6:	74 1b                	je     80487d3 <register_tm_clones+0x33>
 80487b8:	ba 00 00 00 00       	mov    $0x0,%edx
 80487bd:	85 d2                	test   %edx,%edx
 80487bf:	74 12                	je     80487d3 <register_tm_clones+0x33>
 80487c1:	55                   	push   %ebp
 80487c2:	89 e5                	mov    %esp,%ebp
 80487c4:	83 ec 10             	sub    $0x10,%esp
 80487c7:	50                   	push   %eax
 80487c8:	68 fc a6 04 08       	push   $0x804a6fc
 80487cd:	ff d2                	call   *%edx
 80487cf:	83 c4 10             	add    $0x10,%esp
 80487d2:	c9                   	leave  
 80487d3:	f3 c3                	repz ret 
 80487d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80487d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080487e0 <__do_global_dtors_aux>:
 80487e0:	80 3d 0c a8 04 08 00 	cmpb   $0x0,0x804a80c
 80487e7:	75 13                	jne    80487fc <__do_global_dtors_aux+0x1c>
 80487e9:	55                   	push   %ebp
 80487ea:	89 e5                	mov    %esp,%ebp
 80487ec:	83 ec 08             	sub    $0x8,%esp
 80487ef:	e8 7c ff ff ff       	call   8048770 <deregister_tm_clones>
 80487f4:	c6 05 0c a8 04 08 01 	movb   $0x1,0x804a80c
 80487fb:	c9                   	leave  
 80487fc:	f3 c3                	repz ret 
 80487fe:	66 90                	xchg   %ax,%ax

08048800 <frame_dummy>:
 8048800:	b8 b4 a5 04 08       	mov    $0x804a5b4,%eax
 8048805:	8b 10                	mov    (%eax),%edx
 8048807:	85 d2                	test   %edx,%edx
 8048809:	75 05                	jne    8048810 <frame_dummy+0x10>
 804880b:	eb 93                	jmp    80487a0 <register_tm_clones>
 804880d:	8d 76 00             	lea    0x0(%esi),%esi
 8048810:	ba 00 00 00 00       	mov    $0x0,%edx
 8048815:	85 d2                	test   %edx,%edx
 8048817:	74 f2                	je     804880b <frame_dummy+0xb>
 8048819:	55                   	push   %ebp
 804881a:	89 e5                	mov    %esp,%ebp
 804881c:	83 ec 14             	sub    $0x14,%esp
 804881f:	50                   	push   %eax
 8048820:	ff d2                	call   *%edx
 8048822:	83 c4 10             	add    $0x10,%esp
 8048825:	c9                   	leave  
 8048826:	e9 75 ff ff ff       	jmp    80487a0 <register_tm_clones>

0804882b <main>:
 804882b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804882f:	83 e4 f0             	and    $0xfffffff0,%esp
 8048832:	ff 71 fc             	pushl  -0x4(%ecx)
 8048835:	55                   	push   %ebp
 8048836:	89 e5                	mov    %esp,%ebp
 8048838:	53                   	push   %ebx
 8048839:	51                   	push   %ecx
 804883a:	83 ec 30             	sub    $0x30,%esp
 804883d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048844:	83 ec 08             	sub    $0x8,%esp
 8048847:	68 cc 90 04 08       	push   $0x80490cc
 804884c:	68 40 a7 04 08       	push   $0x804a740
 8048851:	e8 8a fe ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048856:	83 c4 10             	add    $0x10,%esp
 8048859:	83 ec 08             	sub    $0x8,%esp
 804885c:	68 00 87 04 08       	push   $0x8048700
 8048861:	50                   	push   %eax
 8048862:	e8 89 fe ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048867:	83 c4 10             	add    $0x10,%esp
 804886a:	83 ec 0c             	sub    $0xc,%esp
 804886d:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048870:	50                   	push   %eax
 8048871:	e8 5e 02 00 00       	call   8048ad4 <_ZN10base_classC1Ev>
 8048876:	83 c4 10             	add    $0x10,%esp
 8048879:	83 ec 08             	sub    $0x8,%esp
 804887c:	68 cc 90 04 08       	push   $0x80490cc
 8048881:	68 40 a7 04 08       	push   $0x804a740
 8048886:	e8 55 fe ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 804888b:	83 c4 10             	add    $0x10,%esp
 804888e:	83 ec 08             	sub    $0x8,%esp
 8048891:	68 00 87 04 08       	push   $0x8048700
 8048896:	50                   	push   %eax
 8048897:	e8 54 fe ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 804889c:	83 c4 10             	add    $0x10,%esp
 804889f:	83 ec 0c             	sub    $0xc,%esp
 80488a2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 80488a5:	50                   	push   %eax
 80488a6:	e8 4f 03 00 00       	call   8048bfa <_ZN13drived_class1C1Ev>
 80488ab:	83 c4 10             	add    $0x10,%esp
 80488ae:	83 ec 08             	sub    $0x8,%esp
 80488b1:	68 cc 90 04 08       	push   $0x80490cc
 80488b6:	68 40 a7 04 08       	push   $0x804a740
 80488bb:	e8 20 fe ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 80488c0:	83 c4 10             	add    $0x10,%esp
 80488c3:	83 ec 08             	sub    $0x8,%esp
 80488c6:	68 00 87 04 08       	push   $0x8048700
 80488cb:	50                   	push   %eax
 80488cc:	e8 1f fe ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 80488d1:	83 c4 10             	add    $0x10,%esp
 80488d4:	83 ec 0c             	sub    $0xc,%esp
 80488d7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 80488da:	50                   	push   %eax
 80488db:	e8 6e 04 00 00       	call   8048d4e <_ZN13drived_class2C1Ev>
 80488e0:	83 c4 10             	add    $0x10,%esp
 80488e3:	83 ec 08             	sub    $0x8,%esp
 80488e6:	68 cc 90 04 08       	push   $0x80490cc
 80488eb:	68 40 a7 04 08       	push   $0x804a740
 80488f0:	e8 eb fd ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 80488f5:	83 c4 10             	add    $0x10,%esp
 80488f8:	83 ec 08             	sub    $0x8,%esp
 80488fb:	68 00 87 04 08       	push   $0x8048700
 8048900:	50                   	push   %eax
 8048901:	e8 ea fd ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048906:	83 c4 10             	add    $0x10,%esp
 8048909:	8d 45 ec             	lea    -0x14(%ebp),%eax
 804890c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804890f:	83 ec 0c             	sub    $0xc,%esp
 8048912:	ff 75 f4             	pushl  -0xc(%ebp)
 8048915:	e8 78 02 00 00       	call   8048b92 <_ZN10base_class11normal_funcEv>
 804891a:	83 c4 10             	add    $0x10,%esp
 804891d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048920:	8b 00                	mov    (%eax),%eax
 8048922:	83 c0 08             	add    $0x8,%eax
 8048925:	8b 00                	mov    (%eax),%eax
 8048927:	83 ec 0c             	sub    $0xc,%esp
 804892a:	ff 75 f4             	pushl  -0xc(%ebp)
 804892d:	ff d0                	call   *%eax
 804892f:	83 c4 10             	add    $0x10,%esp
 8048932:	83 ec 08             	sub    $0x8,%esp
 8048935:	68 cc 90 04 08       	push   $0x80490cc
 804893a:	68 40 a7 04 08       	push   $0x804a740
 804893f:	e8 9c fd ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048944:	83 c4 10             	add    $0x10,%esp
 8048947:	83 ec 08             	sub    $0x8,%esp
 804894a:	68 00 87 04 08       	push   $0x8048700
 804894f:	50                   	push   %eax
 8048950:	e8 9b fd ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048955:	83 c4 10             	add    $0x10,%esp
 8048958:	8d 45 e0             	lea    -0x20(%ebp),%eax
 804895b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804895e:	83 ec 0c             	sub    $0xc,%esp
 8048961:	ff 75 f4             	pushl  -0xc(%ebp)
 8048964:	e8 29 02 00 00       	call   8048b92 <_ZN10base_class11normal_funcEv>
 8048969:	83 c4 10             	add    $0x10,%esp
 804896c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804896f:	8b 00                	mov    (%eax),%eax
 8048971:	83 c0 08             	add    $0x8,%eax
 8048974:	8b 00                	mov    (%eax),%eax
 8048976:	83 ec 0c             	sub    $0xc,%esp
 8048979:	ff 75 f4             	pushl  -0xc(%ebp)
 804897c:	ff d0                	call   *%eax
 804897e:	83 c4 10             	add    $0x10,%esp
 8048981:	83 ec 08             	sub    $0x8,%esp
 8048984:	68 cc 90 04 08       	push   $0x80490cc
 8048989:	68 40 a7 04 08       	push   $0x804a740
 804898e:	e8 4d fd ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048993:	83 c4 10             	add    $0x10,%esp
 8048996:	83 ec 08             	sub    $0x8,%esp
 8048999:	68 00 87 04 08       	push   $0x8048700
 804899e:	50                   	push   %eax
 804899f:	e8 4c fd ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 80489a4:	83 c4 10             	add    $0x10,%esp
 80489a7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 80489aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80489ad:	83 ec 0c             	sub    $0xc,%esp
 80489b0:	ff 75 f4             	pushl  -0xc(%ebp)
 80489b3:	e8 da 01 00 00       	call   8048b92 <_ZN10base_class11normal_funcEv>
 80489b8:	83 c4 10             	add    $0x10,%esp
 80489bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80489be:	8b 00                	mov    (%eax),%eax
 80489c0:	83 c0 08             	add    $0x8,%eax
 80489c3:	8b 00                	mov    (%eax),%eax
 80489c5:	83 ec 0c             	sub    $0xc,%esp
 80489c8:	ff 75 f4             	pushl  -0xc(%ebp)
 80489cb:	ff d0                	call   *%eax
 80489cd:	83 c4 10             	add    $0x10,%esp
 80489d0:	83 ec 08             	sub    $0x8,%esp
 80489d3:	68 cc 90 04 08       	push   $0x80490cc
 80489d8:	68 40 a7 04 08       	push   $0x804a740
 80489dd:	e8 fe fc ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 80489e2:	83 c4 10             	add    $0x10,%esp
 80489e5:	83 ec 08             	sub    $0x8,%esp
 80489e8:	68 00 87 04 08       	push   $0x8048700
 80489ed:	50                   	push   %eax
 80489ee:	e8 fd fc ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 80489f3:	83 c4 10             	add    $0x10,%esp
 80489f6:	bb 00 00 00 00       	mov    $0x0,%ebx
 80489fb:	83 ec 0c             	sub    $0xc,%esp
 80489fe:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 8048a01:	50                   	push   %eax
 8048a02:	e8 b9 03 00 00       	call   8048dc0 <_ZN13drived_class2D1Ev>
 8048a07:	83 c4 10             	add    $0x10,%esp
 8048a0a:	83 ec 0c             	sub    $0xc,%esp
 8048a0d:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048a10:	50                   	push   %eax
 8048a11:	e8 56 02 00 00       	call   8048c6c <_ZN13drived_class1D1Ev>
 8048a16:	83 c4 10             	add    $0x10,%esp
 8048a19:	83 ec 0c             	sub    $0xc,%esp
 8048a1c:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048a1f:	50                   	push   %eax
 8048a20:	e8 f1 00 00 00       	call   8048b16 <_ZN10base_classD1Ev>
 8048a25:	83 c4 10             	add    $0x10,%esp
 8048a28:	89 d8                	mov    %ebx,%eax
 8048a2a:	eb 42                	jmp    8048a6e <main+0x243>
 8048a2c:	89 c3                	mov    %eax,%ebx
 8048a2e:	83 ec 0c             	sub    $0xc,%esp
 8048a31:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 8048a34:	50                   	push   %eax
 8048a35:	e8 86 03 00 00       	call   8048dc0 <_ZN13drived_class2D1Ev>
 8048a3a:	83 c4 10             	add    $0x10,%esp
 8048a3d:	eb 02                	jmp    8048a41 <main+0x216>
 8048a3f:	89 c3                	mov    %eax,%ebx
 8048a41:	83 ec 0c             	sub    $0xc,%esp
 8048a44:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048a47:	50                   	push   %eax
 8048a48:	e8 1f 02 00 00       	call   8048c6c <_ZN13drived_class1D1Ev>
 8048a4d:	83 c4 10             	add    $0x10,%esp
 8048a50:	eb 02                	jmp    8048a54 <main+0x229>
 8048a52:	89 c3                	mov    %eax,%ebx
 8048a54:	83 ec 0c             	sub    $0xc,%esp
 8048a57:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048a5a:	50                   	push   %eax
 8048a5b:	e8 b6 00 00 00       	call   8048b16 <_ZN10base_classD1Ev>
 8048a60:	83 c4 10             	add    $0x10,%esp
 8048a63:	89 d8                	mov    %ebx,%eax
 8048a65:	83 ec 0c             	sub    $0xc,%esp
 8048a68:	50                   	push   %eax
 8048a69:	e8 b2 fc ff ff       	call   8048720 <_Unwind_Resume@plt>
 8048a6e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048a71:	59                   	pop    %ecx
 8048a72:	5b                   	pop    %ebx
 8048a73:	5d                   	pop    %ebp
 8048a74:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048a77:	c3                   	ret    

08048a78 <_Z41__static_initialization_and_destruction_0ii>:
 8048a78:	55                   	push   %ebp
 8048a79:	89 e5                	mov    %esp,%ebp
 8048a7b:	83 ec 08             	sub    $0x8,%esp
 8048a7e:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 8048a82:	75 33                	jne    8048ab7 <_Z41__static_initialization_and_destruction_0ii+0x3f>
 8048a84:	81 7d 0c ff ff 00 00 	cmpl   $0xffff,0xc(%ebp)
 8048a8b:	75 2a                	jne    8048ab7 <_Z41__static_initialization_and_destruction_0ii+0x3f>
 8048a8d:	83 ec 0c             	sub    $0xc,%esp
 8048a90:	68 0d a8 04 08       	push   $0x804a80d
 8048a95:	e8 16 fc ff ff       	call   80486b0 <_ZNSt8ios_base4InitC1Ev@plt>
 8048a9a:	83 c4 10             	add    $0x10,%esp
 8048a9d:	83 ec 04             	sub    $0x4,%esp
 8048aa0:	68 f8 a6 04 08       	push   $0x804a6f8
 8048aa5:	68 0d a8 04 08       	push   $0x804a80d
 8048aaa:	68 d0 86 04 08       	push   $0x80486d0
 8048aaf:	e8 cc fb ff ff       	call   8048680 <__cxa_atexit@plt>
 8048ab4:	83 c4 10             	add    $0x10,%esp
 8048ab7:	c9                   	leave  
 8048ab8:	c3                   	ret    

08048ab9 <_GLOBAL__sub_I_main>:
 8048ab9:	55                   	push   %ebp
 8048aba:	89 e5                	mov    %esp,%ebp
 8048abc:	83 ec 08             	sub    $0x8,%esp
 8048abf:	83 ec 08             	sub    $0x8,%esp
 8048ac2:	68 ff ff 00 00       	push   $0xffff
 8048ac7:	6a 01                	push   $0x1
 8048ac9:	e8 aa ff ff ff       	call   8048a78 <_Z41__static_initialization_and_destruction_0ii>
 8048ace:	83 c4 10             	add    $0x10,%esp
 8048ad1:	c9                   	leave  
 8048ad2:	c3                   	ret    
 8048ad3:	90                   	nop

08048ad4 <_ZN10base_classC1Ev>:
 8048ad4:	55                   	push   %ebp
 8048ad5:	89 e5                	mov    %esp,%ebp
 8048ad7:	83 ec 08             	sub    $0x8,%esp
 8048ada:	8b 45 08             	mov    0x8(%ebp),%eax
 8048add:	c7 00 38 91 04 08    	movl   $0x8049138,(%eax)
 8048ae3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ae6:	c7 40 04 64 00 00 00 	movl   $0x64,0x4(%eax)
 8048aed:	83 ec 08             	sub    $0x8,%esp
 8048af0:	68 40 8f 04 08       	push   $0x8048f40
 8048af5:	68 40 a7 04 08       	push   $0x804a740
 8048afa:	e8 e1 fb ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048aff:	83 c4 10             	add    $0x10,%esp
 8048b02:	83 ec 08             	sub    $0x8,%esp
 8048b05:	68 00 87 04 08       	push   $0x8048700
 8048b0a:	50                   	push   %eax
 8048b0b:	e8 e0 fb ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048b10:	83 c4 10             	add    $0x10,%esp
 8048b13:	c9                   	leave  
 8048b14:	c3                   	ret    
 8048b15:	90                   	nop

08048b16 <_ZN10base_classD1Ev>:
 8048b16:	55                   	push   %ebp
 8048b17:	89 e5                	mov    %esp,%ebp
 8048b19:	83 ec 08             	sub    $0x8,%esp
 8048b1c:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b1f:	c7 00 38 91 04 08    	movl   $0x8049138,(%eax)
 8048b25:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b28:	c7 40 04 9c ff ff ff 	movl   $0xffffff9c,0x4(%eax)
 8048b2f:	83 ec 08             	sub    $0x8,%esp
 8048b32:	68 64 8f 04 08       	push   $0x8048f64
 8048b37:	68 40 a7 04 08       	push   $0x804a740
 8048b3c:	e8 9f fb ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048b41:	83 c4 10             	add    $0x10,%esp
 8048b44:	83 ec 08             	sub    $0x8,%esp
 8048b47:	68 00 87 04 08       	push   $0x8048700
 8048b4c:	50                   	push   %eax
 8048b4d:	e8 9e fb ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048b52:	83 c4 10             	add    $0x10,%esp
 8048b55:	b8 00 00 00 00       	mov    $0x0,%eax
 8048b5a:	85 c0                	test   %eax,%eax
 8048b5c:	74 0e                	je     8048b6c <_ZN10base_classD1Ev+0x56>
 8048b5e:	83 ec 0c             	sub    $0xc,%esp
 8048b61:	ff 75 08             	pushl  0x8(%ebp)
 8048b64:	e8 37 fb ff ff       	call   80486a0 <_ZdlPv@plt>
 8048b69:	83 c4 10             	add    $0x10,%esp
 8048b6c:	c9                   	leave  
 8048b6d:	c3                   	ret    

08048b6e <_ZN10base_classD0Ev>:
 8048b6e:	55                   	push   %ebp
 8048b6f:	89 e5                	mov    %esp,%ebp
 8048b71:	83 ec 08             	sub    $0x8,%esp
 8048b74:	83 ec 0c             	sub    $0xc,%esp
 8048b77:	ff 75 08             	pushl  0x8(%ebp)
 8048b7a:	e8 97 ff ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048b7f:	83 c4 10             	add    $0x10,%esp
 8048b82:	83 ec 0c             	sub    $0xc,%esp
 8048b85:	ff 75 08             	pushl  0x8(%ebp)
 8048b88:	e8 13 fb ff ff       	call   80486a0 <_ZdlPv@plt>
 8048b8d:	83 c4 10             	add    $0x10,%esp
 8048b90:	c9                   	leave  
 8048b91:	c3                   	ret    

08048b92 <_ZN10base_class11normal_funcEv>:
 8048b92:	55                   	push   %ebp
 8048b93:	89 e5                	mov    %esp,%ebp
 8048b95:	83 ec 08             	sub    $0x8,%esp
 8048b98:	83 ec 08             	sub    $0x8,%esp
 8048b9b:	68 8c 8f 04 08       	push   $0x8048f8c
 8048ba0:	68 40 a7 04 08       	push   $0x804a740
 8048ba5:	e8 36 fb ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048baa:	83 c4 10             	add    $0x10,%esp
 8048bad:	83 ec 08             	sub    $0x8,%esp
 8048bb0:	68 00 87 04 08       	push   $0x8048700
 8048bb5:	50                   	push   %eax
 8048bb6:	e8 35 fb ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048bbb:	83 c4 10             	add    $0x10,%esp
 8048bbe:	b8 00 00 00 00       	mov    $0x0,%eax
 8048bc3:	c9                   	leave  
 8048bc4:	c3                   	ret    
 8048bc5:	90                   	nop

08048bc6 <_ZN10base_class11virtual_fucEv>:
 8048bc6:	55                   	push   %ebp
 8048bc7:	89 e5                	mov    %esp,%ebp
 8048bc9:	83 ec 08             	sub    $0x8,%esp
 8048bcc:	83 ec 08             	sub    $0x8,%esp
 8048bcf:	68 b0 8f 04 08       	push   $0x8048fb0
 8048bd4:	68 40 a7 04 08       	push   $0x804a740
 8048bd9:	e8 02 fb ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048bde:	83 c4 10             	add    $0x10,%esp
 8048be1:	83 ec 08             	sub    $0x8,%esp
 8048be4:	68 00 87 04 08       	push   $0x8048700
 8048be9:	50                   	push   %eax
 8048bea:	e8 01 fb ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048bef:	83 c4 10             	add    $0x10,%esp
 8048bf2:	b8 00 00 00 00       	mov    $0x0,%eax
 8048bf7:	c9                   	leave  
 8048bf8:	c3                   	ret    
 8048bf9:	90                   	nop

08048bfa <_ZN13drived_class1C1Ev>:
 8048bfa:	55                   	push   %ebp
 8048bfb:	89 e5                	mov    %esp,%ebp
 8048bfd:	53                   	push   %ebx
 8048bfe:	83 ec 04             	sub    $0x4,%esp
 8048c01:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c04:	83 ec 0c             	sub    $0xc,%esp
 8048c07:	50                   	push   %eax
 8048c08:	e8 c7 fe ff ff       	call   8048ad4 <_ZN10base_classC1Ev>
 8048c0d:	83 c4 10             	add    $0x10,%esp
 8048c10:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c13:	c7 00 20 91 04 08    	movl   $0x8049120,(%eax)
 8048c19:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c1c:	c7 40 08 c8 00 00 00 	movl   $0xc8,0x8(%eax)
 8048c23:	83 ec 08             	sub    $0x8,%esp
 8048c26:	68 d4 8f 04 08       	push   $0x8048fd4
 8048c2b:	68 40 a7 04 08       	push   $0x804a740
 8048c30:	e8 ab fa ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048c35:	83 c4 10             	add    $0x10,%esp
 8048c38:	83 ec 08             	sub    $0x8,%esp
 8048c3b:	68 00 87 04 08       	push   $0x8048700
 8048c40:	50                   	push   %eax
 8048c41:	e8 aa fa ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048c46:	83 c4 10             	add    $0x10,%esp
 8048c49:	eb 1c                	jmp    8048c67 <_ZN13drived_class1C1Ev+0x6d>
 8048c4b:	89 c3                	mov    %eax,%ebx
 8048c4d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c50:	83 ec 0c             	sub    $0xc,%esp
 8048c53:	50                   	push   %eax
 8048c54:	e8 bd fe ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048c59:	83 c4 10             	add    $0x10,%esp
 8048c5c:	89 d8                	mov    %ebx,%eax
 8048c5e:	83 ec 0c             	sub    $0xc,%esp
 8048c61:	50                   	push   %eax
 8048c62:	e8 b9 fa ff ff       	call   8048720 <_Unwind_Resume@plt>
 8048c67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048c6a:	c9                   	leave  
 8048c6b:	c3                   	ret    

08048c6c <_ZN13drived_class1D1Ev>:
 8048c6c:	55                   	push   %ebp
 8048c6d:	89 e5                	mov    %esp,%ebp
 8048c6f:	53                   	push   %ebx
 8048c70:	83 ec 04             	sub    $0x4,%esp
 8048c73:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c76:	c7 00 20 91 04 08    	movl   $0x8049120,(%eax)
 8048c7c:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c7f:	c7 40 08 38 ff ff ff 	movl   $0xffffff38,0x8(%eax)
 8048c86:	83 ec 08             	sub    $0x8,%esp
 8048c89:	68 fc 8f 04 08       	push   $0x8048ffc
 8048c8e:	68 40 a7 04 08       	push   $0x804a740
 8048c93:	e8 48 fa ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048c98:	83 c4 10             	add    $0x10,%esp
 8048c9b:	83 ec 08             	sub    $0x8,%esp
 8048c9e:	68 00 87 04 08       	push   $0x8048700
 8048ca3:	50                   	push   %eax
 8048ca4:	e8 47 fa ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048ca9:	83 c4 10             	add    $0x10,%esp
 8048cac:	8b 45 08             	mov    0x8(%ebp),%eax
 8048caf:	83 ec 0c             	sub    $0xc,%esp
 8048cb2:	50                   	push   %eax
 8048cb3:	e8 5e fe ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048cb8:	83 c4 10             	add    $0x10,%esp
 8048cbb:	b8 00 00 00 00       	mov    $0x0,%eax
 8048cc0:	85 c0                	test   %eax,%eax
 8048cc2:	74 2c                	je     8048cf0 <_ZN13drived_class1D1Ev+0x84>
 8048cc4:	83 ec 0c             	sub    $0xc,%esp
 8048cc7:	ff 75 08             	pushl  0x8(%ebp)
 8048cca:	e8 d1 f9 ff ff       	call   80486a0 <_ZdlPv@plt>
 8048ccf:	83 c4 10             	add    $0x10,%esp
 8048cd2:	eb 1c                	jmp    8048cf0 <_ZN13drived_class1D1Ev+0x84>
 8048cd4:	89 c3                	mov    %eax,%ebx
 8048cd6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048cd9:	83 ec 0c             	sub    $0xc,%esp
 8048cdc:	50                   	push   %eax
 8048cdd:	e8 34 fe ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048ce2:	83 c4 10             	add    $0x10,%esp
 8048ce5:	89 d8                	mov    %ebx,%eax
 8048ce7:	83 ec 0c             	sub    $0xc,%esp
 8048cea:	50                   	push   %eax
 8048ceb:	e8 30 fa ff ff       	call   8048720 <_Unwind_Resume@plt>
 8048cf0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048cf3:	c9                   	leave  
 8048cf4:	c3                   	ret    
 8048cf5:	90                   	nop

08048cf6 <_ZN13drived_class1D0Ev>:
 8048cf6:	55                   	push   %ebp
 8048cf7:	89 e5                	mov    %esp,%ebp
 8048cf9:	83 ec 08             	sub    $0x8,%esp
 8048cfc:	83 ec 0c             	sub    $0xc,%esp
 8048cff:	ff 75 08             	pushl  0x8(%ebp)
 8048d02:	e8 65 ff ff ff       	call   8048c6c <_ZN13drived_class1D1Ev>
 8048d07:	83 c4 10             	add    $0x10,%esp
 8048d0a:	83 ec 0c             	sub    $0xc,%esp
 8048d0d:	ff 75 08             	pushl  0x8(%ebp)
 8048d10:	e8 8b f9 ff ff       	call   80486a0 <_ZdlPv@plt>
 8048d15:	83 c4 10             	add    $0x10,%esp
 8048d18:	c9                   	leave  
 8048d19:	c3                   	ret    

08048d1a <_ZN13drived_class111virtual_fucEv>:
 8048d1a:	55                   	push   %ebp
 8048d1b:	89 e5                	mov    %esp,%ebp
 8048d1d:	83 ec 08             	sub    $0x8,%esp
 8048d20:	83 ec 08             	sub    $0x8,%esp
 8048d23:	68 28 90 04 08       	push   $0x8049028
 8048d28:	68 40 a7 04 08       	push   $0x804a740
 8048d2d:	e8 ae f9 ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048d32:	83 c4 10             	add    $0x10,%esp
 8048d35:	83 ec 08             	sub    $0x8,%esp
 8048d38:	68 00 87 04 08       	push   $0x8048700
 8048d3d:	50                   	push   %eax
 8048d3e:	e8 ad f9 ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048d43:	83 c4 10             	add    $0x10,%esp
 8048d46:	b8 00 00 00 00       	mov    $0x0,%eax
 8048d4b:	c9                   	leave  
 8048d4c:	c3                   	ret    
 8048d4d:	90                   	nop

08048d4e <_ZN13drived_class2C1Ev>:
 8048d4e:	55                   	push   %ebp
 8048d4f:	89 e5                	mov    %esp,%ebp
 8048d51:	53                   	push   %ebx
 8048d52:	83 ec 04             	sub    $0x4,%esp
 8048d55:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d58:	83 ec 0c             	sub    $0xc,%esp
 8048d5b:	50                   	push   %eax
 8048d5c:	e8 73 fd ff ff       	call   8048ad4 <_ZN10base_classC1Ev>
 8048d61:	83 c4 10             	add    $0x10,%esp
 8048d64:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d67:	c7 00 08 91 04 08    	movl   $0x8049108,(%eax)
 8048d6d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d70:	c7 40 08 2c 01 00 00 	movl   $0x12c,0x8(%eax)
 8048d77:	83 ec 08             	sub    $0x8,%esp
 8048d7a:	68 50 90 04 08       	push   $0x8049050
 8048d7f:	68 40 a7 04 08       	push   $0x804a740
 8048d84:	e8 57 f9 ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048d89:	83 c4 10             	add    $0x10,%esp
 8048d8c:	83 ec 08             	sub    $0x8,%esp
 8048d8f:	68 00 87 04 08       	push   $0x8048700
 8048d94:	50                   	push   %eax
 8048d95:	e8 56 f9 ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048d9a:	83 c4 10             	add    $0x10,%esp
 8048d9d:	eb 1c                	jmp    8048dbb <_ZN13drived_class2C1Ev+0x6d>
 8048d9f:	89 c3                	mov    %eax,%ebx
 8048da1:	8b 45 08             	mov    0x8(%ebp),%eax
 8048da4:	83 ec 0c             	sub    $0xc,%esp
 8048da7:	50                   	push   %eax
 8048da8:	e8 69 fd ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048dad:	83 c4 10             	add    $0x10,%esp
 8048db0:	89 d8                	mov    %ebx,%eax
 8048db2:	83 ec 0c             	sub    $0xc,%esp
 8048db5:	50                   	push   %eax
 8048db6:	e8 65 f9 ff ff       	call   8048720 <_Unwind_Resume@plt>
 8048dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048dbe:	c9                   	leave  
 8048dbf:	c3                   	ret    

08048dc0 <_ZN13drived_class2D1Ev>:
 8048dc0:	55                   	push   %ebp
 8048dc1:	89 e5                	mov    %esp,%ebp
 8048dc3:	53                   	push   %ebx
 8048dc4:	83 ec 04             	sub    $0x4,%esp
 8048dc7:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dca:	c7 00 08 91 04 08    	movl   $0x8049108,(%eax)
 8048dd0:	8b 45 08             	mov    0x8(%ebp),%eax
 8048dd3:	c7 40 08 d4 fe ff ff 	movl   $0xfffffed4,0x8(%eax)
 8048dda:	83 ec 08             	sub    $0x8,%esp
 8048ddd:	68 78 90 04 08       	push   $0x8049078
 8048de2:	68 40 a7 04 08       	push   $0x804a740
 8048de7:	e8 f4 f8 ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048dec:	83 c4 10             	add    $0x10,%esp
 8048def:	83 ec 08             	sub    $0x8,%esp
 8048df2:	68 00 87 04 08       	push   $0x8048700
 8048df7:	50                   	push   %eax
 8048df8:	e8 f3 f8 ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048dfd:	83 c4 10             	add    $0x10,%esp
 8048e00:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e03:	83 ec 0c             	sub    $0xc,%esp
 8048e06:	50                   	push   %eax
 8048e07:	e8 0a fd ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048e0c:	83 c4 10             	add    $0x10,%esp
 8048e0f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e14:	85 c0                	test   %eax,%eax
 8048e16:	74 2c                	je     8048e44 <_ZN13drived_class2D1Ev+0x84>
 8048e18:	83 ec 0c             	sub    $0xc,%esp
 8048e1b:	ff 75 08             	pushl  0x8(%ebp)
 8048e1e:	e8 7d f8 ff ff       	call   80486a0 <_ZdlPv@plt>
 8048e23:	83 c4 10             	add    $0x10,%esp
 8048e26:	eb 1c                	jmp    8048e44 <_ZN13drived_class2D1Ev+0x84>
 8048e28:	89 c3                	mov    %eax,%ebx
 8048e2a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e2d:	83 ec 0c             	sub    $0xc,%esp
 8048e30:	50                   	push   %eax
 8048e31:	e8 e0 fc ff ff       	call   8048b16 <_ZN10base_classD1Ev>
 8048e36:	83 c4 10             	add    $0x10,%esp
 8048e39:	89 d8                	mov    %ebx,%eax
 8048e3b:	83 ec 0c             	sub    $0xc,%esp
 8048e3e:	50                   	push   %eax
 8048e3f:	e8 dc f8 ff ff       	call   8048720 <_Unwind_Resume@plt>
 8048e44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048e47:	c9                   	leave  
 8048e48:	c3                   	ret    
 8048e49:	90                   	nop

08048e4a <_ZN13drived_class2D0Ev>:
 8048e4a:	55                   	push   %ebp
 8048e4b:	89 e5                	mov    %esp,%ebp
 8048e4d:	83 ec 08             	sub    $0x8,%esp
 8048e50:	83 ec 0c             	sub    $0xc,%esp
 8048e53:	ff 75 08             	pushl  0x8(%ebp)
 8048e56:	e8 65 ff ff ff       	call   8048dc0 <_ZN13drived_class2D1Ev>
 8048e5b:	83 c4 10             	add    $0x10,%esp
 8048e5e:	83 ec 0c             	sub    $0xc,%esp
 8048e61:	ff 75 08             	pushl  0x8(%ebp)
 8048e64:	e8 37 f8 ff ff       	call   80486a0 <_ZdlPv@plt>
 8048e69:	83 c4 10             	add    $0x10,%esp
 8048e6c:	c9                   	leave  
 8048e6d:	c3                   	ret    

08048e6e <_ZN13drived_class211virtual_fucEv>:
 8048e6e:	55                   	push   %ebp
 8048e6f:	89 e5                	mov    %esp,%ebp
 8048e71:	83 ec 08             	sub    $0x8,%esp
 8048e74:	83 ec 08             	sub    $0x8,%esp
 8048e77:	68 a4 90 04 08       	push   $0x80490a4
 8048e7c:	68 40 a7 04 08       	push   $0x804a740
 8048e81:	e8 5a f8 ff ff       	call   80486e0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048e86:	83 c4 10             	add    $0x10,%esp
 8048e89:	83 ec 08             	sub    $0x8,%esp
 8048e8c:	68 00 87 04 08       	push   $0x8048700
 8048e91:	50                   	push   %eax
 8048e92:	e8 59 f8 ff ff       	call   80486f0 <_ZNSolsEPFRSoS_E@plt>
 8048e97:	83 c4 10             	add    $0x10,%esp
 8048e9a:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e9f:	c9                   	leave  
 8048ea0:	c3                   	ret    
 8048ea1:	66 90                	xchg   %ax,%ax
 8048ea3:	66 90                	xchg   %ax,%ax
 8048ea5:	66 90                	xchg   %ax,%ax
 8048ea7:	66 90                	xchg   %ax,%ax
 8048ea9:	66 90                	xchg   %ax,%ax
 8048eab:	66 90                	xchg   %ax,%ax
 8048ead:	66 90                	xchg   %ax,%ax
 8048eaf:	90                   	nop

08048eb0 <__libc_csu_init>:
 8048eb0:	55                   	push   %ebp
 8048eb1:	57                   	push   %edi
 8048eb2:	31 ff                	xor    %edi,%edi
 8048eb4:	56                   	push   %esi
 8048eb5:	53                   	push   %ebx
 8048eb6:	e8 a5 f8 ff ff       	call   8048760 <__x86.get_pc_thunk.bx>
 8048ebb:	81 c3 01 18 00 00    	add    $0x1801,%ebx
 8048ec1:	83 ec 1c             	sub    $0x1c,%esp
 8048ec4:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8048ec8:	8d b3 f4 fe ff ff    	lea    -0x10c(%ebx),%esi
 8048ece:	e8 6d f7 ff ff       	call   8048640 <_init>
 8048ed3:	8d 83 ec fe ff ff    	lea    -0x114(%ebx),%eax
 8048ed9:	29 c6                	sub    %eax,%esi
 8048edb:	c1 fe 02             	sar    $0x2,%esi
 8048ede:	85 f6                	test   %esi,%esi
 8048ee0:	74 27                	je     8048f09 <__libc_csu_init+0x59>
 8048ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048ee8:	8b 44 24 38          	mov    0x38(%esp),%eax
 8048eec:	89 2c 24             	mov    %ebp,(%esp)
 8048eef:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048ef3:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048ef7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048efb:	ff 94 bb ec fe ff ff 	call   *-0x114(%ebx,%edi,4)
 8048f02:	83 c7 01             	add    $0x1,%edi
 8048f05:	39 f7                	cmp    %esi,%edi
 8048f07:	75 df                	jne    8048ee8 <__libc_csu_init+0x38>
 8048f09:	83 c4 1c             	add    $0x1c,%esp
 8048f0c:	5b                   	pop    %ebx
 8048f0d:	5e                   	pop    %esi
 8048f0e:	5f                   	pop    %edi
 8048f0f:	5d                   	pop    %ebp
 8048f10:	c3                   	ret    
 8048f11:	eb 0d                	jmp    8048f20 <__libc_csu_fini>
 8048f13:	90                   	nop
 8048f14:	90                   	nop
 8048f15:	90                   	nop
 8048f16:	90                   	nop
 8048f17:	90                   	nop
 8048f18:	90                   	nop
 8048f19:	90                   	nop
 8048f1a:	90                   	nop
 8048f1b:	90                   	nop
 8048f1c:	90                   	nop
 8048f1d:	90                   	nop
 8048f1e:	90                   	nop
 8048f1f:	90                   	nop

08048f20 <__libc_csu_fini>:
 8048f20:	f3 c3                	repz ret 

Disassembly of section .fini:

08048f24 <_fini>:
 8048f24:	53                   	push   %ebx
 8048f25:	83 ec 08             	sub    $0x8,%esp
 8048f28:	e8 33 f8 ff ff       	call   8048760 <__x86.get_pc_thunk.bx>
 8048f2d:	81 c3 8f 17 00 00    	add    $0x178f,%ebx
 8048f33:	83 c4 08             	add    $0x8,%esp
 8048f36:	5b                   	pop    %ebx
 8048f37:	c3                   	ret    

Disassembly of section .rodata:

08048f38 <_fp_hw>:
 8048f38:	03 00                	add    (%eax),%eax
	...

08048f3c <_IO_stdin_used>:
 8048f3c:	01 00                	add    %eax,(%eax)
 8048f3e:	02 00                	add    (%eax),%al
 8048f40:	54                   	push   %esp
 8048f41:	68 69 73 20 69       	push   $0x69207369
 8048f46:	73 20                	jae    8048f68 <_IO_stdin_used+0x2c>
 8048f48:	20 62 61             	and    %ah,0x61(%edx)
 8048f4b:	73 65                	jae    8048fb2 <_IO_stdin_used+0x76>
 8048f4d:	5f                   	pop    %edi
 8048f4e:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048f52:	73 27                	jae    8048f7b <_IO_stdin_used+0x3f>
 8048f54:	73 20                	jae    8048f76 <_IO_stdin_used+0x3a>
 8048f56:	43                   	inc    %ebx
 8048f57:	6f                   	outsl  %ds:(%esi),(%dx)
 8048f58:	6e                   	outsb  %ds:(%esi),(%dx)
 8048f59:	73 74                	jae    8048fcf <_IO_stdin_used+0x93>
 8048f5b:	72 75                	jb     8048fd2 <_IO_stdin_used+0x96>
 8048f5d:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 8048f61:	28 29                	sub    %ch,(%ecx)
 8048f63:	00 54 68 69          	add    %dl,0x69(%eax,%ebp,2)
 8048f67:	73 20                	jae    8048f89 <_IO_stdin_used+0x4d>
 8048f69:	69 73 20 20 62 61 73 	imul   $0x73616220,0x20(%ebx),%esi
 8048f70:	65 5f                	gs pop %edi
 8048f72:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048f76:	73 27                	jae    8048f9f <_IO_stdin_used+0x63>
 8048f78:	73 20                	jae    8048f9a <_IO_stdin_used+0x5e>
 8048f7a:	44                   	inc    %esp
 8048f7b:	65 63 6f 6e          	arpl   %bp,%gs:0x6e(%edi)
 8048f7f:	73 74                	jae    8048ff5 <_IO_stdin_used+0xb9>
 8048f81:	72 75                	jb     8048ff8 <_IO_stdin_used+0xbc>
 8048f83:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 8048f87:	28 29                	sub    %ch,(%ecx)
 8048f89:	00 00                	add    %al,(%eax)
 8048f8b:	00 54 68 69          	add    %dl,0x69(%eax,%ebp,2)
 8048f8f:	73 20                	jae    8048fb1 <_IO_stdin_used+0x75>
 8048f91:	69 73 20 20 62 61 73 	imul   $0x73616220,0x20(%ebx),%esi
 8048f98:	65 5f                	gs pop %edi
 8048f9a:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048f9e:	73 27                	jae    8048fc7 <_IO_stdin_used+0x8b>
 8048fa0:	73 20                	jae    8048fc2 <_IO_stdin_used+0x86>
 8048fa2:	6e                   	outsb  %ds:(%esi),(%dx)
 8048fa3:	6f                   	outsl  %ds:(%esi),(%dx)
 8048fa4:	72 6d                	jb     8049013 <_IO_stdin_used+0xd7>
 8048fa6:	61                   	popa   
 8048fa7:	6c                   	insb   (%dx),%es:(%edi)
 8048fa8:	5f                   	pop    %edi
 8048fa9:	66 75 6e             	data16 jne 804901a <_IO_stdin_used+0xde>
 8048fac:	63 28                	arpl   %bp,(%eax)
 8048fae:	29 00                	sub    %eax,(%eax)
 8048fb0:	54                   	push   %esp
 8048fb1:	68 69 73 20 69       	push   $0x69207369
 8048fb6:	73 20                	jae    8048fd8 <_IO_stdin_used+0x9c>
 8048fb8:	20 62 61             	and    %ah,0x61(%edx)
 8048fbb:	73 65                	jae    8049022 <_IO_stdin_used+0xe6>
 8048fbd:	5f                   	pop    %edi
 8048fbe:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048fc2:	73 27                	jae    8048feb <_IO_stdin_used+0xaf>
 8048fc4:	73 20                	jae    8048fe6 <_IO_stdin_used+0xaa>
 8048fc6:	76 69                	jbe    8049031 <_IO_stdin_used+0xf5>
 8048fc8:	72 74                	jb     804903e <_IO_stdin_used+0x102>
 8048fca:	75 61                	jne    804902d <_IO_stdin_used+0xf1>
 8048fcc:	6c                   	insb   (%dx),%es:(%edi)
 8048fcd:	5f                   	pop    %edi
 8048fce:	66 75 63             	data16 jne 8049034 <_IO_stdin_used+0xf8>
 8048fd1:	28 29                	sub    %ch,(%ecx)
 8048fd3:	00 54 68 69          	add    %dl,0x69(%eax,%ebp,2)
 8048fd7:	73 20                	jae    8048ff9 <_IO_stdin_used+0xbd>
 8048fd9:	69 73 20 20 64 72 69 	imul   $0x69726420,0x20(%ebx),%esi
 8048fe0:	76 65                	jbe    8049047 <_IO_stdin_used+0x10b>
 8048fe2:	64 5f                	fs pop %edi
 8048fe4:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048fe8:	73 31                	jae    804901b <_IO_stdin_used+0xdf>
 8048fea:	27                   	daa    
 8048feb:	73 20                	jae    804900d <_IO_stdin_used+0xd1>
 8048fed:	43                   	inc    %ebx
 8048fee:	6f                   	outsl  %ds:(%esi),(%dx)
 8048fef:	6e                   	outsb  %ds:(%esi),(%dx)
 8048ff0:	73 74                	jae    8049066 <_IO_stdin_used+0x12a>
 8048ff2:	72 75                	jb     8049069 <_IO_stdin_used+0x12d>
 8048ff4:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 8048ff8:	28 29                	sub    %ch,(%ecx)
 8048ffa:	00 00                	add    %al,(%eax)
 8048ffc:	54                   	push   %esp
 8048ffd:	68 69 73 20 69       	push   $0x69207369
 8049002:	73 20                	jae    8049024 <_IO_stdin_used+0xe8>
 8049004:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
 8049008:	76 65                	jbe    804906f <_IO_stdin_used+0x133>
 804900a:	64 5f                	fs pop %edi
 804900c:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8049010:	73 31                	jae    8049043 <_IO_stdin_used+0x107>
 8049012:	27                   	daa    
 8049013:	73 20                	jae    8049035 <_IO_stdin_used+0xf9>
 8049015:	44                   	inc    %esp
 8049016:	65 63 6f 6e          	arpl   %bp,%gs:0x6e(%edi)
 804901a:	73 74                	jae    8049090 <_IO_stdin_used+0x154>
 804901c:	72 75                	jb     8049093 <_IO_stdin_used+0x157>
 804901e:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 8049022:	28 29                	sub    %ch,(%ecx)
 8049024:	00 00                	add    %al,(%eax)
 8049026:	00 00                	add    %al,(%eax)
 8049028:	54                   	push   %esp
 8049029:	68 69 73 20 69       	push   $0x69207369
 804902e:	73 20                	jae    8049050 <_IO_stdin_used+0x114>
 8049030:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
 8049034:	76 65                	jbe    804909b <_IO_stdin_used+0x15f>
 8049036:	64 5f                	fs pop %edi
 8049038:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 804903c:	73 31                	jae    804906f <_IO_stdin_used+0x133>
 804903e:	27                   	daa    
 804903f:	73 20                	jae    8049061 <_IO_stdin_used+0x125>
 8049041:	76 69                	jbe    80490ac <_IO_stdin_used+0x170>
 8049043:	72 74                	jb     80490b9 <_IO_stdin_used+0x17d>
 8049045:	75 61                	jne    80490a8 <_IO_stdin_used+0x16c>
 8049047:	6c                   	insb   (%dx),%es:(%edi)
 8049048:	5f                   	pop    %edi
 8049049:	66 75 63             	data16 jne 80490af <_IO_stdin_used+0x173>
 804904c:	28 29                	sub    %ch,(%ecx)
 804904e:	00 00                	add    %al,(%eax)
 8049050:	54                   	push   %esp
 8049051:	68 69 73 20 69       	push   $0x69207369
 8049056:	73 20                	jae    8049078 <_IO_stdin_used+0x13c>
 8049058:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
 804905c:	76 65                	jbe    80490c3 <_IO_stdin_used+0x187>
 804905e:	64 5f                	fs pop %edi
 8049060:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8049064:	73 32                	jae    8049098 <_IO_stdin_used+0x15c>
 8049066:	27                   	daa    
 8049067:	73 20                	jae    8049089 <_IO_stdin_used+0x14d>
 8049069:	43                   	inc    %ebx
 804906a:	6f                   	outsl  %ds:(%esi),(%dx)
 804906b:	6e                   	outsb  %ds:(%esi),(%dx)
 804906c:	73 74                	jae    80490e2 <_IO_stdin_used+0x1a6>
 804906e:	72 75                	jb     80490e5 <_IO_stdin_used+0x1a9>
 8049070:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 8049074:	28 29                	sub    %ch,(%ecx)
 8049076:	00 00                	add    %al,(%eax)
 8049078:	54                   	push   %esp
 8049079:	68 69 73 20 69       	push   $0x69207369
 804907e:	73 20                	jae    80490a0 <_IO_stdin_used+0x164>
 8049080:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
 8049084:	76 65                	jbe    80490eb <_IO_stdin_used+0x1af>
 8049086:	64 5f                	fs pop %edi
 8049088:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 804908c:	73 32                	jae    80490c0 <_IO_stdin_used+0x184>
 804908e:	27                   	daa    
 804908f:	73 20                	jae    80490b1 <_IO_stdin_used+0x175>
 8049091:	44                   	inc    %esp
 8049092:	65 63 6f 6e          	arpl   %bp,%gs:0x6e(%edi)
 8049096:	73 74                	jae    804910c <_ZTV13drived_class2+0xc>
 8049098:	72 75                	jb     804910f <_ZTV13drived_class2+0xf>
 804909a:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 804909e:	28 29                	sub    %ch,(%ecx)
 80490a0:	00 00                	add    %al,(%eax)
 80490a2:	00 00                	add    %al,(%eax)
 80490a4:	54                   	push   %esp
 80490a5:	68 69 73 20 69       	push   $0x69207369
 80490aa:	73 20                	jae    80490cc <_IO_stdin_used+0x190>
 80490ac:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
 80490b0:	76 65                	jbe    8049117 <_ZTV13drived_class2+0x17>
 80490b2:	64 5f                	fs pop %edi
 80490b4:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 80490b8:	73 32                	jae    80490ec <_IO_stdin_used+0x1b0>
 80490ba:	27                   	daa    
 80490bb:	73 20                	jae    80490dd <_IO_stdin_used+0x1a1>
 80490bd:	76 69                	jbe    8049128 <_ZTV13drived_class1+0x10>
 80490bf:	72 74                	jb     8049135 <_ZTV10base_class+0x5>
 80490c1:	75 61                	jne    8049124 <_ZTV13drived_class1+0xc>
 80490c3:	6c                   	insb   (%dx),%es:(%edi)
 80490c4:	5f                   	pop    %edi
 80490c5:	66 75 63             	data16 jne 804912b <_ZTV13drived_class1+0x13>
 80490c8:	28 29                	sub    %ch,(%ecx)
 80490ca:	00 00                	add    %al,(%eax)
 80490cc:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490d1:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490d6:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490db:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490e0:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490e5:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490ea:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490ef:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490f4:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
 80490f9:	00 00                	add    %al,(%eax)
 80490fb:	00 00                	add    %al,(%eax)
 80490fd:	00 00                	add    %al,(%eax)
	...

08049100 <_ZTV13drived_class2>:
 8049100:	00 00                	add    %al,(%eax)
 8049102:	00 00                	add    %al,(%eax)
 8049104:	54                   	push   %esp
 8049105:	91                   	xchg   %eax,%ecx
 8049106:	04 08                	add    $0x8,%al
 8049108:	c0 8d 04 08 4a 8e 04 	rorb   $0x4,-0x71b5f7fc(%ebp)
 804910f:	08 6e 8e             	or     %ch,-0x72(%esi)
 8049112:	04 08                	add    $0x8,%al
 8049114:	00 00                	add    %al,(%eax)
	...

08049118 <_ZTV13drived_class1>:
 8049118:	00 00                	add    %al,(%eax)
 804911a:	00 00                	add    %al,(%eax)
 804911c:	70 91                	jo     80490af <_IO_stdin_used+0x173>
 804911e:	04 08                	add    $0x8,%al
 8049120:	6c                   	insb   (%dx),%es:(%edi)
 8049121:	8c 04 08             	mov    %es,(%eax,%ecx,1)
 8049124:	f6                   	(bad)  
 8049125:	8c 04 08             	mov    %es,(%eax,%ecx,1)
 8049128:	1a 8d 04 08 00 00    	sbb    0x804(%ebp),%cl
	...

08049130 <_ZTV10base_class>:
 8049130:	00 00                	add    %al,(%eax)
 8049132:	00 00                	add    %al,(%eax)
 8049134:	8c 91 04 08 16 8b    	mov    %ss,-0x74e9f7fc(%ecx)
 804913a:	04 08                	add    $0x8,%al
 804913c:	6e                   	outsb  %ds:(%esi),(%dx)
 804913d:	8b 04 08             	mov    (%eax,%ecx,1),%eax
 8049140:	c6                   	(bad)  
 8049141:	8b 04 08             	mov    (%eax,%ecx,1),%eax

08049144 <_ZTS13drived_class2>:
 8049144:	31 33                	xor    %esi,(%ebx)
 8049146:	64 72 69             	fs jb  80491b2 <_ZTI10base_class+0x26>
 8049149:	76 65                	jbe    80491b0 <_ZTI10base_class+0x24>
 804914b:	64 5f                	fs pop %edi
 804914d:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8049151:	73 32                	jae    8049185 <_ZTS10base_class+0x9>
	...

08049154 <_ZTI13drived_class2>:
 8049154:	e8 a7 04 08 44       	call   4c0c9600 <_end+0x4407edf0>
 8049159:	91                   	xchg   %eax,%ecx
 804915a:	04 08                	add    $0x8,%al
 804915c:	8c 91 04 08 31 33    	mov    %ss,0x33310804(%ecx)

08049160 <_ZTS13drived_class1>:
 8049160:	31 33                	xor    %esi,(%ebx)
 8049162:	64 72 69             	fs jb  80491ce <_ZTI10base_class+0x42>
 8049165:	76 65                	jbe    80491cc <_ZTI10base_class+0x40>
 8049167:	64 5f                	fs pop %edi
 8049169:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 804916d:	73 31                	jae    80491a0 <_ZTI10base_class+0x14>
	...

08049170 <_ZTI13drived_class1>:
 8049170:	e8 a7 04 08 60       	call   680c961c <_end+0x6007ee0c>
 8049175:	91                   	xchg   %eax,%ecx
 8049176:	04 08                	add    $0x8,%al
 8049178:	8c 91 04 08 31 30    	mov    %ss,0x30310804(%ecx)

0804917c <_ZTS10base_class>:
 804917c:	31 30                	xor    %esi,(%eax)
 804917e:	62 61 73             	bound  %esp,0x73(%ecx)
 8049181:	65 5f                	gs pop %edi
 8049183:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8049187:	73 00                	jae    8049189 <_ZTS10base_class+0xd>
 8049189:	00 00                	add    %al,(%eax)
	...

0804918c <_ZTI10base_class>:
 804918c:	08 a7 04 08 7c 91    	or     %ah,-0x6e83f7fc(%edi)
 8049192:	04 08                	add    $0x8,%al

Disassembly of section .eh_frame_hdr:

08049194 <.eh_frame_hdr>:
 8049194:	01 1b                	add    %ebx,(%ebx)
 8049196:	03 3b                	add    (%ebx),%edi
 8049198:	a0 00 00 00 13       	mov    0x13000000,%al
 804919d:	00 00                	add    %al,(%eax)
 804919f:	00 dc                	add    %bl,%ah
 80491a1:	f4                   	hlt    
 80491a2:	ff                   	(bad)  
 80491a3:	ff                   	(bad)  
 80491a4:	bc 00 00 00 97       	mov    $0x97000000,%esp
 80491a9:	f6 ff                	idiv   %bh
 80491ab:	ff d0                	call   *%eax
 80491ad:	02 00                	add    (%eax),%al
 80491af:	00 e4                	add    %ah,%ah
 80491b1:	f8                   	clc    
 80491b2:	ff                   	(bad)  
 80491b3:	ff 10                	call   *(%eax)
 80491b5:	03 00                	add    (%eax),%eax
 80491b7:	00 25 f9 ff ff 30    	add    %ah,0x30fffff9
 80491bd:	03 00                	add    (%eax),%eax
 80491bf:	00 40 f9             	add    %al,-0x7(%eax)
 80491c2:	ff                   	(bad)  
 80491c3:	ff e0                	jmp    *%eax
 80491c5:	00 00                	add    %al,(%eax)
 80491c7:	00 82 f9 ff ff 00    	add    %al,0xfffff9(%edx)
 80491cd:	01 00                	add    %eax,(%eax)
 80491cf:	00 da                	add    %bl,%dl
 80491d1:	f9                   	stc    
 80491d2:	ff                   	(bad)  
 80491d3:	ff 20                	jmp    *(%eax)
 80491d5:	01 00                	add    %eax,(%eax)
 80491d7:	00 fe                	add    %bh,%dh
 80491d9:	f9                   	stc    
 80491da:	ff                   	(bad)  
 80491db:	ff 40 01             	incl   0x1(%eax)
 80491de:	00 00                	add    %al,(%eax)
 80491e0:	32 fa                	xor    %dl,%bh
 80491e2:	ff                   	(bad)  
 80491e3:	ff 60 01             	jmp    *0x1(%eax)
 80491e6:	00 00                	add    %al,(%eax)
 80491e8:	66 fa                	data16 cli 
 80491ea:	ff                   	(bad)  
 80491eb:	ff a0 01 00 00 d8    	jmp    *-0x27ffffff(%eax)
 80491f1:	fa                   	cli    
 80491f2:	ff                   	(bad)  
 80491f3:	ff cc                	dec    %esp
 80491f5:	01 00                	add    %eax,(%eax)
 80491f7:	00 62 fb             	add    %ah,-0x5(%edx)
 80491fa:	ff                   	(bad)  
 80491fb:	ff                   	(bad)  
 80491fc:	f8                   	clc    
 80491fd:	01 00                	add    %eax,(%eax)
 80491ff:	00 86 fb ff ff 18    	add    %al,0x18fffffb(%esi)
 8049205:	02 00                	add    (%eax),%al
 8049207:	00 ba fb ff ff 38    	add    %bh,0x38fffffb(%edx)
 804920d:	02 00                	add    (%eax),%al
 804920f:	00 2c fc             	add    %ch,(%esp,%edi,8)
 8049212:	ff                   	(bad)  
 8049213:	ff 64 02 00          	jmp    *0x0(%edx,%eax,1)
 8049217:	00 b6 fc ff ff 90    	add    %dh,-0x6f000004(%esi)
 804921d:	02 00                	add    (%eax),%al
 804921f:	00 da                	add    %bl,%dl
 8049221:	fc                   	cld    
 8049222:	ff                   	(bad)  
 8049223:	ff b0 02 00 00 1c    	pushl  0x1c000002(%eax)
 8049229:	fd                   	std    
 804922a:	ff                   	(bad)  
 804922b:	ff 50 03             	call   *0x3(%eax)
 804922e:	00 00                	add    %al,(%eax)
 8049230:	8c fd                	mov    %?,%ebp
 8049232:	ff                   	(bad)  
 8049233:	ff                   	.byte 0xff
 8049234:	8c 03                	mov    %es,(%ebx)
	...

Disassembly of section .eh_frame:

08049238 <__FRAME_END__-0x2fc>:
 8049238:	14 00                	adc    $0x0,%al
 804923a:	00 00                	add    %al,(%eax)
 804923c:	00 00                	add    %al,(%eax)
 804923e:	00 00                	add    %al,(%eax)
 8049240:	01 7a 52             	add    %edi,0x52(%edx)
 8049243:	00 01                	add    %al,(%ecx)
 8049245:	7c 08                	jl     804924f <_ZTI10base_class+0xc3>
 8049247:	01 1b                	add    %ebx,(%ebx)
 8049249:	0c 04                	or     $0x4,%al
 804924b:	04 88                	add    $0x88,%al
 804924d:	01 00                	add    %eax,(%eax)
 804924f:	00 20                	add    %ah,(%eax)
 8049251:	00 00                	add    %al,(%eax)
 8049253:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8049256:	00 00                	add    %al,(%eax)
 8049258:	18 f4                	sbb    %dh,%ah
 804925a:	ff                   	(bad)  
 804925b:	ff c0                	inc    %eax
 804925d:	00 00                	add    %al,(%eax)
 804925f:	00 00                	add    %al,(%eax)
 8049261:	0e                   	push   %cs
 8049262:	08 46 0e             	or     %al,0xe(%esi)
 8049265:	0c 4a                	or     $0x4a,%al
 8049267:	0f 0b                	ud2    
 8049269:	74 04                	je     804926f <_ZTI10base_class+0xe3>
 804926b:	78 00                	js     804926d <_ZTI10base_class+0xe1>
 804926d:	3f                   	aas    
 804926e:	1a 3b                	sbb    (%ebx),%bh
 8049270:	2a 32                	sub    (%edx),%dh
 8049272:	24 22                	and    $0x22,%al
 8049274:	1c 00                	sbb    $0x0,%al
 8049276:	00 00                	add    %al,(%eax)
 8049278:	40                   	inc    %eax
 8049279:	00 00                	add    %al,(%eax)
 804927b:	00 58 f8             	add    %bl,-0x8(%eax)
 804927e:	ff                   	(bad)  
 804927f:	ff 41 00             	incl   0x0(%ecx)
 8049282:	00 00                	add    %al,(%eax)
 8049284:	00 41 0e             	add    %al,0xe(%ecx)
 8049287:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 804928d:	7d c5                	jge    8049254 <_ZTI10base_class+0xc8>
 804928f:	0c 04                	or     $0x4,%al
 8049291:	04 00                	add    $0x0,%al
 8049293:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8049296:	00 00                	add    %al,(%eax)
 8049298:	60                   	pusha  
 8049299:	00 00                	add    %al,(%eax)
 804929b:	00 7a f8             	add    %bh,-0x8(%edx)
 804929e:	ff                   	(bad)  
 804929f:	ff 58 00             	lcall  *0x0(%eax)
 80492a2:	00 00                	add    %al,(%eax)
 80492a4:	00 41 0e             	add    %al,0xe(%ecx)
 80492a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80492ad:	02 54 c5 0c          	add    0xc(%ebp,%eax,8),%dl
 80492b1:	04 04                	add    $0x4,%al
 80492b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80492b6:	00 00                	add    %al,(%eax)
 80492b8:	80 00 00             	addb   $0x0,(%eax)
 80492bb:	00 b2 f8 ff ff 24    	add    %dh,0x24fffff8(%edx)
 80492c1:	00 00                	add    %al,(%eax)
 80492c3:	00 00                	add    %al,(%eax)
 80492c5:	41                   	inc    %ecx
 80492c6:	0e                   	push   %cs
 80492c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80492cd:	60                   	pusha  
 80492ce:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80492d1:	04 00                	add    $0x0,%al
 80492d3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80492d6:	00 00                	add    %al,(%eax)
 80492d8:	a0 00 00 00 b6       	mov    0xb6000000,%al
 80492dd:	f8                   	clc    
 80492de:	ff                   	(bad)  
 80492df:	ff 33                	pushl  (%ebx)
 80492e1:	00 00                	add    %al,(%eax)
 80492e3:	00 00                	add    %al,(%eax)
 80492e5:	41                   	inc    %ecx
 80492e6:	0e                   	push   %cs
 80492e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80492ed:	6f                   	outsl  %ds:(%esi),(%dx)
 80492ee:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80492f1:	04 00                	add    $0x0,%al
 80492f3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80492f6:	00 00                	add    %al,(%eax)
 80492f8:	c0 00 00             	rolb   $0x0,(%eax)
 80492fb:	00 ca                	add    %cl,%dl
 80492fd:	f8                   	clc    
 80492fe:	ff                   	(bad)  
 80492ff:	ff 33                	pushl  (%ebx)
 8049301:	00 00                	add    %al,(%eax)
 8049303:	00 00                	add    %al,(%eax)
 8049305:	41                   	inc    %ecx
 8049306:	0e                   	push   %cs
 8049307:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 804930d:	6f                   	outsl  %ds:(%esi),(%dx)
 804930e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8049311:	04 00                	add    $0x0,%al
 8049313:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8049316:	00 00                	add    %al,(%eax)
 8049318:	00 00                	add    %al,(%eax)
 804931a:	00 00                	add    %al,(%eax)
 804931c:	01 7a 50             	add    %edi,0x50(%edx)
 804931f:	4c                   	dec    %esp
 8049320:	52                   	push   %edx
 8049321:	00 01                	add    %al,(%ecx)
 8049323:	7c 08                	jl     804932d <_ZTI10base_class+0x1a1>
 8049325:	07                   	pop    %es
 8049326:	00 10                	add    %dl,(%eax)
 8049328:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804932b:	00 1b                	add    %bl,(%ebx)
 804932d:	0c 04                	or     $0x4,%al
 804932f:	04 88                	add    $0x88,%al
 8049331:	01 00                	add    %eax,(%eax)
 8049333:	00 28                	add    %ch,(%eax)
 8049335:	00 00                	add    %al,(%eax)
 8049337:	00 24 00             	add    %ah,(%eax,%eax,1)
 804933a:	00 00                	add    %al,(%eax)
 804933c:	be f8 ff ff 72       	mov    $0x72fffff8,%esi
 8049341:	00 00                	add    %al,(%eax)
 8049343:	00 04 38             	add    %al,(%eax,%edi,1)
 8049346:	95                   	xchg   %eax,%ebp
 8049347:	04 08                	add    $0x8,%al
 8049349:	41                   	inc    %ecx
 804934a:	0e                   	push   %cs
 804934b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8049351:	44                   	inc    %esp
 8049352:	83 03 6f             	addl   $0x6f,(%ebx)
 8049355:	2e 10 7b c5          	adc    %bh,%cs:-0x3b(%ebx)
 8049359:	c3                   	ret    
 804935a:	0c 04                	or     $0x4,%al
 804935c:	04 00                	add    $0x0,%al
 804935e:	00 00                	add    %al,(%eax)
 8049360:	28 00                	sub    %al,(%eax)
 8049362:	00 00                	add    %al,(%eax)
 8049364:	50                   	push   %eax
 8049365:	00 00                	add    %al,(%eax)
 8049367:	00 04 f9             	add    %al,(%ecx,%edi,8)
 804936a:	ff                   	(bad)  
 804936b:	ff 89 00 00 00 04    	decl   0x4000000(%ecx)
 8049371:	48                   	dec    %eax
 8049372:	95                   	xchg   %eax,%ebp
 8049373:	04 08                	add    $0x8,%al
 8049375:	41                   	inc    %ecx
 8049376:	0e                   	push   %cs
 8049377:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 804937d:	44                   	inc    %esp
 804937e:	83 03 60             	addl   $0x60,(%ebx)
 8049381:	2e 10 02             	adc    %al,%cs:(%edx)
 8049384:	61                   	popa   
 8049385:	c5 c3 0c             	(bad)  
 8049388:	04 04                	add    $0x4,%al
 804938a:	00 00                	add    %al,(%eax)
 804938c:	1c 00                	sbb    $0x0,%al
 804938e:	00 00                	add    %al,(%eax)
 8049390:	58                   	pop    %eax
 8049391:	01 00                	add    %eax,(%eax)
 8049393:	00 62 f9             	add    %ah,-0x7(%edx)
 8049396:	ff                   	(bad)  
 8049397:	ff 24 00             	jmp    *(%eax,%eax,1)
 804939a:	00 00                	add    %al,(%eax)
 804939c:	00 41 0e             	add    %al,0xe(%ecx)
 804939f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80493a5:	60                   	pusha  
 80493a6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80493a9:	04 00                	add    $0x0,%al
 80493ab:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80493ae:	00 00                	add    %al,(%eax)
 80493b0:	78 01                	js     80493b3 <_ZTI10base_class+0x227>
 80493b2:	00 00                	add    %al,(%eax)
 80493b4:	66 f9                	data16 stc 
 80493b6:	ff                   	(bad)  
 80493b7:	ff 33                	pushl  (%ebx)
 80493b9:	00 00                	add    %al,(%eax)
 80493bb:	00 00                	add    %al,(%eax)
 80493bd:	41                   	inc    %ecx
 80493be:	0e                   	push   %cs
 80493bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80493c5:	6f                   	outsl  %ds:(%esi),(%dx)
 80493c6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80493c9:	04 00                	add    $0x0,%al
 80493cb:	00 28                	add    %ch,(%eax)
 80493cd:	00 00                	add    %al,(%eax)
 80493cf:	00 bc 00 00 00 7a f9 	add    %bh,-0x6860000(%eax,%eax,1)
 80493d6:	ff                   	(bad)  
 80493d7:	ff 72 00             	pushl  0x0(%edx)
 80493da:	00 00                	add    %al,(%eax)
 80493dc:	04 58                	add    $0x58,%al
 80493de:	95                   	xchg   %eax,%ebp
 80493df:	04 08                	add    $0x8,%al
 80493e1:	41                   	inc    %ecx
 80493e2:	0e                   	push   %cs
 80493e3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80493e9:	44                   	inc    %esp
 80493ea:	83 03 6f             	addl   $0x6f,(%ebx)
 80493ed:	2e 10 7b c5          	adc    %bh,%cs:-0x3b(%ebx)
 80493f1:	c3                   	ret    
 80493f2:	0c 04                	or     $0x4,%al
 80493f4:	04 00                	add    $0x0,%al
 80493f6:	00 00                	add    %al,(%eax)
 80493f8:	28 00                	sub    %al,(%eax)
 80493fa:	00 00                	add    %al,(%eax)
 80493fc:	e8 00 00 00 c0       	call   c8049401 <_end+0xbfffebf1>
 8049401:	f9                   	stc    
 8049402:	ff                   	(bad)  
 8049403:	ff 89 00 00 00 04    	decl   0x4000000(%ecx)
 8049409:	68 95 04 08 41       	push   $0x41080495
 804940e:	0e                   	push   %cs
 804940f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8049415:	44                   	inc    %esp
 8049416:	83 03 60             	addl   $0x60,(%ebx)
 8049419:	2e 10 02             	adc    %al,%cs:(%edx)
 804941c:	61                   	popa   
 804941d:	c5 c3 0c             	(bad)  
 8049420:	04 04                	add    $0x4,%al
 8049422:	00 00                	add    %al,(%eax)
 8049424:	1c 00                	sbb    $0x0,%al
 8049426:	00 00                	add    %al,(%eax)
 8049428:	f0 01 00             	lock add %eax,(%eax)
 804942b:	00 1e                	add    %bl,(%esi)
 804942d:	fa                   	cli    
 804942e:	ff                   	(bad)  
 804942f:	ff 24 00             	jmp    *(%eax,%eax,1)
 8049432:	00 00                	add    %al,(%eax)
 8049434:	00 41 0e             	add    %al,0xe(%ecx)
 8049437:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 804943d:	60                   	pusha  
 804943e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8049441:	04 00                	add    $0x0,%al
 8049443:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8049446:	00 00                	add    %al,(%eax)
 8049448:	10 02                	adc    %al,(%edx)
 804944a:	00 00                	add    %al,(%eax)
 804944c:	22 fa                	and    %dl,%bh
 804944e:	ff                   	(bad)  
 804944f:	ff 33                	pushl  (%ebx)
 8049451:	00 00                	add    %al,(%eax)
 8049453:	00 00                	add    %al,(%eax)
 8049455:	41                   	inc    %ecx
 8049456:	0e                   	push   %cs
 8049457:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 804945d:	6f                   	outsl  %ds:(%esi),(%dx)
 804945e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8049461:	04 00                	add    $0x0,%al
 8049463:	00 3c 00             	add    %bh,(%eax,%eax,1)
 8049466:	00 00                	add    %al,(%eax)
 8049468:	54                   	push   %esp
 8049469:	01 00                	add    %eax,(%eax)
 804946b:	00 bf f3 ff ff 4d    	add    %bh,0x4dfffff3(%edi)
 8049471:	02 00                	add    (%eax),%al
 8049473:	00 04 78             	add    %al,(%eax,%edi,2)
 8049476:	95                   	xchg   %eax,%ebp
 8049477:	04 08                	add    $0x8,%al
 8049479:	44                   	inc    %esp
 804947a:	0c 01                	or     $0x1,%al
 804947c:	00 47 10             	add    %al,0x10(%edi)
 804947f:	05 02 75 00 44       	add    $0x44007502,%eax
 8049484:	0f 03 75 78          	lsl    0x78(%ebp),%esi
 8049488:	06                   	push   %es
 8049489:	10 03                	adc    %al,(%ebx)
 804948b:	02 75 7c             	add    0x7c(%ebp),%dh
 804948e:	02 4c 2e 10          	add    0x10(%esi,%ebp,1),%cl
 8049492:	03 ec                	add    %esp,%ebp
 8049494:	01 c1                	add    %eax,%ecx
 8049496:	0c 01                	or     $0x1,%al
 8049498:	00 41 c3             	add    %al,-0x3d(%ecx)
 804949b:	41                   	inc    %ecx
 804949c:	c5 43 0c             	lds    0xc(%ebx),%eax
 804949f:	04 04                	add    $0x4,%al
 80494a1:	00 00                	add    %al,(%eax)
 80494a3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80494a6:	00 00                	add    %al,(%eax)
 80494a8:	70 02                	jo     80494ac <_ZTI10base_class+0x320>
 80494aa:	00 00                	add    %al,(%eax)
 80494ac:	cc                   	int3   
 80494ad:	f5                   	cmc    
 80494ae:	ff                   	(bad)  
 80494af:	ff 41 00             	incl   0x0(%ecx)
 80494b2:	00 00                	add    %al,(%eax)
 80494b4:	00 41 0e             	add    %al,0xe(%ecx)
 80494b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80494bd:	7d c5                	jge    8049484 <_ZTI10base_class+0x2f8>
 80494bf:	0c 04                	or     $0x4,%al
 80494c1:	04 00                	add    $0x0,%al
 80494c3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 80494c6:	00 00                	add    %al,(%eax)
 80494c8:	90                   	nop
 80494c9:	02 00                	add    (%eax),%al
 80494cb:	00 ed                	add    %ch,%ch
 80494cd:	f5                   	cmc    
 80494ce:	ff                   	(bad)  
 80494cf:	ff 1a                	lcall  *(%edx)
 80494d1:	00 00                	add    %al,(%eax)
 80494d3:	00 00                	add    %al,(%eax)
 80494d5:	41                   	inc    %ecx
 80494d6:	0e                   	push   %cs
 80494d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80494dd:	56                   	push   %esi
 80494de:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80494e1:	04 00                	add    $0x0,%al
 80494e3:	00 38                	add    %bh,(%eax)
 80494e5:	00 00                	add    %al,(%eax)
 80494e7:	00 b0 02 00 00 c4    	add    %dh,-0x3bfffffe(%eax)
 80494ed:	f9                   	stc    
 80494ee:	ff                   	(bad)  
 80494ef:	ff 61 00             	jmp    *0x0(%ecx)
 80494f2:	00 00                	add    %al,(%eax)
 80494f4:	00 41 0e             	add    %al,0xe(%ecx)
 80494f7:	08 85 02 41 0e 0c    	or     %al,0xc0e4102(%ebp)
 80494fd:	87 03                	xchg   %eax,(%ebx)
 80494ff:	43                   	inc    %ebx
 8049500:	0e                   	push   %cs
 8049501:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
 8049507:	83 05 4e 0e 30 02 48 	addl   $0x48,0x2300e4e
 804950e:	0e                   	push   %cs
 804950f:	14 41                	adc    $0x41,%al
 8049511:	c3                   	ret    
 8049512:	0e                   	push   %cs
 8049513:	10 41 c6             	adc    %al,-0x3a(%ecx)
 8049516:	0e                   	push   %cs
 8049517:	0c 41                	or     $0x41,%al
 8049519:	c7                   	(bad)  
 804951a:	0e                   	push   %cs
 804951b:	08 41 c5             	or     %al,-0x3b(%ecx)
 804951e:	0e                   	push   %cs
 804951f:	04 10                	add    $0x10,%al
 8049521:	00 00                	add    %al,(%eax)
 8049523:	00 ec                	add    %ch,%ah
 8049525:	02 00                	add    (%eax),%al
 8049527:	00 f8                	add    %bh,%al
 8049529:	f9                   	stc    
 804952a:	ff                   	(bad)  
 804952b:	ff 02                	incl   (%edx)
 804952d:	00 00                	add    %al,(%eax)
 804952f:	00 00                	add    %al,(%eax)
 8049531:	00 00                	add    %al,(%eax)
	...

08049534 <__FRAME_END__>:
 8049534:	00 00                	add    %al,(%eax)
	...

Disassembly of section .gcc_except_table:

08049538 <.gcc_except_table>:
 8049538:	ff                   	(bad)  
 8049539:	ff 01                	incl   (%ecx)
 804953b:	0c 0e                	or     $0xe,%al
 804953d:	05 00 00 36 16       	add    $0x16360000,%eax
 8049542:	51                   	push   %ecx
 8049543:	00 68 05             	add    %ch,0x5(%eax)
 8049546:	00 00                	add    %al,(%eax)
 8049548:	ff                   	(bad)  
 8049549:	ff 01                	incl   (%ecx)
 804954b:	0c 27                	or     $0x27,%al
 804954d:	16                   	push   %ss
 804954e:	68 00 47 05 00       	push   $0x54700
 8049553:	00 7f 05             	add    %bh,0x5(%edi)
 8049556:	00 00                	add    %al,(%eax)
 8049558:	ff                   	(bad)  
 8049559:	ff 01                	incl   (%ecx)
 804955b:	0c 0e                	or     $0xe,%al
 804955d:	05 00 00 36 16       	add    $0x16360000,%eax
 8049562:	51                   	push   %ecx
 8049563:	00 68 05             	add    %ch,0x5(%eax)
 8049566:	00 00                	add    %al,(%eax)
 8049568:	ff                   	(bad)  
 8049569:	ff 01                	incl   (%ecx)
 804956b:	0c 27                	or     $0x27,%al
 804956d:	16                   	push   %ss
 804956e:	68 00 47 05 00       	push   $0x54700
 8049573:	00 7f 05             	add    %bh,0x5(%edi)
 8049576:	00 00                	add    %al,(%eax)
 8049578:	ff                   	(bad)  
 8049579:	ff 01                	incl   (%ecx)
 804957b:	2c 26                	sub    $0x26,%al
 804957d:	25 00 00 5b 25       	and    $0x255b0000,%eax
 8049582:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 8049583:	04 00                	add    $0x0,%al
 8049585:	90                   	nop
 8049586:	01 25 94 04 00 c5    	add    %esp,0xc5000494
 804958c:	01 83 02 81 04 00    	add    %eax,0x48102(%ebx)
 8049592:	d7                   	xlat   %ds:(%ebx)
 8049593:	03 05 94 04 00 e6    	add    0xe6000494,%eax
 8049599:	03 05 a7 04 00 f5    	add    0xf50004a7,%eax
 804959f:	03 05 00 00 be 04    	add    0x4be0000,%eax
 80495a5:	05                   	.byte 0x5
	...

Disassembly of section .init_array:

0804a5a8 <__frame_dummy_init_array_entry>:
 804a5a8:	00 88 04 08 b9 8a    	add    %cl,-0x7546f7fc(%eax)
 804a5ae:	04 08                	add    $0x8,%al

Disassembly of section .fini_array:

0804a5b0 <__do_global_dtors_aux_fini_array_entry>:
 804a5b0:	e0 87                	loopne 804a539 <__FRAME_END__+0x1005>
 804a5b2:	04 08                	add    $0x8,%al

Disassembly of section .jcr:

0804a5b4 <__JCR_END__>:
 804a5b4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

0804a5b8 <_DYNAMIC>:
 804a5b8:	01 00                	add    %eax,(%eax)
 804a5ba:	00 00                	add    %al,(%eax)
 804a5bc:	01 00                	add    %eax,(%eax)
 804a5be:	00 00                	add    %al,(%eax)
 804a5c0:	01 00                	add    %eax,(%eax)
 804a5c2:	00 00                	add    %al,(%eax)
 804a5c4:	92                   	xchg   %eax,%edx
 804a5c5:	01 00                	add    %eax,(%eax)
 804a5c7:	00 01                	add    %al,(%ecx)
 804a5c9:	00 00                	add    %al,(%eax)
 804a5cb:	00 9c 01 00 00 01 00 	add    %bl,0x10000(%ecx,%eax,1)
 804a5d2:	00 00                	add    %al,(%eax)
 804a5d4:	b9 01 00 00 0c       	mov    $0xc000001,%ecx
 804a5d9:	00 00                	add    %al,(%eax)
 804a5db:	00 40 86             	add    %al,-0x7a(%eax)
 804a5de:	04 08                	add    $0x8,%al
 804a5e0:	0d 00 00 00 24       	or     $0x24000000,%eax
 804a5e5:	8f 04 08             	popl   (%eax,%ecx,1)
 804a5e8:	19 00                	sbb    %eax,(%eax)
 804a5ea:	00 00                	add    %al,(%eax)
 804a5ec:	a8 a5                	test   $0xa5,%al
 804a5ee:	04 08                	add    $0x8,%al
 804a5f0:	1b 00                	sbb    (%eax),%eax
 804a5f2:	00 00                	add    %al,(%eax)
 804a5f4:	08 00                	or     %al,(%eax)
 804a5f6:	00 00                	add    %al,(%eax)
 804a5f8:	1a 00                	sbb    (%eax),%al
 804a5fa:	00 00                	add    %al,(%eax)
 804a5fc:	b0 a5                	mov    $0xa5,%al
 804a5fe:	04 08                	add    $0x8,%al
 804a600:	1c 00                	sbb    $0x0,%al
 804a602:	00 00                	add    %al,(%eax)
 804a604:	04 00                	add    $0x0,%al
 804a606:	00 00                	add    %al,(%eax)
 804a608:	f5                   	cmc    
 804a609:	fe                   	(bad)  
 804a60a:	ff 6f 8c             	ljmp   *-0x74(%edi)
 804a60d:	81 04 08 05 00 00 00 	addl   $0x5,(%eax,%ecx,1)
 804a614:	fc                   	cld    
 804a615:	82                   	(bad)  
 804a616:	04 08                	add    $0x8,%al
 804a618:	06                   	push   %es
 804a619:	00 00                	add    %al,(%eax)
 804a61b:	00 cc                	add    %cl,%ah
 804a61d:	81 04 08 0a 00 00 00 	addl   $0xa,(%eax,%ecx,1)
 804a624:	26 02 00             	add    %es:(%eax),%al
 804a627:	00 0b                	add    %cl,(%ebx)
 804a629:	00 00                	add    %al,(%eax)
 804a62b:	00 10                	add    %dl,(%eax)
 804a62d:	00 00                	add    %al,(%eax)
 804a62f:	00 15 00 00 00 00    	add    %dl,0x0
 804a635:	00 00                	add    %al,(%eax)
 804a637:	00 03                	add    %al,(%ebx)
 804a639:	00 00                	add    %al,(%eax)
 804a63b:	00 bc a6 04 08 02 00 	add    %bh,0x20804(%esi,%eiz,4)
 804a642:	00 00                	add    %al,(%eax)
 804a644:	58                   	pop    %eax
 804a645:	00 00                	add    %al,(%eax)
 804a647:	00 14 00             	add    %dl,(%eax,%eax,1)
 804a64a:	00 00                	add    %al,(%eax)
 804a64c:	11 00                	adc    %eax,(%eax)
 804a64e:	00 00                	add    %al,(%eax)
 804a650:	17                   	pop    %ss
 804a651:	00 00                	add    %al,(%eax)
 804a653:	00 e8                	add    %ch,%al
 804a655:	85 04 08             	test   %eax,(%eax,%ecx,1)
 804a658:	11 00                	adc    %eax,(%eax)
 804a65a:	00 00                	add    %al,(%eax)
 804a65c:	c8 85 04 08          	enter  $0x485,$0x8
 804a660:	12 00                	adc    (%eax),%al
 804a662:	00 00                	add    %al,(%eax)
 804a664:	20 00                	and    %al,(%eax)
 804a666:	00 00                	add    %al,(%eax)
 804a668:	13 00                	adc    (%eax),%eax
 804a66a:	00 00                	add    %al,(%eax)
 804a66c:	08 00                	or     %al,(%eax)
 804a66e:	00 00                	add    %al,(%eax)
 804a670:	fe                   	(bad)  
 804a671:	ff                   	(bad)  
 804a672:	ff 6f 48             	ljmp   *0x48(%edi)
 804a675:	85 04 08             	test   %eax,(%eax,%ecx,1)
 804a678:	ff                   	(bad)  
 804a679:	ff                   	(bad)  
 804a67a:	ff 6f 03             	ljmp   *0x3(%edi)
 804a67d:	00 00                	add    %al,(%eax)
 804a67f:	00 f0                	add    %dh,%al
 804a681:	ff                   	(bad)  
 804a682:	ff 6f 22             	ljmp   *0x22(%edi)
 804a685:	85 04 08             	test   %eax,(%eax,%ecx,1)
	...

Disassembly of section .got:

0804a6b8 <.got>:
 804a6b8:	00 00                	add    %al,(%eax)
	...

Disassembly of section .got.plt:

0804a6bc <_GLOBAL_OFFSET_TABLE_>:
 804a6bc:	b8 a5 04 08 00       	mov    $0x804a5,%eax
 804a6c1:	00 00                	add    %al,(%eax)
 804a6c3:	00 00                	add    %al,(%eax)
 804a6c5:	00 00                	add    %al,(%eax)
 804a6c7:	00 86 86 04 08 96    	add    %al,-0x69f7fb7a(%esi)
 804a6cd:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 804a6d0:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 804a6d1:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 804a6d4:	b6 86                	mov    $0x86,%dh
 804a6d6:	04 08                	add    $0x8,%al
 804a6d8:	c6 86 04 08 d6 86 04 	movb   $0x4,-0x7929f7fc(%esi)
 804a6df:	08 e6                	or     %ah,%dh
 804a6e1:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 804a6e4:	f6 86 04 08 06 87 04 	testb  $0x4,-0x78f9f7fc(%esi)
 804a6eb:	08 16                	or     %dl,(%esi)
 804a6ed:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 804a6f0:	26 87 04 08          	xchg   %eax,%es:(%eax,%ecx,1)

Disassembly of section .data:

0804a6f4 <__data_start>:
 804a6f4:	00 00                	add    %al,(%eax)
	...

0804a6f8 <__dso_handle>:
 804a6f8:	00 00                	add    %al,(%eax)
	...

Disassembly of section .bss:

0804a700 <_ZTVN10__cxxabiv117__class_type_infoE@@CXXABI_1.3>:
	...

0804a740 <_ZSt4cout@@GLIBCXX_3.4>:
	...

0804a7e0 <_ZTVN10__cxxabiv120__si_class_type_infoE@@CXXABI_1.3>:
	...

0804a80c <completed.6279>:
	...

0804a80d <_ZStL8__ioinit>:
 804a80d:	00 00                	add    %al,(%eax)
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
   9:	69 61 6e 20 34 2e 39 	imul   $0x392e3420,0x6e(%ecx),%esp
  10:	2e 32 2d 31 30 29 20 	xor    %cs:0x20293031,%ch
  17:	34 2e                	xor    $0x2e,%al
  19:	39 2e                	cmp    %ebp,(%esi)
  1b:	32 00                	xor    (%eax),%al
  1d:	47                   	inc    %edi
  1e:	43                   	inc    %ebx
  1f:	43                   	inc    %ebx
  20:	3a 20                	cmp    (%eax),%ah
  22:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
  26:	69 61 6e 20 34 2e 38 	imul   $0x382e3420,0x6e(%ecx),%esp
  2d:	2e 34 2d             	cs xor $0x2d,%al
  30:	31 29                	xor    %ebp,(%ecx)
  32:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  35:	38 2e                	cmp    %ch,(%esi)
  37:	34 00                	xor    $0x0,%al

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	84 00                	test   %al,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	2b 88 04 08 a8 02    	sub    0x2a80804(%eax),%ecx
  16:	00 00                	add    %al,(%eax)
  18:	d4 8a                	aam    $0x8a
  1a:	04 08                	add    $0x8,%al
  1c:	41                   	inc    %ecx
  1d:	00 00                	add    %al,(%eax)
  1f:	00 16                	add    %dl,(%esi)
  21:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  24:	58                   	pop    %eax
  25:	00 00                	add    %al,(%eax)
  27:	00 6e 8b             	add    %ch,-0x75(%esi)
  2a:	04 08                	add    $0x8,%al
  2c:	24 00                	and    $0x0,%al
  2e:	00 00                	add    %al,(%eax)
  30:	92                   	xchg   %eax,%edx
  31:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  34:	33 00                	xor    (%eax),%eax
  36:	00 00                	add    %al,(%eax)
  38:	c6                   	(bad)  
  39:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  3c:	33 00                	xor    (%eax),%eax
  3e:	00 00                	add    %al,(%eax)
  40:	fa                   	cli    
  41:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  44:	72 00                	jb     46 <_init-0x80485fa>
  46:	00 00                	add    %al,(%eax)
  48:	6c                   	insb   (%dx),%es:(%edi)
  49:	8c 04 08             	mov    %es,(%eax,%ecx,1)
  4c:	89 00                	mov    %eax,(%eax)
  4e:	00 00                	add    %al,(%eax)
  50:	f6                   	(bad)  
  51:	8c 04 08             	mov    %es,(%eax,%ecx,1)
  54:	24 00                	and    $0x0,%al
  56:	00 00                	add    %al,(%eax)
  58:	1a 8d 04 08 33 00    	sbb    0x330804(%ebp),%cl
  5e:	00 00                	add    %al,(%eax)
  60:	4e                   	dec    %esi
  61:	8d 04 08             	lea    (%eax,%ecx,1),%eax
  64:	72 00                	jb     66 <_init-0x80485da>
  66:	00 00                	add    %al,(%eax)
  68:	c0 8d 04 08 89 00 00 	rorb   $0x0,0x890804(%ebp)
  6f:	00 4a 8e             	add    %cl,-0x72(%edx)
  72:	04 08                	add    $0x8,%al
  74:	24 00                	and    $0x0,%al
  76:	00 00                	add    %al,(%eax)
  78:	6e                   	outsb  %ds:(%esi),(%dx)
  79:	8e 04 08             	mov    (%eax,%ecx,1),%es
  7c:	33 00                	xor    (%eax),%eax
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	d5 19                	aad    $0x19
       2:	00 00                	add    %al,(%eax)
       4:	04 00                	add    $0x0,%al
       6:	00 00                	add    %al,(%eax)
       8:	00 00                	add    %al,(%eax)
       a:	04 01                	add    $0x1,%al
       c:	3b 01                	cmp    (%ecx),%eax
       e:	00 00                	add    %al,(%eax)
      10:	04 c1                	add    $0xc1,%al
      12:	0b 00                	or     (%eax),%eax
      14:	00 af 04 00 00 00    	add    %ch,0x4(%edi)
	...
      22:	00 00                	add    %al,(%eax)
      24:	00 02                	add    %al,(%edx)
      26:	6e                   	outsb  %ds:(%esi),(%dx)
      27:	02 00                	add    (%eax),%al
      29:	00 03                	add    %al,(%ebx)
      2b:	38 0a                	cmp    %cl,(%edx)
      2d:	00 00                	add    %al,(%eax)
      2f:	03 40 25             	add    0x25(%eax),%eax
      32:	00 00                	add    %al,(%eax)
      34:	00 03                	add    %al,(%ebx)
      36:	48                   	dec    %eax
      37:	03 00                	add    (%eax),%eax
      39:	00 04 28             	add    %al,(%eax,%ebp,1)
      3c:	40                   	inc    %eax
      3d:	00 00                	add    %al,(%eax)
      3f:	00 04 04             	add    %al,(%esp,%eax,1)
      42:	2e 03 00             	add    %cs:(%eax),%eax
      45:	00 4a 00             	add    %cl,0x0(%edx)
      48:	00 00                	add    %al,(%eax)
      4a:	05 01 06 d6 02       	add    $0x2d60601,%eax
      4f:	00 00                	add    %al,(%eax)
      51:	03 1b                	add    (%ebx),%ebx
      53:	00 00                	add    %al,(%eax)
      55:	00 05 d4 5c 00 00    	add    %al,0x5cd4
      5b:	00 05 04 07 f6 08    	add    %al,0x8f60704
      61:	00 00                	add    %al,(%eax)
      63:	06                   	push   %es
      64:	65 0a 00             	or     %gs:(%eax),%al
      67:	00 05 61 01 5c 00    	add    %al,0x5c0161
      6d:	00 00                	add    %al,(%eax)
      6f:	07                   	pop    %es
      70:	08 06                	or     %al,(%esi)
      72:	53                   	push   %ebx
      73:	8f                   	(bad)  
      74:	0b 00                	or     (%eax),%eax
      76:	00 b3 00 00 00 08    	add    %dh,0x8000000(%ebx)
      7c:	04 06                	add    $0x6,%al
      7e:	56                   	push   %esi
      7f:	9a 00 00 00 09 28 01 	lcall  $0x128,$0x9000000
      86:	00 00                	add    %al,(%eax)
      88:	06                   	push   %es
      89:	58                   	pop    %eax
      8a:	5c                   	pop    %esp
      8b:	00 00                	add    %al,(%eax)
      8d:	00 09                	add    %cl,(%ecx)
      8f:	8e 08                	mov    (%eax),%cs
      91:	00 00                	add    %al,(%eax)
      93:	06                   	push   %es
      94:	5c                   	pop    %esp
      95:	b3 00                	mov    $0x0,%bl
      97:	00 00                	add    %al,(%eax)
      99:	00 0a                	add    %cl,(%edx)
      9b:	3c 08                	cmp    $0x8,%al
      9d:	00 00                	add    %al,(%eax)
      9f:	06                   	push   %es
      a0:	54                   	push   %esp
      a1:	ca 00 00             	lret   $0x0
      a4:	00 00                	add    %al,(%eax)
      a6:	0a 33                	or     (%ebx),%dh
      a8:	00 00                	add    %al,(%eax)
      aa:	00 06                	add    %al,(%esi)
      ac:	5d                   	pop    %ebp
      ad:	7b 00                	jnp    af <_init-0x8048591>
      af:	00 00                	add    %al,(%eax)
      b1:	04 00                	add    $0x0,%al
      b3:	0b 4a 00             	or     0x0(%edx),%ecx
      b6:	00 00                	add    %al,(%eax)
      b8:	c3                   	ret    
      b9:	00 00                	add    %al,(%eax)
      bb:	00 0c c3             	add    %cl,(%ebx,%eax,8)
      be:	00 00                	add    %al,(%eax)
      c0:	00 03                	add    %al,(%ebx)
      c2:	00 05 04 07 22 00    	add    %al,0x220704
      c8:	00 00                	add    %al,(%eax)
      ca:	0d 04 05 69 6e       	or     $0x6e690504,%eax
      cf:	74 00                	je     d1 <_init-0x804856f>
      d1:	03 91 0b 00 00 06    	add    0x600000b(%ecx),%edx
      d7:	5e                   	pop    %esi
      d8:	6f                   	outsl  %ds:(%esi),(%dx)
      d9:	00 00                	add    %al,(%eax)
      db:	00 03                	add    %al,(%ebx)
      dd:	93                   	xchg   %eax,%ebx
      de:	0b 00                	or     (%eax),%eax
      e0:	00 06                	add    %al,(%esi)
      e2:	6a d1                	push   $0xffffffd1
      e4:	00 00                	add    %al,(%eax)
      e6:	00 05 02 07 b3 0c    	add    %al,0xcb30702
      ec:	00 00                	add    %al,(%eax)
      ee:	0e                   	push   %cs
      ef:	ca 00 00             	lret   $0x0
      f2:	00 0f                	add    %cl,(%edi)
      f4:	04 f9                	add    $0xf9,%al
      f6:	00 00                	add    %al,(%eax)
      f8:	00 0e                	add    %cl,(%esi)
      fa:	4a                   	dec    %edx
      fb:	00 00                	add    %al,(%eax)
      fd:	00 10                	add    %dl,(%eax)
      ff:	73 74                	jae    175 <_init-0x80484cb>
     101:	64 00 17             	add    %dl,%fs:(%edi)
     104:	00 a0 08 00 00 11    	add    %ah,0x11000008(%eax)
     10a:	07                   	pop    %es
     10b:	40                   	inc    %eax
     10c:	dc 00                	faddl  (%eax)
     10e:	00 00                	add    %al,(%eax)
     110:	11 07                	adc    %eax,(%edi)
     112:	8b 63 00             	mov    0x0(%ebx),%esp
     115:	00 00                	add    %al,(%eax)
     117:	11 07                	adc    %eax,(%edi)
     119:	8d a0 08 00 00 11    	lea    0x11000008(%eax),%esp
     11f:	07                   	pop    %es
     120:	8e b6 08 00 00 11    	mov    0x11000008(%esi),%?
     126:	07                   	pop    %es
     127:	8f                   	(bad)  
     128:	d2 08                	rorb   %cl,(%eax)
     12a:	00 00                	add    %al,(%eax)
     12c:	11 07                	adc    %eax,(%edi)
     12e:	90                   	nop
     12f:	ff 08                	decl   (%eax)
     131:	00 00                	add    %al,(%eax)
     133:	11 07                	adc    %eax,(%edi)
     135:	91                   	xchg   %eax,%ecx
     136:	1a 09                	sbb    (%ecx),%cl
     138:	00 00                	add    %al,(%eax)
     13a:	11 07                	adc    %eax,(%edi)
     13c:	92                   	xchg   %eax,%edx
     13d:	40                   	inc    %eax
     13e:	09 00                	or     %eax,(%eax)
     140:	00 11                	add    %dl,(%ecx)
     142:	07                   	pop    %es
     143:	93                   	xchg   %eax,%ebx
     144:	5b                   	pop    %ebx
     145:	09 00                	or     %eax,(%eax)
     147:	00 11                	add    %dl,(%ecx)
     149:	07                   	pop    %es
     14a:	94                   	xchg   %eax,%esp
     14b:	77 09                	ja     156 <_init-0x80484ea>
     14d:	00 00                	add    %al,(%eax)
     14f:	11 07                	adc    %eax,(%edi)
     151:	95                   	xchg   %eax,%ebp
     152:	93                   	xchg   %eax,%ebx
     153:	09 00                	or     %eax,(%eax)
     155:	00 11                	add    %dl,(%ecx)
     157:	07                   	pop    %es
     158:	96                   	xchg   %eax,%esi
     159:	a9 09 00 00 11       	test   $0x11000009,%eax
     15e:	07                   	pop    %es
     15f:	97                   	xchg   %eax,%edi
     160:	b5 09                	mov    $0x9,%ch
     162:	00 00                	add    %al,(%eax)
     164:	11 07                	adc    %eax,(%edi)
     166:	98                   	cwtl   
     167:	db 09                	fisttpl (%ecx)
     169:	00 00                	add    %al,(%eax)
     16b:	11 07                	adc    %eax,(%edi)
     16d:	99                   	cltd   
     16e:	00 0a                	add    %cl,(%edx)
     170:	00 00                	add    %al,(%eax)
     172:	11 07                	adc    %eax,(%edi)
     174:	9a 21 0a 00 00 11 07 	lcall  $0x711,$0xa21
     17b:	9b                   	fwait
     17c:	4c                   	dec    %esp
     17d:	0a 00                	or     (%eax),%al
     17f:	00 11                	add    %dl,(%ecx)
     181:	07                   	pop    %es
     182:	9c                   	pushf  
     183:	67 0a 00             	or     (%bx,%si),%al
     186:	00 11                	add    %dl,(%ecx)
     188:	07                   	pop    %es
     189:	9e                   	sahf   
     18a:	7d 0a                	jge    196 <_init-0x80484aa>
     18c:	00 00                	add    %al,(%eax)
     18e:	11 07                	adc    %eax,(%edi)
     190:	a0 9e 0a 00 00       	mov    0xa9e,%al
     195:	11 07                	adc    %eax,(%edi)
     197:	a1 ba 0a 00 00       	mov    0xaba,%eax
     19c:	11 07                	adc    %eax,(%edi)
     19e:	a2 d5 0a 00 00       	mov    %al,0xad5
     1a3:	11 07                	adc    %eax,(%edi)
     1a5:	a4                   	movsb  %ds:(%esi),%es:(%edi)
     1a6:	f5                   	cmc    
     1a7:	0a 00                	or     (%eax),%al
     1a9:	00 11                	add    %dl,(%ecx)
     1ab:	07                   	pop    %es
     1ac:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     1ad:	15 0b 00 00 11       	adc    $0x1100000b,%eax
     1b2:	07                   	pop    %es
     1b3:	aa                   	stos   %al,%es:(%edi)
     1b4:	3a 0b                	cmp    (%ebx),%cl
     1b6:	00 00                	add    %al,(%eax)
     1b8:	11 07                	adc    %eax,(%edi)
     1ba:	ac                   	lods   %ds:(%esi),%al
     1bb:	5a                   	pop    %edx
     1bc:	0b 00                	or     (%eax),%eax
     1be:	00 11                	add    %dl,(%ecx)
     1c0:	07                   	pop    %es
     1c1:	ae                   	scas   %es:(%edi),%al
     1c2:	75 0b                	jne    1cf <_init-0x8048471>
     1c4:	00 00                	add    %al,(%eax)
     1c6:	11 07                	adc    %eax,(%edi)
     1c8:	b0 90                	mov    $0x90,%al
     1ca:	0b 00                	or     (%eax),%eax
     1cc:	00 11                	add    %dl,(%ecx)
     1ce:	07                   	pop    %es
     1cf:	b1 b6                	mov    $0xb6,%cl
     1d1:	0b 00                	or     (%eax),%eax
     1d3:	00 11                	add    %dl,(%ecx)
     1d5:	07                   	pop    %es
     1d6:	b2 d0                	mov    $0xd0,%dl
     1d8:	0b 00                	or     (%eax),%eax
     1da:	00 11                	add    %dl,(%ecx)
     1dc:	07                   	pop    %es
     1dd:	b3 ea                	mov    $0xea,%bl
     1df:	0b 00                	or     (%eax),%eax
     1e1:	00 11                	add    %dl,(%ecx)
     1e3:	07                   	pop    %es
     1e4:	b4 04                	mov    $0x4,%ah
     1e6:	0c 00                	or     $0x0,%al
     1e8:	00 11                	add    %dl,(%ecx)
     1ea:	07                   	pop    %es
     1eb:	b5 1e                	mov    $0x1e,%ch
     1ed:	0c 00                	or     $0x0,%al
     1ef:	00 11                	add    %dl,(%ecx)
     1f1:	07                   	pop    %es
     1f2:	b6 38                	mov    $0x38,%dh
     1f4:	0c 00                	or     $0x0,%al
     1f6:	00 11                	add    %dl,(%ecx)
     1f8:	07                   	pop    %es
     1f9:	b7 f8                	mov    $0xf8,%bh
     1fb:	0c 00                	or     $0x0,%al
     1fd:	00 11                	add    %dl,(%ecx)
     1ff:	07                   	pop    %es
     200:	b8 0e 0d 00 00       	mov    $0xd0e,%eax
     205:	11 07                	adc    %eax,(%edi)
     207:	b9 2d 0d 00 00       	mov    $0xd2d,%ecx
     20c:	11 07                	adc    %eax,(%edi)
     20e:	ba 4c 0d 00 00       	mov    $0xd4c,%edx
     213:	11 07                	adc    %eax,(%edi)
     215:	bb 6b 0d 00 00       	mov    $0xd6b,%ebx
     21a:	11 07                	adc    %eax,(%edi)
     21c:	bc 96 0d 00 00       	mov    $0xd96,%esp
     221:	11 07                	adc    %eax,(%edi)
     223:	bd b1 0d 00 00       	mov    $0xdb1,%ebp
     228:	11 07                	adc    %eax,(%edi)
     22a:	bf d9 0d 00 00       	mov    $0xdd9,%edi
     22f:	11 07                	adc    %eax,(%edi)
     231:	c1 fb 0d             	sar    $0xd,%ebx
     234:	00 00                	add    %al,(%eax)
     236:	11 07                	adc    %eax,(%edi)
     238:	c2 1b 0e             	ret    $0xe1b
     23b:	00 00                	add    %al,(%eax)
     23d:	11 07                	adc    %eax,(%edi)
     23f:	c3                   	ret    
     240:	42                   	inc    %edx
     241:	0e                   	push   %cs
     242:	00 00                	add    %al,(%eax)
     244:	11 07                	adc    %eax,(%edi)
     246:	c4 69 0e             	les    0xe(%ecx),%ebp
     249:	00 00                	add    %al,(%eax)
     24b:	11 07                	adc    %eax,(%edi)
     24d:	c5 88 0e 00 00 11    	lds    0x1100000e(%eax),%ecx
     253:	07                   	pop    %es
     254:	c6                   	(bad)  
     255:	9e                   	sahf   
     256:	0e                   	push   %cs
     257:	00 00                	add    %al,(%eax)
     259:	11 07                	adc    %eax,(%edi)
     25b:	c7                   	(bad)  
     25c:	be 0e 00 00 11       	mov    $0x1100000e,%esi
     261:	07                   	pop    %es
     262:	c8 de 0e 00          	enter  $0xede,$0x0
     266:	00 11                	add    %dl,(%ecx)
     268:	07                   	pop    %es
     269:	c9                   	leave  
     26a:	fe 0e                	decb   (%esi)
     26c:	00 00                	add    %al,(%eax)
     26e:	11 07                	adc    %eax,(%edi)
     270:	ca 1e 0f             	lret   $0xf1e
     273:	00 00                	add    %al,(%eax)
     275:	11 07                	adc    %eax,(%edi)
     277:	cb                   	lret   
     278:	35 0f 00 00 11       	xor    $0x1100000f,%eax
     27d:	07                   	pop    %es
     27e:	cc                   	int3   
     27f:	4c                   	dec    %esp
     280:	0f 00 00             	sldt   (%eax)
     283:	11 07                	adc    %eax,(%edi)
     285:	cd 6a                	int    $0x6a
     287:	0f 00 00             	sldt   (%eax)
     28a:	11 07                	adc    %eax,(%edi)
     28c:	ce                   	into   
     28d:	89 0f                	mov    %ecx,(%edi)
     28f:	00 00                	add    %al,(%eax)
     291:	11 07                	adc    %eax,(%edi)
     293:	cf                   	iret   
     294:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     295:	0f 00 00             	sldt   (%eax)
     298:	11 07                	adc    %eax,(%edi)
     29a:	d0 c6                	rol    %dh
     29c:	0f 00 00             	sldt   (%eax)
     29f:	12 07                	adc    (%edi),%al
     2a1:	08 01                	or     %al,(%ecx)
     2a3:	26 11 00             	adc    %eax,%es:(%eax)
     2a6:	00 12                	add    %dl,(%edx)
     2a8:	07                   	pop    %es
     2a9:	09 01                	or     %eax,(%ecx)
     2ab:	48                   	dec    %eax
     2ac:	11 00                	adc    %eax,(%eax)
     2ae:	00 12                	add    %dl,(%edx)
     2b0:	07                   	pop    %es
     2b1:	0a 01                	or     (%ecx),%al
     2b3:	6f                   	outsl  %ds:(%esi),(%dx)
     2b4:	11 00                	adc    %eax,(%eax)
     2b6:	00 13                	add    %dl,(%ebx)
     2b8:	9d                   	popf   
     2b9:	0a 00                	or     (%eax),%al
     2bb:	00 0f                	add    %cl,(%edi)
     2bd:	30 14 7f             	xor    %dl,(%edi,%edi,2)
     2c0:	07                   	pop    %es
     2c1:	00 00                	add    %al,(%eax)
     2c3:	01 08                	add    %ecx,(%eax)
     2c5:	e9 86 04 00 00       	jmp    750 <_init-0x8047ef0>
     2ca:	03 93 0a 00 00 08    	add    0x800000a(%ebx),%edx
     2d0:	eb 4a                	jmp    31c <_init-0x8048324>
     2d2:	00 00                	add    %al,(%eax)
     2d4:	00 03                	add    %al,(%ebx)
     2d6:	87 0a                	xchg   %ecx,(%edx)
     2d8:	00 00                	add    %al,(%eax)
     2da:	08 ec                	or     %ch,%ah
     2dc:	ca 00 00             	lret   $0x0
     2df:	00 15 2f 0d 00 00    	add    %dl,0xd2f
     2e5:	08 f2                	or     %dh,%dl
     2e7:	3a 0b                	cmp    (%ebx),%cl
     2e9:	00 00                	add    %al,(%eax)
     2eb:	fa                   	cli    
     2ec:	02 00                	add    (%eax),%al
     2ee:	00 16                	add    %dl,(%esi)
     2f0:	be 11 00 00 16       	mov    $0x16000011,%esi
     2f5:	c4 11                	les    (%ecx),%edx
     2f7:	00 00                	add    %al,(%eax)
     2f9:	00 0e                	add    %cl,(%esi)
     2fb:	ca 02 00             	lret   $0x2
     2fe:	00 17                	add    %dl,(%edi)
     300:	65 71 00             	gs jno 303 <_init-0x804833d>
     303:	08 f6                	or     %dh,%dh
     305:	ca 09 00             	lret   $0x9
     308:	00 ca                	add    %cl,%dl
     30a:	11 00                	adc    %eax,(%eax)
     30c:	00 1c 03             	add    %bl,(%ebx,%eax,1)
     30f:	00 00                	add    %al,(%eax)
     311:	16                   	push   %ss
     312:	c4 11                	les    (%ecx),%edx
     314:	00 00                	add    %al,(%eax)
     316:	16                   	push   %ss
     317:	c4 11                	les    (%ecx),%edx
     319:	00 00                	add    %al,(%eax)
     31b:	00 17                	add    %dl,(%edi)
     31d:	6c                   	insb   (%dx),%es:(%edi)
     31e:	74 00                	je     320 <_init-0x8048320>
     320:	08 fa                	or     %bh,%dl
     322:	84 05 00 00 ca 11    	test   %al,0x11ca0000
     328:	00 00                	add    %al,(%eax)
     32a:	39 03                	cmp    %eax,(%ebx)
     32c:	00 00                	add    %al,(%eax)
     32e:	16                   	push   %ss
     32f:	c4 11                	les    (%ecx),%edx
     331:	00 00                	add    %al,(%eax)
     333:	16                   	push   %ss
     334:	c4 11                	les    (%ecx),%edx
     336:	00 00                	add    %al,(%eax)
     338:	00 18                	add    %bl,(%eax)
     33a:	9f                   	lahf   
     33b:	04 00                	add    $0x0,%al
     33d:	00 08                	add    %cl,(%eax)
     33f:	02 01                	add    (%ecx),%al
     341:	c6                   	(bad)  
     342:	08 00                	or     %al,(%eax)
     344:	00 ca                	add    %cl,%dl
     346:	00 00                	add    %al,(%eax)
     348:	00 5d 03             	add    %bl,0x3(%ebp)
     34b:	00 00                	add    %al,(%eax)
     34d:	16                   	push   %ss
     34e:	d1 11                	rcll   (%ecx)
     350:	00 00                	add    %al,(%eax)
     352:	16                   	push   %ss
     353:	d1 11                	rcll   (%ecx)
     355:	00 00                	add    %al,(%eax)
     357:	16                   	push   %ss
     358:	86 04 00             	xchg   %al,(%eax,%eax,1)
     35b:	00 00                	add    %al,(%eax)
     35d:	18 39                	sbb    %bh,(%ecx)
     35f:	09 00                	or     %eax,(%eax)
     361:	00 08                	add    %cl,(%eax)
     363:	06                   	push   %es
     364:	01 c9                	add    %ecx,%ecx
     366:	0a 00                	or     (%eax),%al
     368:	00 86 04 00 00 77    	add    %al,0x77000004(%esi)
     36e:	03 00                	add    (%eax),%eax
     370:	00 16                	add    %dl,(%esi)
     372:	d1 11                	rcll   (%ecx)
     374:	00 00                	add    %al,(%eax)
     376:	00 18                	add    %bl,(%eax)
     378:	d8 04 00             	fadds  (%eax,%eax,1)
     37b:	00 08                	add    %cl,(%eax)
     37d:	0a 01                	or     (%ecx),%al
     37f:	58                   	pop    %eax
     380:	0d 00 00 d1 11       	or     $0x11d10000,%eax
     385:	00 00                	add    %al,(%eax)
     387:	9b                   	fwait
     388:	03 00                	add    (%eax),%eax
     38a:	00 16                	add    %dl,(%esi)
     38c:	d1 11                	rcll   (%ecx)
     38e:	00 00                	add    %al,(%eax)
     390:	16                   	push   %ss
     391:	86 04 00             	xchg   %al,(%eax,%eax,1)
     394:	00 16                	add    %dl,(%esi)
     396:	c4 11                	les    (%ecx),%edx
     398:	00 00                	add    %al,(%eax)
     39a:	00 18                	add    %bl,(%eax)
     39c:	cc                   	int3   
     39d:	03 00                	add    (%eax),%eax
     39f:	00 08                	add    %cl,(%eax)
     3a1:	0e                   	push   %cs
     3a2:	01 85 03 00 00 d7    	add    %eax,-0x28fffffd(%ebp)
     3a8:	11 00                	adc    %eax,(%eax)
     3aa:	00 bf 03 00 00 16    	add    %bh,0x16000003(%edi)
     3b0:	d7                   	xlat   %ds:(%ebx)
     3b1:	11 00                	adc    %eax,(%eax)
     3b3:	00 16                	add    %dl,(%esi)
     3b5:	d1 11                	rcll   (%ecx)
     3b7:	00 00                	add    %al,(%eax)
     3b9:	16                   	push   %ss
     3ba:	86 04 00             	xchg   %al,(%eax,%eax,1)
     3bd:	00 00                	add    %al,(%eax)
     3bf:	18 32                	sbb    %dh,(%edx)
     3c1:	02 00                	add    (%eax),%al
     3c3:	00 08                	add    %cl,(%eax)
     3c5:	12 01                	adc    (%ecx),%al
     3c7:	62 05 00 00 d7 11    	bound  %eax,0x11d70000
     3cd:	00 00                	add    %al,(%eax)
     3cf:	e3 03                	jecxz  3d4 <_init-0x804826c>
     3d1:	00 00                	add    %al,(%eax)
     3d3:	16                   	push   %ss
     3d4:	d7                   	xlat   %ds:(%ebx)
     3d5:	11 00                	adc    %eax,(%eax)
     3d7:	00 16                	add    %dl,(%esi)
     3d9:	d1 11                	rcll   (%ecx)
     3db:	00 00                	add    %al,(%eax)
     3dd:	16                   	push   %ss
     3de:	86 04 00             	xchg   %al,(%eax,%eax,1)
     3e1:	00 00                	add    %al,(%eax)
     3e3:	18 2f                	sbb    %ch,(%edi)
     3e5:	0d 00 00 08 16       	or     $0x16080000,%eax
     3ea:	01 09                	add    %ecx,(%ecx)
     3ec:	07                   	pop    %es
     3ed:	00 00                	add    %al,(%eax)
     3ef:	d7                   	xlat   %ds:(%ebx)
     3f0:	11 00                	adc    %eax,(%eax)
     3f2:	00 07                	add    %al,(%edi)
     3f4:	04 00                	add    $0x0,%al
     3f6:	00 16                	add    %dl,(%esi)
     3f8:	d7                   	xlat   %ds:(%ebx)
     3f9:	11 00                	adc    %eax,(%eax)
     3fb:	00 16                	add    %dl,(%esi)
     3fd:	86 04 00             	xchg   %al,(%eax,%eax,1)
     400:	00 16                	add    %dl,(%esi)
     402:	ca 02 00             	lret   $0x2
     405:	00 00                	add    %al,(%eax)
     407:	18 90 0a 00 00 08    	sbb    %dl,0x800000a(%eax)
     40d:	1a 01                	sbb    (%ecx),%al
     40f:	25 06 00 00 ca       	and    $0xca000006,%eax
     414:	02 00                	add    (%eax),%al
     416:	00 21                	add    %ah,(%ecx)
     418:	04 00                	add    $0x0,%al
     41a:	00 16                	add    %dl,(%esi)
     41c:	dd 11                	fstl   (%ecx)
     41e:	00 00                	add    %al,(%eax)
     420:	00 0e                	add    %cl,(%esi)
     422:	d5 02                	aad    $0x2
     424:	00 00                	add    %al,(%eax)
     426:	18 84 0a 00 00 08 20 	sbb    %al,0x20080000(%edx,%ecx,1)
     42d:	01 67 01             	add    %esp,0x1(%edi)
     430:	00 00                	add    %al,(%eax)
     432:	d5 02                	aad    $0x2
     434:	00 00                	add    %al,(%eax)
     436:	40                   	inc    %eax
     437:	04 00                	add    $0x0,%al
     439:	00 16                	add    %dl,(%esi)
     43b:	c4 11                	les    (%ecx),%edx
     43d:	00 00                	add    %al,(%eax)
     43f:	00 18                	add    %bl,(%eax)
     441:	0d 06 00 00 08       	or     $0x8000006,%eax
     446:	24 01                	and    $0x1,%al
     448:	ba 07 00 00 ca       	mov    $0xca000007,%edx
     44d:	11 00                	adc    %eax,(%eax)
     44f:	00 5f 04             	add    %bl,0x4(%edi)
     452:	00 00                	add    %al,(%eax)
     454:	16                   	push   %ss
     455:	dd 11                	fstl   (%ecx)
     457:	00 00                	add    %al,(%eax)
     459:	16                   	push   %ss
     45a:	dd 11                	fstl   (%ecx)
     45c:	00 00                	add    %al,(%eax)
     45e:	00 19                	add    %bl,(%ecx)
     460:	65 6f                	outsl  %gs:(%esi),(%dx)
     462:	66 00 08             	data16 add %cl,(%eax)
     465:	28 01                	sub    %al,(%ecx)
     467:	f3 0b 00             	repz or (%eax),%eax
     46a:	00 d5                	add    %dl,%ch
     46c:	02 00                	add    (%eax),%al
     46e:	00 1a                	add    %bl,(%edx)
     470:	40                   	inc    %eax
     471:	03 00                	add    (%eax),%eax
     473:	00 08                	add    %cl,(%eax)
     475:	2c 01                	sub    $0x1,%al
     477:	36 0d 00 00 d5 02    	ss or  $0x2d50000,%eax
     47d:	00 00                	add    %al,(%eax)
     47f:	16                   	push   %ss
     480:	dd 11                	fstl   (%ecx)
     482:	00 00                	add    %al,(%eax)
     484:	00 00                	add    %al,(%eax)
     486:	03 1b                	add    (%ebx),%ebx
     488:	00 00                	add    %al,(%eax)
     48a:	00 09                	add    %cl,(%ecx)
     48c:	bc 5c 00 00 00       	mov    $0x5c,%esp
     491:	11 0a                	adc    %ecx,(%edx)
     493:	35 e3 11 00 00       	xor    $0x11e3,%eax
     498:	11 0a                	adc    %ecx,(%edx)
     49a:	36 10 13             	adc    %dl,%ss:(%ebx)
     49d:	00 00                	add    %al,(%eax)
     49f:	11 0a                	adc    %ecx,(%edx)
     4a1:	37                   	aaa    
     4a2:	2a 13                	sub    (%ebx),%dl
     4a4:	00 00                	add    %al,(%eax)
     4a6:	03 f7                	add    %edi,%esi
     4a8:	03 00                	add    (%eax),%eax
     4aa:	00 09                	add    %cl,(%ecx)
     4ac:	bd ca 00 00 00       	mov    $0xca,%ebp
     4b1:	1b 86 06 00 00 04    	sbb    0x4000006(%esi),%eax
     4b7:	0b 33                	or     (%ebx),%esi
     4b9:	40                   	inc    %eax
     4ba:	05 00 00 1c cb       	add    $0xcb1c0000,%eax
     4bf:	00 00                	add    %al,(%eax)
     4c1:	00 01                	add    %al,(%ecx)
     4c3:	1c 7f                	sbb    $0x7f,%al
     4c5:	06                   	push   %es
     4c6:	00 00                	add    %al,(%eax)
     4c8:	02 1c a4             	add    (%esp,%eiz,4),%bl
     4cb:	05 00 00 04 1c       	add    $0x1c040000,%eax
     4d0:	52                   	push   %edx
     4d1:	04 00                	add    $0x0,%al
     4d3:	00 08                	add    %cl,(%eax)
     4d5:	1c 93                	sbb    $0x93,%al
     4d7:	04 00                	add    $0x0,%al
     4d9:	00 10                	add    %dl,(%eax)
     4db:	1c 77                	sbb    $0x77,%al
     4dd:	07                   	pop    %es
     4de:	00 00                	add    %al,(%eax)
     4e0:	20 1c 87             	and    %bl,(%edi,%eax,4)
     4e3:	08 00                	or     %al,(%eax)
     4e5:	00 c0                	add    %al,%al
     4e7:	00 1c c4             	add    %bl,(%esp,%eax,8)
     4ea:	02 00                	add    (%eax),%al
     4ec:	00 80 01 1c 6b 08    	add    %al,0x86b1c01(%eax)
     4f2:	00 00                	add    %al,(%eax)
     4f4:	80 02 1c             	addb   $0x1c,(%edx)
     4f7:	cb                   	lret   
     4f8:	05 00 00 80 04       	add    $0x4800000,%eax
     4fd:	1c e3                	sbb    $0xe3,%al
     4ff:	06                   	push   %es
     500:	00 00                	add    %al,(%eax)
     502:	80 08 1c             	orb    $0x1c,(%eax)
     505:	65 06                	gs push %es
     507:	00 00                	add    %al,(%eax)
     509:	80 10 1c             	adcb   $0x1c,(%eax)
     50c:	f0 06                	lock push %es
     50e:	00 00                	add    %al,(%eax)
     510:	80 20 1c             	andb   $0x1c,(%eax)
     513:	bf 09 00 00 80       	mov    $0x80000009,%edi
     518:	c0 00 1c             	rolb   $0x1c,(%eax)
     51b:	e4 07                	in     $0x7,%al
     51d:	00 00                	add    %al,(%eax)
     51f:	80 80 01 1c fa 06 00 	addb   $0x0,0x6fa1c01(%eax)
     526:	00 b0 01 1c 2e 01    	add    %dh,0x12e1c01(%eax)
     52c:	00 00                	add    %al,(%eax)
     52e:	ca 00 1c             	lret   $0x1c00
     531:	79 08                	jns    53b <_init-0x8048105>
     533:	00 00                	add    %al,(%eax)
     535:	84 02                	test   %al,(%edx)
     537:	1c 20                	sbb    $0x20,%al
     539:	08 00                	or     %al,(%eax)
     53b:	00 80 80 04 00 1b    	add    %al,0x1b000480(%eax)
     541:	08 02                	or     %al,(%edx)
     543:	00 00                	add    %al,(%eax)
     545:	04 0b                	add    $0xb,%al
     547:	67 79 05             	addr16 jns 54f <_init-0x80480f1>
     54a:	00 00                	add    %al,(%eax)
     54c:	1c 7e                	sbb    $0x7e,%al
     54e:	03 00                	add    (%eax),%eax
     550:	00 01                	add    %al,(%ecx)
     552:	1c ea                	sbb    $0xea,%al
     554:	09 00                	or     %eax,(%eax)
     556:	00 02                	add    %al,(%edx)
     558:	1c 20                	sbb    $0x20,%al
     55a:	03 00                	add    (%eax),%eax
     55c:	00 04 1c             	add    %al,(%esp,%ebx,1)
     55f:	d7                   	xlat   %ds:(%ebx)
     560:	05 00 00 08 1c       	add    $0x1c080000,%eax
     565:	77 03                	ja     56a <_init-0x80480d6>
     567:	00 00                	add    %al,(%eax)
     569:	10 1c 4d 06 00 00 20 	adc    %bl,0x20000006(,%ecx,2)
     570:	1c 9f                	sbb    $0x9f,%al
     572:	07                   	pop    %es
     573:	00 00                	add    %al,(%eax)
     575:	80 80 04 00 1b 4f 09 	addb   $0x9,0x4f1b0004(%eax)
     57c:	00 00                	add    %al,(%eax)
     57e:	04 0b                	add    $0xb,%al
     580:	8f                   	(bad)  
     581:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     582:	05 00 00 1c e3       	add    $0xe31c0000,%eax
     587:	02 00                	add    (%eax),%al
     589:	00 00                	add    %al,(%eax)
     58b:	1c d8                	sbb    $0xd8,%al
     58d:	00 00                	add    %al,(%eax)
     58f:	00 01                	add    %al,(%ecx)
     591:	1c 5c                	sbb    $0x5c,%al
     593:	02 00                	add    (%eax),%al
     595:	00 02                	add    %al,(%edx)
     597:	1c 74                	sbb    $0x74,%al
     599:	0c 00                	or     $0x0,%al
     59b:	00 04 1c             	add    %al,(%esp,%ebx,1)
     59e:	d2 0b                	rorb   %cl,(%ebx)
     5a0:	00 00                	add    %al,(%eax)
     5a2:	80 80 04 00 1b dd 0c 	addb   $0xc,-0x22e4fffc(%eax)
     5a9:	00 00                	add    %al,(%eax)
     5ab:	04 0b                	add    $0xb,%al
     5ad:	b5 cd                	mov    $0xcd,%ch
     5af:	05 00 00 1c 02       	add    $0x21c0000,%eax
     5b4:	01 00                	add    %eax,(%eax)
     5b6:	00 00                	add    %al,(%eax)
     5b8:	1c 00                	sbb    $0x0,%al
     5ba:	0b 00                	or     (%eax),%eax
     5bc:	00 01                	add    %al,(%ecx)
     5be:	1c 14                	sbb    $0x14,%al
     5c0:	00 00                	add    %al,(%eax)
     5c2:	00 02                	add    %al,(%edx)
     5c4:	1c 26                	sbb    $0x26,%al
     5c6:	09 00                	or     %eax,(%eax)
     5c8:	00 80 80 04 00 1d    	add    %al,0x1d000480(%eax)
     5ce:	6c                   	insb   (%dx),%es:(%edi)
     5cf:	0a 00                	or     (%eax),%al
     5d1:	00 2d 08 00 00 1e    	add    %ch,0x1e000008
     5d7:	65 0c 00             	gs or  $0x0,%al
     5da:	00 01                	add    %al,(%ecx)
     5dc:	0b 15 02 01 2c 06    	or     0x62c0102,%edx
     5e2:	00 00                	add    %al,(%eax)
     5e4:	1f                   	pop    %ds
     5e5:	19 06                	sbb    %eax,(%esi)
     5e7:	00 00                	add    %al,(%eax)
     5e9:	0b 1d 02 48 13 00    	or     0x134802,%ebx
     5ef:	00 1f                	add    %bl,(%edi)
     5f1:	40                   	inc    %eax
     5f2:	02 00                	add    (%eax),%al
     5f4:	00 0b                	add    %cl,(%ebx)
     5f6:	1e                   	push   %ds
     5f7:	02 ca                	add    %dl,%cl
     5f9:	11 00                	adc    %eax,(%eax)
     5fb:	00 20                	add    %ah,(%eax)
     5fd:	65 0c 00             	gs or  $0x0,%al
     600:	00 0b                	add    %cl,(%ebx)
     602:	19 02                	sbb    %eax,(%edx)
     604:	01 0d 06 00 00 13    	add    %ecx,0x13000006
     60a:	06                   	push   %es
     60b:	00 00                	add    %al,(%eax)
     60d:	21 5d 13             	and    %ebx,0x13(%ebp)
     610:	00 00                	add    %al,(%eax)
     612:	00 22                	add    %ah,(%edx)
     614:	64 0c 00             	fs or  $0x0,%al
     617:	00 0b                	add    %cl,(%ebx)
     619:	1a 02                	sbb    (%edx),%al
     61b:	01 20                	add    %esp,(%eax)
     61d:	06                   	push   %es
     61e:	00 00                	add    %al,(%eax)
     620:	21 5d 13             	and    %ebx,0x13(%ebp)
     623:	00 00                	add    %al,(%eax)
     625:	21 ca                	and    %ecx,%edx
     627:	00 00                	add    %al,(%eax)
     629:	00 00                	add    %al,(%eax)
     62b:	00 23                	add    %ah,(%ebx)
     62d:	ea 0c 00 00 0b ff b1 	ljmp   $0xb1ff,$0xb00000c
     634:	04 00                	add    $0x0,%al
     636:	00 01                	add    %al,(%ecx)
     638:	24 ce                	and    $0xce,%al
     63a:	00 00                	add    %al,(%eax)
     63c:	00 0b                	add    %cl,(%ebx)
     63e:	02 01                	add    (%ecx),%al
     640:	46                   	inc    %esi
     641:	06                   	push   %es
     642:	00 00                	add    %al,(%eax)
     644:	01 01                	add    %eax,(%ecx)
     646:	0e                   	push   %cs
     647:	2c 06                	sub    $0x6,%al
     649:	00 00                	add    %al,(%eax)
     64b:	25 64 65 63 00       	and    $0x636564,%eax
     650:	0b 05 01 46 06 00    	or     0x64601,%eax
     656:	00 01                	add    %al,(%ecx)
     658:	02 24 a7             	add    (%edi,%eiz,4),%ah
     65b:	05 00 00 0b 08       	add    $0x80b0000,%eax
     660:	01 46 06             	add    %eax,0x6(%esi)
     663:	00 00                	add    %al,(%eax)
     665:	01 04 25 68 65 78 00 	add    %eax,0x786568(,%eiz,1)
     66c:	0b 0b                	or     (%ebx),%ecx
     66e:	01 46 06             	add    %eax,0x6(%esi)
     671:	00 00                	add    %al,(%eax)
     673:	01 08                	add    %ecx,(%eax)
     675:	24 96                	and    $0x96,%al
     677:	04 00                	add    $0x0,%al
     679:	00 0b                	add    %cl,(%ebx)
     67b:	10 01                	adc    %al,(%ecx)
     67d:	46                   	inc    %esi
     67e:	06                   	push   %es
     67f:	00 00                	add    %al,(%eax)
     681:	01 10                	add    %edx,(%eax)
     683:	24 7a                	and    $0x7a,%al
     685:	07                   	pop    %es
     686:	00 00                	add    %al,(%eax)
     688:	0b 14 01             	or     (%ecx,%eax,1),%edx
     68b:	46                   	inc    %esi
     68c:	06                   	push   %es
     68d:	00 00                	add    %al,(%eax)
     68f:	01 20                	add    %esp,(%eax)
     691:	25 6f 63 74 00       	and    $0x74636f,%eax
     696:	0b 17                	or     (%edi),%edx
     698:	01 46 06             	add    %eax,0x6(%esi)
     69b:	00 00                	add    %al,(%eax)
     69d:	01 40 24             	add    %eax,0x24(%eax)
     6a0:	c7 02 00 00 0b 1b    	movl   $0x1b0b0000,(%edx)
     6a6:	01 46 06             	add    %eax,0x6(%esi)
     6a9:	00 00                	add    %al,(%eax)
     6ab:	01 80 26 6e 08 00    	add    %eax,0x86e26(%eax)
     6b1:	00 0b                	add    %cl,(%ebx)
     6b3:	1e                   	push   %ds
     6b4:	01 46 06             	add    %eax,0x6(%esi)
     6b7:	00 00                	add    %al,(%eax)
     6b9:	01 00                	add    %eax,(%eax)
     6bb:	01 26                	add    %esp,(%esi)
     6bd:	ce                   	into   
     6be:	05 00 00 0b 22       	add    $0x220b0000,%eax
     6c3:	01 46 06             	add    %eax,0x6(%esi)
     6c6:	00 00                	add    %al,(%eax)
     6c8:	01 00                	add    %eax,(%eax)
     6ca:	02 26                	add    (%esi),%ah
     6cc:	e6 06                	out    %al,$0x6
     6ce:	00 00                	add    %al,(%eax)
     6d0:	0b 26                	or     (%esi),%esp
     6d2:	01 46 06             	add    %eax,0x6(%esi)
     6d5:	00 00                	add    %al,(%eax)
     6d7:	01 00                	add    %eax,(%eax)
     6d9:	04 26                	add    $0x26,%al
     6db:	68 06 00 00 0b       	push   $0xb000006
     6e0:	29 01                	sub    %eax,(%ecx)
     6e2:	46                   	inc    %esi
     6e3:	06                   	push   %es
     6e4:	00 00                	add    %al,(%eax)
     6e6:	01 00                	add    %eax,(%eax)
     6e8:	08 26                	or     %ah,(%esi)
     6ea:	f3 06                	repz push %es
     6ec:	00 00                	add    %al,(%eax)
     6ee:	0b 2c 01             	or     (%ecx,%eax,1),%ebp
     6f1:	46                   	inc    %esi
     6f2:	06                   	push   %es
     6f3:	00 00                	add    %al,(%eax)
     6f5:	01 00                	add    %eax,(%eax)
     6f7:	10 26                	adc    %ah,(%esi)
     6f9:	c2 09 00             	ret    $0x9
     6fc:	00 0b                	add    %cl,(%ebx)
     6fe:	2f                   	das    
     6ff:	01 46 06             	add    %eax,0x6(%esi)
     702:	00 00                	add    %al,(%eax)
     704:	01 00                	add    %eax,(%eax)
     706:	20 26                	and    %ah,(%esi)
     708:	e7 07                	out    %eax,$0x7
     70a:	00 00                	add    %al,(%eax)
     70c:	0b 33                	or     (%ebx),%esi
     70e:	01 46 06             	add    %eax,0x6(%esi)
     711:	00 00                	add    %al,(%eax)
     713:	01 00                	add    %eax,(%eax)
     715:	40                   	inc    %eax
     716:	24 fd                	and    $0xfd,%al
     718:	06                   	push   %es
     719:	00 00                	add    %al,(%eax)
     71b:	0b 36                	or     (%esi),%esi
     71d:	01 46 06             	add    %eax,0x6(%esi)
     720:	00 00                	add    %al,(%eax)
     722:	01 b0 24 31 01 00    	add    %esi,0x13124(%eax)
     728:	00 0b                	add    %cl,(%ebx)
     72a:	39 01                	cmp    %eax,(%ecx)
     72c:	46                   	inc    %esi
     72d:	06                   	push   %es
     72e:	00 00                	add    %al,(%eax)
     730:	01 4a 26             	add    %ecx,0x26(%edx)
     733:	7c 08                	jl     73d <_init-0x8047f03>
     735:	00 00                	add    %al,(%eax)
     737:	0b 3c 01             	or     (%ecx,%eax,1),%edi
     73a:	46                   	inc    %esi
     73b:	06                   	push   %es
     73c:	00 00                	add    %al,(%eax)
     73e:	01 04 01             	add    %eax,(%ecx,%eax,1)
     741:	27                   	daa    
     742:	7c 0a                	jl     74e <_init-0x8047ef2>
     744:	00 00                	add    %al,(%eax)
     746:	0b 4a 01             	or     0x1(%edx),%ecx
     749:	79 05                	jns    750 <_init-0x8047ef0>
     74b:	00 00                	add    %al,(%eax)
     74d:	01 24 db             	add    %esp,(%ebx,%ebx,8)
     750:	00 00                	add    %al,(%eax)
     752:	00 0b                	add    %cl,(%ebx)
     754:	4e                   	dec    %esi
     755:	01 5c 07 00          	add    %ebx,0x0(%edi,%eax,1)
     759:	00 01                	add    %al,(%ecx)
     75b:	01 0e                	add    %ecx,(%esi)
     75d:	41                   	inc    %ecx
     75e:	07                   	pop    %es
     75f:	00 00                	add    %al,(%eax)
     761:	24 5f                	and    $0x5f,%al
     763:	02 00                	add    (%eax),%al
     765:	00 0b                	add    %cl,(%ebx)
     767:	51                   	push   %ecx
     768:	01 5c 07 00          	add    %ebx,0x0(%edi,%eax,1)
     76c:	00 01                	add    %al,(%ecx)
     76e:	02 24 77             	add    (%edi,%esi,2),%ah
     771:	0c 00                	or     $0x0,%al
     773:	00 0b                	add    %cl,(%ebx)
     775:	56                   	push   %esi
     776:	01 5c 07 00          	add    %ebx,0x0(%edi,%eax,1)
     77a:	00 01                	add    %al,(%ecx)
     77c:	04 24                	add    $0x24,%al
     77e:	e6 02                	out    %al,$0x2
     780:	00 00                	add    %al,(%eax)
     782:	0b 59 01             	or     0x1(%ecx),%ebx
     785:	5c                   	pop    %esp
     786:	07                   	pop    %es
     787:	00 00                	add    %al,(%eax)
     789:	01 00                	add    %eax,(%eax)
     78b:	27                   	daa    
     78c:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     78d:	03 00                	add    (%eax),%eax
     78f:	00 0b                	add    %cl,(%ebx)
     791:	69 01 40 05 00 00    	imul   $0x540,(%ecx),%eax
     797:	01 25 61 70 70 00    	add    %esp,0x707061
     79d:	0b 6c 01 a6          	or     -0x5a(%ecx,%eax,1),%ebp
     7a1:	07                   	pop    %es
     7a2:	00 00                	add    %al,(%eax)
     7a4:	01 01                	add    %eax,(%ecx)
     7a6:	0e                   	push   %cs
     7a7:	8b 07                	mov    (%edi),%eax
     7a9:	00 00                	add    %al,(%eax)
     7ab:	25 61 74 65 00       	and    $0x657461,%eax
     7b0:	0b 6f 01             	or     0x1(%edi),%ebp
     7b3:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     7b4:	07                   	pop    %es
     7b5:	00 00                	add    %al,(%eax)
     7b7:	01 02                	add    %eax,(%edx)
     7b9:	24 95                	and    $0x95,%al
     7bb:	08 00                	or     %al,(%eax)
     7bd:	00 0b                	add    %cl,(%ebx)
     7bf:	74 01                	je     7c2 <_init-0x8047e7e>
     7c1:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     7c2:	07                   	pop    %es
     7c3:	00 00                	add    %al,(%eax)
     7c5:	01 04 25 69 6e 00 0b 	add    %eax,0xb006e69(,%eiz,1)
     7cc:	77 01                	ja     7cf <_init-0x8047e71>
     7ce:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     7cf:	07                   	pop    %es
     7d0:	00 00                	add    %al,(%eax)
     7d2:	01 08                	add    %ecx,(%eax)
     7d4:	25 6f 75 74 00       	and    $0x74756f,%eax
     7d9:	0b 7a 01             	or     0x1(%edx),%edi
     7dc:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     7dd:	07                   	pop    %es
     7de:	00 00                	add    %al,(%eax)
     7e0:	01 10                	add    %edx,(%eax)
     7e2:	24 50                	and    $0x50,%al
     7e4:	06                   	push   %es
     7e5:	00 00                	add    %al,(%eax)
     7e7:	0b 7d 01             	or     0x1(%ebp),%edi
     7ea:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     7eb:	07                   	pop    %es
     7ec:	00 00                	add    %al,(%eax)
     7ee:	01 20                	add    %esp,(%eax)
     7f0:	27                   	daa    
     7f1:	2b 05 00 00 0b 89    	sub    0x890b0000,%eax
     7f7:	01 a6 05 00 00 01    	add    %esp,0x1000005(%esi)
     7fd:	25 62 65 67 00       	and    $0x676562,%eax
     802:	0b 8c 01 0b 08 00 00 	or     0x80b(%ecx,%eax,1),%ecx
     809:	01 00                	add    %eax,(%eax)
     80b:	0e                   	push   %cs
     80c:	f0 07                	lock pop %es
     80e:	00 00                	add    %al,(%eax)
     810:	25 63 75 72 00       	and    $0x727563,%eax
     815:	0b 8f 01 0b 08 00    	or     0x80b01(%edi),%ecx
     81b:	00 01                	add    %al,(%ecx)
     81d:	01 25 65 6e 64 00    	add    %esp,0x646e65
     823:	0b 92 01 0b 08 00    	or     0x80b01(%edx),%edx
     829:	00 01                	add    %al,(%ecx)
     82b:	02 00                	add    (%eax),%al
     82d:	11 0c 52             	adc    %ecx,(%edx,%edx,2)
     830:	6e                   	outsb  %ds:(%esi),(%dx)
     831:	13 00                	adc    (%eax),%eax
     833:	00 11                	add    %dl,(%ecx)
     835:	0c 53                	or     $0x53,%al
     837:	63 13                	arpl   %dx,(%ebx)
     839:	00 00                	add    %al,(%eax)
     83b:	11 0c 54             	adc    %ecx,(%esp,%edx,2)
     83e:	63 00                	arpl   %ax,(%eax)
     840:	00 00                	add    %al,(%eax)
     842:	11 0c 5c             	adc    %ecx,(%esp,%ebx,2)
     845:	84 13                	test   %dl,(%ebx)
     847:	00 00                	add    %al,(%eax)
     849:	11 0c 65 9e 13 00 00 	adc    %ecx,0x139e(,%eiz,2)
     850:	11 0c 68             	adc    %ecx,(%eax,%ebp,2)
     853:	b8 13 00 00 11       	mov    $0x11000013,%eax
     858:	0c 69                	or     $0x69,%al
     85a:	cd 13                	int    $0x13
     85c:	00 00                	add    %al,(%eax)
     85e:	1d 77 02 00 00       	sbb    $0x277,%eax
     863:	7a 08                	jp     86d <_init-0x8047dd3>
     865:	00 00                	add    %al,(%eax)
     867:	28 fb                	sub    %bh,%bl
     869:	04 00                	add    $0x0,%al
     86b:	00 4a 00             	add    %cl,0x0(%edx)
     86e:	00 00                	add    %al,(%eax)
     870:	29 c6                	sub    %eax,%esi
     872:	0c 00                	or     $0x0,%al
     874:	00 be 02 00 00 00    	add    %bh,0x2(%esi)
     87a:	03 34 08             	add    (%eax,%ecx,1),%esi
     87d:	00 00                	add    %al,(%eax)
     87f:	0d 88 5e 08 00       	or     $0x85e88,%eax
     884:	00 2a                	add    %ch,(%edx)
     886:	6b 07 00             	imul   $0x0,(%edi),%eax
     889:	00 02                	add    %al,(%edx)
     88b:	3d 66 07 00 00       	cmp    $0x766,%eax
     890:	7a 08                	jp     89a <_init-0x8047da6>
     892:	00 00                	add    %al,(%eax)
     894:	2b 37                	sub    (%edi),%esi
     896:	02 00                	add    (%eax),%al
     898:	00 02                	add    %al,(%edx)
     89a:	4a                   	dec    %edx
     89b:	d6                   	(bad)  
     89c:	05 00 00 00 2c       	add    $0x2c000000,%eax
     8a1:	d7                   	xlat   %ds:(%ebx)
     8a2:	03 00                	add    (%eax),%eax
     8a4:	00 06                	add    %al,(%esi)
     8a6:	61                   	popa   
     8a7:	01 63 00             	add    %esp,0x0(%ebx)
     8aa:	00 00                	add    %al,(%eax)
     8ac:	b6 08                	mov    $0x8,%dh
     8ae:	00 00                	add    %al,(%eax)
     8b0:	16                   	push   %ss
     8b1:	ca 00 00             	lret   $0x0
     8b4:	00 00                	add    %al,(%eax)
     8b6:	2c ad                	sub    $0xad,%al
     8b8:	02 00                	add    (%eax),%al
     8ba:	00 06                	add    %al,(%esi)
     8bc:	e9 02 63 00 00       	jmp    6bc3 <_init-0x8041a7d>
     8c1:	00 cc                	add    %cl,%ah
     8c3:	08 00                	or     %al,(%eax)
     8c5:	00 16                	add    %dl,(%esi)
     8c7:	cc                   	int3   
     8c8:	08 00                	or     %al,(%eax)
     8ca:	00 00                	add    %al,(%eax)
     8cc:	0f 04                	(bad)  
     8ce:	2a 00                	sub    (%eax),%al
     8d0:	00 00                	add    %al,(%eax)
     8d2:	2c bd                	sub    $0xbd,%al
     8d4:	02 00                	add    (%eax),%al
     8d6:	00 06                	add    %al,(%esi)
     8d8:	06                   	push   %es
     8d9:	03 f2                	add    %edx,%esi
     8db:	08 00                	or     %al,(%eax)
     8dd:	00 f2                	add    %dh,%dl
     8df:	08 00                	or     %al,(%eax)
     8e1:	00 16                	add    %dl,(%esi)
     8e3:	f2 08 00             	repnz or %al,(%eax)
     8e6:	00 16                	add    %dl,(%esi)
     8e8:	ca 00 00             	lret   $0x0
     8eb:	00 16                	add    %dl,(%esi)
     8ed:	cc                   	int3   
     8ee:	08 00                	or     %al,(%eax)
     8f0:	00 00                	add    %al,(%eax)
     8f2:	0f 04                	(bad)  
     8f4:	f8                   	clc    
     8f5:	08 00                	or     %al,(%eax)
     8f7:	00 05 04 05 7c 0d    	add    %al,0xd7c0504
     8fd:	00 00                	add    %al,(%eax)
     8ff:	2c 56                	sub    $0x56,%al
     901:	0c 00                	or     $0x0,%al
     903:	00 06                	add    %al,(%esi)
     905:	f7 02 63 00 00 00    	testl  $0x63,(%edx)
     90b:	1a 09                	sbb    (%ecx),%cl
     90d:	00 00                	add    %al,(%eax)
     90f:	16                   	push   %ss
     910:	f8                   	clc    
     911:	08 00                	or     %al,(%eax)
     913:	00 16                	add    %dl,(%esi)
     915:	cc                   	int3   
     916:	08 00                	or     %al,(%eax)
     918:	00 00                	add    %al,(%eax)
     91a:	2c 5d                	sub    $0x5d,%al
     91c:	0c 00                	or     $0x0,%al
     91e:	00 06                	add    %al,(%esi)
     920:	0d 03 ca 00 00       	or     $0xca03,%eax
     925:	00 35 09 00 00 16    	add    %dh,0x16000009
     92b:	35 09 00 00 16       	xor    $0x16000009,%eax
     930:	cc                   	int3   
     931:	08 00                	or     %al,(%eax)
     933:	00 00                	add    %al,(%eax)
     935:	0f 04                	(bad)  
     937:	3b 09                	cmp    (%ecx),%ecx
     939:	00 00                	add    %al,(%eax)
     93b:	0e                   	push   %cs
     93c:	f8                   	clc    
     93d:	08 00                	or     %al,(%eax)
     93f:	00 2c 33             	add    %ch,(%ebx,%esi,1)
     942:	05 00 00 06 4b       	add    $0x4b060000,%eax
     947:	02 ca                	add    %dl,%cl
     949:	00 00                	add    %al,(%eax)
     94b:	00 5b 09             	add    %bl,0x9(%ebx)
     94e:	00 00                	add    %al,(%eax)
     950:	16                   	push   %ss
     951:	cc                   	int3   
     952:	08 00                	or     %al,(%eax)
     954:	00 16                	add    %dl,(%esi)
     956:	ca 00 00             	lret   $0x0
     959:	00 00                	add    %al,(%eax)
     95b:	2c ea                	sub    $0xea,%al
     95d:	05 00 00 06 52       	add    $0x52060000,%eax
     962:	02 ca                	add    %dl,%cl
     964:	00 00                	add    %al,(%eax)
     966:	00 77 09             	add    %dh,0x9(%edi)
     969:	00 00                	add    %al,(%eax)
     96b:	16                   	push   %ss
     96c:	cc                   	int3   
     96d:	08 00                	or     %al,(%eax)
     96f:	00 16                	add    %dl,(%esi)
     971:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     976:	00 2c d5 0c 00 00 06 	add    %ch,0x600000c(,%edx,8)
     97d:	7b 02                	jnp    981 <_init-0x8047cbf>
     97f:	ca 00 00             	lret   $0x0
     982:	00 93 09 00 00 16    	add    %dl,0x16000009(%ebx)
     988:	cc                   	int3   
     989:	08 00                	or     %al,(%eax)
     98b:	00 16                	add    %dl,(%esi)
     98d:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     992:	00 2c ae             	add    %ch,(%esi,%ebp,4)
     995:	02 00                	add    (%eax),%al
     997:	00 06                	add    %al,(%esi)
     999:	ea 02 63 00 00 00 a9 	ljmp   $0xa900,$0x6302
     9a0:	09 00                	or     %eax,(%eax)
     9a2:	00 16                	add    %dl,(%esi)
     9a4:	cc                   	int3   
     9a5:	08 00                	or     %al,(%eax)
     9a7:	00 00                	add    %al,(%eax)
     9a9:	2e b4 02             	cs mov $0x2,%ah
     9ac:	00 00                	add    %al,(%eax)
     9ae:	06                   	push   %es
     9af:	f0 02 63 00          	lock add 0x0(%ebx),%ah
     9b3:	00 00                	add    %al,(%eax)
     9b5:	2c 3d                	sub    $0x3d,%al
     9b7:	04 00                	add    $0x0,%al
     9b9:	00 06                	add    %al,(%esi)
     9bb:	78 01                	js     9be <_init-0x8047c82>
     9bd:	51                   	push   %ecx
     9be:	00 00                	add    %al,(%eax)
     9c0:	00 d5                	add    %dl,%ch
     9c2:	09 00                	or     %eax,(%eax)
     9c4:	00 16                	add    %dl,(%esi)
     9c6:	f3 00 00             	repz add %al,(%eax)
     9c9:	00 16                	add    %dl,(%esi)
     9cb:	51                   	push   %ecx
     9cc:	00 00                	add    %al,(%eax)
     9ce:	00 16                	add    %dl,(%esi)
     9d0:	d5 09                	aad    $0x9
     9d2:	00 00                	add    %al,(%eax)
     9d4:	00 0f                	add    %cl,(%edi)
     9d6:	04 dc                	add    $0xdc,%al
     9d8:	00 00                	add    %al,(%eax)
     9da:	00 2c e2             	add    %ch,(%edx,%eiz,8)
     9dd:	00 00                	add    %al,(%eax)
     9df:	00 06                	add    %al,(%esi)
     9e1:	6d                   	insl   (%dx),%es:(%edi)
     9e2:	01 51 00             	add    %edx,0x0(%ecx)
     9e5:	00 00                	add    %al,(%eax)
     9e7:	00 0a                	add    %cl,(%edx)
     9e9:	00 00                	add    %al,(%eax)
     9eb:	16                   	push   %ss
     9ec:	f2 08 00             	repnz or %al,(%eax)
     9ef:	00 16                	add    %dl,(%esi)
     9f1:	f3 00 00             	repz add %al,(%eax)
     9f4:	00 16                	add    %dl,(%esi)
     9f6:	51                   	push   %ecx
     9f7:	00 00                	add    %al,(%eax)
     9f9:	00 16                	add    %dl,(%esi)
     9fb:	d5 09                	aad    $0x9
     9fd:	00 00                	add    %al,(%eax)
     9ff:	00 2c 1e             	add    %ch,(%esi,%ebx,1)
     a02:	0d 00 00 06 69       	or     $0x69060000,%eax
     a07:	01 ca                	add    %ecx,%edx
     a09:	00 00                	add    %al,(%eax)
     a0b:	00 16                	add    %dl,(%esi)
     a0d:	0a 00                	or     (%eax),%al
     a0f:	00 16                	add    %dl,(%esi)
     a11:	16                   	push   %ss
     a12:	0a 00                	or     (%eax),%al
     a14:	00 00                	add    %al,(%eax)
     a16:	0f 04                	(bad)  
     a18:	1c 0a                	sbb    $0xa,%al
     a1a:	00 00                	add    %al,(%eax)
     a1c:	0e                   	push   %cs
     a1d:	dc 00                	faddl  (%eax)
     a1f:	00 00                	add    %al,(%eax)
     a21:	2c 6a                	sub    $0x6a,%al
     a23:	0c 00                	or     $0x0,%al
     a25:	00 06                	add    %al,(%esi)
     a27:	98                   	cwtl   
     a28:	01 51 00             	add    %edx,0x0(%ecx)
     a2b:	00 00                	add    %al,(%eax)
     a2d:	46                   	inc    %esi
     a2e:	0a 00                	or     (%eax),%al
     a30:	00 16                	add    %dl,(%esi)
     a32:	f2 08 00             	repnz or %al,(%eax)
     a35:	00 16                	add    %dl,(%esi)
     a37:	46                   	inc    %esi
     a38:	0a 00                	or     (%eax),%al
     a3a:	00 16                	add    %dl,(%esi)
     a3c:	51                   	push   %ecx
     a3d:	00 00                	add    %al,(%eax)
     a3f:	00 16                	add    %dl,(%esi)
     a41:	d5 09                	aad    $0x9
     a43:	00 00                	add    %al,(%eax)
     a45:	00 0f                	add    %cl,(%edi)
     a47:	04 f3                	add    $0xf3,%al
     a49:	00 00                	add    %al,(%eax)
     a4b:	00 2c 57             	add    %ch,(%edi,%edx,2)
     a4e:	0c 00                	or     $0x0,%al
     a50:	00 06                	add    %al,(%esi)
     a52:	f8                   	clc    
     a53:	02 63 00             	add    0x0(%ebx),%ah
     a56:	00 00                	add    %al,(%eax)
     a58:	67 0a 00             	or     (%bx,%si),%al
     a5b:	00 16                	add    %dl,(%esi)
     a5d:	f8                   	clc    
     a5e:	08 00                	or     %al,(%eax)
     a60:	00 16                	add    %dl,(%esi)
     a62:	cc                   	int3   
     a63:	08 00                	or     %al,(%eax)
     a65:	00 00                	add    %al,(%eax)
     a67:	2c 51                	sub    $0x51,%al
     a69:	05 00 00 06 fe       	add    $0xfe060000,%eax
     a6e:	02 63 00             	add    0x0(%ebx),%ah
     a71:	00 00                	add    %al,(%eax)
     a73:	7d 0a                	jge    a7f <_init-0x8047bc1>
     a75:	00 00                	add    %al,(%eax)
     a77:	16                   	push   %ss
     a78:	f8                   	clc    
     a79:	08 00                	or     %al,(%eax)
     a7b:	00 00                	add    %al,(%eax)
     a7d:	2c 03                	sub    $0x3,%al
     a7f:	05 00 00 06 5c       	add    $0x5c060000,%eax
     a84:	02 ca                	add    %dl,%cl
     a86:	00 00                	add    %al,(%eax)
     a88:	00 9e 0a 00 00 16    	add    %bl,0x1600000a(%esi)
     a8e:	f2 08 00             	repnz or %al,(%eax)
     a91:	00 16                	add    %dl,(%esi)
     a93:	51                   	push   %ecx
     a94:	00 00                	add    %al,(%eax)
     a96:	00 16                	add    %dl,(%esi)
     a98:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     a9d:	00 2c 05 06 00 00 06 	add    %ch,0x6000006(,%eax,1)
     aa4:	85 02                	test   %eax,(%edx)
     aa6:	ca 00 00             	lret   $0x0
     aa9:	00 ba 0a 00 00 16    	add    %bh,0x1600000a(%edx)
     aaf:	35 09 00 00 16       	xor    $0x16000009,%eax
     ab4:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     ab9:	00 2c ef             	add    %ch,(%edi,%ebp,8)
     abc:	03 00                	add    (%eax),%eax
     abe:	00 06                	add    %al,(%esi)
     ac0:	15 03 63 00 00       	adc    $0x6303,%eax
     ac5:	00 d5                	add    %dl,%ch
     ac7:	0a 00                	or     (%eax),%al
     ac9:	00 16                	add    %dl,(%esi)
     acb:	63 00                	arpl   %ax,(%eax)
     acd:	00 00                	add    %al,(%eax)
     acf:	16                   	push   %ss
     ad0:	cc                   	int3   
     ad1:	08 00                	or     %al,(%eax)
     ad3:	00 00                	add    %al,(%eax)
     ad5:	2c e9                	sub    $0xe9,%al
     ad7:	05 00 00 06 64       	add    $0x64060000,%eax
     adc:	02 ca                	add    %dl,%cl
     ade:	00 00                	add    %al,(%eax)
     ae0:	00 f5                	add    %dh,%ch
     ae2:	0a 00                	or     (%eax),%al
     ae4:	00 16                	add    %dl,(%esi)
     ae6:	cc                   	int3   
     ae7:	08 00                	or     %al,(%eax)
     ae9:	00 16                	add    %dl,(%esi)
     aeb:	35 09 00 00 16       	xor    $0x16000009,%eax
     af0:	35 00 00 00 00       	xor    $0x0,%eax
     af5:	2c d4                	sub    $0xd4,%al
     af7:	0c 00                	or     $0x0,%al
     af9:	00 06                	add    %al,(%esi)
     afb:	b1 02                	mov    $0x2,%cl
     afd:	ca 00 00             	lret   $0x0
     b00:	00 15 0b 00 00 16    	add    %dl,0x1600000b
     b06:	cc                   	int3   
     b07:	08 00                	or     %al,(%eax)
     b09:	00 16                	add    %dl,(%esi)
     b0b:	35 09 00 00 16       	xor    $0x16000009,%eax
     b10:	35 00 00 00 00       	xor    $0x0,%eax
     b15:	2c 02                	sub    $0x2,%al
     b17:	05 00 00 06 71       	add    $0x71060000,%eax
     b1c:	02 ca                	add    %dl,%cl
     b1e:	00 00                	add    %al,(%eax)
     b20:	00 3a                	add    %bh,(%edx)
     b22:	0b 00                	or     (%eax),%eax
     b24:	00 16                	add    %dl,(%esi)
     b26:	f2 08 00             	repnz or %al,(%eax)
     b29:	00 16                	add    %dl,(%esi)
     b2b:	51                   	push   %ecx
     b2c:	00 00                	add    %al,(%eax)
     b2e:	00 16                	add    %dl,(%esi)
     b30:	35 09 00 00 16       	xor    $0x16000009,%eax
     b35:	35 00 00 00 00       	xor    $0x0,%eax
     b3a:	2c 04                	sub    $0x4,%al
     b3c:	06                   	push   %es
     b3d:	00 00                	add    %al,(%eax)
     b3f:	06                   	push   %es
     b40:	bd 02 ca 00 00       	mov    $0xca02,%ebp
     b45:	00 5a 0b             	add    %bl,0xb(%edx)
     b48:	00 00                	add    %al,(%eax)
     b4a:	16                   	push   %ss
     b4b:	35 09 00 00 16       	xor    $0x16000009,%eax
     b50:	35 09 00 00 16       	xor    $0x16000009,%eax
     b55:	35 00 00 00 00       	xor    $0x0,%eax
     b5a:	2c ff                	sub    $0xff,%al
     b5c:	01 00                	add    %eax,(%eax)
     b5e:	00 06                	add    %al,(%esi)
     b60:	6c                   	insb   (%dx),%es:(%edi)
     b61:	02 ca                	add    %dl,%cl
     b63:	00 00                	add    %al,(%eax)
     b65:	00 75 0b             	add    %dh,0xb(%ebp)
     b68:	00 00                	add    %al,(%eax)
     b6a:	16                   	push   %ss
     b6b:	35 09 00 00 16       	xor    $0x16000009,%eax
     b70:	35 00 00 00 00       	xor    $0x0,%eax
     b75:	2c ca                	sub    $0xca,%al
     b77:	0b 00                	or     (%eax),%eax
     b79:	00 06                	add    %al,(%esi)
     b7b:	b9 02 ca 00 00       	mov    $0xca02,%ecx
     b80:	00 90 0b 00 00 16    	add    %dl,0x1600000b(%eax)
     b86:	35 09 00 00 16       	xor    $0x16000009,%eax
     b8b:	35 00 00 00 00       	xor    $0x0,%eax
     b90:	2c e5                	sub    $0xe5,%al
     b92:	0b 00                	or     (%eax),%eax
     b94:	00 06                	add    %al,(%esi)
     b96:	72 01                	jb     b99 <_init-0x8047aa7>
     b98:	51                   	push   %ecx
     b99:	00 00                	add    %al,(%eax)
     b9b:	00 b0 0b 00 00 16    	add    %dh,0x1600000b(%eax)
     ba1:	b0 0b                	mov    $0xb,%al
     ba3:	00 00                	add    %al,(%eax)
     ba5:	16                   	push   %ss
     ba6:	f8                   	clc    
     ba7:	08 00                	or     %al,(%eax)
     ba9:	00 16                	add    %dl,(%esi)
     bab:	d5 09                	aad    $0x9
     bad:	00 00                	add    %al,(%eax)
     baf:	00 0f                	add    %cl,(%edi)
     bb1:	04 4a                	add    $0x4a,%al
     bb3:	00 00                	add    %al,(%eax)
     bb5:	00 2f                	add    %ch,(%edi)
     bb7:	5d                   	pop    %ebp
     bb8:	0b 00                	or     (%eax),%eax
     bba:	00 06                	add    %al,(%esi)
     bbc:	9b                   	fwait
     bbd:	f2 08 00             	repnz or %al,(%eax)
     bc0:	00 d0                	add    %dl,%al
     bc2:	0b 00                	or     (%eax),%eax
     bc4:	00 16                	add    %dl,(%esi)
     bc6:	f2 08 00             	repnz or %al,(%eax)
     bc9:	00 16                	add    %dl,(%esi)
     bcb:	35 09 00 00 00       	xor    $0x9,%eax
     bd0:	2f                   	das    
     bd1:	27                   	daa    
     bd2:	03 00                	add    (%eax),%eax
     bd4:	00 06                	add    %al,(%esi)
     bd6:	a3 ca 00 00 00       	mov    %eax,0xca
     bdb:	ea 0b 00 00 16 35 09 	ljmp   $0x935,$0x1600000b
     be2:	00 00                	add    %al,(%eax)
     be4:	16                   	push   %ss
     be5:	35 09 00 00 00       	xor    $0x9,%eax
     bea:	2f                   	das    
     beb:	09 01                	or     %eax,(%ecx)
     bed:	00 00                	add    %al,(%eax)
     bef:	06                   	push   %es
     bf0:	c0 ca 00             	ror    $0x0,%dl
     bf3:	00 00                	add    %al,(%eax)
     bf5:	04 0c                	add    $0xc,%al
     bf7:	00 00                	add    %al,(%eax)
     bf9:	16                   	push   %ss
     bfa:	35 09 00 00 16       	xor    $0x16000009,%eax
     bff:	35 09 00 00 00       	xor    $0x9,%eax
     c04:	2f                   	das    
     c05:	dd 04 00             	fldl   (%eax,%eax,1)
     c08:	00 06                	add    %al,(%esi)
     c0a:	93                   	xchg   %eax,%ebx
     c0b:	f2 08 00             	repnz or %al,(%eax)
     c0e:	00 1e                	add    %bl,(%esi)
     c10:	0c 00                	or     $0x0,%al
     c12:	00 16                	add    %dl,(%esi)
     c14:	f2 08 00             	repnz or %al,(%eax)
     c17:	00 16                	add    %dl,(%esi)
     c19:	35 09 00 00 00       	xor    $0x9,%eax
     c1e:	2f                   	das    
     c1f:	91                   	xchg   %eax,%ecx
     c20:	00 00                	add    %al,(%eax)
     c22:	00 06                	add    %al,(%esi)
     c24:	fc                   	cld    
     c25:	51                   	push   %ecx
     c26:	00 00                	add    %al,(%eax)
     c28:	00 38                	add    %bh,(%eax)
     c2a:	0c 00                	or     $0x0,%al
     c2c:	00 16                	add    %dl,(%esi)
     c2e:	35 09 00 00 16       	xor    $0x16000009,%eax
     c33:	35 09 00 00 00       	xor    $0x9,%eax
     c38:	2c ea                	sub    $0xea,%al
     c3a:	0a 00                	or     (%eax),%al
     c3c:	00 06                	add    %al,(%esi)
     c3e:	57                   	push   %edi
     c3f:	03 51 00             	add    0x0(%ecx),%edx
     c42:	00 00                	add    %al,(%eax)
     c44:	5d                   	pop    %ebp
     c45:	0c 00                	or     $0x0,%al
     c47:	00 16                	add    %dl,(%esi)
     c49:	f2 08 00             	repnz or %al,(%eax)
     c4c:	00 16                	add    %dl,(%esi)
     c4e:	51                   	push   %ecx
     c4f:	00 00                	add    %al,(%eax)
     c51:	00 16                	add    %dl,(%esi)
     c53:	35 09 00 00 16       	xor    $0x16000009,%eax
     c58:	5d                   	pop    %ebp
     c59:	0c 00                	or     $0x0,%al
     c5b:	00 00                	add    %al,(%eax)
     c5d:	0f 04                	(bad)  
     c5f:	63 0c 00             	arpl   %cx,(%eax,%eax,1)
     c62:	00 0e                	add    %cl,(%esi)
     c64:	68 0c 00 00 30       	push   $0x3000000c
     c69:	74 6d                	je     cd8 <_init-0x8047968>
     c6b:	00 2c 0e             	add    %ch,(%esi,%ecx,1)
     c6e:	85 f8                	test   %edi,%eax
     c70:	0c 00                	or     $0x0,%al
     c72:	00 0a                	add    %cl,(%edx)
     c74:	39 05 00 00 0e 87    	cmp    %eax,0x870e0000
     c7a:	ca 00 00             	lret   $0x0
     c7d:	00 00                	add    %al,(%eax)
     c7f:	0a 70 07             	or     0x7(%eax),%dh
     c82:	00 00                	add    %al,(%eax)
     c84:	0e                   	push   %cs
     c85:	88 ca                	mov    %cl,%dl
     c87:	00 00                	add    %al,(%eax)
     c89:	00 04 0a             	add    %al,(%edx,%ecx,1)
     c8c:	2b 00                	sub    (%eax),%eax
     c8e:	00 00                	add    %al,(%eax)
     c90:	0e                   	push   %cs
     c91:	89 ca                	mov    %ecx,%edx
     c93:	00 00                	add    %al,(%eax)
     c95:	00 08                	add    %cl,(%eax)
     c97:	0a a7 04 00 00 0e    	or     0xe000004(%edi),%ah
     c9d:	8a ca                	mov    %dl,%cl
     c9f:	00 00                	add    %al,(%eax)
     ca1:	00 0c 0a             	add    %cl,(%edx,%ecx,1)
     ca4:	78 06                	js     cac <_init-0x8047994>
     ca6:	00 00                	add    %al,(%eax)
     ca8:	0e                   	push   %cs
     ca9:	8b ca                	mov    %edx,%ecx
     cab:	00 00                	add    %al,(%eax)
     cad:	00 10                	add    %dl,(%eax)
     caf:	0a ab 0c 00 00 0e    	or     0xe00000c(%ebx),%ch
     cb5:	8c ca                	mov    %cs,%edx
     cb7:	00 00                	add    %al,(%eax)
     cb9:	00 14 0a             	add    %dl,(%edx,%ecx,1)
     cbc:	b7 09                	mov    $0x9,%bh
     cbe:	00 00                	add    %al,(%eax)
     cc0:	0e                   	push   %cs
     cc1:	8d                   	(bad)  
     cc2:	ca 00 00             	lret   $0x0
     cc5:	00 18                	add    %bl,(%eax)
     cc7:	0a 66 02             	or     0x2(%esi),%ah
     cca:	00 00                	add    %al,(%eax)
     ccc:	0e                   	push   %cs
     ccd:	8e ca                	mov    %edx,%cs
     ccf:	00 00                	add    %al,(%eax)
     cd1:	00 1c 0a             	add    %bl,(%edx,%ecx,1)
     cd4:	40                   	inc    %eax
     cd5:	05 00 00 0e 8f       	add    $0x8f0e0000,%eax
     cda:	ca 00 00             	lret   $0x0
     cdd:	00 20                	add    %ah,(%eax)
     cdf:	0a a5 0a 00 00 0e    	or     0xe00000a(%ebp),%ah
     ce5:	92                   	xchg   %eax,%edx
     ce6:	3b 0e                	cmp    (%esi),%ecx
     ce8:	00 00                	add    %al,(%eax)
     cea:	24 0a                	and    $0xa,%al
     cec:	b9 0b 00 00 0e       	mov    $0xe00000b,%ecx
     cf1:	93                   	xchg   %eax,%ebx
     cf2:	f3 00 00             	repz add %al,(%eax)
     cf5:	00 28                	add    %ch,(%eax)
     cf7:	00 2c 75 0a 00 00 06 	add    %ch,0x600000a(,%esi,2)
     cfe:	1f                   	pop    %ds
     cff:	01 51 00             	add    %edx,0x0(%ecx)
     d02:	00 00                	add    %al,(%eax)
     d04:	0e                   	push   %cs
     d05:	0d 00 00 16 35       	or     $0x35160000,%eax
     d0a:	09 00                	or     %eax,(%eax)
     d0c:	00 00                	add    %al,(%eax)
     d0e:	2f                   	das    
     d0f:	0f 0c                	(bad)  
     d11:	00 00                	add    %al,(%eax)
     d13:	06                   	push   %es
     d14:	9e                   	sahf   
     d15:	f2 08 00             	repnz or %al,(%eax)
     d18:	00 2d 0d 00 00 16    	add    %ch,0x1600000d
     d1e:	f2 08 00             	repnz or %al,(%eax)
     d21:	00 16                	add    %dl,(%esi)
     d23:	35 09 00 00 16       	xor    $0x16000009,%eax
     d28:	51                   	push   %ecx
     d29:	00 00                	add    %al,(%eax)
     d2b:	00 00                	add    %al,(%eax)
     d2d:	2f                   	das    
     d2e:	b0 03                	mov    $0x3,%al
     d30:	00 00                	add    %al,(%eax)
     d32:	06                   	push   %es
     d33:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     d34:	ca 00 00             	lret   $0x0
     d37:	00 4c 0d 00          	add    %cl,0x0(%ebp,%ecx,1)
     d3b:	00 16                	add    %dl,(%esi)
     d3d:	35 09 00 00 16       	xor    $0x16000009,%eax
     d42:	35 09 00 00 16       	xor    $0x16000009,%eax
     d47:	51                   	push   %ecx
     d48:	00 00                	add    %al,(%eax)
     d4a:	00 00                	add    %al,(%eax)
     d4c:	2f                   	das    
     d4d:	49                   	dec    %ecx
     d4e:	05 00 00 06 96       	add    $0x96060000,%eax
     d53:	f2 08 00             	repnz or %al,(%eax)
     d56:	00 6b 0d             	add    %ch,0xd(%ebx)
     d59:	00 00                	add    %al,(%eax)
     d5b:	16                   	push   %ss
     d5c:	f2 08 00             	repnz or %al,(%eax)
     d5f:	00 16                	add    %dl,(%esi)
     d61:	35 09 00 00 16       	xor    $0x16000009,%eax
     d66:	51                   	push   %ecx
     d67:	00 00                	add    %al,(%eax)
     d69:	00 00                	add    %al,(%eax)
     d6b:	2c ad                	sub    $0xad,%al
     d6d:	09 00                	or     %eax,(%eax)
     d6f:	00 06                	add    %al,(%esi)
     d71:	9e                   	sahf   
     d72:	01 51 00             	add    %edx,0x0(%ecx)
     d75:	00 00                	add    %al,(%eax)
     d77:	90                   	nop
     d78:	0d 00 00 16 b0       	or     $0xb0160000,%eax
     d7d:	0b 00                	or     (%eax),%eax
     d7f:	00 16                	add    %dl,(%esi)
     d81:	90                   	nop
     d82:	0d 00 00 16 51       	or     $0x51160000,%eax
     d87:	00 00                	add    %al,(%eax)
     d89:	00 16                	add    %dl,(%esi)
     d8b:	d5 09                	aad    $0x9
     d8d:	00 00                	add    %al,(%eax)
     d8f:	00 0f                	add    %cl,(%edi)
     d91:	04 35                	add    $0x35,%al
     d93:	09 00                	or     %eax,(%eax)
     d95:	00 2c b3             	add    %ch,(%ebx,%esi,4)
     d98:	07                   	pop    %es
     d99:	00 00                	add    %al,(%eax)
     d9b:	06                   	push   %es
     d9c:	00 01                	add    %al,(%ecx)
     d9e:	51                   	push   %ecx
     d9f:	00 00                	add    %al,(%eax)
     da1:	00 b1 0d 00 00 16    	add    %dh,0x1600000d(%ecx)
     da7:	35 09 00 00 16       	xor    $0x16000009,%eax
     dac:	35 09 00 00 00       	xor    $0x9,%eax
     db1:	2c 1c                	sub    $0x1c,%al
     db3:	0a 00                	or     (%eax),%al
     db5:	00 06                	add    %al,(%esi)
     db7:	c2 01 cc             	ret    $0xcc01
     dba:	0d 00 00 cc 0d       	or     $0xdcc0000,%eax
     dbf:	00 00                	add    %al,(%eax)
     dc1:	16                   	push   %ss
     dc2:	35 09 00 00 16       	xor    $0x16000009,%eax
     dc7:	d3 0d 00 00 00 05    	rorl   %cl,0x5000000
     dcd:	08 04 58             	or     %al,(%eax,%ebx,2)
     dd0:	08 00                	or     %al,(%eax)
     dd2:	00 0f                	add    %cl,(%edi)
     dd4:	04 f2                	add    $0xf2,%al
     dd6:	08 00                	or     %al,(%eax)
     dd8:	00 2c 23             	add    %ch,(%ebx,%eiz,1)
     ddb:	0a 00                	or     (%eax),%al
     ddd:	00 06                	add    %al,(%esi)
     ddf:	c9                   	leave  
     de0:	01 f4                	add    %esi,%esp
     de2:	0d 00 00 f4 0d       	or     $0xdf40000,%eax
     de7:	00 00                	add    %al,(%eax)
     de9:	16                   	push   %ss
     dea:	35 09 00 00 16       	xor    $0x16000009,%eax
     def:	d3 0d 00 00 00 05    	rorl   %cl,0x5000000
     df5:	04 04                	add    $0x4,%al
     df7:	60                   	pusha  
     df8:	07                   	pop    %es
     df9:	00 00                	add    %al,(%eax)
     dfb:	2c 2a                	sub    $0x2a,%al
     dfd:	0a 00                	or     (%eax),%al
     dff:	00 06                	add    %al,(%esi)
     e01:	1a 01                	sbb    (%ecx),%al
     e03:	f2 08 00             	repnz or %al,(%eax)
     e06:	00 1b                	add    %bl,(%ebx)
     e08:	0e                   	push   %cs
     e09:	00 00                	add    %al,(%eax)
     e0b:	16                   	push   %ss
     e0c:	f2 08 00             	repnz or %al,(%eax)
     e0f:	00 16                	add    %dl,(%esi)
     e11:	35 09 00 00 16       	xor    $0x16000009,%eax
     e16:	d3 0d 00 00 00 2c    	rorl   %cl,0x2c000000
     e1c:	31 0a                	xor    %ecx,(%edx)
     e1e:	00 00                	add    %al,(%eax)
     e20:	06                   	push   %es
     e21:	d4 01                	aam    $0x1
     e23:	3b 0e                	cmp    (%esi),%ecx
     e25:	00 00                	add    %al,(%eax)
     e27:	3b 0e                	cmp    (%esi),%ecx
     e29:	00 00                	add    %al,(%eax)
     e2b:	16                   	push   %ss
     e2c:	35 09 00 00 16       	xor    $0x16000009,%eax
     e31:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
     e37:	00 00                	add    %al,(%eax)
     e39:	00 00                	add    %al,(%eax)
     e3b:	05 04 05 4d 0c       	add    $0xc4d0504,%eax
     e40:	00 00                	add    %al,(%eax)
     e42:	2c 84                	sub    $0x84,%al
     e44:	0d 00 00 06 d9       	or     $0xd9060000,%eax
     e49:	01 62 0e             	add    %esp,0xe(%edx)
     e4c:	00 00                	add    %al,(%eax)
     e4e:	62 0e                	bound  %ecx,(%esi)
     e50:	00 00                	add    %al,(%eax)
     e52:	16                   	push   %ss
     e53:	35 09 00 00 16       	xor    $0x16000009,%eax
     e58:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
     e5e:	00 00                	add    %al,(%eax)
     e60:	00 00                	add    %al,(%eax)
     e62:	05 04 07 f1 08       	add    $0x8f10704,%eax
     e67:	00 00                	add    %al,(%eax)
     e69:	2f                   	das    
     e6a:	ea 00 00 00 06 c4 51 	ljmp   $0x51c4,$0x6000000
     e71:	00 00                	add    %al,(%eax)
     e73:	00 88 0e 00 00 16    	add    %cl,0x1600000e(%eax)
     e79:	f2 08 00             	repnz or %al,(%eax)
     e7c:	00 16                	add    %dl,(%esi)
     e7e:	35 09 00 00 16       	xor    $0x16000009,%eax
     e83:	51                   	push   %ecx
     e84:	00 00                	add    %al,(%eax)
     e86:	00 00                	add    %al,(%eax)
     e88:	2c dd                	sub    $0xdd,%al
     e8a:	06                   	push   %es
     e8b:	00 00                	add    %al,(%eax)
     e8d:	06                   	push   %es
     e8e:	65 01 ca             	gs add %ecx,%edx
     e91:	00 00                	add    %al,(%eax)
     e93:	00 9e 0e 00 00 16    	add    %bl,0x1600000e(%esi)
     e99:	63 00                	arpl   %ax,(%eax)
     e9b:	00 00                	add    %al,(%eax)
     e9d:	00 2c 5a             	add    %ch,(%edx,%ebx,2)
     ea0:	05 00 00 06 45       	add    $0x45060000,%eax
     ea5:	01 ca                	add    %ecx,%edx
     ea7:	00 00                	add    %al,(%eax)
     ea9:	00 be 0e 00 00 16    	add    %bh,0x1600000e(%esi)
     eaf:	35 09 00 00 16       	xor    $0x16000009,%eax
     eb4:	35 09 00 00 16       	xor    $0x16000009,%eax
     eb9:	51                   	push   %ecx
     eba:	00 00                	add    %al,(%eax)
     ebc:	00 00                	add    %al,(%eax)
     ebe:	2c 70                	sub    $0x70,%al
     ec0:	06                   	push   %es
     ec1:	00 00                	add    %al,(%eax)
     ec3:	06                   	push   %es
     ec4:	49                   	dec    %ecx
     ec5:	01 f2                	add    %esi,%edx
     ec7:	08 00                	or     %al,(%eax)
     ec9:	00 de                	add    %bl,%dh
     ecb:	0e                   	push   %cs
     ecc:	00 00                	add    %al,(%eax)
     ece:	16                   	push   %ss
     ecf:	f2 08 00             	repnz or %al,(%eax)
     ed2:	00 16                	add    %dl,(%esi)
     ed4:	35 09 00 00 16       	xor    $0x16000009,%eax
     ed9:	51                   	push   %ecx
     eda:	00 00                	add    %al,(%eax)
     edc:	00 00                	add    %al,(%eax)
     ede:	2c c8                	sub    $0xc8,%al
     ee0:	03 00                	add    (%eax),%eax
     ee2:	00 06                	add    %al,(%esi)
     ee4:	4e                   	dec    %esi
     ee5:	01 f2                	add    %esi,%edx
     ee7:	08 00                	or     %al,(%eax)
     ee9:	00 fe                	add    %bh,%dh
     eeb:	0e                   	push   %cs
     eec:	00 00                	add    %al,(%eax)
     eee:	16                   	push   %ss
     eef:	f2 08 00             	repnz or %al,(%eax)
     ef2:	00 16                	add    %dl,(%esi)
     ef4:	35 09 00 00 16       	xor    $0x16000009,%eax
     ef9:	51                   	push   %ecx
     efa:	00 00                	add    %al,(%eax)
     efc:	00 00                	add    %al,(%eax)
     efe:	2c 0c                	sub    $0xc,%al
     f00:	05 00 00 06 52       	add    $0x52060000,%eax
     f05:	01 f2                	add    %esi,%edx
     f07:	08 00                	or     %al,(%eax)
     f09:	00 1e                	add    %bl,(%esi)
     f0b:	0f 00 00             	sldt   (%eax)
     f0e:	16                   	push   %ss
     f0f:	f2 08 00             	repnz or %al,(%eax)
     f12:	00 16                	add    %dl,(%esi)
     f14:	f8                   	clc    
     f15:	08 00                	or     %al,(%eax)
     f17:	00 16                	add    %dl,(%esi)
     f19:	51                   	push   %ecx
     f1a:	00 00                	add    %al,(%eax)
     f1c:	00 00                	add    %al,(%eax)
     f1e:	2c eb                	sub    $0xeb,%al
     f20:	05 00 00 06 59       	add    $0x59060000,%eax
     f25:	02 ca                	add    %dl,%cl
     f27:	00 00                	add    %al,(%eax)
     f29:	00 35 0f 00 00 16    	add    %dh,0x1600000f
     f2f:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     f34:	00 2c d6             	add    %ch,(%esi,%edx,8)
     f37:	0c 00                	or     $0x0,%al
     f39:	00 06                	add    %al,(%esi)
     f3b:	82                   	(bad)  
     f3c:	02 ca                	add    %dl,%cl
     f3e:	00 00                	add    %al,(%eax)
     f40:	00 4c 0f 00          	add    %cl,0x0(%edi,%ecx,1)
     f44:	00 16                	add    %dl,(%esi)
     f46:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     f4b:	00 31                	add    %dh,(%ecx)
     f4d:	c4 00                	les    (%eax),%eax
     f4f:	00 00                	add    %al,(%eax)
     f51:	06                   	push   %es
     f52:	e0 c4                	loopne f18 <_init-0x8047728>
     f54:	00 00                	add    %al,(%eax)
     f56:	00 35 09 00 00 6a    	add    %dh,0x6a000009
     f5c:	0f 00 00             	sldt   (%eax)
     f5f:	16                   	push   %ss
     f60:	35 09 00 00 16       	xor    $0x16000009,%eax
     f65:	f8                   	clc    
     f66:	08 00                	or     %al,(%eax)
     f68:	00 00                	add    %al,(%eax)
     f6a:	18 03                	sbb    %al,(%ebx)
     f6c:	09 00                	or     %eax,(%eax)
     f6e:	00 06                	add    %al,(%esi)
     f70:	06                   	push   %es
     f71:	01 03                	add    %eax,(%ebx)
     f73:	09 00                	or     %eax,(%eax)
     f75:	00 35 09 00 00 89    	add    %dh,0x89000009
     f7b:	0f 00 00             	sldt   (%eax)
     f7e:	16                   	push   %ss
     f7f:	35 09 00 00 16       	xor    $0x16000009,%eax
     f84:	35 09 00 00 00       	xor    $0x9,%eax
     f89:	31 5d 0a             	xor    %ebx,0xa(%ebp)
     f8c:	00 00                	add    %al,(%eax)
     f8e:	06                   	push   %es
     f8f:	ea 5d 0a 00 00 35 09 	ljmp   $0x935,$0xa5d
     f96:	00 00                	add    %al,(%eax)
     f98:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     f99:	0f 00 00             	sldt   (%eax)
     f9c:	16                   	push   %ss
     f9d:	35 09 00 00 16       	xor    $0x16000009,%eax
     fa2:	f8                   	clc    
     fa3:	08 00                	or     %al,(%eax)
     fa5:	00 00                	add    %al,(%eax)
     fa7:	18 48 09             	sbb    %cl,0x9(%eax)
     faa:	00 00                	add    %al,(%eax)
     fac:	06                   	push   %es
     fad:	11 01                	adc    %eax,(%ecx)
     faf:	48                   	dec    %eax
     fb0:	09 00                	or     %eax,(%eax)
     fb2:	00 35 09 00 00 c6    	add    %dh,0xc6000009
     fb8:	0f 00 00             	sldt   (%eax)
     fbb:	16                   	push   %ss
     fbc:	35 09 00 00 16       	xor    $0x16000009,%eax
     fc1:	35 09 00 00 00       	xor    $0x9,%eax
     fc6:	18 db                	sbb    %bl,%bl
     fc8:	02 00                	add    (%eax),%al
     fca:	00 06                	add    %al,(%esi)
     fcc:	3c 01                	cmp    $0x1,%al
     fce:	db 02                	fildl  (%edx)
     fd0:	00 00                	add    %al,(%eax)
     fd2:	35 09 00 00 ea       	xor    $0xea000009,%eax
     fd7:	0f 00 00             	sldt   (%eax)
     fda:	16                   	push   %ss
     fdb:	35 09 00 00 16       	xor    $0x16000009,%eax
     fe0:	f8                   	clc    
     fe1:	08 00                	or     %al,(%eax)
     fe3:	00 16                	add    %dl,(%esi)
     fe5:	51                   	push   %ecx
     fe6:	00 00                	add    %al,(%eax)
     fe8:	00 00                	add    %al,(%eax)
     fea:	32 44 08 00          	xor    0x0(%eax,%ecx,1),%al
     fee:	00 07                	add    %al,(%edi)
     ff0:	f2 26 11 00          	repnz adc %eax,%es:(%eax)
     ff4:	00 11                	add    %dl,(%ecx)
     ff6:	07                   	pop    %es
     ff7:	f8                   	clc    
     ff8:	26 11 00             	adc    %eax,%es:(%eax)
     ffb:	00 12                	add    %dl,(%edx)
     ffd:	07                   	pop    %es
     ffe:	01 01                	add    %eax,(%ecx)
    1000:	48                   	dec    %eax
    1001:	11 00                	adc    %eax,(%eax)
    1003:	00 12                	add    %dl,(%edx)
    1005:	07                   	pop    %es
    1006:	02 01                	add    (%ecx),%al
    1008:	6f                   	outsl  %ds:(%esi),(%dx)
    1009:	11 00                	adc    %eax,(%eax)
    100b:	00 13                	add    %dl,(%ebx)
    100d:	ce                   	into   
    100e:	0c 00                	or     $0x0,%al
    1010:	00 10                	add    %dl,(%eax)
    1012:	24 11                	and    $0x11,%al
    1014:	11 2c 86             	adc    %ebp,(%esi,%eax,4)
    1017:	04 00                	add    $0x0,%al
    1019:	00 11                	add    %dl,(%ecx)
    101b:	11 2d a6 04 00 00    	adc    %ebp,0x4a6
    1021:	14 3b                	adc    $0x3b,%al
    1023:	00 00                	add    %al,(%eax)
    1025:	00 01                	add    %al,(%ecx)
    1027:	12 37                	adc    (%edi),%dh
    1029:	63 10                	arpl   %dx,(%eax)
    102b:	00 00                	add    %al,(%eax)
    102d:	33 d1                	xor    %ecx,%edx
    102f:	03 00                	add    (%eax),%eax
    1031:	00 12                	add    %dl,(%edx)
    1033:	3a ee                	cmp    %dh,%ch
    1035:	00 00                	add    %al,(%eax)
    1037:	00 33                	add    %dh,(%ebx)
    1039:	8b 00                	mov    (%eax),%eax
    103b:	00 00                	add    %al,(%eax)
    103d:	12 3b                	adc    (%ebx),%bh
    103f:	ee                   	out    %al,(%dx)
    1040:	00 00                	add    %al,(%eax)
    1042:	00 33                	add    %dh,(%ebx)
    1044:	6b 03 00             	imul   $0x0,(%ebx),%eax
    1047:	00 12                	add    %dl,(%edx)
    1049:	3f                   	aas    
    104a:	53                   	push   %ebx
    104b:	13 00                	adc    (%eax),%eax
    104d:	00 33                	add    %dh,(%ebx)
    104f:	13 0a                	adc    (%edx),%ecx
    1051:	00 00                	add    %al,(%eax)
    1053:	12 40 ee             	adc    -0x12(%eax),%al
    1056:	00 00                	add    %al,(%eax)
    1058:	00 28                	add    %ch,(%eax)
    105a:	55                   	push   %ebp
    105b:	02 00                	add    (%eax),%al
    105d:	00 ca                	add    %cl,%dl
    105f:	00 00                	add    %al,(%eax)
    1061:	00 00                	add    %al,(%eax)
    1063:	14 7f                	adc    $0x7f,%al
    1065:	0c 00                	or     $0x0,%al
    1067:	00 01                	add    %al,(%ecx)
    1069:	12 37                	adc    (%edi),%dh
    106b:	a5                   	movsl  %ds:(%esi),%es:(%edi)
    106c:	10 00                	adc    %al,(%eax)
    106e:	00 33                	add    %dh,(%ebx)
    1070:	d1 03                	roll   (%ebx)
    1072:	00 00                	add    %al,(%eax)
    1074:	12 3a                	adc    (%edx),%bh
    1076:	58                   	pop    %eax
    1077:	13 00                	adc    (%eax),%eax
    1079:	00 33                	add    %dh,(%ebx)
    107b:	8b 00                	mov    (%eax),%eax
    107d:	00 00                	add    %al,(%eax)
    107f:	12 3b                	adc    (%ebx),%bh
    1081:	58                   	pop    %eax
    1082:	13 00                	adc    (%eax),%eax
    1084:	00 33                	add    %dh,(%ebx)
    1086:	6b 03 00             	imul   $0x0,(%ebx),%eax
    1089:	00 12                	add    %dl,(%edx)
    108b:	3f                   	aas    
    108c:	53                   	push   %ebx
    108d:	13 00                	adc    (%eax),%eax
    108f:	00 33                	add    %dh,(%ebx)
    1091:	13 0a                	adc    (%edx),%ecx
    1093:	00 00                	add    %al,(%eax)
    1095:	12 40 ee             	adc    -0x12(%eax),%al
    1098:	00 00                	add    %al,(%eax)
    109a:	00 28                	add    %ch,(%eax)
    109c:	55                   	push   %ebp
    109d:	02 00                	add    (%eax),%al
    109f:	00 62 0e             	add    %ah,0xe(%edx)
    10a2:	00 00                	add    %al,(%eax)
    10a4:	00 14 e0             	add    %dl,(%eax,%eiz,8)
    10a7:	01 00                	add    %eax,(%eax)
    10a9:	00 01                	add    %al,(%ecx)
    10ab:	12 37                	adc    (%edi),%dh
    10ad:	e7 10                	out    %eax,$0x10
    10af:	00 00                	add    %al,(%eax)
    10b1:	33 d1                	xor    %ecx,%edx
    10b3:	03 00                	add    (%eax),%eax
    10b5:	00 12                	add    %dl,(%edx)
    10b7:	3a f9                	cmp    %cl,%bh
    10b9:	00 00                	add    %al,(%eax)
    10bb:	00 33                	add    %dh,(%ebx)
    10bd:	8b 00                	mov    (%eax),%eax
    10bf:	00 00                	add    %al,(%eax)
    10c1:	12 3b                	adc    (%ebx),%bh
    10c3:	f9                   	stc    
    10c4:	00 00                	add    %al,(%eax)
    10c6:	00 33                	add    %dh,(%ebx)
    10c8:	6b 03 00             	imul   $0x0,(%ebx),%eax
    10cb:	00 12                	add    %dl,(%edx)
    10cd:	3f                   	aas    
    10ce:	53                   	push   %ebx
    10cf:	13 00                	adc    (%eax),%eax
    10d1:	00 33                	add    %dh,(%ebx)
    10d3:	13 0a                	adc    (%edx),%ecx
    10d5:	00 00                	add    %al,(%eax)
    10d7:	12 40 ee             	adc    -0x12(%eax),%al
    10da:	00 00                	add    %al,(%eax)
    10dc:	00 28                	add    %ch,(%eax)
    10de:	55                   	push   %ebp
    10df:	02 00                	add    (%eax),%al
    10e1:	00 4a 00             	add    %cl,0x0(%edx)
    10e4:	00 00                	add    %al,(%eax)
    10e6:	00 34 17             	add    %dh,(%edi,%edx,1)
    10e9:	0c 00                	or     $0x0,%al
    10eb:	00 01                	add    %al,(%ecx)
    10ed:	12 37                	adc    (%edi),%dh
    10ef:	33 d1                	xor    %ecx,%edx
    10f1:	03 00                	add    (%eax),%eax
    10f3:	00 12                	add    %dl,(%edx)
    10f5:	3a e2                	cmp    %dl,%ah
    10f7:	13 00                	adc    (%eax),%eax
    10f9:	00 33                	add    %dh,(%ebx)
    10fb:	8b 00                	mov    (%eax),%eax
    10fd:	00 00                	add    %al,(%eax)
    10ff:	12 3b                	adc    (%ebx),%bh
    1101:	e2 13                	loop   1116 <_init-0x804752a>
    1103:	00 00                	add    %al,(%eax)
    1105:	33 6b 03             	xor    0x3(%ebx),%ebp
    1108:	00 00                	add    %al,(%eax)
    110a:	12 3f                	adc    (%edi),%bh
    110c:	53                   	push   %ebx
    110d:	13 00                	adc    (%eax),%eax
    110f:	00 33                	add    %dh,(%ebx)
    1111:	13 0a                	adc    (%edx),%ecx
    1113:	00 00                	add    %al,(%eax)
    1115:	12 40 ee             	adc    -0x12(%eax),%al
    1118:	00 00                	add    %al,(%eax)
    111a:	00 28                	add    %ch,(%eax)
    111c:	55                   	push   %ebp
    111d:	02 00                	add    (%eax),%al
    111f:	00 a4 11 00 00 00 00 	add    %ah,0x0(%ecx,%edx,1)
    1126:	2c 0b                	sub    $0xb,%al
    1128:	09 00                	or     %eax,(%eax)
    112a:	00 06                	add    %al,(%esi)
    112c:	cb                   	lret   
    112d:	01 41 11             	add    %eax,0x11(%ecx)
    1130:	00 00                	add    %al,(%eax)
    1132:	41                   	inc    %ecx
    1133:	11 00                	adc    %eax,(%eax)
    1135:	00 16                	add    %dl,(%esi)
    1137:	35 09 00 00 16       	xor    $0x16000009,%eax
    113c:	d3 0d 00 00 00 05    	rorl   %cl,0x5000000
    1142:	0c 04                	or     $0x4,%al
    1144:	53                   	push   %ebx
    1145:	08 00                	or     %al,(%eax)
    1147:	00 2c 40             	add    %ch,(%eax,%eax,2)
    114a:	09 00                	or     %eax,(%eax)
    114c:	00 06                	add    %al,(%esi)
    114e:	e3 01                	jecxz  1151 <_init-0x80474ef>
    1150:	68 11 00 00 68       	push   $0x68000011
    1155:	11 00                	adc    %eax,(%eax)
    1157:	00 16                	add    %dl,(%esi)
    1159:	35 09 00 00 16       	xor    $0x16000009,%eax
    115e:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
    1164:	00 00                	add    %al,(%eax)
    1166:	00 00                	add    %al,(%eax)
    1168:	05 08 05 48 0c       	add    $0xc480508,%eax
    116d:	00 00                	add    %al,(%eax)
    116f:	2c 8a                	sub    $0x8a,%al
    1171:	04 00                	add    $0x0,%al
    1173:	00 06                	add    %al,(%esi)
    1175:	ea 01 8f 11 00 00 8f 	ljmp   $0x8f00,$0x118f01
    117c:	11 00                	adc    %eax,(%eax)
    117e:	00 16                	add    %dl,(%esi)
    1180:	35 09 00 00 16       	xor    $0x16000009,%eax
    1185:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
    118b:	00 00                	add    %al,(%eax)
    118d:	00 00                	add    %al,(%eax)
    118f:	05 08 07 ec 08       	add    $0x8ec0708,%eax
    1194:	00 00                	add    %al,(%eax)
    1196:	05 01 08 cd 02       	add    $0x2cd0801,%eax
    119b:	00 00                	add    %al,(%eax)
    119d:	05 01 06 cf 02       	add    $0x2cf0601,%eax
    11a2:	00 00                	add    %al,(%eax)
    11a4:	05 02 05 bf 0a       	add    $0xabf0502,%eax
    11a9:	00 00                	add    %al,(%eax)
    11ab:	32 dd                	xor    %ch,%bl
    11ad:	05 00 00 0f 37       	add    $0x370f0000,%eax
    11b2:	be 11 00 00 35       	mov    $0x35000011,%esi
    11b7:	0f 38 b7             	(bad)  
    11ba:	02 00                	add    (%eax),%al
    11bc:	00 00                	add    %al,(%eax)
    11be:	36 04 ca             	ss add $0xca,%al
    11c1:	02 00                	add    (%eax),%al
    11c3:	00 36                	add    %dh,(%esi)
    11c5:	04 fa                	add    $0xfa,%al
    11c7:	02 00                	add    (%eax),%al
    11c9:	00 05 01 02 4e 08    	add    %al,0x84e0201
    11cf:	00 00                	add    %al,(%eax)
    11d1:	0f 04                	(bad)  
    11d3:	fa                   	cli    
    11d4:	02 00                	add    (%eax),%al
    11d6:	00 0f                	add    %cl,(%edi)
    11d8:	04 ca                	add    $0xca,%al
    11da:	02 00                	add    (%eax),%al
    11dc:	00 36                	add    %dh,(%esi)
    11de:	04 21                	add    $0x21,%al
    11e0:	04 00                	add    $0x0,%al
    11e2:	00 14 ed 0b 00 00 38 	add    %dl,0x3800000b(,%ebp,8)
    11e9:	13 35 10 13 00 00    	adc    0x1310,%esi
    11ef:	0a 92 01 00 00 13    	or     0x13000001(%edx),%dl
    11f5:	39 b0 0b 00 00 00    	cmp    %esi,0xb(%eax)
    11fb:	0a e1                	or     %cl,%ah
    11fd:	03 00                	add    (%eax),%eax
    11ff:	00 13                	add    %dl,(%ebx)
    1201:	3a b0 0b 00 00 04    	cmp    0x400000b(%eax),%dh
    1207:	0a f7                	or     %bh,%dh
    1209:	0a 00                	or     (%eax),%al
    120b:	00 13                	add    %dl,(%ebx)
    120d:	40                   	inc    %eax
    120e:	b0 0b                	mov    $0xb,%al
    1210:	00 00                	add    %al,(%eax)
    1212:	08 0a                	or     %cl,(%edx)
    1214:	b4 00                	mov    $0x0,%ah
    1216:	00 00                	add    %al,(%eax)
    1218:	13 46 b0             	adc    -0x50(%esi),%eax
    121b:	0b 00                	or     (%eax),%eax
    121d:	00 0c 0a             	add    %cl,(%edx,%ecx,1)
    1220:	af                   	scas   %es:(%edi),%eax
    1221:	0a 00                	or     (%eax),%al
    1223:	00 13                	add    %dl,(%ebx)
    1225:	47                   	inc    %edi
    1226:	b0 0b                	mov    $0xb,%al
    1228:	00 00                	add    %al,(%eax)
    122a:	10 0a                	adc    %cl,(%edx)
    122c:	8e 01                	mov    (%ecx),%es
    122e:	00 00                	add    %al,(%eax)
    1230:	13 48 b0             	adc    -0x50(%eax),%ecx
    1233:	0b 00                	or     (%eax),%eax
    1235:	00 14 0a             	add    %dl,(%edx,%ecx,1)
    1238:	dd 03                	fldl   (%ebx)
    123a:	00 00                	add    %al,(%eax)
    123c:	13 49 b0             	adc    -0x50(%ecx),%ecx
    123f:	0b 00                	or     (%eax),%eax
    1241:	00 18                	add    %bl,(%eax)
    1243:	0a f3                	or     %bl,%dh
    1245:	0a 00                	or     (%eax),%al
    1247:	00 13                	add    %dl,(%ebx)
    1249:	4a                   	dec    %edx
    124a:	b0 0b                	mov    $0xb,%al
    124c:	00 00                	add    %al,(%eax)
    124e:	1c 0a                	sbb    $0xa,%al
    1250:	91                   	xchg   %eax,%ecx
    1251:	07                   	pop    %es
    1252:	00 00                	add    %al,(%eax)
    1254:	13 4b b0             	adc    -0x50(%ebx),%ecx
    1257:	0b 00                	or     (%eax),%eax
    1259:	00 20                	add    %ah,(%eax)
    125b:	0a 44 04 00          	or     0x0(%esp,%eax,1),%al
    125f:	00 13                	add    %dl,(%ebx)
    1261:	4c                   	dec    %esp
    1262:	b0 0b                	mov    $0xb,%al
    1264:	00 00                	add    %al,(%eax)
    1266:	24 0a                	and    $0xa,%al
    1268:	f2 00 00             	repnz add %al,(%eax)
    126b:	00 13                	add    %dl,(%ebx)
    126d:	4d                   	dec    %ebp
    126e:	4a                   	dec    %edx
    126f:	00 00                	add    %al,(%eax)
    1271:	00 28                	add    %ch,(%eax)
    1273:	0a f6                	or     %dh,%dh
    1275:	00 00                	add    %al,(%eax)
    1277:	00 13                	add    %dl,(%ebx)
    1279:	4e                   	dec    %esi
    127a:	4a                   	dec    %edx
    127b:	00 00                	add    %al,(%eax)
    127d:	00 29                	add    %ch,(%ecx)
    127f:	0a 5d 04             	or     0x4(%ebp),%bl
    1282:	00 00                	add    %al,(%eax)
    1284:	13 50 4a             	adc    0x4a(%eax),%edx
    1287:	00 00                	add    %al,(%eax)
    1289:	00 2a                	add    %ch,(%edx)
    128b:	0a 17                	or     (%edi),%dl
    128d:	09 00                	or     %eax,(%eax)
    128f:	00 13                	add    %dl,(%ebx)
    1291:	52                   	push   %edx
    1292:	4a                   	dec    %edx
    1293:	00 00                	add    %al,(%eax)
    1295:	00 2b                	add    %ch,(%ebx)
    1297:	0a 1a                	or     (%edx),%bl
    1299:	02 00                	add    (%eax),%al
    129b:	00 13                	add    %dl,(%ebx)
    129d:	54                   	push   %esp
    129e:	4a                   	dec    %edx
    129f:	00 00                	add    %al,(%eax)
    12a1:	00 2c 0a             	add    %ch,(%edx,%ecx,1)
    12a4:	b1 05                	mov    $0x5,%cl
    12a6:	00 00                	add    %al,(%eax)
    12a8:	13 56 4a             	adc    0x4a(%esi),%edx
    12ab:	00 00                	add    %al,(%eax)
    12ad:	00 2d 0a ad 0b 00    	add    %ch,0xbad0a
    12b3:	00 13                	add    %dl,(%ebx)
    12b5:	5d                   	pop    %ebp
    12b6:	4a                   	dec    %edx
    12b7:	00 00                	add    %al,(%eax)
    12b9:	00 2e                	add    %ch,(%esi)
    12bb:	0a bc 03 00 00 13 5e 	or     0x5e130000(%ebx,%eax,1),%bh
    12c2:	4a                   	dec    %edx
    12c3:	00 00                	add    %al,(%eax)
    12c5:	00 2f                	add    %ch,(%edi)
    12c7:	0a 59 04             	or     0x4(%ecx),%bl
    12ca:	00 00                	add    %al,(%eax)
    12cc:	13 61 4a             	adc    0x4a(%ecx),%esp
    12cf:	00 00                	add    %al,(%eax)
    12d1:	00 30                	add    %dh,(%eax)
    12d3:	0a 13                	or     (%ebx),%dl
    12d5:	09 00                	or     %eax,(%eax)
    12d7:	00 13                	add    %dl,(%ebx)
    12d9:	63 4a 00             	arpl   %cx,0x0(%edx)
    12dc:	00 00                	add    %al,(%eax)
    12de:	31 0a                	xor    %ecx,(%edx)
    12e0:	16                   	push   %ss
    12e1:	02 00                	add    (%eax),%al
    12e3:	00 13                	add    %dl,(%ebx)
    12e5:	65 4a                	gs dec %edx
    12e7:	00 00                	add    %al,(%eax)
    12e9:	00 32                	add    %dh,(%edx)
    12eb:	0a ad 05 00 00 13    	or     0x13000005(%ebp),%ch
    12f1:	67 4a                	addr16 dec %edx
    12f3:	00 00                	add    %al,(%eax)
    12f5:	00 33                	add    %dh,(%ebx)
    12f7:	0a a9 0b 00 00 13    	or     0x1300000b(%ecx),%ch
    12fd:	6e                   	outsb  %ds:(%esi),(%dx)
    12fe:	4a                   	dec    %edx
    12ff:	00 00                	add    %al,(%eax)
    1301:	00 34 0a             	add    %dh,(%edx,%ecx,1)
    1304:	b8 03 00 00 13       	mov    $0x13000003,%eax
    1309:	6f                   	outsl  %ds:(%esi),(%dx)
    130a:	4a                   	dec    %edx
    130b:	00 00                	add    %al,(%eax)
    130d:	00 35 00 2f 3f 0a    	add    %dh,0xa3f2f00
    1313:	00 00                	add    %al,(%eax)
    1315:	13 7c b0 0b          	adc    0xb(%eax,%esi,4),%edi
    1319:	00 00                	add    %al,(%eax)
    131b:	2a 13                	sub    (%ebx),%dl
    131d:	00 00                	add    %al,(%eax)
    131f:	16                   	push   %ss
    1320:	ca 00 00             	lret   $0x0
    1323:	00 16                	add    %dl,(%esi)
    1325:	f3 00 00             	repz add %al,(%eax)
    1328:	00 00                	add    %al,(%eax)
    132a:	37                   	aaa    
    132b:	99                   	cltd   
    132c:	00 00                	add    %al,(%eax)
    132e:	00 13                	add    %dl,(%ebx)
    1330:	7f 35                	jg     1367 <_init-0x80472d9>
    1332:	13 00                	adc    (%eax),%eax
    1334:	00 0f                	add    %cl,(%edi)
    1336:	04 e3                	add    $0xe3,%al
    1338:	11 00                	adc    %eax,(%eax)
    133a:	00 03                	add    %al,(%ebx)
    133c:	f3 0c 00             	repz or $0x0,%al
    133f:	00 14 28             	add    %dl,(%eax,%ebp,1)
    1342:	ca 00 00             	lret   $0x0
    1345:	00 38                	add    %bh,(%eax)
    1347:	04 03                	add    $0x3,%al
    1349:	13 08                	adc    (%eax),%ecx
    134b:	00 00                	add    %al,(%eax)
    134d:	15 20 ca 00 00       	adc    $0xca20,%eax
    1352:	00 0e                	add    %cl,(%esi)
    1354:	ca 11 00             	lret   $0x11
    1357:	00 0e                	add    %cl,(%esi)
    1359:	62 0e                	bound  %ecx,(%esi)
    135b:	00 00                	add    %al,(%eax)
    135d:	0f 04                	(bad)  
    135f:	d6                   	(bad)  
    1360:	05 00 00 03 a4       	add    $0xa4030000,%eax
    1365:	02 00                	add    (%eax),%al
    1367:	00 16                	add    %dl,(%esi)
    1369:	34 62                	xor    $0x62,%al
    136b:	0e                   	push   %cs
    136c:	00 00                	add    %al,(%eax)
    136e:	03 33                	add    (%ebx),%esi
    1370:	04 00                	add    $0x0,%al
    1372:	00 16                	add    %dl,(%esi)
    1374:	ba 79 13 00 00       	mov    $0x1379,%edx
    1379:	0f 04                	(bad)  
    137b:	7f 13                	jg     1390 <_init-0x80472b0>
    137d:	00 00                	add    %al,(%eax)
    137f:	0e                   	push   %cs
    1380:	3b 13                	cmp    (%ebx),%edx
    1382:	00 00                	add    %al,(%eax)
    1384:	2f                   	das    
    1385:	26 0d 00 00 16 af    	es or  $0xaf160000,%eax
    138b:	ca 00 00             	lret   $0x0
    138e:	00 9e 13 00 00 16    	add    %bl,0x16000013(%esi)
    1394:	63 00                	arpl   %ax,(%eax)
    1396:	00 00                	add    %al,(%eax)
    1398:	16                   	push   %ss
    1399:	63 13                	arpl   %dx,(%ebx)
    139b:	00 00                	add    %al,(%eax)
    139d:	00 2f                	add    %ch,(%edi)
    139f:	28 02                	sub    %al,(%edx)
    13a1:	00 00                	add    %al,(%eax)
    13a3:	16                   	push   %ss
    13a4:	dd 63 00             	frstor 0x0(%ebx)
    13a7:	00 00                	add    %al,(%eax)
    13a9:	b8 13 00 00 16       	mov    $0x16000013,%eax
    13ae:	63 00                	arpl   %ax,(%eax)
    13b0:	00 00                	add    %al,(%eax)
    13b2:	16                   	push   %ss
    13b3:	6e                   	outsb  %ds:(%esi),(%dx)
    13b4:	13 00                	adc    (%eax),%eax
    13b6:	00 00                	add    %al,(%eax)
    13b8:	2f                   	das    
    13b9:	2a 02                	sub    (%edx),%al
    13bb:	00 00                	add    %al,(%eax)
    13bd:	16                   	push   %ss
    13be:	da 6e 13             	fisubrl 0x13(%esi)
    13c1:	00 00                	add    %al,(%eax)
    13c3:	cd 13                	int    $0x13
    13c5:	00 00                	add    %al,(%eax)
    13c7:	16                   	push   %ss
    13c8:	f3 00 00             	repz add %al,(%eax)
    13cb:	00 00                	add    %al,(%eax)
    13cd:	2f                   	das    
    13ce:	28 0d 00 00 16 ab    	sub    %cl,0xab160000
    13d4:	63 13                	arpl   %dx,(%ebx)
    13d6:	00 00                	add    %al,(%eax)
    13d8:	e2 13                	loop   13ed <_init-0x8047253>
    13da:	00 00                	add    %al,(%eax)
    13dc:	16                   	push   %ss
    13dd:	f3 00 00             	repz add %al,(%eax)
    13e0:	00 00                	add    %al,(%eax)
    13e2:	0e                   	push   %cs
    13e3:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    13e4:	11 00                	adc    %eax,(%eax)
    13e6:	00 35 01 02 fe 00    	add    %dh,0xfe0201
    13ec:	00 00                	add    %al,(%eax)
    13ee:	39 d2                	cmp    %edx,%edx
    13f0:	01 00                	add    %eax,(%eax)
    13f2:	00 0c 01             	add    %cl,(%ecx,%eax,1)
    13f5:	3b a0 14 00 00 a0    	cmp    -0x5fffffec(%eax),%esp
    13fb:	14 00                	adc    $0x0,%al
    13fd:	00 3a                	add    %bh,(%edx)
    13ff:	a0 14 00 00 00       	mov    0x14,%al
    1404:	01 3b                	add    %edi,(%ebx)
    1406:	7a 00                	jp     1408 <_init-0x8047238>
    1408:	01 53 ca             	add    %edx,-0x36(%ebx)
    140b:	00 00                	add    %al,(%eax)
    140d:	00 08                	add    %cl,(%eax)
    140f:	01 3c d2             	add    %edi,(%edx,%edx,8)
    1412:	01 00                	add    %eax,(%eax)
    1414:	00 01                	add    %al,(%ecx)
    1416:	1e                   	push   %ds
    1417:	14 00                	adc    $0x0,%al
    1419:	00 29                	add    %ch,(%ecx)
    141b:	14 00                	adc    $0x0,%al
    141d:	00 21                	add    %ah,(%ecx)
    141f:	56                   	push   %esi
    1420:	15 00 00 16 5c       	adc    $0x5c160000,%eax
    1425:	15 00 00 00 3d       	adc    $0x3d000000,%eax
    142a:	d2 01                	rolb   %cl,(%ecx)
    142c:	00 00                	add    %al,(%eax)
    142e:	01 3e                	add    %edi,(%esi)
    1430:	01 39                	add    %edi,(%ecx)
    1432:	14 00                	adc    $0x0,%al
    1434:	00 3f                	add    %bh,(%edi)
    1436:	14 00                	adc    $0x0,%al
    1438:	00 21                	add    %ah,(%ecx)
    143a:	56                   	push   %esi
    143b:	15 00 00 00 3e       	adc    $0x3e000000,%eax
    1440:	d1 01                	roll   (%ecx)
    1442:	00 00                	add    %al,(%eax)
    1444:	01 43 01             	add    %eax,0x1(%ebx)
    1447:	ee                   	out    %al,(%dx)
    1448:	13 00                	adc    (%eax),%eax
    144a:	00 01                	add    %al,(%ecx)
    144c:	54                   	push   %esp
    144d:	14 00                	adc    $0x0,%al
    144f:	00 5f 14             	add    %bl,0x14(%edi)
    1452:	00 00                	add    %al,(%eax)
    1454:	21 56 15             	and    %edx,0x15(%esi)
    1457:	00 00                	add    %al,(%eax)
    1459:	21 ca                	and    %ecx,%edx
    145b:	00 00                	add    %al,(%eax)
    145d:	00 00                	add    %al,(%eax)
    145f:	3f                   	aas    
    1460:	9d                   	popf   
    1461:	0b 00                	or     (%eax),%eax
    1463:	00 01                	add    %al,(%ecx)
    1465:	49                   	dec    %ecx
    1466:	a0 01 00 00 ca       	mov    0xca000001,%al
    146b:	00 00                	add    %al,(%eax)
    146d:	00 01                	add    %al,(%ecx)
    146f:	77 14                	ja     1485 <_init-0x80471bb>
    1471:	00 00                	add    %al,(%eax)
    1473:	7d 14                	jge    1489 <_init-0x80471b7>
    1475:	00 00                	add    %al,(%eax)
    1477:	21 56 15             	and    %edx,0x15(%esi)
    147a:	00 00                	add    %al,(%eax)
    147c:	00 40 f3             	add    %al,-0xd(%eax)
    147f:	05 00 00 01 4e       	add    $0x4e010000,%eax
    1484:	f1                   	icebp  
    1485:	07                   	pop    %es
    1486:	00 00                	add    %al,(%eax)
    1488:	ca 00 00             	lret   $0x0
    148b:	00 01                	add    %al,(%ecx)
    148d:	02 10                	add    (%eax),%dl
    148f:	02 ee                	add    %dh,%ch
    1491:	13 00                	adc    (%eax),%eax
    1493:	00 01                	add    %al,(%ecx)
    1495:	99                   	cltd   
    1496:	14 00                	adc    $0x0,%al
    1498:	00 21                	add    %ah,(%ecx)
    149a:	56                   	push   %esi
    149b:	15 00 00 00 00       	adc    $0x0,%eax
    14a0:	39 2f                	cmp    %ebp,(%edi)
    14a2:	0b 00                	or     (%eax),%eax
    14a4:	00 08                	add    %cl,(%eax)
    14a6:	01 04 a0             	add    %eax,(%eax,%eiz,4)
    14a9:	14 00                	adc    $0x0,%al
    14ab:	00 56 15             	add    %dl,0x15(%esi)
    14ae:	00 00                	add    %al,(%eax)
    14b0:	41                   	inc    %ecx
    14b1:	29 0b                	sub    %ecx,(%ebx)
    14b3:	00 00                	add    %al,(%eax)
    14b5:	35 16 00 00 00       	xor    $0x16,%eax
    14ba:	01 3b                	add    %edi,(%ebx)
    14bc:	78 00                	js     14be <_init-0x8047182>
    14be:	01 1c ca             	add    %ebx,(%edx,%ecx,8)
    14c1:	00 00                	add    %al,(%eax)
    14c3:	00 04 01             	add    %al,(%ecx,%eax,1)
    14c6:	3c 2f                	cmp    $0x2f,%al
    14c8:	0b 00                	or     (%eax),%eax
    14ca:	00 01                	add    %al,(%ecx)
    14cc:	d4 14                	aam    $0x14
    14ce:	00 00                	add    %al,(%eax)
    14d0:	df 14 00             	fist   (%eax,%eax,1)
    14d3:	00 21                	add    %ah,(%ecx)
    14d5:	45                   	inc    %ebp
    14d6:	16                   	push   %ss
    14d7:	00 00                	add    %al,(%eax)
    14d9:	16                   	push   %ss
    14da:	4b                   	dec    %ebx
    14db:	16                   	push   %ss
    14dc:	00 00                	add    %al,(%eax)
    14de:	00 3d 2f 0b 00 00    	add    %bh,0xb2f
    14e4:	01 07                	add    %eax,(%edi)
    14e6:	01 ef                	add    %ebp,%edi
    14e8:	14 00                	adc    $0x0,%al
    14ea:	00 f5                	add    %dh,%ch
    14ec:	14 00                	adc    $0x0,%al
    14ee:	00 21                	add    %ah,(%ecx)
    14f0:	45                   	inc    %ebp
    14f1:	16                   	push   %ss
    14f2:	00 00                	add    %al,(%eax)
    14f4:	00 3e                	add    %bh,(%esi)
    14f6:	5f                   	pop    %edi
    14f7:	08 00                	or     %al,(%eax)
    14f9:	00 01                	add    %al,(%ecx)
    14fb:	0c 01                	or     $0x1,%al
    14fd:	a0 14 00 00 01       	mov    0x1000014,%al
    1502:	0a 15 00 00 15 15    	or     0x15150000,%dl
    1508:	00 00                	add    %al,(%eax)
    150a:	21 45 16             	and    %eax,0x16(%ebp)
    150d:	00 00                	add    %al,(%eax)
    150f:	21 ca                	and    %ecx,%edx
    1511:	00 00                	add    %al,(%eax)
    1513:	00 00                	add    %al,(%eax)
    1515:	3f                   	aas    
    1516:	9d                   	popf   
    1517:	0b 00                	or     (%eax),%eax
    1519:	00 01                	add    %al,(%ecx)
    151b:	12 6b 04             	adc    0x4(%ebx),%ch
    151e:	00 00                	add    %al,(%eax)
    1520:	ca 00 00             	lret   $0x0
    1523:	00 01                	add    %al,(%ecx)
    1525:	2d 15 00 00 33       	sub    $0x33000015,%eax
    152a:	15 00 00 21 45       	adc    $0x45210000,%eax
    152f:	16                   	push   %ss
    1530:	00 00                	add    %al,(%eax)
    1532:	00 40 f3             	add    %al,-0xd(%eax)
    1535:	05 00 00 01 17       	add    $0x17010000,%eax
    153a:	8e 09                	mov    (%ecx),%cs
    153c:	00 00                	add    %al,(%eax)
    153e:	ca 00 00             	lret   $0x0
    1541:	00 01                	add    %al,(%ecx)
    1543:	02 10                	add    (%eax),%dl
    1545:	02 a0 14 00 00 01    	add    0x1000014(%eax),%ah
    154b:	4f                   	dec    %edi
    154c:	15 00 00 21 45       	adc    $0x45210000,%eax
    1551:	16                   	push   %ss
    1552:	00 00                	add    %al,(%eax)
    1554:	00 00                	add    %al,(%eax)
    1556:	0f 04                	(bad)  
    1558:	ee                   	out    %al,(%dx)
    1559:	13 00                	adc    (%eax),%eax
    155b:	00 36                	add    %dh,(%esi)
    155d:	04 62                	add    $0x62,%al
    155f:	15 00 00 0e ee       	adc    $0xee0e0000,%eax
    1564:	13 00                	adc    (%eax),%eax
    1566:	00 39                	add    %bh,(%ecx)
    1568:	c3                   	ret    
    1569:	01 00                	add    %eax,(%eax)
    156b:	00 0c 01             	add    %cl,(%ecx,%eax,1)
    156e:	20 a0 14 00 00 19    	and    %ah,0x19000014(%eax)
    1574:	16                   	push   %ss
    1575:	00 00                	add    %al,(%eax)
    1577:	3a a0 14 00 00 00    	cmp    0x14(%eax),%ah
    157d:	01 3b                	add    %edi,(%ebx)
    157f:	79 00                	jns    1581 <_init-0x80470bf>
    1581:	01 38                	add    %edi,(%eax)
    1583:	ca 00 00             	lret   $0x0
    1586:	00 08                	add    %cl,(%eax)
    1588:	01 3c c3             	add    %edi,(%ebx,%eax,8)
    158b:	01 00                	add    %eax,(%eax)
    158d:	00 01                	add    %al,(%ecx)
    158f:	97                   	xchg   %eax,%edi
    1590:	15 00 00 a2 15       	adc    $0x15a20000,%eax
    1595:	00 00                	add    %al,(%eax)
    1597:	21 19                	and    %ebx,(%ecx)
    1599:	16                   	push   %ss
    159a:	00 00                	add    %al,(%eax)
    159c:	16                   	push   %ss
    159d:	1f                   	pop    %ds
    159e:	16                   	push   %ss
    159f:	00 00                	add    %al,(%eax)
    15a1:	00 3d c3 01 00 00    	add    %bh,0x1c3
    15a7:	01 23                	add    %esp,(%ebx)
    15a9:	01 b2 15 00 00 b8    	add    %esi,-0x47ffffeb(%edx)
    15af:	15 00 00 21 19       	adc    $0x19210000,%eax
    15b4:	16                   	push   %ss
    15b5:	00 00                	add    %al,(%eax)
    15b7:	00 3e                	add    %bh,(%esi)
    15b9:	c2 01 00             	ret    $0x1
    15bc:	00 01                	add    %al,(%ecx)
    15be:	28 01                	sub    %al,(%ecx)
    15c0:	67 15 00 00 01 cd    	addr16 adc $0xcd010000,%eax
    15c6:	15 00 00 d8 15       	adc    $0x15d80000,%eax
    15cb:	00 00                	add    %al,(%eax)
    15cd:	21 19                	and    %ebx,(%ecx)
    15cf:	16                   	push   %ss
    15d0:	00 00                	add    %al,(%eax)
    15d2:	21 ca                	and    %ecx,%edx
    15d4:	00 00                	add    %al,(%eax)
    15d6:	00 00                	add    %al,(%eax)
    15d8:	3f                   	aas    
    15d9:	9d                   	popf   
    15da:	0b 00                	or     (%eax),%eax
    15dc:	00 01                	add    %al,(%ecx)
    15de:	2e f1                	cs icebp 
    15e0:	09 00                	or     %eax,(%eax)
    15e2:	00 ca                	add    %cl,%dl
    15e4:	00 00                	add    %al,(%eax)
    15e6:	00 01                	add    %al,(%ecx)
    15e8:	f0 15 00 00 f6 15    	lock adc $0x15f60000,%eax
    15ee:	00 00                	add    %al,(%eax)
    15f0:	21 19                	and    %ebx,(%ecx)
    15f2:	16                   	push   %ss
    15f3:	00 00                	add    %al,(%eax)
    15f5:	00 40 f3             	add    %al,-0xd(%eax)
    15f8:	05 00 00 01 33       	add    $0x33010000,%eax
    15fd:	07                   	pop    %es
    15fe:	0b 00                	or     (%eax),%eax
    1600:	00 ca                	add    %cl,%dl
    1602:	00 00                	add    %al,(%eax)
    1604:	00 01                	add    %al,(%ecx)
    1606:	02 10                	add    (%eax),%dl
    1608:	02 67 15             	add    0x15(%edi),%ah
    160b:	00 00                	add    %al,(%eax)
    160d:	01 12                	add    %edx,(%edx)
    160f:	16                   	push   %ss
    1610:	00 00                	add    %al,(%eax)
    1612:	21 19                	and    %ebx,(%ecx)
    1614:	16                   	push   %ss
    1615:	00 00                	add    %al,(%eax)
    1617:	00 00                	add    %al,(%eax)
    1619:	0f 04                	(bad)  
    161b:	67 15 00 00 36 04    	addr16 adc $0x4360000,%eax
    1621:	25 16 00 00 0e       	and    $0xe000016,%eax
    1626:	67 15 00 00 42 ca    	addr16 adc $0xca420000,%eax
    162c:	00 00                	add    %al,(%eax)
    162e:	00 35 16 00 00 2d    	add    %dh,0x2d000016
    1634:	00 0f                	add    %cl,(%edi)
    1636:	04 3b                	add    $0x3b,%al
    1638:	16                   	push   %ss
    1639:	00 00                	add    %al,(%eax)
    163b:	04 04                	add    $0x4,%al
    163d:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    163e:	00 00                	add    %al,(%eax)
    1640:	00 2a                	add    %ch,(%edx)
    1642:	16                   	push   %ss
    1643:	00 00                	add    %al,(%eax)
    1645:	0f 04                	(bad)  
    1647:	a0 14 00 00 36       	mov    0x36000014,%al
    164c:	04 51                	add    $0x51,%al
    164e:	16                   	push   %ss
    164f:	00 00                	add    %al,(%eax)
    1651:	0e                   	push   %cs
    1652:	a0 14 00 00 43       	mov    0x43000014,%al
    1657:	df 14 00             	fist   (%eax,%eax,1)
    165a:	00 02                	add    %al,(%edx)
    165c:	64 16                	fs push %ss
    165e:	00 00                	add    %al,(%eax)
    1660:	6e                   	outsb  %ds:(%esi),(%dx)
    1661:	16                   	push   %ss
    1662:	00 00                	add    %al,(%eax)
    1664:	44                   	inc    %esp
    1665:	ff 05 00 00 6e 16    	incl   0x166e0000
    166b:	00 00                	add    %al,(%eax)
    166d:	00 0e                	add    %cl,(%esi)
    166f:	45                   	inc    %ebp
    1670:	16                   	push   %ss
    1671:	00 00                	add    %al,(%eax)
    1673:	45                   	inc    %ebp
    1674:	56                   	push   %esi
    1675:	16                   	push   %ss
    1676:	00 00                	add    %al,(%eax)
    1678:	49                   	dec    %ecx
    1679:	0a 00                	or     (%eax),%al
    167b:	00 d4                	add    %dl,%ah
    167d:	8a 04 08             	mov    (%eax,%ecx,1),%al
    1680:	41                   	inc    %ecx
    1681:	00 00                	add    %al,(%eax)
    1683:	00 01                	add    %al,(%ecx)
    1685:	9c                   	pushf  
    1686:	8e 16                	mov    (%esi),%ss
    1688:	00 00                	add    %al,(%eax)
    168a:	97                   	xchg   %eax,%edi
    168b:	16                   	push   %ss
    168c:	00 00                	add    %al,(%eax)
    168e:	46                   	inc    %esi
    168f:	64 16                	fs push %ss
    1691:	00 00                	add    %al,(%eax)
    1693:	02 91 00 00 43 f5    	add    -0xabd0000(%ecx),%dl
    1699:	14 00                	adc    $0x0,%al
    169b:	00 02                	add    %al,(%edx)
    169d:	a5                   	movsl  %ds:(%esi),%es:(%edi)
    169e:	16                   	push   %ss
    169f:	00 00                	add    %al,(%eax)
    16a1:	b8 16 00 00 44       	mov    $0x44000016,%eax
    16a6:	ff 05 00 00 6e 16    	incl   0x166e0000
    16ac:	00 00                	add    %al,(%eax)
    16ae:	44                   	inc    %esp
    16af:	fd                   	std    
    16b0:	0c 00                	or     $0x0,%al
    16b2:	00 ee                	add    %ch,%dh
    16b4:	00 00                	add    %al,(%eax)
    16b6:	00 00                	add    %al,(%eax)
    16b8:	45                   	inc    %ebp
    16b9:	97                   	xchg   %eax,%edi
    16ba:	16                   	push   %ss
    16bb:	00 00                	add    %al,(%eax)
    16bd:	57                   	push   %edi
    16be:	03 00                	add    (%eax),%eax
    16c0:	00 16                	add    %dl,(%esi)
    16c2:	8b 04 08             	mov    (%eax,%ecx,1),%eax
    16c5:	58                   	pop    %eax
    16c6:	00 00                	add    %al,(%eax)
    16c8:	00 01                	add    %al,(%ecx)
    16ca:	9c                   	pushf  
    16cb:	d3 16                	rcll   %cl,(%esi)
    16cd:	00 00                	add    %al,(%eax)
    16cf:	dc 16                	fcoml  (%esi)
    16d1:	00 00                	add    %al,(%eax)
    16d3:	46                   	inc    %esi
    16d4:	a5                   	movsl  %ds:(%esi),%es:(%edi)
    16d5:	16                   	push   %ss
    16d6:	00 00                	add    %al,(%eax)
    16d8:	02 91 00 00 45 97    	add    -0x68bb0000(%ecx),%dl
    16de:	16                   	push   %ss
    16df:	00 00                	add    %al,(%eax)
    16e1:	64 0b 00             	or     %fs:(%eax),%eax
    16e4:	00 6e 8b             	add    %ch,-0x75(%esi)
    16e7:	04 08                	add    $0x8,%al
    16e9:	24 00                	and    $0x0,%al
    16eb:	00 00                	add    %al,(%eax)
    16ed:	01 9c f7 16 00 00 00 	add    %ebx,0x16(%edi,%esi,8)
    16f4:	17                   	pop    %ss
    16f5:	00 00                	add    %al,(%eax)
    16f7:	46                   	inc    %esi
    16f8:	a5                   	movsl  %ds:(%esi),%es:(%edi)
    16f9:	16                   	push   %ss
    16fa:	00 00                	add    %al,(%eax)
    16fc:	02 91 00 00 47 15    	add    0x15470000(%ecx),%dl
    1702:	15 00 00 92 8b       	adc    $0x8b920000,%eax
    1707:	04 08                	add    $0x8,%al
    1709:	33 00                	xor    (%eax),%eax
    170b:	00 00                	add    %al,(%eax)
    170d:	01 9c 17 17 00 00 24 	add    %ebx,0x24000017(%edi,%edx,1)
    1714:	17                   	pop    %ss
    1715:	00 00                	add    %al,(%eax)
    1717:	48                   	dec    %eax
    1718:	ff 05 00 00 6e 16    	incl   0x166e0000
    171e:	00 00                	add    %al,(%eax)
    1720:	02 91 00 00 47 33    	add    0x33470000(%ecx),%dl
    1726:	15 00 00 c6 8b       	adc    $0x8bc60000,%eax
    172b:	04 08                	add    $0x8,%al
    172d:	33 00                	xor    (%eax),%eax
    172f:	00 00                	add    %al,(%eax)
    1731:	01 9c 3b 17 00 00 48 	add    %ebx,0x48000017(%ebx,%edi,1)
    1738:	17                   	pop    %ss
    1739:	00 00                	add    %al,(%eax)
    173b:	48                   	dec    %eax
    173c:	ff 05 00 00 6e 16    	incl   0x166e0000
    1742:	00 00                	add    %al,(%eax)
    1744:	02 91 00 00 43 a2    	add    -0x5dbd0000(%ecx),%dl
    174a:	15 00 00 02 56       	adc    $0x56020000,%eax
    174f:	17                   	pop    %ss
    1750:	00 00                	add    %al,(%eax)
    1752:	60                   	pusha  
    1753:	17                   	pop    %ss
    1754:	00 00                	add    %al,(%eax)
    1756:	44                   	inc    %esp
    1757:	ff 05 00 00 60 17    	incl   0x17600000
    175d:	00 00                	add    %al,(%eax)
    175f:	00 0e                	add    %cl,(%esi)
    1761:	19 16                	sbb    %edx,(%esi)
    1763:	00 00                	add    %al,(%eax)
    1765:	45                   	inc    %ebp
    1766:	48                   	dec    %eax
    1767:	17                   	pop    %ss
    1768:	00 00                	add    %al,(%eax)
    176a:	e4 04                	in     $0x4,%al
    176c:	00 00                	add    %al,(%eax)
    176e:	fa                   	cli    
    176f:	8b 04 08             	mov    (%eax,%ecx,1),%eax
    1772:	72 00                	jb     1774 <_init-0x8046ecc>
    1774:	00 00                	add    %al,(%eax)
    1776:	01 9c 80 17 00 00 89 	add    %ebx,-0x76ffffe9(%eax,%eax,4)
    177d:	17                   	pop    %ss
    177e:	00 00                	add    %al,(%eax)
    1780:	46                   	inc    %esi
    1781:	56                   	push   %esi
    1782:	17                   	pop    %ss
    1783:	00 00                	add    %al,(%eax)
    1785:	02 91 00 00 43 b8    	add    -0x47bd0000(%ecx),%dl
    178b:	15 00 00 02 97       	adc    $0x97020000,%eax
    1790:	17                   	pop    %ss
    1791:	00 00                	add    %al,(%eax)
    1793:	aa                   	stos   %al,%es:(%edi)
    1794:	17                   	pop    %ss
    1795:	00 00                	add    %al,(%eax)
    1797:	44                   	inc    %esp
    1798:	ff 05 00 00 60 17    	incl   0x17600000
    179e:	00 00                	add    %al,(%eax)
    17a0:	44                   	inc    %esp
    17a1:	fd                   	std    
    17a2:	0c 00                	or     $0x0,%al
    17a4:	00 ee                	add    %ch,%dh
    17a6:	00 00                	add    %al,(%eax)
    17a8:	00 00                	add    %al,(%eax)
    17aa:	45                   	inc    %ebp
    17ab:	89 17                	mov    %edx,(%edi)
    17ad:	00 00                	add    %al,(%eax)
    17af:	94                   	xchg   %eax,%esp
    17b0:	06                   	push   %es
    17b1:	00 00                	add    %al,(%eax)
    17b3:	6c                   	insb   (%dx),%es:(%edi)
    17b4:	8c 04 08             	mov    %es,(%eax,%ecx,1)
    17b7:	89 00                	mov    %eax,(%eax)
    17b9:	00 00                	add    %al,(%eax)
    17bb:	01 9c c5 17 00 00 ce 	add    %ebx,-0x31ffffe9(%ebp,%eax,8)
    17c2:	17                   	pop    %ss
    17c3:	00 00                	add    %al,(%eax)
    17c5:	46                   	inc    %esi
    17c6:	97                   	xchg   %eax,%edi
    17c7:	17                   	pop    %ss
    17c8:	00 00                	add    %al,(%eax)
    17ca:	02 91 00 00 45 89    	add    -0x76bb0000(%ecx),%dl
    17d0:	17                   	pop    %ss
    17d1:	00 00                	add    %al,(%eax)
    17d3:	11 01                	adc    %eax,(%ecx)
    17d5:	00 00                	add    %al,(%eax)
    17d7:	f6                   	(bad)  
    17d8:	8c 04 08             	mov    %es,(%eax,%ecx,1)
    17db:	24 00                	and    $0x0,%al
    17dd:	00 00                	add    %al,(%eax)
    17df:	01 9c e9 17 00 00 f2 	add    %ebx,-0xdffffe9(%ecx,%ebp,8)
    17e6:	17                   	pop    %ss
    17e7:	00 00                	add    %al,(%eax)
    17e9:	46                   	inc    %esi
    17ea:	97                   	xchg   %eax,%edi
    17eb:	17                   	pop    %ss
    17ec:	00 00                	add    %al,(%eax)
    17ee:	02 91 00 00 47 f6    	add    -0x9b90000(%ecx),%dl
    17f4:	15 00 00 1a 8d       	adc    $0x8d1a0000,%eax
    17f9:	04 08                	add    $0x8,%al
    17fb:	33 00                	xor    (%eax),%eax
    17fd:	00 00                	add    %al,(%eax)
    17ff:	01 9c 09 18 00 00 16 	add    %ebx,0x16000018(%ecx,%ecx,1)
    1806:	18 00                	sbb    %al,(%eax)
    1808:	00 48 ff             	add    %cl,-0x1(%eax)
    180b:	05 00 00 60 17       	add    $0x17600000,%eax
    1810:	00 00                	add    %al,(%eax)
    1812:	02 91 00 00 43 29    	add    0x29430000(%ecx),%dl
    1818:	14 00                	adc    $0x0,%al
    181a:	00 02                	add    %al,(%edx)
    181c:	24 18                	and    $0x18,%al
    181e:	00 00                	add    %al,(%eax)
    1820:	2e 18 00             	sbb    %al,%cs:(%eax)
    1823:	00 44 ff 05          	add    %al,0x5(%edi,%edi,8)
    1827:	00 00                	add    %al,(%eax)
    1829:	2e 18 00             	sbb    %al,%cs:(%eax)
    182c:	00 00                	add    %al,(%eax)
    182e:	0e                   	push   %cs
    182f:	56                   	push   %esi
    1830:	15 00 00 45 16       	adc    $0x16450000,%eax
    1835:	18 00                	sbb    %al,(%eax)
    1837:	00 78 0b             	add    %bh,0xb(%eax)
    183a:	00 00                	add    %al,(%eax)
    183c:	4e                   	dec    %esi
    183d:	8d 04 08             	lea    (%eax,%ecx,1),%eax
    1840:	72 00                	jb     1842 <_init-0x8046dfe>
    1842:	00 00                	add    %al,(%eax)
    1844:	01 9c 4e 18 00 00 57 	add    %ebx,0x57000018(%esi,%ecx,2)
    184b:	18 00                	sbb    %al,(%eax)
    184d:	00 46 24             	add    %al,0x24(%esi)
    1850:	18 00                	sbb    %al,(%eax)
    1852:	00 02                	add    %al,(%edx)
    1854:	91                   	xchg   %eax,%ecx
    1855:	00 00                	add    %al,(%eax)
    1857:	43                   	inc    %ebx
    1858:	3f                   	aas    
    1859:	14 00                	adc    $0x0,%al
    185b:	00 02                	add    %al,(%edx)
    185d:	65 18 00             	sbb    %al,%gs:(%eax)
    1860:	00 78 18             	add    %bh,0x18(%eax)
    1863:	00 00                	add    %al,(%eax)
    1865:	44                   	inc    %esp
    1866:	ff 05 00 00 2e 18    	incl   0x182e0000
    186c:	00 00                	add    %al,(%eax)
    186e:	44                   	inc    %esp
    186f:	fd                   	std    
    1870:	0c 00                	or     $0x0,%al
    1872:	00 ee                	add    %ch,%dh
    1874:	00 00                	add    %al,(%eax)
    1876:	00 00                	add    %al,(%eax)
    1878:	45                   	inc    %ebp
    1879:	57                   	push   %edi
    187a:	18 00                	sbb    %al,(%eax)
    187c:	00 14 05 00 00 c0 8d 	add    %dl,-0x72400000(,%eax,1)
    1883:	04 08                	add    $0x8,%al
    1885:	89 00                	mov    %eax,(%eax)
    1887:	00 00                	add    %al,(%eax)
    1889:	01 9c 93 18 00 00 9c 	add    %ebx,-0x63ffffe8(%ebx,%edx,4)
    1890:	18 00                	sbb    %al,(%eax)
    1892:	00 46 65             	add    %al,0x65(%esi)
    1895:	18 00                	sbb    %al,(%eax)
    1897:	00 02                	add    %al,(%edx)
    1899:	91                   	xchg   %eax,%ecx
    189a:	00 00                	add    %al,(%eax)
    189c:	45                   	inc    %ebp
    189d:	57                   	push   %edi
    189e:	18 00                	sbb    %al,(%eax)
    18a0:	00 07                	add    %al,(%edi)
    18a2:	0d 00 00 4a 8e       	or     $0x8e4a0000,%eax
    18a7:	04 08                	add    $0x8,%al
    18a9:	24 00                	and    $0x0,%al
    18ab:	00 00                	add    %al,(%eax)
    18ad:	01 9c b7 18 00 00 c0 	add    %ebx,-0x3fffffe8(%edi,%esi,4)
    18b4:	18 00                	sbb    %al,(%eax)
    18b6:	00 46 65             	add    %al,0x65(%esi)
    18b9:	18 00                	sbb    %al,(%eax)
    18bb:	00 02                	add    %al,(%edx)
    18bd:	91                   	xchg   %eax,%ecx
    18be:	00 00                	add    %al,(%eax)
    18c0:	47                   	inc    %edi
    18c1:	7d 14                	jge    18d7 <_init-0x8046d69>
    18c3:	00 00                	add    %al,(%eax)
    18c5:	6e                   	outsb  %ds:(%esi),(%dx)
    18c6:	8e 04 08             	mov    (%eax,%ecx,1),%es
    18c9:	33 00                	xor    (%eax),%eax
    18cb:	00 00                	add    %al,(%eax)
    18cd:	01 9c d7 18 00 00 e4 	add    %ebx,-0x1bffffe8(%edi,%edx,8)
    18d4:	18 00                	sbb    %al,(%eax)
    18d6:	00 48 ff             	add    %cl,-0x1(%eax)
    18d9:	05 00 00 2e 18       	add    $0x182e0000,%eax
    18de:	00 00                	add    %al,(%eax)
    18e0:	02 91 00 00 49 0f    	add    0xf490000(%ecx),%dl
    18e6:	00 00                	add    %al,(%eax)
    18e8:	00 01                	add    %al,(%ecx)
    18ea:	57                   	push   %edi
    18eb:	ca 00 00             	lret   $0x0
    18ee:	00 2b                	add    %ch,(%ebx)
    18f0:	88 04 08             	mov    %al,(%eax,%ecx,1)
    18f3:	4d                   	dec    %ebp
    18f4:	02 00                	add    (%eax),%al
    18f6:	00 01                	add    %al,(%ecx)
    18f8:	9c                   	pushf  
    18f9:	3f                   	aas    
    18fa:	19 00                	sbb    %eax,(%eax)
    18fc:	00 4a 3d             	add    %cl,0x3d(%edx)
    18ff:	88 04 08             	mov    %al,(%eax,%ecx,1)
    1902:	31 02                	xor    %eax,(%edx)
    1904:	00 00                	add    %al,(%eax)
    1906:	4b                   	dec    %ebx
    1907:	70 62                	jo     196b <_init-0x8046cd5>
    1909:	63 00                	arpl   %ax,(%eax)
    190b:	01 59 45             	add    %ebx,0x45(%ecx)
    190e:	16                   	push   %ss
    190f:	00 00                	add    %al,(%eax)
    1911:	02 75 74             	add    0x74(%ebp),%dh
    1914:	4b                   	dec    %ebx
    1915:	62 63 00             	bound  %esp,0x0(%ebx)
    1918:	01 5b a0             	add    %ebx,-0x60(%ebx)
    191b:	14 00                	adc    $0x0,%al
    191d:	00 02                	add    %al,(%edx)
    191f:	75 6c                	jne    198d <_init-0x8046cb3>
    1921:	4b                   	dec    %ebx
    1922:	64 63 31             	arpl   %si,%fs:(%ecx)
    1925:	00 01                	add    %al,(%ecx)
    1927:	5d                   	pop    %ebp
    1928:	67 15 00 00 02 75    	addr16 adc $0x75020000,%eax
    192e:	60                   	pusha  
    192f:	4b                   	dec    %ebx
    1930:	64 63 32             	arpl   %si,%fs:(%edx)
    1933:	00 01                	add    %al,(%ecx)
    1935:	5f                   	pop    %edi
    1936:	ee                   	out    %al,(%dx)
    1937:	13 00                	adc    (%eax),%eax
    1939:	00 02                	add    %al,(%edx)
    193b:	75 54                	jne    1991 <_init-0x8046caf>
    193d:	00 00                	add    %al,(%eax)
    193f:	4c                   	dec    %esp
    1940:	9c                   	pushf  
    1941:	08 00                	or     %al,(%eax)
    1943:	00 78 8a             	add    %bh,-0x76(%eax)
    1946:	04 08                	add    $0x8,%al
    1948:	41                   	inc    %ecx
    1949:	00 00                	add    %al,(%eax)
    194b:	00 01                	add    %al,(%ecx)
    194d:	9c                   	pushf  
    194e:	6f                   	outsl  %ds:(%esi),(%dx)
    194f:	19 00                	sbb    %eax,(%eax)
    1951:	00 4d 56             	add    %cl,0x56(%ebp)
    1954:	06                   	push   %es
    1955:	00 00                	add    %al,(%eax)
    1957:	01 72 ca             	add    %esi,-0x36(%edx)
    195a:	00 00                	add    %al,(%eax)
    195c:	00 02                	add    %al,(%edx)
    195e:	91                   	xchg   %eax,%ecx
    195f:	00 4d c0             	add    %cl,-0x40(%ebp)
    1962:	05 00 00 01 72       	add    $0x72010000,%eax
    1967:	ca 00 00             	lret   $0x0
    196a:	00 02                	add    %al,(%edx)
    196c:	91                   	xchg   %eax,%ecx
    196d:	04 00                	add    $0x0,%al
    196f:	4e                   	dec    %esi
    1970:	00 00                	add    %al,(%eax)
    1972:	00 00                	add    %al,(%eax)
    1974:	b9 8a 04 08 1a       	mov    $0x1a08048a,%ecx
    1979:	00 00                	add    %al,(%eax)
    197b:	00 01                	add    %al,(%ecx)
    197d:	9c                   	pushf  
    197e:	4f                   	dec    %edi
    197f:	3b 0c 00             	cmp    (%eax,%eax,1),%ecx
    1982:	00 46 13             	add    %al,0x13(%esi)
    1985:	00 00                	add    %al,(%eax)
    1987:	50                   	push   %eax
    1988:	94                   	xchg   %eax,%esp
    1989:	08 00                	or     %al,(%eax)
    198b:	00 05 03 0d a8 04    	add    %al,0x4a80d03
    1991:	08 51 2d             	or     %dl,0x2d(%ecx)
    1994:	10 00                	adc    %al,(%eax)
    1996:	00 01                	add    %al,(%ecx)
    1998:	04 00                	add    $0x0,%al
    199a:	00 80 80 80 80 78    	add    %al,0x78808080(%eax)
    19a0:	52                   	push   %edx
    19a1:	38 10                	cmp    %dl,(%eax)
    19a3:	00 00                	add    %al,(%eax)
    19a5:	59                   	pop    %ecx
    19a6:	00 00                	add    %al,(%eax)
    19a8:	00 ff                	add    %bh,%bh
    19aa:	ff                   	(bad)  
    19ab:	ff                   	(bad)  
    19ac:	7f 53                	jg     1a01 <_init-0x8046c3f>
    19ae:	90                   	nop
    19af:	10 00                	adc    %al,(%eax)
    19b1:	00 2b                	add    %ch,(%ebx)
    19b3:	07                   	pop    %es
    19b4:	00 00                	add    %al,(%eax)
    19b6:	20 53 bc             	and    %dl,-0x44(%ebx)
    19b9:	10 00                	adc    %al,(%eax)
    19bb:	00 5c 09 00          	add    %bl,0x0(%ecx,%ecx,1)
    19bf:	00 7f 51             	add    %bh,0x51(%edi)
    19c2:	ef                   	out    %eax,(%dx)
    19c3:	10 00                	adc    %al,(%eax)
    19c5:	00 ab 06 00 00 80    	add    %ch,-0x7ffffffa(%ebx)
    19cb:	80 7e 54 fa          	cmpb   $0xfa,0x54(%esi)
    19cf:	10 00                	adc    %al,(%eax)
    19d1:	00 ee                	add    %ch,%dh
    19d3:	02 00                	add    (%eax),%al
    19d5:	00 ff                	add    %bh,%bh
    19d7:	7f 00                	jg     19d9 <_init-0x8046c67>

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
   8:	0e                   	push   %cs
   9:	1b 0e                	sbb    (%esi),%ecx
   b:	55                   	push   %ebp
   c:	17                   	pop    %ss
   d:	11 01                	adc    %eax,(%ecx)
   f:	10 17                	adc    %dl,(%edi)
  11:	00 00                	add    %al,(%eax)
  13:	02 13                	add    (%ebx),%dl
  15:	00 03                	add    %al,(%ebx)
  17:	0e                   	push   %cs
  18:	3c 19                	cmp    $0x19,%al
  1a:	00 00                	add    %al,(%eax)
  1c:	03 16                	add    (%esi),%edx
  1e:	00 03                	add    %al,(%ebx)
  20:	0e                   	push   %cs
  21:	3a 0b                	cmp    (%ebx),%cl
  23:	3b 0b                	cmp    (%ebx),%ecx
  25:	49                   	dec    %ecx
  26:	13 00                	adc    (%eax),%eax
  28:	00 04 0f             	add    %al,(%edi,%ecx,1)
  2b:	00 0b                	add    %cl,(%ebx)
  2d:	0b 03                	or     (%ebx),%eax
  2f:	0e                   	push   %cs
  30:	49                   	dec    %ecx
  31:	13 00                	adc    (%eax),%eax
  33:	00 05 24 00 0b 0b    	add    %al,0xb0b0024
  39:	3e 0b 03             	or     %ds:(%ebx),%eax
  3c:	0e                   	push   %cs
  3d:	00 00                	add    %al,(%eax)
  3f:	06                   	push   %es
  40:	16                   	push   %ss
  41:	00 03                	add    %al,(%ebx)
  43:	0e                   	push   %cs
  44:	3a 0b                	cmp    (%ebx),%cl
  46:	3b 05 49 13 00 00    	cmp    0x1349,%eax
  4c:	07                   	pop    %es
  4d:	13 01                	adc    (%ecx),%eax
  4f:	0b 0b                	or     (%ebx),%ecx
  51:	3a 0b                	cmp    (%ebx),%cl
  53:	3b 0b                	cmp    (%ebx),%ecx
  55:	6e                   	outsb  %ds:(%esi),(%dx)
  56:	0e                   	push   %cs
  57:	01 13                	add    %edx,(%ebx)
  59:	00 00                	add    %al,(%eax)
  5b:	08 17                	or     %dl,(%edi)
  5d:	01 0b                	add    %ecx,(%ebx)
  5f:	0b 3a                	or     (%edx),%edi
  61:	0b 3b                	or     (%ebx),%edi
  63:	0b 01                	or     (%ecx),%eax
  65:	13 00                	adc    (%eax),%eax
  67:	00 09                	add    %cl,(%ecx)
  69:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
  6e:	0b 3b                	or     (%ebx),%edi
  70:	0b 49 13             	or     0x13(%ecx),%ecx
  73:	00 00                	add    %al,(%eax)
  75:	0a 0d 00 03 0e 3a    	or     0x3a0e0300,%cl
  7b:	0b 3b                	or     (%ebx),%edi
  7d:	0b 49 13             	or     0x13(%ecx),%ecx
  80:	38 0b                	cmp    %cl,(%ebx)
  82:	00 00                	add    %al,(%eax)
  84:	0b 01                	or     (%ecx),%eax
  86:	01 49 13             	add    %ecx,0x13(%ecx)
  89:	01 13                	add    %edx,(%ebx)
  8b:	00 00                	add    %al,(%eax)
  8d:	0c 21                	or     $0x21,%al
  8f:	00 49 13             	add    %cl,0x13(%ecx)
  92:	2f                   	das    
  93:	0b 00                	or     (%eax),%eax
  95:	00 0d 24 00 0b 0b    	add    %cl,0xb0b0024
  9b:	3e 0b 03             	or     %ds:(%ebx),%eax
  9e:	08 00                	or     %al,(%eax)
  a0:	00 0e                	add    %cl,(%esi)
  a2:	26 00 49 13          	add    %cl,%es:0x13(%ecx)
  a6:	00 00                	add    %al,(%eax)
  a8:	0f                   	(bad)  
  a9:	0f 00 0b             	str    (%ebx)
  ac:	0b 49 13             	or     0x13(%ecx),%ecx
  af:	00 00                	add    %al,(%eax)
  b1:	10 39                	adc    %bh,(%ecx)
  b3:	01 03                	add    %eax,(%ebx)
  b5:	08 3a                	or     %bh,(%edx)
  b7:	0b 3b                	or     (%ebx),%edi
  b9:	0b 01                	or     (%ecx),%eax
  bb:	13 00                	adc    (%eax),%eax
  bd:	00 11                	add    %dl,(%ecx)
  bf:	08 00                	or     %al,(%eax)
  c1:	3a 0b                	cmp    (%ebx),%cl
  c3:	3b 0b                	cmp    (%ebx),%ecx
  c5:	18 13                	sbb    %dl,(%ebx)
  c7:	00 00                	add    %al,(%eax)
  c9:	12 08                	adc    (%eax),%cl
  cb:	00 3a                	add    %bh,(%edx)
  cd:	0b 3b                	or     (%ebx),%edi
  cf:	05 18 13 00 00       	add    $0x1318,%eax
  d4:	13 39                	adc    (%ecx),%edi
  d6:	00 03                	add    %al,(%ebx)
  d8:	0e                   	push   %cs
  d9:	3a 0b                	cmp    (%ebx),%cl
  db:	3b 0b                	cmp    (%ebx),%ecx
  dd:	00 00                	add    %al,(%eax)
  df:	14 13                	adc    $0x13,%al
  e1:	01 03                	add    %eax,(%ebx)
  e3:	0e                   	push   %cs
  e4:	0b 0b                	or     (%ebx),%ecx
  e6:	3a 0b                	cmp    (%ebx),%cl
  e8:	3b 0b                	cmp    (%ebx),%ecx
  ea:	01 13                	add    %edx,(%ebx)
  ec:	00 00                	add    %al,(%eax)
  ee:	15 2e 01 3f 19       	adc    $0x193f012e,%eax
  f3:	03 0e                	add    (%esi),%ecx
  f5:	3a 0b                	cmp    (%ebx),%cl
  f7:	3b 0b                	cmp    (%ebx),%ecx
  f9:	6e                   	outsb  %ds:(%esi),(%dx)
  fa:	0e                   	push   %cs
  fb:	3c 19                	cmp    $0x19,%al
  fd:	01 13                	add    %edx,(%ebx)
  ff:	00 00                	add    %al,(%eax)
 101:	16                   	push   %ss
 102:	05 00 49 13 00       	add    $0x134900,%eax
 107:	00 17                	add    %dl,(%edi)
 109:	2e 01 3f             	add    %edi,%cs:(%edi)
 10c:	19 03                	sbb    %eax,(%ebx)
 10e:	08 3a                	or     %bh,(%edx)
 110:	0b 3b                	or     (%ebx),%edi
 112:	0b 6e 0e             	or     0xe(%esi),%ebp
 115:	49                   	dec    %ecx
 116:	13 3c 19             	adc    (%ecx,%ebx,1),%edi
 119:	01 13                	add    %edx,(%ebx)
 11b:	00 00                	add    %al,(%eax)
 11d:	18 2e                	sbb    %ch,(%esi)
 11f:	01 3f                	add    %edi,(%edi)
 121:	19 03                	sbb    %eax,(%ebx)
 123:	0e                   	push   %cs
 124:	3a 0b                	cmp    (%ebx),%cl
 126:	3b 05 6e 0e 49 13    	cmp    0x13490e6e,%eax
 12c:	3c 19                	cmp    $0x19,%al
 12e:	01 13                	add    %edx,(%ebx)
 130:	00 00                	add    %al,(%eax)
 132:	19 2e                	sbb    %ebp,(%esi)
 134:	00 3f                	add    %bh,(%edi)
 136:	19 03                	sbb    %eax,(%ebx)
 138:	08 3a                	or     %bh,(%edx)
 13a:	0b 3b                	or     (%ebx),%edi
 13c:	05 6e 0e 49 13       	add    $0x13490e6e,%eax
 141:	3c 19                	cmp    $0x19,%al
 143:	00 00                	add    %al,(%eax)
 145:	1a 2e                	sbb    (%esi),%ch
 147:	01 3f                	add    %edi,(%edi)
 149:	19 03                	sbb    %eax,(%ebx)
 14b:	0e                   	push   %cs
 14c:	3a 0b                	cmp    (%ebx),%cl
 14e:	3b 05 6e 0e 49 13    	cmp    0x13490e6e,%eax
 154:	3c 19                	cmp    $0x19,%al
 156:	00 00                	add    %al,(%eax)
 158:	1b 04 01             	sbb    (%ecx,%eax,1),%eax
 15b:	03 0e                	add    (%esi),%ecx
 15d:	0b 0b                	or     (%ebx),%ecx
 15f:	3a 0b                	cmp    (%ebx),%cl
 161:	3b 0b                	cmp    (%ebx),%ecx
 163:	01 13                	add    %edx,(%ebx)
 165:	00 00                	add    %al,(%eax)
 167:	1c 28                	sbb    $0x28,%al
 169:	00 03                	add    %al,(%ebx)
 16b:	0e                   	push   %cs
 16c:	1c 0d                	sbb    $0xd,%al
 16e:	00 00                	add    %al,(%eax)
 170:	1d 02 01 03 0e       	sbb    $0xe030102,%eax
 175:	3c 19                	cmp    $0x19,%al
 177:	01 13                	add    %edx,(%ebx)
 179:	00 00                	add    %al,(%eax)
 17b:	1e                   	push   %ds
 17c:	02 01                	add    (%ecx),%al
 17e:	03 0e                	add    (%esi),%ecx
 180:	0b 0b                	or     (%ebx),%ecx
 182:	3a 0b                	cmp    (%ebx),%cl
 184:	3b 05 32 0b 01 13    	cmp    0x13010b32,%eax
 18a:	00 00                	add    %al,(%eax)
 18c:	1f                   	pop    %ds
 18d:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 192:	0b 3b                	or     (%ebx),%edi
 194:	05 49 13 3f 19       	add    $0x193f1349,%eax
 199:	3c 19                	cmp    $0x19,%al
 19b:	00 00                	add    %al,(%eax)
 19d:	20 2e                	and    %ch,(%esi)
 19f:	01 3f                	add    %edi,(%edi)
 1a1:	19 03                	sbb    %eax,(%ebx)
 1a3:	0e                   	push   %cs
 1a4:	3a 0b                	cmp    (%ebx),%cl
 1a6:	3b 05 32 0b 3c 19    	cmp    0x193c0b32,%eax
 1ac:	64 13 01             	adc    %fs:(%ecx),%eax
 1af:	13 00                	adc    (%eax),%eax
 1b1:	00 21                	add    %ah,(%ecx)
 1b3:	05 00 49 13 34       	add    $0x34134900,%eax
 1b8:	19 00                	sbb    %eax,(%eax)
 1ba:	00 22                	add    %ah,(%edx)
 1bc:	2e 01 3f             	add    %edi,%cs:(%edi)
 1bf:	19 03                	sbb    %eax,(%ebx)
 1c1:	0e                   	push   %cs
 1c2:	3a 0b                	cmp    (%ebx),%cl
 1c4:	3b 05 32 0b 3c 19    	cmp    0x193c0b32,%eax
 1ca:	64 13 00             	adc    %fs:(%eax),%eax
 1cd:	00 23                	add    %ah,(%ebx)
 1cf:	16                   	push   %ss
 1d0:	00 03                	add    %al,(%ebx)
 1d2:	0e                   	push   %cs
 1d3:	3a 0b                	cmp    (%ebx),%cl
 1d5:	3b 0b                	cmp    (%ebx),%ecx
 1d7:	49                   	dec    %ecx
 1d8:	13 32                	adc    (%edx),%esi
 1da:	0b 00                	or     (%eax),%eax
 1dc:	00 24 0d 00 03 0e 3a 	add    %ah,0x3a0e0300(,%ecx,1)
 1e3:	0b 3b                	or     (%ebx),%edi
 1e5:	05 49 13 3f 19       	add    $0x193f1349,%eax
 1ea:	32 0b                	xor    (%ebx),%cl
 1ec:	3c 19                	cmp    $0x19,%al
 1ee:	1c 0b                	sbb    $0xb,%al
 1f0:	00 00                	add    %al,(%eax)
 1f2:	25 0d 00 03 08       	and    $0x803000d,%eax
 1f7:	3a 0b                	cmp    (%ebx),%cl
 1f9:	3b 05 49 13 3f 19    	cmp    0x193f1349,%eax
 1ff:	32 0b                	xor    (%ebx),%cl
 201:	3c 19                	cmp    $0x19,%al
 203:	1c 0b                	sbb    $0xb,%al
 205:	00 00                	add    %al,(%eax)
 207:	26 0d 00 03 0e 3a    	es or  $0x3a0e0300,%eax
 20d:	0b 3b                	or     (%ebx),%edi
 20f:	05 49 13 3f 19       	add    $0x193f1349,%eax
 214:	32 0b                	xor    (%ebx),%cl
 216:	3c 19                	cmp    $0x19,%al
 218:	1c 05                	sbb    $0x5,%al
 21a:	00 00                	add    %al,(%eax)
 21c:	27                   	daa    
 21d:	16                   	push   %ss
 21e:	00 03                	add    %al,(%ebx)
 220:	0e                   	push   %cs
 221:	3a 0b                	cmp    (%ebx),%cl
 223:	3b 05 49 13 32 0b    	cmp    0xb321349,%eax
 229:	00 00                	add    %al,(%eax)
 22b:	28 2f                	sub    %ch,(%edi)
 22d:	00 03                	add    %al,(%ebx)
 22f:	0e                   	push   %cs
 230:	49                   	dec    %ecx
 231:	13 00                	adc    (%eax),%eax
 233:	00 29                	add    %ch,(%ecx)
 235:	2f                   	das    
 236:	00 03                	add    %al,(%ebx)
 238:	0e                   	push   %cs
 239:	49                   	dec    %ecx
 23a:	13 1e                	adc    (%esi),%ebx
 23c:	19 00                	sbb    %eax,(%eax)
 23e:	00 2a                	add    %ch,(%edx)
 240:	34 00                	xor    $0x0,%al
 242:	03 0e                	add    (%esi),%ecx
 244:	3a 0b                	cmp    (%ebx),%cl
 246:	3b 0b                	cmp    (%ebx),%ecx
 248:	6e                   	outsb  %ds:(%esi),(%dx)
 249:	0e                   	push   %cs
 24a:	49                   	dec    %ecx
 24b:	13 3f                	adc    (%edi),%edi
 24d:	19 3c 19             	sbb    %edi,(%ecx,%ebx,1)
 250:	00 00                	add    %al,(%eax)
 252:	2b 34 00             	sub    (%eax,%eax,1),%esi
 255:	03 0e                	add    (%esi),%ecx
 257:	3a 0b                	cmp    (%ebx),%cl
 259:	3b 0b                	cmp    (%ebx),%ecx
 25b:	49                   	dec    %ecx
 25c:	13 3c 19             	adc    (%ecx,%ebx,1),%edi
 25f:	00 00                	add    %al,(%eax)
 261:	2c 2e                	sub    $0x2e,%al
 263:	01 3f                	add    %edi,(%edi)
 265:	19 03                	sbb    %eax,(%ebx)
 267:	0e                   	push   %cs
 268:	3a 0b                	cmp    (%ebx),%cl
 26a:	3b 05 49 13 3c 19    	cmp    0x193c1349,%eax
 270:	01 13                	add    %edx,(%ebx)
 272:	00 00                	add    %al,(%eax)
 274:	2d 18 00 00 00       	sub    $0x18,%eax
 279:	2e 2e 00 3f          	cs add %bh,%cs:(%edi)
 27d:	19 03                	sbb    %eax,(%ebx)
 27f:	0e                   	push   %cs
 280:	3a 0b                	cmp    (%ebx),%cl
 282:	3b 05 49 13 3c 19    	cmp    0x193c1349,%eax
 288:	00 00                	add    %al,(%eax)
 28a:	2f                   	das    
 28b:	2e 01 3f             	add    %edi,%cs:(%edi)
 28e:	19 03                	sbb    %eax,(%ebx)
 290:	0e                   	push   %cs
 291:	3a 0b                	cmp    (%ebx),%cl
 293:	3b 0b                	cmp    (%ebx),%ecx
 295:	49                   	dec    %ecx
 296:	13 3c 19             	adc    (%ecx,%ebx,1),%edi
 299:	01 13                	add    %edx,(%ebx)
 29b:	00 00                	add    %al,(%eax)
 29d:	30 13                	xor    %dl,(%ebx)
 29f:	01 03                	add    %eax,(%ebx)
 2a1:	08 0b                	or     %cl,(%ebx)
 2a3:	0b 3a                	or     (%edx),%edi
 2a5:	0b 3b                	or     (%ebx),%edi
 2a7:	0b 01                	or     (%ecx),%eax
 2a9:	13 00                	adc    (%eax),%eax
 2ab:	00 31                	add    %dh,(%ecx)
 2ad:	2e 01 3f             	add    %edi,%cs:(%edi)
 2b0:	19 03                	sbb    %eax,(%ebx)
 2b2:	0e                   	push   %cs
 2b3:	3a 0b                	cmp    (%ebx),%cl
 2b5:	3b 0b                	cmp    (%ebx),%ecx
 2b7:	6e                   	outsb  %ds:(%esi),(%dx)
 2b8:	0e                   	push   %cs
 2b9:	49                   	dec    %ecx
 2ba:	13 3c 19             	adc    (%ecx,%ebx,1),%edi
 2bd:	01 13                	add    %edx,(%ebx)
 2bf:	00 00                	add    %al,(%eax)
 2c1:	32 39                	xor    (%ecx),%bh
 2c3:	01 03                	add    %eax,(%ebx)
 2c5:	0e                   	push   %cs
 2c6:	3a 0b                	cmp    (%ebx),%cl
 2c8:	3b 0b                	cmp    (%ebx),%ecx
 2ca:	01 13                	add    %edx,(%ebx)
 2cc:	00 00                	add    %al,(%eax)
 2ce:	33 0d 00 03 0e 3a    	xor    0x3a0e0300,%ecx
 2d4:	0b 3b                	or     (%ebx),%edi
 2d6:	0b 49 13             	or     0x13(%ecx),%ecx
 2d9:	3f                   	aas    
 2da:	19 3c 19             	sbb    %edi,(%ecx,%ebx,1)
 2dd:	00 00                	add    %al,(%eax)
 2df:	34 13                	xor    $0x13,%al
 2e1:	01 03                	add    %eax,(%ebx)
 2e3:	0e                   	push   %cs
 2e4:	0b 0b                	or     (%ebx),%ecx
 2e6:	3a 0b                	cmp    (%ebx),%cl
 2e8:	3b 0b                	cmp    (%ebx),%ecx
 2ea:	00 00                	add    %al,(%eax)
 2ec:	35 3a 00 3a 0b       	xor    $0xb3a003a,%eax
 2f1:	3b 0b                	cmp    (%ebx),%ecx
 2f3:	18 13                	sbb    %dl,(%ebx)
 2f5:	00 00                	add    %al,(%eax)
 2f7:	36 10 00             	adc    %al,%ss:(%eax)
 2fa:	0b 0b                	or     (%ebx),%ecx
 2fc:	49                   	dec    %ecx
 2fd:	13 00                	adc    (%eax),%eax
 2ff:	00 37                	add    %dh,(%edi)
 301:	2e 00 3f             	add    %bh,%cs:(%edi)
 304:	19 03                	sbb    %eax,(%ebx)
 306:	0e                   	push   %cs
 307:	3a 0b                	cmp    (%ebx),%cl
 309:	3b 0b                	cmp    (%ebx),%ecx
 30b:	49                   	dec    %ecx
 30c:	13 3c 19             	adc    (%ecx,%ebx,1),%edi
 30f:	00 00                	add    %al,(%eax)
 311:	38 0f                	cmp    %cl,(%edi)
 313:	00 0b                	add    %cl,(%ebx)
 315:	0b 00                	or     (%eax),%eax
 317:	00 39                	add    %bh,(%ecx)
 319:	02 01                	add    (%ecx),%al
 31b:	03 0e                	add    (%esi),%ecx
 31d:	0b 0b                	or     (%ebx),%ecx
 31f:	3a 0b                	cmp    (%ebx),%cl
 321:	3b 0b                	cmp    (%ebx),%ecx
 323:	1d 13 01 13 00       	sbb    $0x130113,%eax
 328:	00 3a                	add    %bh,(%edx)
 32a:	1c 00                	sbb    $0x0,%al
 32c:	49                   	dec    %ecx
 32d:	13 38                	adc    (%eax),%edi
 32f:	0b 32                	or     (%edx),%esi
 331:	0b 00                	or     (%eax),%eax
 333:	00 3b                	add    %bh,(%ebx)
 335:	0d 00 03 08 3a       	or     $0x3a080300,%eax
 33a:	0b 3b                	or     (%ebx),%edi
 33c:	0b 49 13             	or     0x13(%ecx),%ecx
 33f:	38 0b                	cmp    %cl,(%ebx)
 341:	32 0b                	xor    (%ebx),%cl
 343:	00 00                	add    %al,(%eax)
 345:	3c 2e                	cmp    $0x2e,%al
 347:	01 3f                	add    %edi,(%edi)
 349:	19 03                	sbb    %eax,(%ebx)
 34b:	0e                   	push   %cs
 34c:	34 19                	xor    $0x19,%al
 34e:	32 0b                	xor    (%ebx),%cl
 350:	3c 19                	cmp    $0x19,%al
 352:	64 13 01             	adc    %fs:(%ecx),%eax
 355:	13 00                	adc    (%eax),%eax
 357:	00 3d 2e 01 3f 19    	add    %bh,0x193f012e
 35d:	03 0e                	add    (%esi),%ecx
 35f:	3a 0b                	cmp    (%ebx),%cl
 361:	3b 0b                	cmp    (%ebx),%ecx
 363:	32 0b                	xor    (%ebx),%cl
 365:	3c 19                	cmp    $0x19,%al
 367:	64 13 01             	adc    %fs:(%ecx),%eax
 36a:	13 00                	adc    (%eax),%eax
 36c:	00 3e                	add    %bh,(%esi)
 36e:	2e 01 3f             	add    %edi,%cs:(%edi)
 371:	19 03                	sbb    %eax,(%ebx)
 373:	0e                   	push   %cs
 374:	3a 0b                	cmp    (%ebx),%cl
 376:	3b 0b                	cmp    (%ebx),%ecx
 378:	4c                   	dec    %esp
 379:	0b 1d 13 32 0b 3c    	or     0x3c0b3213,%ebx
 37f:	19 64 13 01          	sbb    %esp,0x1(%ebx,%edx,1)
 383:	13 00                	adc    (%eax),%eax
 385:	00 3f                	add    %bh,(%edi)
 387:	2e 01 3f             	add    %edi,%cs:(%edi)
 38a:	19 03                	sbb    %eax,(%ebx)
 38c:	0e                   	push   %cs
 38d:	3a 0b                	cmp    (%ebx),%cl
 38f:	3b 0b                	cmp    (%ebx),%ecx
 391:	6e                   	outsb  %ds:(%esi),(%dx)
 392:	0e                   	push   %cs
 393:	49                   	dec    %ecx
 394:	13 32                	adc    (%edx),%esi
 396:	0b 3c 19             	or     (%ecx,%ebx,1),%edi
 399:	64 13 01             	adc    %fs:(%ecx),%eax
 39c:	13 00                	adc    (%eax),%eax
 39e:	00 40 2e             	add    %al,0x2e(%eax)
 3a1:	01 3f                	add    %edi,(%edi)
 3a3:	19 03                	sbb    %eax,(%ebx)
 3a5:	0e                   	push   %cs
 3a6:	3a 0b                	cmp    (%ebx),%cl
 3a8:	3b 0b                	cmp    (%ebx),%ecx
 3aa:	6e                   	outsb  %ds:(%esi),(%dx)
 3ab:	0e                   	push   %cs
 3ac:	49                   	dec    %ecx
 3ad:	13 4c 0b 4d          	adc    0x4d(%ebx,%ecx,1),%ecx
 3b1:	18 1d 13 32 0b 3c    	sbb    %bl,0x3c0b3213
 3b7:	19 64 13 00          	sbb    %esp,0x0(%ebx,%edx,1)
 3bb:	00 41 0d             	add    %al,0xd(%ecx)
 3be:	00 03                	add    %al,(%ebx)
 3c0:	0e                   	push   %cs
 3c1:	49                   	dec    %ecx
 3c2:	13 38                	adc    (%eax),%edi
 3c4:	0b 34 19             	or     (%ecx,%ebx,1),%esi
 3c7:	32 0b                	xor    (%ebx),%cl
 3c9:	00 00                	add    %al,(%eax)
 3cb:	42                   	inc    %edx
 3cc:	15 01 49 13 01       	adc    $0x1134901,%eax
 3d1:	13 00                	adc    (%eax),%eax
 3d3:	00 43 2e             	add    %al,0x2e(%ebx)
 3d6:	01 47 13             	add    %eax,0x13(%edi)
 3d9:	20 0b                	and    %cl,(%ebx)
 3db:	64 13 01             	adc    %fs:(%ecx),%eax
 3de:	13 00                	adc    (%eax),%eax
 3e0:	00 44 05 00          	add    %al,0x0(%ebp,%eax,1)
 3e4:	03 0e                	add    (%esi),%ecx
 3e6:	49                   	dec    %ecx
 3e7:	13 34 19             	adc    (%ecx,%ebx,1),%esi
 3ea:	00 00                	add    %al,(%eax)
 3ec:	45                   	inc    %ebp
 3ed:	2e 01 31             	add    %esi,%cs:(%ecx)
 3f0:	13 6e 0e             	adc    0xe(%esi),%ebp
 3f3:	11 01                	adc    %eax,(%ecx)
 3f5:	12 06                	adc    (%esi),%al
 3f7:	40                   	inc    %eax
 3f8:	18 64 13 96          	sbb    %ah,-0x6a(%ebx,%edx,1)
 3fc:	42                   	inc    %edx
 3fd:	19 01                	sbb    %eax,(%ecx)
 3ff:	13 00                	adc    (%eax),%eax
 401:	00 46 05             	add    %al,0x5(%esi)
 404:	00 31                	add    %dh,(%ecx)
 406:	13 02                	adc    (%edx),%eax
 408:	18 00                	sbb    %al,(%eax)
 40a:	00 47 2e             	add    %al,0x2e(%edi)
 40d:	01 47 13             	add    %eax,0x13(%edi)
 410:	11 01                	adc    %eax,(%ecx)
 412:	12 06                	adc    (%esi),%al
 414:	40                   	inc    %eax
 415:	18 64 13 96          	sbb    %ah,-0x6a(%ebx,%edx,1)
 419:	42                   	inc    %edx
 41a:	19 01                	sbb    %eax,(%ecx)
 41c:	13 00                	adc    (%eax),%eax
 41e:	00 48 05             	add    %cl,0x5(%eax)
 421:	00 03                	add    %al,(%ebx)
 423:	0e                   	push   %cs
 424:	49                   	dec    %ecx
 425:	13 34 19             	adc    (%ecx,%ebx,1),%esi
 428:	02 18                	add    (%eax),%bl
 42a:	00 00                	add    %al,(%eax)
 42c:	49                   	dec    %ecx
 42d:	2e 01 3f             	add    %edi,%cs:(%edi)
 430:	19 03                	sbb    %eax,(%ebx)
 432:	0e                   	push   %cs
 433:	3a 0b                	cmp    (%ebx),%cl
 435:	3b 0b                	cmp    (%ebx),%ecx
 437:	49                   	dec    %ecx
 438:	13 11                	adc    (%ecx),%edx
 43a:	01 12                	add    %edx,(%edx)
 43c:	06                   	push   %es
 43d:	40                   	inc    %eax
 43e:	18 96 42 19 01 13    	sbb    %dl,0x13011942(%esi)
 444:	00 00                	add    %al,(%eax)
 446:	4a                   	dec    %edx
 447:	0b 01                	or     (%ecx),%eax
 449:	11 01                	adc    %eax,(%ecx)
 44b:	12 06                	adc    (%esi),%al
 44d:	00 00                	add    %al,(%eax)
 44f:	4b                   	dec    %ebx
 450:	34 00                	xor    $0x0,%al
 452:	03 08                	add    (%eax),%ecx
 454:	3a 0b                	cmp    (%ebx),%cl
 456:	3b 0b                	cmp    (%ebx),%ecx
 458:	49                   	dec    %ecx
 459:	13 02                	adc    (%edx),%eax
 45b:	18 00                	sbb    %al,(%eax)
 45d:	00 4c 2e 01          	add    %cl,0x1(%esi,%ebp,1)
 461:	03 0e                	add    (%esi),%ecx
 463:	34 19                	xor    $0x19,%al
 465:	11 01                	adc    %eax,(%ecx)
 467:	12 06                	adc    (%esi),%al
 469:	40                   	inc    %eax
 46a:	18 96 42 19 01 13    	sbb    %dl,0x13011942(%esi)
 470:	00 00                	add    %al,(%eax)
 472:	4d                   	dec    %ebp
 473:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 478:	0b 3b                	or     (%ebx),%edi
 47a:	0b 49 13             	or     0x13(%ecx),%ecx
 47d:	02 18                	add    (%eax),%bl
 47f:	00 00                	add    %al,(%eax)
 481:	4e                   	dec    %esi
 482:	2e 00 03             	add    %al,%cs:(%ebx)
 485:	0e                   	push   %cs
 486:	34 19                	xor    $0x19,%al
 488:	11 01                	adc    %eax,(%ecx)
 48a:	12 06                	adc    (%esi),%al
 48c:	40                   	inc    %eax
 48d:	18 96 42 19 00 00    	sbb    %dl,0x1942(%esi)
 493:	4f                   	dec    %edi
 494:	34 00                	xor    $0x0,%al
 496:	03 0e                	add    (%esi),%ecx
 498:	49                   	dec    %ecx
 499:	13 3f                	adc    (%edi),%edi
 49b:	19 34 19             	sbb    %esi,(%ecx,%ebx,1)
 49e:	3c 19                	cmp    $0x19,%al
 4a0:	00 00                	add    %al,(%eax)
 4a2:	50                   	push   %eax
 4a3:	34 00                	xor    $0x0,%al
 4a5:	47                   	inc    %edi
 4a6:	13 02                	adc    (%edx),%eax
 4a8:	18 00                	sbb    %al,(%eax)
 4aa:	00 51 34             	add    %dl,0x34(%ecx)
 4ad:	00 47 13             	add    %al,0x13(%edi)
 4b0:	6e                   	outsb  %ds:(%esi),(%dx)
 4b1:	0e                   	push   %cs
 4b2:	1c 0d                	sbb    $0xd,%al
 4b4:	00 00                	add    %al,(%eax)
 4b6:	52                   	push   %edx
 4b7:	34 00                	xor    $0x0,%al
 4b9:	47                   	inc    %edi
 4ba:	13 6e 0e             	adc    0xe(%esi),%ebp
 4bd:	1c 06                	sbb    $0x6,%al
 4bf:	00 00                	add    %al,(%eax)
 4c1:	53                   	push   %ebx
 4c2:	34 00                	xor    $0x0,%al
 4c4:	47                   	inc    %edi
 4c5:	13 6e 0e             	adc    0xe(%esi),%ebp
 4c8:	1c 0b                	sbb    $0xb,%al
 4ca:	00 00                	add    %al,(%eax)
 4cc:	54                   	push   %esp
 4cd:	34 00                	xor    $0x0,%al
 4cf:	47                   	inc    %edi
 4d0:	13 6e 0e             	adc    0xe(%esi),%ebp
 4d3:	1c 05                	sbb    $0x5,%al
 4d5:	00 00                	add    %al,(%eax)
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	40                   	inc    %eax
   1:	04 00                	add    $0x0,%al
   3:	00 02                	add    %al,(%edx)
   5:	00 25 02 00 00 01    	add    %ah,0x1000002
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	2f                   	das    
  1c:	75 73                	jne    91 <_init-0x80485af>
  1e:	72 2f                	jb     4f <_init-0x80485f1>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  27:	2f                   	das    
  28:	63 2b                	arpl   %bp,(%ebx)
  2a:	2b 2f                	sub    (%edi),%ebp
  2c:	34 2e                	xor    $0x2e,%al
  2e:	39 00                	cmp    %eax,(%eax)
  30:	2f                   	das    
  31:	75 73                	jne    a6 <_init-0x804859a>
  33:	72 2f                	jb     64 <_init-0x80485dc>
  35:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  3c:	00 2f                	add    %ch,(%edi)
  3e:	75 73                	jne    b3 <_init-0x804858d>
  40:	72 2f                	jb     71 <_init-0x80485cf>
  42:	6c                   	insb   (%dx),%es:(%edi)
  43:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%edx),%esp
  4a:	69 35 38 36 2d 6c 69 	imul   $0x78756e69,0x6c2d3638,%esi
  51:	6e 75 78 
  54:	2d 67 6e 75 2f       	sub    $0x2f756e67,%eax
  59:	34 2e                	xor    $0x2e,%al
  5b:	39 2f                	cmp    %ebp,(%edi)
  5d:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  64:	00 2f                	add    %ch,(%edi)
  66:	75 73                	jne    db <_init-0x8048565>
  68:	72 2f                	jb     99 <_init-0x80485a7>
  6a:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  71:	2f                   	das    
  72:	63 2b                	arpl   %bp,(%ebx)
  74:	2b 2f                	sub    (%edi),%ebp
  76:	34 2e                	xor    $0x2e,%al
  78:	39 2f                	cmp    %ebp,(%edi)
  7a:	62 69 74             	bound  %ebp,0x74(%ecx)
  7d:	73 00                	jae    7f <_init-0x80485c1>
  7f:	2f                   	das    
  80:	75 73                	jne    f5 <_init-0x804854b>
  82:	72 2f                	jb     b3 <_init-0x804858d>
  84:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  8b:	2f                   	das    
  8c:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
  92:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%esi),%ebp
  99:	75 2f                	jne    ca <_init-0x8048576>
  9b:	63 2b                	arpl   %bp,(%ebx)
  9d:	2b 2f                	sub    (%edi),%ebp
  9f:	34 2e                	xor    $0x2e,%al
  a1:	39 2f                	cmp    %ebp,(%edi)
  a3:	62 69 74             	bound  %ebp,0x74(%ecx)
  a6:	73 00                	jae    a8 <_init-0x8048598>
  a8:	2f                   	das    
  a9:	75 73                	jne    11e <_init-0x8048522>
  ab:	72 2f                	jb     dc <_init-0x8048564>
  ad:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  b4:	2f                   	das    
  b5:	63 2b                	arpl   %bp,(%ebx)
  b7:	2b 2f                	sub    (%edi),%ebp
  b9:	34 2e                	xor    $0x2e,%al
  bb:	39 2f                	cmp    %ebp,(%edi)
  bd:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
  c2:	00 2f                	add    %ch,(%edi)
  c4:	75 73                	jne    139 <_init-0x8048507>
  c6:	72 2f                	jb     f7 <_init-0x8048549>
  c8:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  cf:	2f                   	das    
  d0:	63 2b                	arpl   %bp,(%ebx)
  d2:	2b 2f                	sub    (%edi),%ebp
  d4:	34 2e                	xor    $0x2e,%al
  d6:	39 2f                	cmp    %ebp,(%edi)
  d8:	65 78 74             	gs js  14f <_init-0x80484f1>
  db:	00 2f                	add    %ch,(%edi)
  dd:	75 73                	jne    152 <_init-0x80484ee>
  df:	72 2f                	jb     110 <_init-0x8048530>
  e1:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  e8:	2f                   	das    
  e9:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
  ef:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%esi),%ebp
  f6:	75 2f                	jne    127 <_init-0x8048519>
  f8:	62 69 74             	bound  %ebp,0x74(%ecx)
  fb:	73 00                	jae    fd <_init-0x8048543>
  fd:	00 76 74             	add    %dh,0x74(%esi)
 100:	62 6c 2e 63          	bound  %ebp,0x63(%esi,%ebp,1)
 104:	70 70                	jo     176 <_init-0x80484ca>
 106:	00 00                	add    %al,(%eax)
 108:	00 00                	add    %al,(%eax)
 10a:	69 6f 73 74 72 65 61 	imul   $0x61657274,0x73(%edi),%ebp
 111:	6d                   	insl   (%dx),%es:(%edi)
 112:	00 01                	add    %al,(%ecx)
 114:	00 00                	add    %al,(%eax)
 116:	73 74                	jae    18c <_init-0x80484b4>
 118:	64 69 6f 2e 68 00 02 	imul   $0x20068,%fs:0x2e(%edi),%ebp
 11f:	00 
 120:	00 73 74             	add    %dh,0x74(%ebx)
 123:	64 61                	fs popa 
 125:	72 67                	jb     18e <_init-0x80484b2>
 127:	2e 68 00 03 00 00    	cs push $0x300
 12d:	73 74                	jae    1a3 <_init-0x804849d>
 12f:	64 64 65 66 2e 68 00 	fs fs gs cs pushw $0x300
 136:	03 
 137:	00 00                	add    %al,(%eax)
 139:	77 63                	ja     19e <_init-0x80484a2>
 13b:	68 61 72 2e 68       	push   $0x682e7261
 140:	00 02                	add    %al,(%edx)
 142:	00 00                	add    %al,(%eax)
 144:	63 77 63             	arpl   %si,0x63(%edi)
 147:	68 61 72 00 01       	push   $0x1007261
 14c:	00 00                	add    %al,(%eax)
 14e:	63 68 61             	arpl   %bp,0x61(%eax)
 151:	72 5f                	jb     1b2 <_init-0x804848e>
 153:	74 72                	je     1c7 <_init-0x8048479>
 155:	61                   	popa   
 156:	69 74 73 2e 68 00 04 	imul   $0x40068,0x2e(%ebx,%esi,2),%esi
 15d:	00 
 15e:	00 63 2b             	add    %ah,0x2b(%ebx)
 161:	2b 63 6f             	sub    0x6f(%ebx),%esp
 164:	6e                   	outsb  %ds:(%esi),(%dx)
 165:	66 69 67 2e 68 00    	imul   $0x68,0x2e(%edi),%sp
 16b:	05 00 00 63 6c       	add    $0x6c630000,%eax
 170:	6f                   	outsl  %ds:(%esi),(%dx)
 171:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 174:	65 00 01             	add    %al,%gs:(%ecx)
 177:	00 00                	add    %al,(%eax)
 179:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 180:	65 2e 68 00 04 00 00 	gs cs push $0x400
 187:	63 77 63             	arpl   %si,0x63(%edi)
 18a:	74 79                	je     205 <_init-0x804843b>
 18c:	70 65                	jo     1f3 <_init-0x804844d>
 18e:	00 01                	add    %al,(%ecx)
 190:	00 00                	add    %al,(%eax)
 192:	69 6f 73 66 77 64 00 	imul   $0x647766,0x73(%edi),%ebp
 199:	01 00                	add    %eax,(%eax)
 19b:	00 74 69 6d          	add    %dh,0x6d(%ecx,%ebp,2)
 19f:	65 2e 68 00 02 00 00 	gs cs push $0x200
 1a6:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
 1ab:	2e 68 00 06 00 00    	cs push $0x600
 1b1:	70 72                	jo     225 <_init-0x804841b>
 1b3:	65 64 65 66 69 6e 65 	gs fs imul $0x5f64,%gs:0x65(%esi),%bp
 1ba:	64 5f 
 1bc:	6f                   	outsl  %ds:(%esi),(%dx)
 1bd:	70 73                	jo     232 <_init-0x804840e>
 1bf:	2e 68 00 04 00 00    	cs push $0x400
 1c5:	6e                   	outsb  %ds:(%esi),(%dx)
 1c6:	65 77 5f             	gs ja  228 <_init-0x8048418>
 1c9:	61                   	popa   
 1ca:	6c                   	insb   (%dx),%es:(%edi)
 1cb:	6c                   	insb   (%dx),%es:(%edi)
 1cc:	6f                   	outsl  %ds:(%esi),(%dx)
 1cd:	63 61 74             	arpl   %sp,0x74(%ecx)
 1d0:	6f                   	outsl  %ds:(%esi),(%dx)
 1d1:	72 2e                	jb     201 <_init-0x804843f>
 1d3:	68 00 07 00 00       	push   $0x700
 1d8:	6e                   	outsb  %ds:(%esi),(%dx)
 1d9:	75 6d                	jne    248 <_init-0x80483f8>
 1db:	65 72 69             	gs jb  247 <_init-0x80483f9>
 1de:	63 5f 74             	arpl   %bx,0x74(%edi)
 1e1:	72 61                	jb     244 <_init-0x80483fc>
 1e3:	69 74 73 2e 68 00 07 	imul   $0x70068,0x2e(%ebx,%esi,2),%esi
 1ea:	00 
 1eb:	00 6c 6f 63          	add    %ch,0x63(%edi,%ebp,2)
 1ef:	61                   	popa   
 1f0:	6c                   	insb   (%dx),%es:(%edi)
 1f1:	65 2e 68 00 02 00 00 	gs cs push $0x200
 1f8:	74 79                	je     273 <_init-0x80483cd>
 1fa:	70 65                	jo     261 <_init-0x80483df>
 1fc:	73 2e                	jae    22c <_init-0x8048414>
 1fe:	68 00 08 00 00       	push   $0x800
 203:	61                   	popa   
 204:	74 6f                	je     275 <_init-0x80483cb>
 206:	6d                   	insl   (%dx),%es:(%edi)
 207:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%ebx),%esp
 20e:	2e 68 00 05 00 00    	cs push $0x500
 214:	77 63                	ja     279 <_init-0x80483c7>
 216:	74 79                	je     291 <_init-0x80483af>
 218:	70 65                	jo     27f <_init-0x80483c1>
 21a:	2e 68 00 02 00 00    	cs push $0x200
 220:	3c 62                	cmp    $0x62,%al
 222:	75 69                	jne    28d <_init-0x80483b3>
 224:	6c                   	insb   (%dx),%es:(%edi)
 225:	74 2d                	je     254 <_init-0x80483ec>
 227:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%esi),%ebp
 22e:	00 00                	add    %al,(%eax)
 230:	05 02 d4 8a 04       	add    $0x48ad402,%eax
 235:	08 18                	or     %bl,(%eax)
 237:	67 91                	addr16 xchg %eax,%ecx
 239:	9f                   	lahf   
 23a:	02 26                	add    (%esi),%ah
 23c:	13 02                	adc    (%edx),%eax
 23e:	02 00                	add    (%eax),%al
 240:	01 01                	add    %eax,(%ecx)
 242:	00 05 02 16 8b 04    	add    %al,0x48b1602
 248:	08 03                	or     %al,(%ebx)
 24a:	0b 01                	or     (%ecx),%eax
 24c:	67 91                	addr16 xchg %eax,%ecx
 24e:	9f                   	lahf   
 24f:	02 26                	add    (%esi),%ah
 251:	13 00                	adc    (%eax),%eax
 253:	02 04 02             	add    (%edx,%eax,1),%al
 256:	06                   	push   %es
 257:	90                   	nop
 258:	d6                   	(bad)  
 259:	02 02                	add    (%edx),%al
 25b:	00 01                	add    %al,(%ecx)
 25d:	01 00                	add    %eax,(%eax)
 25f:	05 02 6e 8b 04       	add    $0x48b6e02,%eax
 264:	08 03                	or     %al,(%ebx)
 266:	0b 01                	or     (%ecx),%eax
 268:	6a 02                	push   $0x2
 26a:	1e                   	push   %ds
 26b:	00 01                	add    %al,(%ecx)
 26d:	01 00                	add    %eax,(%eax)
 26f:	05 02 92 8b 04       	add    $0x48b9202,%eax
 274:	08 03                	or     %al,(%ebx)
 276:	11 01                	adc    %eax,(%ecx)
 278:	68 02 26 13 59       	push   $0x59132602
 27d:	02 02                	add    (%edx),%al
 27f:	00 01                	add    %al,(%ecx)
 281:	01 00                	add    %eax,(%eax)
 283:	05 02 c6 8b 04       	add    $0x48bc602,%eax
 288:	08 03                	or     %al,(%ebx)
 28a:	16                   	push   %ss
 28b:	01 68 02             	add    %ebp,0x2(%eax)
 28e:	26 13 59 02          	adc    %es:0x2(%ecx),%ebx
 292:	02 00                	add    (%eax),%al
 294:	01 01                	add    %eax,(%ecx)
 296:	00 05 02 fa 8b 04    	add    %al,0x48bfa02
 29c:	08 03                	or     %al,(%ebx)
 29e:	22 01                	and    (%ecx),%al
 2a0:	75 08                	jne    2aa <_init-0x8048396>
 2a2:	75 9f                	jne    243 <_init-0x80483fd>
 2a4:	00 02                	add    %al,(%edx)
 2a6:	04 01                	add    $0x1,%al
 2a8:	06                   	push   %es
 2a9:	02 23                	add    (%ebx),%ah
 2ab:	12 06                	adc    (%esi),%al
 2ad:	72 08                	jb     2b7 <_init-0x8048389>
 2af:	93                   	xchg   %eax,%ebx
 2b0:	02 05 00 01 01 00    	add    0x10100,%al
 2b6:	05 02 6c 8c 04       	add    $0x48c6c02,%eax
 2bb:	08 03                	or     %al,(%ebx)
 2bd:	27                   	daa    
 2be:	01 75 91             	add    %esi,-0x6f(%ebp)
 2c1:	9f                   	lahf   
 2c2:	00 02                	add    %al,(%edx)
 2c4:	04 01                	add    $0x1,%al
 2c6:	06                   	push   %es
 2c7:	02 23                	add    (%ebx),%ah
 2c9:	12 00                	adc    (%eax),%al
 2cb:	02 04 01             	add    (%ecx,%eax,1),%al
 2ce:	06                   	push   %es
 2cf:	3a 00                	cmp    (%eax),%al
 2d1:	02 04 01             	add    (%ecx,%eax,1),%al
 2d4:	e7 00                	out    %eax,$0x0
 2d6:	02 04 02             	add    (%edx,%eax,1),%al
 2d9:	06                   	push   %es
 2da:	90                   	nop
 2db:	06                   	push   %es
 2dc:	08 1d 08 93 02 05    	or     %bl,0x5029308
 2e2:	00 01                	add    %al,(%ecx)
 2e4:	01 00                	add    %eax,(%eax)
 2e6:	05 02 f6 8c 04       	add    $0x48cf602,%eax
 2eb:	08 03                	or     %al,(%ebx)
 2ed:	27                   	daa    
 2ee:	01 6a 02             	add    %ebp,0x2(%edx)
 2f1:	1e                   	push   %ds
 2f2:	00 01                	add    %al,(%ecx)
 2f4:	01 00                	add    %eax,(%eax)
 2f6:	05 02 1a 8d 04       	add    $0x48d1a02,%eax
 2fb:	08 03                	or     %al,(%ebx)
 2fd:	32 01                	xor    (%ecx),%al
 2ff:	68 02 26 13 59       	push   $0x59132602
 304:	02 02                	add    (%edx),%al
 306:	00 01                	add    %al,(%ecx)
 308:	01 00                	add    %eax,(%eax)
 30a:	05 02 4e 8d 04       	add    $0x48d4e02,%eax
 30f:	08 03                	or     %al,(%ebx)
 311:	3d 01 75 08 75       	cmp    $0x75087501,%eax
 316:	9f                   	lahf   
 317:	00 02                	add    %al,(%edx)
 319:	04 01                	add    $0x1,%al
 31b:	06                   	push   %es
 31c:	02 23                	add    (%ebx),%ah
 31e:	12 06                	adc    (%esi),%al
 320:	72 08                	jb     32a <_init-0x8048316>
 322:	93                   	xchg   %eax,%ebx
 323:	02 05 00 01 01 00    	add    0x10100,%al
 329:	05 02 c0 8d 04       	add    $0x48dc002,%eax
 32e:	08 03                	or     %al,(%ebx)
 330:	c2 00 01             	ret    $0x100
 333:	75 91                	jne    2c6 <_init-0x804837a>
 335:	9f                   	lahf   
 336:	00 02                	add    %al,(%edx)
 338:	04 01                	add    $0x1,%al
 33a:	06                   	push   %es
 33b:	02 23                	add    (%ebx),%ah
 33d:	12 00                	adc    (%eax),%al
 33f:	02 04 01             	add    (%ecx,%eax,1),%al
 342:	06                   	push   %es
 343:	3a 00                	cmp    (%eax),%al
 345:	02 04 01             	add    (%ecx,%eax,1),%al
 348:	e7 00                	out    %eax,$0x0
 34a:	02 04 02             	add    (%edx,%eax,1),%al
 34d:	06                   	push   %es
 34e:	90                   	nop
 34f:	06                   	push   %es
 350:	08 1d 08 93 02 05    	or     %bl,0x5029308
 356:	00 01                	add    %al,(%ecx)
 358:	01 00                	add    %eax,(%eax)
 35a:	05 02 4a 8e 04       	add    $0x48e4a02,%eax
 35f:	08 03                	or     %al,(%ebx)
 361:	c2 00 01             	ret    $0x100
 364:	6a 02                	push   $0x2
 366:	1e                   	push   %ds
 367:	00 01                	add    %al,(%ecx)
 369:	01 00                	add    %eax,(%eax)
 36b:	05 02 6e 8e 04       	add    $0x48e6e02,%eax
 370:	08 03                	or     %al,(%ebx)
 372:	cd 00                	int    $0x0
 374:	01 68 02             	add    %ebp,0x2(%eax)
 377:	26 13 59 02          	adc    %es:0x2(%ecx),%ebx
 37b:	02 00                	add    (%eax),%al
 37d:	01 01                	add    %eax,(%ecx)
 37f:	00 05 02 2b 88 04    	add    %al,0x4882b02
 385:	08 03                	or     %al,(%ebx)
 387:	d7                   	xlat   %ds:(%ebx)
 388:	00 01                	add    %al,(%ecx)
 38a:	08 21                	or     %ah,(%ecx)
 38c:	75 02                	jne    390 <_init-0x80482b0>
 38e:	26 13 e5             	es adc %ebp,%esp
 391:	00 02                	add    %al,(%edx)
 393:	04 01                	add    $0x1,%al
 395:	06                   	push   %es
 396:	02 23                	add    (%ebx),%ah
 398:	12 00                	adc    (%eax),%al
 39a:	02 04 01             	add    (%ecx,%eax,1),%al
 39d:	06                   	push   %es
 39e:	3d 06 ba 06 3d       	cmp    $0x3d06ba06,%eax
 3a3:	00 02                	add    %al,(%edx)
 3a5:	04 01                	add    $0x1,%al
 3a7:	06                   	push   %es
 3a8:	02 23                	add    (%ebx),%ah
 3aa:	12 00                	adc    (%eax),%al
 3ac:	02 04 01             	add    (%ecx,%eax,1),%al
 3af:	06                   	push   %es
 3b0:	3d 06 ba 06 3d       	cmp    $0x3d06ba06,%eax
 3b5:	00 02                	add    %al,(%edx)
 3b7:	04 01                	add    $0x1,%al
 3b9:	06                   	push   %es
 3ba:	02 23                	add    (%ebx),%ah
 3bc:	12 00                	adc    (%eax),%al
 3be:	02 04 01             	add    (%ecx,%eax,1),%al
 3c1:	06                   	push   %es
 3c2:	3e 00 02             	add    %al,%ds:(%edx)
 3c5:	04 01                	add    $0x1,%al
 3c7:	67 06                	addr16 push %es
 3c9:	ac                   	lods   %ds:(%esi),%al
 3ca:	06                   	push   %es
 3cb:	3d 08 4c 00 02       	cmp    $0x2004c08,%eax
 3d0:	04 01                	add    $0x1,%al
 3d2:	06                   	push   %es
 3d3:	02 23                	add    (%ebx),%ah
 3d5:	12 00                	adc    (%eax),%al
 3d7:	02 04 01             	add    (%ecx,%eax,1),%al
 3da:	06                   	push   %es
 3db:	3d 00 02 04 01       	cmp    $0x1040200,%eax
 3e0:	67 06                	addr16 push %es
 3e2:	ac                   	lods   %ds:(%esi),%al
 3e3:	06                   	push   %es
 3e4:	3d 08 4c 00 02       	cmp    $0x2004c08,%eax
 3e9:	04 01                	add    $0x1,%al
 3eb:	06                   	push   %es
 3ec:	02 23                	add    (%ebx),%ah
 3ee:	12 00                	adc    (%eax),%al
 3f0:	02 04 01             	add    (%ecx,%eax,1),%al
 3f3:	06                   	push   %es
 3f4:	3d 00 02 04 01       	cmp    $0x1040200,%eax
 3f9:	67 06                	addr16 push %es
 3fb:	ac                   	lods   %ds:(%esi),%al
 3fc:	06                   	push   %es
 3fd:	3d 08 4b 00 02       	cmp    $0x2004b08,%eax
 402:	04 01                	add    $0x1,%al
 404:	06                   	push   %es
 405:	02 23                	add    (%ebx),%ah
 407:	12 00                	adc    (%eax),%al
 409:	02 04 01             	add    (%ecx,%eax,1),%al
 40c:	06                   	push   %es
 40d:	3d 00 02 04 01       	cmp    $0x1040200,%eax
 412:	03 6f 58             	add    0x58(%edi),%ebp
 415:	06                   	push   %es
 416:	ba 06 3a 03 13       	mov    $0x13033a06,%edx
 41b:	e4 03                	in     $0x3,%al
 41d:	6f                   	outsl  %ds:(%esi),(%dx)
 41e:	08 4a 08             	or     %cl,0x8(%edx)
 421:	2c 03                	sub    $0x3,%al
 423:	13 08                	adc    (%eax),%ecx
 425:	2e 08 92 9e 66 00 02 	or     %dl,%cs:0x200669e(%edx)
 42c:	04 01                	add    $0x1,%al
 42e:	06                   	push   %es
 42f:	66 04 02             	data16 add $0x2,%al
 432:	06                   	push   %es
 433:	03 58 90             	add    -0x70(%eax),%ebx
 436:	04 01                	add    $0x1,%al
 438:	03 28                	add    (%eax),%ebp
 43a:	02 2a                	add    (%edx),%ch
 43c:	01 2e                	add    %ebp,(%esi)
 43e:	66 02 14 00          	data16 add (%eax,%eax,1),%dl
 442:	01 01                	add    %eax,(%ecx)

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5f                   	pop    %edi
   1:	47                   	inc    %edi
   2:	4c                   	dec    %esp
   3:	4f                   	dec    %edi
   4:	42                   	inc    %edx
   5:	41                   	inc    %ecx
   6:	4c                   	dec    %esp
   7:	5f                   	pop    %edi
   8:	5f                   	pop    %edi
   9:	73 75                	jae    80 <_init-0x80485c0>
   b:	62 5f 49             	bound  %ebx,0x49(%edi)
   e:	5f                   	pop    %edi
   f:	6d                   	insl   (%dx),%es:(%edi)
  10:	61                   	popa   
  11:	69 6e 00 5f 53 5f 65 	imul   $0x655f535f,0x0(%esi),%ebp
  18:	6e                   	outsb  %ds:(%esi),(%dx)
  19:	64 00 73 69          	add    %dh,%fs:0x69(%ebx)
  1d:	7a 65                	jp     84 <_init-0x80485bc>
  1f:	5f                   	pop    %edi
  20:	74 00                	je     22 <_init-0x804861e>
  22:	73 69                	jae    8d <_init-0x80485b3>
  24:	7a 65                	jp     8b <_init-0x80485b5>
  26:	74 79                	je     a1 <_init-0x804859f>
  28:	70 65                	jo     8f <_init-0x80485b1>
  2a:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
  2e:	68 6f 75 72 00       	push   $0x72756f
  33:	5f                   	pop    %edi
  34:	5f                   	pop    %edi
  35:	76 61                	jbe    98 <_init-0x80485a8>
  37:	6c                   	insb   (%dx),%es:(%edi)
  38:	75 65                	jne    9f <_init-0x80485a1>
  3a:	00 5f 5f             	add    %bl,0x5f(%edi)
  3d:	6e                   	outsb  %ds:(%esi),(%dx)
  3e:	75 6d                	jne    ad <_init-0x8048593>
  40:	65 72 69             	gs jb  ac <_init-0x8048594>
  43:	63 5f 74             	arpl   %bx,0x74(%edi)
  46:	72 61                	jb     a9 <_init-0x8048597>
  48:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
  4f:	65 
  50:	67 65 72 3c          	addr16 gs jb 90 <_init-0x80485b0>
  54:	69 6e 74 3e 00 5f 5a 	imul   $0x5a5f003e,0x74(%esi),%ebp
  5b:	4e                   	dec    %esi
  5c:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
  5f:	67 6e                	outsb  %ds:(%si),(%dx)
  61:	75 5f                	jne    c2 <_init-0x804857e>
  63:	63 78 78             	arpl   %di,0x78(%eax)
  66:	32 34 5f             	xor    (%edi,%ebx,2),%dh
  69:	5f                   	pop    %edi
  6a:	6e                   	outsb  %ds:(%esi),(%dx)
  6b:	75 6d                	jne    da <_init-0x8048566>
  6d:	65 72 69             	gs jb  d9 <_init-0x8048567>
  70:	63 5f 74             	arpl   %bx,0x74(%edi)
  73:	72 61                	jb     d6 <_init-0x804856a>
  75:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
  7c:	65 
  7d:	67 65 72 49          	addr16 gs jb ca <_init-0x8048576>
  81:	69 45 35 5f 5f 6d 61 	imul   $0x616d5f5f,0x35(%ebp),%eax
  88:	78 45                	js     cf <_init-0x8048571>
  8a:	00 5f 5f             	add    %bl,0x5f(%edi)
  8d:	6d                   	insl   (%dx),%es:(%edi)
  8e:	61                   	popa   
  8f:	78 00                	js     91 <_init-0x80485af>
  91:	77 63                	ja     f6 <_init-0x804854a>
  93:	73 63                	jae    f8 <_init-0x8048548>
  95:	73 70                	jae    107 <_init-0x8048539>
  97:	6e                   	outsb  %ds:(%esi),(%dx)
  98:	00 6c 6f 63          	add    %ch,0x63(%edi,%ebp,2)
  9c:	61                   	popa   
  9d:	6c                   	insb   (%dx),%es:(%edi)
  9e:	65 63 6f 6e          	arpl   %bp,%gs:0x6e(%edi)
  a2:	76 00                	jbe    a4 <_init-0x804859c>
  a4:	5f                   	pop    %edi
  a5:	5f                   	pop    %edi
  a6:	76 74                	jbe    11c <_init-0x8048524>
  a8:	62 6c 5f 70          	bound  %ebp,0x70(%edi,%ebx,2)
  ac:	74 72                	je     120 <_init-0x8048520>
  ae:	5f                   	pop    %edi
  af:	74 79                	je     12a <_init-0x8048516>
  b1:	70 65                	jo     118 <_init-0x8048528>
  b3:	00 69 6e             	add    %ch,0x6e(%ecx)
  b6:	74 5f                	je     117 <_init-0x8048529>
  b8:	63 75 72             	arpl   %si,0x72(%ebp)
  bb:	72 5f                	jb     11c <_init-0x8048524>
  bd:	73 79                	jae    138 <_init-0x8048508>
  bf:	6d                   	insl   (%dx),%es:(%edi)
  c0:	62 6f 6c             	bound  %ebp,0x6c(%edi)
  c3:	00 77 63             	add    %dh,0x63(%edi)
  c6:	73 63                	jae    12b <_init-0x8048515>
  c8:	68 72 00 5f 53       	push   $0x535f0072
  cd:	5f                   	pop    %edi
  ce:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  d1:	6c                   	insb   (%dx),%es:(%edi)
  d2:	61                   	popa   
  d3:	6c                   	insb   (%dx),%es:(%edi)
  d4:	70 68                	jo     13e <_init-0x8048502>
  d6:	61                   	popa   
  d7:	00 5f 53             	add    %bl,0x53(%edi)
  da:	5f                   	pop    %edi
  db:	62 61 64             	bound  %esp,0x64(%ecx)
  de:	62 69 74             	bound  %ebp,0x74(%ecx)
  e1:	00 6d 62             	add    %ch,0x62(%ebp)
  e4:	72 74                	jb     15a <_init-0x80484e6>
  e6:	6f                   	outsl  %ds:(%esi),(%dx)
  e7:	77 63                	ja     14c <_init-0x80484f4>
  e9:	00 77 63             	add    %dh,0x63(%edi)
  ec:	73 78                	jae    166 <_init-0x80484da>
  ee:	66 72 6d             	data16 jb 15e <_init-0x80484e2>
  f1:	00 69 6e             	add    %ch,0x6e(%ecx)
  f4:	74 5f                	je     155 <_init-0x80484eb>
  f6:	66 72 61             	data16 jb 15a <_init-0x80484e6>
  f9:	63 5f 64             	arpl   %bx,0x64(%edi)
  fc:	69 67 69 74 73 00 5f 	imul   $0x5f007374,0x69(%edi),%esp
 103:	53                   	push   %ebx
 104:	5f                   	pop    %edi
 105:	62 65 67             	bound  %esp,0x67(%ebp)
 108:	00 77 63             	add    %dh,0x63(%edi)
 10b:	73 63                	jae    170 <_init-0x80484d0>
 10d:	6f                   	outsl  %ds:(%esi),(%dx)
 10e:	6c                   	insb   (%dx),%es:(%edi)
 10f:	6c                   	insb   (%dx),%es:(%edi)
 110:	00 5f 5a             	add    %bl,0x5a(%edi)
 113:	4e                   	dec    %esi
 114:	31 33                	xor    %esi,(%ebx)
 116:	64 72 69             	fs jb  182 <_init-0x80484be>
 119:	76 65                	jbe    180 <_init-0x80484c0>
 11b:	64 5f                	fs pop %edi
 11d:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 121:	73 31                	jae    154 <_init-0x80484ec>
 123:	44                   	inc    %esp
 124:	30 45 76             	xor    %al,0x76(%ebp)
 127:	00 5f 5f             	add    %bl,0x5f(%edi)
 12a:	77 63                	ja     18f <_init-0x80484b1>
 12c:	68 00 5f 53 5f       	push   $0x5f535f00
 131:	62 61 73             	bound  %esp,0x73(%ecx)
 134:	65 66 69 65 6c 64 00 	imul   $0x64,%gs:0x6c(%ebp),%sp
 13b:	47                   	inc    %edi
 13c:	4e                   	dec    %esi
 13d:	55                   	push   %ebp
 13e:	20 43 2b             	and    %al,0x2b(%ebx)
 141:	2b 20                	sub    (%eax),%esp
 143:	34 2e                	xor    $0x2e,%al
 145:	39 2e                	cmp    %ebp,(%esi)
 147:	32 20                	xor    (%eax),%ah
 149:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
 14e:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 154:	72 69                	jb     1bf <_init-0x8048481>
 156:	63 20                	arpl   %sp,(%eax)
 158:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 15d:	68 3d 69 35 38       	push   $0x3835693d
 162:	36 20 2d 67 00 5f 5a 	and    %ch,%ss:0x5a5f0067
 169:	4e                   	dec    %esi
 16a:	53                   	push   %ebx
 16b:	74 31                	je     19e <_init-0x80484a2>
 16d:	31 63 68             	xor    %esp,0x68(%ebx)
 170:	61                   	popa   
 171:	72 5f                	jb     1d2 <_init-0x804846e>
 173:	74 72                	je     1e7 <_init-0x8048459>
 175:	61                   	popa   
 176:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%ebx,%esi,2),%esi
 17d:	31 
 17e:	74 6f                	je     1ef <_init-0x8048451>
 180:	5f                   	pop    %edi
 181:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 188:	65 45                	gs inc %ebp
 18a:	52                   	push   %edx
 18b:	4b                   	dec    %ebx
 18c:	63 00                	arpl   %ax,(%eax)
 18e:	6d                   	insl   (%dx),%es:(%edi)
 18f:	6f                   	outsl  %ds:(%esi),(%dx)
 190:	6e                   	outsb  %ds:(%esi),(%dx)
 191:	5f                   	pop    %edi
 192:	64 65 63 69 6d       	fs arpl %bp,%gs:0x6d(%ecx)
 197:	61                   	popa   
 198:	6c                   	insb   (%dx),%es:(%edi)
 199:	5f                   	pop    %edi
 19a:	70 6f                	jo     20b <_init-0x8048435>
 19c:	69 6e 74 00 5f 5a 4e 	imul   $0x4e5a5f00,0x74(%esi),%ebp
 1a3:	31 33                	xor    %esi,(%ebx)
 1a5:	64 72 69             	fs jb  211 <_init-0x804842f>
 1a8:	76 65                	jbe    20f <_init-0x8048431>
 1aa:	64 5f                	fs pop %edi
 1ac:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 1b0:	73 32                	jae    1e4 <_init-0x804845c>
 1b2:	31 31                	xor    %esi,(%ecx)
 1b4:	6e                   	outsb  %ds:(%esi),(%dx)
 1b5:	6f                   	outsl  %ds:(%esi),(%dx)
 1b6:	72 6d                	jb     225 <_init-0x804841b>
 1b8:	61                   	popa   
 1b9:	6c                   	insb   (%dx),%es:(%edi)
 1ba:	5f                   	pop    %edi
 1bb:	66 75 6e             	data16 jne 22c <_init-0x8048414>
 1be:	63 45 76             	arpl   %ax,0x76(%ebp)
 1c1:	00 7e 64             	add    %bh,0x64(%esi)
 1c4:	72 69                	jb     22f <_init-0x8048411>
 1c6:	76 65                	jbe    22d <_init-0x8048413>
 1c8:	64 5f                	fs pop %edi
 1ca:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 1ce:	73 31                	jae    201 <_init-0x804843f>
 1d0:	00 7e 64             	add    %bh,0x64(%esi)
 1d3:	72 69                	jb     23e <_init-0x8048402>
 1d5:	76 65                	jbe    23c <_init-0x8048404>
 1d7:	64 5f                	fs pop %edi
 1d9:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 1dd:	73 32                	jae    211 <_init-0x804842f>
 1df:	00 5f 5f             	add    %bl,0x5f(%edi)
 1e2:	6e                   	outsb  %ds:(%esi),(%dx)
 1e3:	75 6d                	jne    252 <_init-0x80483ee>
 1e5:	65 72 69             	gs jb  251 <_init-0x80483ef>
 1e8:	63 5f 74             	arpl   %bx,0x74(%edi)
 1eb:	72 61                	jb     24e <_init-0x80483f2>
 1ed:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 1f4:	65 
 1f5:	67 65 72 3c          	addr16 gs jb 235 <_init-0x804840b>
 1f9:	63 68 61             	arpl   %bp,0x61(%eax)
 1fc:	72 3e                	jb     23c <_init-0x8048404>
 1fe:	00 76 77             	add    %dh,0x77(%esi)
 201:	70 72                	jo     275 <_init-0x80483cb>
 203:	69 6e 74 66 00 5f 49 	imul   $0x495f0066,0x74(%esi),%ebp
 20a:	6f                   	outsl  %ds:(%esi),(%dx)
 20b:	73 5f                	jae    26c <_init-0x80483d4>
 20d:	4f                   	dec    %edi
 20e:	70 65                	jo     275 <_init-0x80483cb>
 210:	6e                   	outsb  %ds:(%esi),(%dx)
 211:	6d                   	insl   (%dx),%es:(%edi)
 212:	6f                   	outsl  %ds:(%esi),(%dx)
 213:	64 65 00 69 6e       	fs add %ch,%gs:0x6e(%ecx)
 218:	74 5f                	je     279 <_init-0x80483c7>
 21a:	6e                   	outsb  %ds:(%esi),(%dx)
 21b:	5f                   	pop    %edi
 21c:	63 73 5f             	arpl   %si,0x5f(%ebx)
 21f:	70 72                	jo     293 <_init-0x80483ad>
 221:	65 63 65 64          	arpl   %sp,%gs:0x64(%ebp)
 225:	65 73 00             	gs jae 228 <_init-0x8048418>
 228:	74 6f                	je     299 <_init-0x80483a7>
 22a:	77 63                	ja     28f <_init-0x80483b1>
 22c:	74 72                	je     2a0 <_init-0x80483a0>
 22e:	61                   	popa   
 22f:	6e                   	outsb  %ds:(%esi),(%dx)
 230:	73 00                	jae    232 <_init-0x804840e>
 232:	63 6f 70             	arpl   %bp,0x70(%edi)
 235:	79 00                	jns    237 <_init-0x8048409>
 237:	5f                   	pop    %edi
 238:	5f                   	pop    %edi
 239:	69 6f 69 6e 69 74 00 	imul   $0x74696e,0x69(%edi),%ebp
 240:	5f                   	pop    %edi
 241:	53                   	push   %ebx
 242:	5f                   	pop    %edi
 243:	73 79                	jae    2be <_init-0x8048382>
 245:	6e                   	outsb  %ds:(%esi),(%dx)
 246:	63 65 64             	arpl   %sp,0x64(%ebp)
 249:	5f                   	pop    %edi
 24a:	77 69                	ja     2b5 <_init-0x804838b>
 24c:	74 68                	je     2b6 <_init-0x804838a>
 24e:	5f                   	pop    %edi
 24f:	73 74                	jae    2c5 <_init-0x804837b>
 251:	64 69 6f 00 5f 56 61 	imul   $0x6c61565f,%fs:0x0(%edi),%ebp
 258:	6c 
 259:	75 65                	jne    2c0 <_init-0x8048380>
 25b:	00 5f 53             	add    %bl,0x53(%edi)
 25e:	5f                   	pop    %edi
 25f:	65 6f                	outsl  %gs:(%esi),(%dx)
 261:	66 62 69 74          	bound  %bp,0x74(%ecx)
 265:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 269:	79 64                	jns    2cf <_init-0x8048371>
 26b:	61                   	popa   
 26c:	79 00                	jns    26e <_init-0x80483d2>
 26e:	5f                   	pop    %edi
 26f:	49                   	dec    %ecx
 270:	4f                   	dec    %edi
 271:	5f                   	pop    %edi
 272:	46                   	inc    %esi
 273:	49                   	dec    %ecx
 274:	4c                   	dec    %esp
 275:	45                   	inc    %ebp
 276:	00 62 61             	add    %ah,0x61(%edx)
 279:	73 69                	jae    2e4 <_init-0x804835c>
 27b:	63 5f 6f             	arpl   %bx,0x6f(%edi)
 27e:	73 74                	jae    2f4 <_init-0x804834c>
 280:	72 65                	jb     2e7 <_init-0x8048359>
 282:	61                   	popa   
 283:	6d                   	insl   (%dx),%es:(%edi)
 284:	3c 63                	cmp    $0x63,%al
 286:	68 61 72 2c 20       	push   $0x202c7261
 28b:	73 74                	jae    301 <_init-0x804833f>
 28d:	64 3a 3a             	cmp    %fs:(%edx),%bh
 290:	63 68 61             	arpl   %bp,0x61(%eax)
 293:	72 5f                	jb     2f4 <_init-0x804834c>
 295:	74 72                	je     309 <_init-0x8048337>
 297:	61                   	popa   
 298:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%ebx,%esi,2),%esi
 29f:	72 
 2a0:	3e 20 3e             	and    %bh,%ds:(%esi)
 2a3:	00 77 63             	add    %dh,0x63(%edi)
 2a6:	74 79                	je     321 <_init-0x804831f>
 2a8:	70 65                	jo     30f <_init-0x8048331>
 2aa:	5f                   	pop    %edi
 2ab:	74 00                	je     2ad <_init-0x8048393>
 2ad:	66 67 65 74 77       	data16 addr16 gs je 329 <_init-0x8048317>
 2b2:	63 00                	arpl   %ax,(%eax)
 2b4:	67 65 74 77          	addr16 gs je 32f <_init-0x8048311>
 2b8:	63 68 61             	arpl   %bp,0x61(%eax)
 2bb:	72 00                	jb     2bd <_init-0x8048383>
 2bd:	66 67 65 74 77       	data16 addr16 gs je 339 <_init-0x8048307>
 2c2:	73 00                	jae    2c4 <_init-0x804837c>
 2c4:	5f                   	pop    %edi
 2c5:	53                   	push   %ebx
 2c6:	5f                   	pop    %edi
 2c7:	72 69                	jb     332 <_init-0x804830e>
 2c9:	67 68 74 00 75 6e    	addr16 push $0x6e750074
 2cf:	73 69                	jae    33a <_init-0x8048306>
 2d1:	67 6e                	outsb  %ds:(%si),(%dx)
 2d3:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
 2d8:	61                   	popa   
 2d9:	72 00                	jb     2db <_init-0x8048365>
 2db:	77 6d                	ja     34a <_init-0x80482f6>
 2dd:	65 6d                	gs insl (%dx),%es:(%edi)
 2df:	63 68 72             	arpl   %bp,0x72(%eax)
 2e2:	00 5f 53             	add    %bl,0x53(%edi)
 2e5:	5f                   	pop    %edi
 2e6:	67 6f                	outsl  %ds:(%si),(%dx)
 2e8:	6f                   	outsl  %ds:(%esi),(%dx)
 2e9:	64 62 69 74          	bound  %ebp,%fs:0x74(%ecx)
 2ed:	00 5f 5a             	add    %bl,0x5a(%edi)
 2f0:	4e                   	dec    %esi
 2f1:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 2f4:	67 6e                	outsb  %ds:(%si),(%dx)
 2f6:	75 5f                	jne    357 <_init-0x80482e9>
 2f8:	63 78 78             	arpl   %di,0x78(%eax)
 2fb:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 2fe:	5f                   	pop    %edi
 2ff:	6e                   	outsb  %ds:(%esi),(%dx)
 300:	75 6d                	jne    36f <_init-0x80482d1>
 302:	65 72 69             	gs jb  36e <_init-0x80482d2>
 305:	63 5f 74             	arpl   %bx,0x74(%edi)
 308:	72 61                	jb     36b <_init-0x80482d5>
 30a:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 311:	65 
 312:	67 65 72 49          	addr16 gs jb 35f <_init-0x80482e1>
 316:	73 45                	jae    35d <_init-0x80482e3>
 318:	35 5f 5f 6d 61       	xor    $0x616d5f5f,%eax
 31d:	78 45                	js     364 <_init-0x80482dc>
 31f:	00 5f 53             	add    %bl,0x53(%edi)
 322:	5f                   	pop    %edi
 323:	62 69 6e             	bound  %ebp,0x6e(%ecx)
 326:	00 77 63             	add    %dh,0x63(%edi)
 329:	73 63                	jae    38e <_init-0x80482b2>
 32b:	6d                   	insl   (%dx),%es:(%edi)
 32c:	70 00                	jo     32e <_init-0x8048312>
 32e:	5f                   	pop    %edi
 32f:	5f                   	pop    %edi
 330:	62 75 69             	bound  %esi,0x69(%ebp)
 333:	6c                   	insb   (%dx),%es:(%edi)
 334:	74 69                	je     39f <_init-0x80482a1>
 336:	6e                   	outsb  %ds:(%esi),(%dx)
 337:	5f                   	pop    %edi
 338:	76 61                	jbe    39b <_init-0x80482a5>
 33a:	5f                   	pop    %edi
 33b:	6c                   	insb   (%dx),%es:(%edi)
 33c:	69 73 74 00 6e 6f 74 	imul   $0x746f6e00,0x74(%ebx),%esi
 343:	5f                   	pop    %edi
 344:	65 6f                	outsl  %gs:(%esi),(%dx)
 346:	66 00 5f 5f          	data16 add %bl,0x5f(%edi)
 34a:	67 6e                	outsb  %ds:(%si),(%dx)
 34c:	75 63                	jne    3b1 <_init-0x804828f>
 34e:	5f                   	pop    %edi
 34f:	76 61                	jbe    3b2 <_init-0x804828e>
 351:	5f                   	pop    %edi
 352:	6c                   	insb   (%dx),%es:(%edi)
 353:	69 73 74 00 5f 5a 4e 	imul   $0x4e5a5f00,0x74(%ebx),%esi
 35a:	31 30                	xor    %esi,(%eax)
 35c:	62 61 73             	bound  %esp,0x73(%ecx)
 35f:	65 5f                	gs pop %edi
 361:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 365:	73 44                	jae    3ab <_init-0x8048295>
 367:	32 45 76             	xor    0x76(%ebp),%al
 36a:	00 5f 5f             	add    %bl,0x5f(%edi)
 36d:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%ebx),%esi
 374:	65 64 00 5f 53       	gs add %bl,%fs:0x53(%edi)
 379:	5f                   	pop    %edi
 37a:	6f                   	outsl  %ds:(%esi),(%dx)
 37b:	75 74                	jne    3f1 <_init-0x804824f>
 37d:	00 5f 53             	add    %bl,0x53(%edi)
 380:	5f                   	pop    %edi
 381:	61                   	popa   
 382:	70 70                	jo     3f4 <_init-0x804824c>
 384:	00 5f 5a             	add    %bl,0x5a(%edi)
 387:	4e                   	dec    %esi
 388:	53                   	push   %ebx
 389:	74 31                	je     3bc <_init-0x8048284>
 38b:	31 63 68             	xor    %esp,0x68(%ebx)
 38e:	61                   	popa   
 38f:	72 5f                	jb     3f0 <_init-0x8048250>
 391:	74 72                	je     405 <_init-0x804823b>
 393:	61                   	popa   
 394:	69 74 73 49 63 45 34 	imul   $0x6d344563,0x49(%ebx,%esi,2),%esi
 39b:	6d 
 39c:	6f                   	outsl  %ds:(%esi),(%dx)
 39d:	76 65                	jbe    404 <_init-0x804823c>
 39f:	45                   	inc    %ebp
 3a0:	50                   	push   %eax
 3a1:	63 50 4b             	arpl   %dx,0x4b(%eax)
 3a4:	63 6a 00             	arpl   %bp,0x0(%edx)
 3a7:	6f                   	outsl  %ds:(%esi),(%dx)
 3a8:	70 65                	jo     40f <_init-0x8048231>
 3aa:	6e                   	outsb  %ds:(%esi),(%dx)
 3ab:	6d                   	insl   (%dx),%es:(%edi)
 3ac:	6f                   	outsl  %ds:(%esi),(%dx)
 3ad:	64 65 00 77 63       	fs add %dh,%gs:0x63(%edi)
 3b2:	73 6e                	jae    422 <_init-0x804821e>
 3b4:	63 6d 70             	arpl   %bp,0x70(%ebp)
 3b7:	00 69 6e             	add    %ch,0x6e(%ecx)
 3ba:	74 5f                	je     41b <_init-0x8048225>
 3bc:	6e                   	outsb  %ds:(%esi),(%dx)
 3bd:	5f                   	pop    %edi
 3be:	73 69                	jae    429 <_init-0x8048217>
 3c0:	67 6e                	outsb  %ds:(%si),(%dx)
 3c2:	5f                   	pop    %edi
 3c3:	70 6f                	jo     434 <_init-0x804820c>
 3c5:	73 6e                	jae    435 <_init-0x804820b>
 3c7:	00 77 6d             	add    %dh,0x6d(%edi)
 3ca:	65 6d                	gs insl (%dx),%es:(%edi)
 3cc:	6d                   	insl   (%dx),%es:(%edi)
 3cd:	6f                   	outsl  %ds:(%esi),(%dx)
 3ce:	76 65                	jbe    435 <_init-0x804820b>
 3d0:	00 5f 5f             	add    %bl,0x5f(%edi)
 3d3:	6d                   	insl   (%dx),%es:(%edi)
 3d4:	69 6e 00 62 74 6f 77 	imul   $0x776f7462,0x0(%esi),%ebp
 3db:	63 00                	arpl   %ax,(%eax)
 3dd:	6d                   	insl   (%dx),%es:(%edi)
 3de:	6f                   	outsl  %ds:(%esi),(%dx)
 3df:	6e                   	outsb  %ds:(%esi),(%dx)
 3e0:	5f                   	pop    %edi
 3e1:	74 68                	je     44b <_init-0x80481f5>
 3e3:	6f                   	outsl  %ds:(%esi),(%dx)
 3e4:	75 73                	jne    459 <_init-0x80481e7>
 3e6:	61                   	popa   
 3e7:	6e                   	outsb  %ds:(%esi),(%dx)
 3e8:	64 73 5f             	fs jae 44a <_init-0x80481f6>
 3eb:	73 65                	jae    452 <_init-0x80481ee>
 3ed:	70 00                	jo     3ef <_init-0x8048251>
 3ef:	75 6e                	jne    45f <_init-0x80481e1>
 3f1:	67 65 74 77          	addr16 gs je 46c <_init-0x80481d4>
 3f5:	63 00                	arpl   %ax,(%eax)
 3f7:	70 74                	jo     46d <_init-0x80481d3>
 3f9:	72 64                	jb     45f <_init-0x80481e1>
 3fb:	69 66 66 5f 74 00 5f 	imul   $0x5f00745f,0x66(%esi),%esp
 402:	5a                   	pop    %edx
 403:	4e                   	dec    %esi
 404:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 407:	67 6e                	outsb  %ds:(%si),(%dx)
 409:	75 5f                	jne    46a <_init-0x80481d6>
 40b:	63 78 78             	arpl   %di,0x78(%eax)
 40e:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 411:	5f                   	pop    %edi
 412:	6e                   	outsb  %ds:(%esi),(%dx)
 413:	75 6d                	jne    482 <_init-0x80481be>
 415:	65 72 69             	gs jb  481 <_init-0x80481bf>
 418:	63 5f 74             	arpl   %bx,0x74(%edi)
 41b:	72 61                	jb     47e <_init-0x80481c2>
 41d:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 424:	65 
 425:	67 65 72 49          	addr16 gs jb 472 <_init-0x80481ce>
 429:	69 45 35 5f 5f 6d 69 	imul   $0x696d5f5f,0x35(%ebp),%eax
 430:	6e                   	outsb  %ds:(%esi),(%dx)
 431:	45                   	inc    %ebp
 432:	00 77 63             	add    %dh,0x63(%edi)
 435:	74 72                	je     4a9 <_init-0x8048197>
 437:	61                   	popa   
 438:	6e                   	outsb  %ds:(%esi),(%dx)
 439:	73 5f                	jae    49a <_init-0x80481a6>
 43b:	74 00                	je     43d <_init-0x8048203>
 43d:	6d                   	insl   (%dx),%es:(%edi)
 43e:	62 72 6c             	bound  %esi,0x6c(%edx)
 441:	65 6e                	outsb  %gs:(%esi),(%dx)
 443:	00 6e 65             	add    %ch,0x65(%esi)
 446:	67 61                	addr16 popa 
 448:	74 69                	je     4b3 <_init-0x804818d>
 44a:	76 65                	jbe    4b1 <_init-0x804818f>
 44c:	5f                   	pop    %edi
 44d:	73 69                	jae    4b8 <_init-0x8048188>
 44f:	67 6e                	outsb  %ds:(%si),(%dx)
 451:	00 5f 53             	add    %bl,0x53(%edi)
 454:	5f                   	pop    %edi
 455:	68 65 78 00 69       	push   $0x69007865
 45a:	6e                   	outsb  %ds:(%esi),(%dx)
 45b:	74 5f                	je     4bc <_init-0x8048184>
 45d:	70 5f                	jo     4be <_init-0x8048182>
 45f:	63 73 5f             	arpl   %si,0x5f(%ebx)
 462:	70 72                	jo     4d6 <_init-0x804816a>
 464:	65 63 65 64          	arpl   %sp,%gs:0x64(%ebp)
 468:	65 73 00             	gs jae 46b <_init-0x80481d5>
 46b:	5f                   	pop    %edi
 46c:	5a                   	pop    %edx
 46d:	4e                   	dec    %esi
 46e:	31 30                	xor    %esi,(%eax)
 470:	62 61 73             	bound  %esp,0x73(%ecx)
 473:	65 5f                	gs pop %edi
 475:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 479:	73 31                	jae    4ac <_init-0x8048194>
 47b:	31 6e 6f             	xor    %ebp,0x6f(%esi)
 47e:	72 6d                	jb     4ed <_init-0x8048153>
 480:	61                   	popa   
 481:	6c                   	insb   (%dx),%es:(%edi)
 482:	5f                   	pop    %edi
 483:	66 75 6e             	data16 jne 4f4 <_init-0x804814c>
 486:	63 45 76             	arpl   %ax,0x76(%ebp)
 489:	00 77 63             	add    %dh,0x63(%edi)
 48c:	73 74                	jae    502 <_init-0x804813e>
 48e:	6f                   	outsl  %ds:(%esi),(%dx)
 48f:	75 6c                	jne    4fd <_init-0x8048143>
 491:	6c                   	insb   (%dx),%es:(%edi)
 492:	00 5f 53             	add    %bl,0x53(%edi)
 495:	5f                   	pop    %edi
 496:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%esi),%ebp
 49d:	6c                   	insb   (%dx),%es:(%edi)
 49e:	00 63 6f             	add    %ah,0x6f(%ebx)
 4a1:	6d                   	insl   (%dx),%es:(%edi)
 4a2:	70 61                	jo     505 <_init-0x804813b>
 4a4:	72 65                	jb     50b <_init-0x8048135>
 4a6:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 4aa:	6d                   	insl   (%dx),%es:(%edi)
 4ab:	64 61                	fs popa 
 4ad:	79 00                	jns    4af <_init-0x8048191>
 4af:	2f                   	das    
 4b0:	72 6f                	jb     521 <_init-0x804811f>
 4b2:	6f                   	outsl  %ds:(%esi),(%dx)
 4b3:	74 2f                	je     4e4 <_init-0x804815c>
 4b5:	70 72                	jo     529 <_init-0x8048117>
 4b7:	6f                   	outsl  %ds:(%esi),(%dx)
 4b8:	67 72 61             	addr16 jb 51c <_init-0x8048124>
 4bb:	6d                   	insl   (%dx),%es:(%edi)
 4bc:	6d                   	insl   (%dx),%es:(%edi)
 4bd:	69 6e 67 2f 63 70 70 	imul   $0x7070632f,0x67(%esi),%ebp
 4c4:	2f                   	das    
 4c5:	76 69                	jbe    530 <_init-0x8048110>
 4c7:	72 74                	jb     53d <_init-0x8048103>
 4c9:	75 61                	jne    52c <_init-0x8048114>
 4cb:	6c                   	insb   (%dx),%es:(%edi)
 4cc:	2f                   	das    
 4cd:	76 74                	jbe    543 <_init-0x80480fd>
 4cf:	62 6c 5f 70          	bound  %ebp,0x70(%edi,%ebx,2)
 4d3:	72 6f                	jb     544 <_init-0x80480fc>
 4d5:	62 65 00             	bound  %esp,0x0(%ebp)
 4d8:	66 69 6e 64 00 77    	imul   $0x7700,0x64(%esi),%bp
 4de:	63 73 63             	arpl   %si,0x63(%ebx)
 4e1:	70 79                	jo     55c <_init-0x80480e4>
 4e3:	00 5f 5a             	add    %bl,0x5a(%edi)
 4e6:	4e                   	dec    %esi
 4e7:	31 33                	xor    %esi,(%ebx)
 4e9:	64 72 69             	fs jb  555 <_init-0x80480eb>
 4ec:	76 65                	jbe    553 <_init-0x80480ed>
 4ee:	64 5f                	fs pop %edi
 4f0:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 4f4:	73 31                	jae    527 <_init-0x8048119>
 4f6:	43                   	inc    %ebx
 4f7:	32 45 76             	xor    0x76(%ebp),%al
 4fa:	00 5f 43             	add    %bl,0x43(%edi)
 4fd:	68 61 72 54 00       	push   $0x547261
 502:	76 73                	jbe    577 <_init-0x80480c9>
 504:	77 70                	ja     576 <_init-0x80480ca>
 506:	72 69                	jb     571 <_init-0x80480cf>
 508:	6e                   	outsb  %ds:(%esi),(%dx)
 509:	74 66                	je     571 <_init-0x80480cf>
 50b:	00 77 6d             	add    %dh,0x6d(%edi)
 50e:	65 6d                	gs insl (%dx),%es:(%edi)
 510:	73 65                	jae    577 <_init-0x80480c9>
 512:	74 00                	je     514 <_init-0x804812c>
 514:	5f                   	pop    %edi
 515:	5a                   	pop    %edx
 516:	4e                   	dec    %esi
 517:	31 33                	xor    %esi,(%ebx)
 519:	64 72 69             	fs jb  585 <_init-0x80480bb>
 51c:	76 65                	jbe    583 <_init-0x80480bd>
 51e:	64 5f                	fs pop %edi
 520:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 524:	73 32                	jae    558 <_init-0x80480e8>
 526:	44                   	inc    %esp
 527:	32 45 76             	xor    0x76(%ebp),%al
 52a:	00 73 65             	add    %dh,0x65(%ebx)
 52d:	65 6b 64 69 72 00    	imul   $0x0,%gs:0x72(%ecx,%ebp,2),%esp
 533:	66 77 69             	data16 ja 59f <_init-0x80480a1>
 536:	64 65 00 74 6d 5f    	fs add %dh,%gs:0x5f(%ebp,%ebp,2)
 53c:	73 65                	jae    5a3 <_init-0x804809d>
 53e:	63 00                	arpl   %ax,(%eax)
 540:	74 6d                	je     5af <_init-0x8048091>
 542:	5f                   	pop    %edi
 543:	69 73 64 73 74 00 77 	imul   $0x77007473,0x64(%ebx),%esi
 54a:	63 73 6e             	arpl   %si,0x6e(%ebx)
 54d:	63 70 79             	arpl   %si,0x79(%eax)
 550:	00 70 75             	add    %dh,0x75(%eax)
 553:	74 77                	je     5cc <_init-0x8048074>
 555:	63 68 61             	arpl   %bp,0x61(%eax)
 558:	72 00                	jb     55a <_init-0x80480e6>
 55a:	77 6d                	ja     5c9 <_init-0x8048077>
 55c:	65 6d                	gs insl (%dx),%es:(%edi)
 55e:	63 6d 70             	arpl   %bp,0x70(%ebp)
 561:	00 5f 5a             	add    %bl,0x5a(%edi)
 564:	4e                   	dec    %esi
 565:	53                   	push   %ebx
 566:	74 31                	je     599 <_init-0x80480a7>
 568:	31 63 68             	xor    %esp,0x68(%ebx)
 56b:	61                   	popa   
 56c:	72 5f                	jb     5cd <_init-0x8048073>
 56e:	74 72                	je     5e2 <_init-0x804805e>
 570:	61                   	popa   
 571:	69 74 73 49 63 45 34 	imul   $0x63344563,0x49(%ebx,%esi,2),%esi
 578:	63 
 579:	6f                   	outsl  %ds:(%esi),(%dx)
 57a:	70 79                	jo     5f5 <_init-0x804804b>
 57c:	45                   	inc    %ebp
 57d:	50                   	push   %eax
 57e:	63 50 4b             	arpl   %dx,0x4b(%eax)
 581:	63 6a 00             	arpl   %bp,0x0(%edx)
 584:	5f                   	pop    %edi
 585:	5a                   	pop    %edx
 586:	4e                   	dec    %esi
 587:	53                   	push   %ebx
 588:	74 31                	je     5bb <_init-0x8048085>
 58a:	31 63 68             	xor    %esp,0x68(%ebx)
 58d:	61                   	popa   
 58e:	72 5f                	jb     5ef <_init-0x8048051>
 590:	74 72                	je     604 <_init-0x804803c>
 592:	61                   	popa   
 593:	69 74 73 49 63 45 32 	imul   $0x6c324563,0x49(%ebx,%esi,2),%esi
 59a:	6c 
 59b:	74 45                	je     5e2 <_init-0x804805e>
 59d:	52                   	push   %edx
 59e:	4b                   	dec    %ebx
 59f:	63 53 32             	arpl   %dx,0x32(%ebx)
 5a2:	5f                   	pop    %edi
 5a3:	00 5f 53             	add    %bl,0x53(%edi)
 5a6:	5f                   	pop    %edi
 5a7:	66 69 78 65 64 00    	imul   $0x64,0x65(%eax),%di
 5ad:	69 6e 74 5f 6e 5f 73 	imul   $0x735f6e5f,0x74(%esi),%ebp
 5b4:	65 70 5f             	gs jo  616 <_init-0x804802a>
 5b7:	62 79 5f             	bound  %edi,0x5f(%ecx)
 5ba:	73 70                	jae    62c <_init-0x8048014>
 5bc:	61                   	popa   
 5bd:	63 65 00             	arpl   %sp,0x0(%ebp)
 5c0:	5f                   	pop    %edi
 5c1:	5f                   	pop    %edi
 5c2:	70 72                	jo     636 <_init-0x804800a>
 5c4:	69 6f 72 69 74 79 00 	imul   $0x797469,0x72(%edi),%ebp
 5cb:	5f                   	pop    %edi
 5cc:	53                   	push   %ebx
 5cd:	5f                   	pop    %edi
 5ce:	73 68                	jae    638 <_init-0x8048008>
 5d0:	6f                   	outsl  %ds:(%esi),(%dx)
 5d1:	77 62                	ja     635 <_init-0x804800b>
 5d3:	61                   	popa   
 5d4:	73 65                	jae    63b <_init-0x8048005>
 5d6:	00 5f 53             	add    %bl,0x53(%edi)
 5d9:	5f                   	pop    %edi
 5da:	69 6e 00 5f 5f 67 6e 	imul   $0x6e675f5f,0x0(%esi),%ebp
 5e1:	75 5f                	jne    642 <_init-0x8047ffe>
 5e3:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
 5e8:	00 76 66             	add    %dh,0x66(%esi)
 5eb:	77 70                	ja     65d <_init-0x8047fe3>
 5ed:	72 69                	jb     658 <_init-0x8047fe8>
 5ef:	6e                   	outsb  %ds:(%esi),(%dx)
 5f0:	74 66                	je     658 <_init-0x8047fe8>
 5f2:	00 76 69             	add    %dh,0x69(%esi)
 5f5:	72 74                	jb     66b <_init-0x8047fd5>
 5f7:	75 61                	jne    65a <_init-0x8047fe6>
 5f9:	6c                   	insb   (%dx),%es:(%edi)
 5fa:	5f                   	pop    %edi
 5fb:	66 75 63             	data16 jne 661 <_init-0x8047fdf>
 5fe:	00 74 68 69          	add    %dh,0x69(%eax,%ebp,2)
 602:	73 00                	jae    604 <_init-0x804803c>
 604:	76 73                	jbe    679 <_init-0x8047fc7>
 606:	77 73                	ja     67b <_init-0x8047fc5>
 608:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 60b:	66 00 65 71          	data16 add %ah,0x71(%ebp)
 60f:	5f                   	pop    %edi
 610:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 617:	65 00 5f 53          	add    %bl,%gs:0x53(%edi)
 61b:	5f                   	pop    %edi
 61c:	72 65                	jb     683 <_init-0x8047fbd>
 61e:	66 63 6f 75          	data16 arpl %bp,0x75(%edi)
 622:	6e                   	outsb  %ds:(%esi),(%dx)
 623:	74 00                	je     625 <_init-0x804801b>
 625:	5f                   	pop    %edi
 626:	5a                   	pop    %edx
 627:	4e                   	dec    %esi
 628:	53                   	push   %ebx
 629:	74 31                	je     65c <_init-0x8047fe4>
 62b:	31 63 68             	xor    %esp,0x68(%ebx)
 62e:	61                   	popa   
 62f:	72 5f                	jb     690 <_init-0x8047fb0>
 631:	74 72                	je     6a5 <_init-0x8047f9b>
 633:	61                   	popa   
 634:	69 74 73 49 63 45 31 	imul   $0x32314563,0x49(%ebx,%esi,2),%esi
 63b:	32 
 63c:	74 6f                	je     6ad <_init-0x8047f93>
 63e:	5f                   	pop    %edi
 63f:	63 68 61             	arpl   %bp,0x61(%eax)
 642:	72 5f                	jb     6a3 <_init-0x8047f9d>
 644:	74 79                	je     6bf <_init-0x8047f81>
 646:	70 65                	jo     6ad <_init-0x8047f93>
 648:	45                   	inc    %ebp
 649:	52                   	push   %edx
 64a:	4b                   	dec    %ebx
 64b:	69 00 5f 53 5f 74    	imul   $0x745f535f,(%eax),%eax
 651:	72 75                	jb     6c8 <_init-0x8047f78>
 653:	6e                   	outsb  %ds:(%esi),(%dx)
 654:	63 00                	arpl   %ax,(%eax)
 656:	5f                   	pop    %edi
 657:	5f                   	pop    %edi
 658:	69 6e 69 74 69 61 6c 	imul   $0x6c616974,0x69(%esi),%ebp
 65f:	69 7a 65 5f 70 00 5f 	imul   $0x5f00705f,0x65(%edx),%edi
 666:	53                   	push   %ebx
 667:	5f                   	pop    %edi
 668:	73 68                	jae    6d2 <_init-0x8047f6e>
 66a:	6f                   	outsl  %ds:(%esi),(%dx)
 66b:	77 70                	ja     6dd <_init-0x8047f63>
 66d:	6f                   	outsl  %ds:(%esi),(%dx)
 66e:	73 00                	jae    670 <_init-0x8047fd0>
 670:	77 6d                	ja     6df <_init-0x8047f61>
 672:	65 6d                	gs insl (%dx),%es:(%edi)
 674:	63 70 79             	arpl   %si,0x79(%eax)
 677:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 67b:	6d                   	insl   (%dx),%es:(%edi)
 67c:	6f                   	outsl  %ds:(%esi),(%dx)
 67d:	6e                   	outsb  %ds:(%esi),(%dx)
 67e:	00 5f 53             	add    %bl,0x53(%edi)
 681:	5f                   	pop    %edi
 682:	64 65 63 00          	fs arpl %ax,%gs:(%eax)
 686:	5f                   	pop    %edi
 687:	49                   	dec    %ecx
 688:	6f                   	outsl  %ds:(%esi),(%dx)
 689:	73 5f                	jae    6ea <_init-0x8047f56>
 68b:	46                   	inc    %esi
 68c:	6d                   	insl   (%dx),%es:(%edi)
 68d:	74 66                	je     6f5 <_init-0x8047f4b>
 68f:	6c                   	insb   (%dx),%es:(%edi)
 690:	61                   	popa   
 691:	67 73 00             	addr16 jae 694 <_init-0x8047fac>
 694:	5f                   	pop    %edi
 695:	5a                   	pop    %edx
 696:	4e                   	dec    %esi
 697:	31 33                	xor    %esi,(%ebx)
 699:	64 72 69             	fs jb  705 <_init-0x8047f3b>
 69c:	76 65                	jbe    703 <_init-0x8047f3d>
 69e:	64 5f                	fs pop %edi
 6a0:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 6a4:	73 31                	jae    6d7 <_init-0x8047f69>
 6a6:	44                   	inc    %esp
 6a7:	32 45 76             	xor    0x76(%ebp),%al
 6aa:	00 5f 5a             	add    %bl,0x5a(%edi)
 6ad:	4e                   	dec    %esi
 6ae:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 6b1:	67 6e                	outsb  %ds:(%si),(%dx)
 6b3:	75 5f                	jne    714 <_init-0x8047f2c>
 6b5:	63 78 78             	arpl   %di,0x78(%eax)
 6b8:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 6bb:	5f                   	pop    %edi
 6bc:	6e                   	outsb  %ds:(%esi),(%dx)
 6bd:	75 6d                	jne    72c <_init-0x8047f14>
 6bf:	65 72 69             	gs jb  72b <_init-0x8047f15>
 6c2:	63 5f 74             	arpl   %bx,0x74(%edi)
 6c5:	72 61                	jb     728 <_init-0x8047f18>
 6c7:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 6ce:	65 
 6cf:	67 65 72 49          	addr16 gs jb 71c <_init-0x8047f24>
 6d3:	73 45                	jae    71a <_init-0x8047f26>
 6d5:	35 5f 5f 6d 69       	xor    $0x696d5f5f,%eax
 6da:	6e                   	outsb  %ds:(%esi),(%dx)
 6db:	45                   	inc    %ebp
 6dc:	00 77 63             	add    %dh,0x63(%edi)
 6df:	74 6f                	je     750 <_init-0x8047ef0>
 6e1:	62 00                	bound  %eax,(%eax)
 6e3:	5f                   	pop    %edi
 6e4:	53                   	push   %ebx
 6e5:	5f                   	pop    %edi
 6e6:	73 68                	jae    750 <_init-0x8047ef0>
 6e8:	6f                   	outsl  %ds:(%esi),(%dx)
 6e9:	77 70                	ja     75b <_init-0x8047ee5>
 6eb:	6f                   	outsl  %ds:(%esi),(%dx)
 6ec:	69 6e 74 00 5f 53 5f 	imul   $0x5f535f00,0x74(%esi),%ebp
 6f3:	73 6b                	jae    760 <_init-0x8047ee0>
 6f5:	69 70 77 73 00 5f 53 	imul   $0x535f0073,0x77(%eax),%esi
 6fc:	5f                   	pop    %edi
 6fd:	61                   	popa   
 6fe:	64 6a 75             	fs push $0x75
 701:	73 74                	jae    777 <_init-0x8047ec9>
 703:	66 69 65 6c 64 00    	imul   $0x64,0x6c(%ebp),%sp
 709:	5f                   	pop    %edi
 70a:	5a                   	pop    %edx
 70b:	4e                   	dec    %esi
 70c:	53                   	push   %ebx
 70d:	74 31                	je     740 <_init-0x8047f00>
 70f:	31 63 68             	xor    %esp,0x68(%ebx)
 712:	61                   	popa   
 713:	72 5f                	jb     774 <_init-0x8047ecc>
 715:	74 72                	je     789 <_init-0x8047eb7>
 717:	61                   	popa   
 718:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%ebx,%esi,2),%esi
 71f:	61 
 720:	73 73                	jae    795 <_init-0x8047eab>
 722:	69 67 6e 45 50 63 6a 	imul   $0x6a635045,0x6e(%edi),%esp
 729:	63 00                	arpl   %ax,(%eax)
 72b:	5f                   	pop    %edi
 72c:	5a                   	pop    %edx
 72d:	4e                   	dec    %esi
 72e:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 731:	67 6e                	outsb  %ds:(%si),(%dx)
 733:	75 5f                	jne    794 <_init-0x8047eac>
 735:	63 78 78             	arpl   %di,0x78(%eax)
 738:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 73b:	5f                   	pop    %edi
 73c:	6e                   	outsb  %ds:(%esi),(%dx)
 73d:	75 6d                	jne    7ac <_init-0x8047e94>
 73f:	65 72 69             	gs jb  7ab <_init-0x8047e95>
 742:	63 5f 74             	arpl   %bx,0x74(%edi)
 745:	72 61                	jb     7a8 <_init-0x8047e98>
 747:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 74e:	65 
 74f:	67 65 72 49          	addr16 gs jb 79c <_init-0x8047ea4>
 753:	6d                   	insl   (%dx),%es:(%edi)
 754:	45                   	inc    %ebp
 755:	38 5f 5f             	cmp    %bl,0x5f(%edi)
 758:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%edi),%esp
 75f:	00 
 760:	66 6c                	data16 insb (%dx),%es:(%edi)
 762:	6f                   	outsl  %ds:(%esi),(%dx)
 763:	61                   	popa   
 764:	74 00                	je     766 <_init-0x8047eda>
 766:	5f                   	pop    %edi
 767:	5a                   	pop    %edx
 768:	53                   	push   %ebx
 769:	74 34                	je     79f <_init-0x8047ea1>
 76b:	63 6f 75             	arpl   %bp,0x75(%edi)
 76e:	74 00                	je     770 <_init-0x8047ed0>
 770:	74 6d                	je     7df <_init-0x8047e61>
 772:	5f                   	pop    %edi
 773:	6d                   	insl   (%dx),%es:(%edi)
 774:	69 6e 00 5f 53 5f 6c 	imul   $0x6c5f535f,0x0(%esi),%ebp
 77b:	65 66 74 00          	gs data16 je 77f <_init-0x8047ec1>
 77f:	63 68 61             	arpl   %bp,0x61(%eax)
 782:	72 5f                	jb     7e3 <_init-0x8047e5d>
 784:	74 72                	je     7f8 <_init-0x8047e48>
 786:	61                   	popa   
 787:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%ebx,%esi,2),%esi
 78e:	72 
 78f:	3e 00 70 6f          	add    %dh,%ds:0x6f(%eax)
 793:	73 69                	jae    7fe <_init-0x8047e42>
 795:	74 69                	je     800 <_init-0x8047e40>
 797:	76 65                	jbe    7fe <_init-0x8047e42>
 799:	5f                   	pop    %edi
 79a:	73 69                	jae    805 <_init-0x8047e3b>
 79c:	67 6e                	outsb  %ds:(%si),(%dx)
 79e:	00 5f 53             	add    %bl,0x53(%edi)
 7a1:	5f                   	pop    %edi
 7a2:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%edi),%ebp
 7a9:	6e                   	outsb  %ds:(%esi),(%dx)
 7aa:	6d                   	insl   (%dx),%es:(%edi)
 7ab:	6f                   	outsl  %ds:(%esi),(%dx)
 7ac:	64 65 5f             	fs gs pop %edi
 7af:	65 6e                	outsb  %gs:(%esi),(%dx)
 7b1:	64 00 77 63          	add    %dh,%fs:0x63(%edi)
 7b5:	73 73                	jae    82a <_init-0x8047e16>
 7b7:	70 6e                	jo     827 <_init-0x8047e19>
 7b9:	00 5f 5a             	add    %bl,0x5a(%edi)
 7bc:	4e                   	dec    %esi
 7bd:	53                   	push   %ebx
 7be:	74 31                	je     7f1 <_init-0x8047e4f>
 7c0:	31 63 68             	xor    %esp,0x68(%ebx)
 7c3:	61                   	popa   
 7c4:	72 5f                	jb     825 <_init-0x8047e1b>
 7c6:	74 72                	je     83a <_init-0x8047e06>
 7c8:	61                   	popa   
 7c9:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%ebx,%esi,2),%esi
 7d0:	31 
 7d1:	65 71 5f             	gs jno 833 <_init-0x8047e0d>
 7d4:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 7db:	65 45                	gs inc %ebp
 7dd:	52                   	push   %edx
 7de:	4b                   	dec    %ebx
 7df:	69 53 32 5f 00 5f 53 	imul   $0x535f005f,0x32(%ebx),%edx
 7e6:	5f                   	pop    %edi
 7e7:	75 70                	jne    859 <_init-0x8047de7>
 7e9:	70 65                	jo     850 <_init-0x8047df0>
 7eb:	72 63                	jb     850 <_init-0x8047df0>
 7ed:	61                   	popa   
 7ee:	73 65                	jae    855 <_init-0x8047deb>
 7f0:	00 5f 5a             	add    %bl,0x5a(%edi)
 7f3:	4e                   	dec    %esi
 7f4:	31 33                	xor    %esi,(%ebx)
 7f6:	64 72 69             	fs jb  862 <_init-0x8047dde>
 7f9:	76 65                	jbe    860 <_init-0x8047de0>
 7fb:	64 5f                	fs pop %edi
 7fd:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 801:	73 32                	jae    835 <_init-0x8047e0b>
 803:	31 31                	xor    %esi,(%ecx)
 805:	76 69                	jbe    870 <_init-0x8047dd0>
 807:	72 74                	jb     87d <_init-0x8047dc3>
 809:	75 61                	jne    86c <_init-0x8047dd4>
 80b:	6c                   	insb   (%dx),%es:(%edi)
 80c:	5f                   	pop    %edi
 80d:	66 75 63             	data16 jne 873 <_init-0x8047dcd>
 810:	45                   	inc    %ebp
 811:	76 00                	jbe    813 <_init-0x8047e2d>
 813:	5f                   	pop    %edi
 814:	41                   	inc    %ecx
 815:	74 6f                	je     886 <_init-0x8047dba>
 817:	6d                   	insl   (%dx),%es:(%edi)
 818:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%ebx),%esp
 81f:	00 5f 53             	add    %bl,0x53(%edi)
 822:	5f                   	pop    %edi
 823:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%edi),%ebp
 82a:	66 6c                	data16 insb (%dx),%es:(%edi)
 82c:	61                   	popa   
 82d:	67 73 5f             	addr16 jae 88f <_init-0x8047db1>
 830:	65 6e                	outsb  %gs:(%esi),(%dx)
 832:	64 00 6f 73          	add    %ch,%fs:0x73(%edi)
 836:	74 72                	je     8aa <_init-0x8047d96>
 838:	65 61                	gs popa 
 83a:	6d                   	insl   (%dx),%es:(%edi)
 83b:	00 5f 5f             	add    %bl,0x5f(%edi)
 83e:	63 6f 75             	arpl   %bp,0x75(%edi)
 841:	6e                   	outsb  %ds:(%esi),(%dx)
 842:	74 00                	je     844 <_init-0x8047dfc>
 844:	5f                   	pop    %edi
 845:	5f                   	pop    %edi
 846:	67 6e                	outsb  %ds:(%si),(%dx)
 848:	75 5f                	jne    8a9 <_init-0x8047d97>
 84a:	63 78 78             	arpl   %di,0x78(%eax)
 84d:	00 62 6f             	add    %ah,0x6f(%edx)
 850:	6f                   	outsl  %ds:(%esi),(%dx)
 851:	6c                   	insb   (%dx),%es:(%edi)
 852:	00 6c 6f 6e          	add    %ch,0x6e(%edi,%ebp,2)
 856:	67 20 64 6f          	and    %ah,0x6f(%si)
 85a:	75 62                	jne    8be <_init-0x8047d82>
 85c:	6c                   	insb   (%dx),%es:(%edi)
 85d:	65 00 7e 62          	add    %bh,%gs:0x62(%esi)
 861:	61                   	popa   
 862:	73 65                	jae    8c9 <_init-0x8047d77>
 864:	5f                   	pop    %edi
 865:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 869:	73 00                	jae    86b <_init-0x8047dd5>
 86b:	5f                   	pop    %edi
 86c:	53                   	push   %ebx
 86d:	5f                   	pop    %edi
 86e:	73 63                	jae    8d3 <_init-0x8047d6d>
 870:	69 65 6e 74 69 66 69 	imul   $0x69666974,0x6e(%ebp),%esp
 877:	63 00                	arpl   %ax,(%eax)
 879:	5f                   	pop    %edi
 87a:	53                   	push   %ebx
 87b:	5f                   	pop    %edi
 87c:	66 6c                	data16 insb (%dx),%es:(%edi)
 87e:	6f                   	outsl  %ds:(%esi),(%dx)
 87f:	61                   	popa   
 880:	74 66                	je     8e8 <_init-0x8047d58>
 882:	69 65 6c 64 00 5f 53 	imul   $0x535f0064,0x6c(%ebp),%esp
 889:	5f                   	pop    %edi
 88a:	6f                   	outsl  %ds:(%esi),(%dx)
 88b:	63 74 00 5f          	arpl   %si,0x5f(%eax,%eax,1)
 88f:	5f                   	pop    %edi
 890:	77 63                	ja     8f5 <_init-0x8047d4b>
 892:	68 62 00 62 69       	push   $0x69620062
 897:	6e                   	outsb  %ds:(%esi),(%dx)
 898:	61                   	popa   
 899:	72 79                	jb     914 <_init-0x8047d2c>
 89b:	00 5f 5f             	add    %bl,0x5f(%edi)
 89e:	73 74                	jae    914 <_init-0x8047d2c>
 8a0:	61                   	popa   
 8a1:	74 69                	je     90c <_init-0x8047d34>
 8a3:	63 5f 69             	arpl   %bx,0x69(%edi)
 8a6:	6e                   	outsb  %ds:(%esi),(%dx)
 8a7:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%ecx,%ebp,2),%esi
 8ae:	61 
 8af:	74 69                	je     91a <_init-0x8047d26>
 8b1:	6f                   	outsl  %ds:(%esi),(%dx)
 8b2:	6e                   	outsb  %ds:(%esi),(%dx)
 8b3:	5f                   	pop    %edi
 8b4:	61                   	popa   
 8b5:	6e                   	outsb  %ds:(%esi),(%dx)
 8b6:	64 5f                	fs pop %edi
 8b8:	64 65 73 74          	fs gs jae 930 <_init-0x8047d10>
 8bc:	72 75                	jb     933 <_init-0x8047d0d>
 8be:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
 8c2:	6e                   	outsb  %ds:(%esi),(%dx)
 8c3:	5f                   	pop    %edi
 8c4:	30 00                	xor    %al,(%eax)
 8c6:	5f                   	pop    %edi
 8c7:	5a                   	pop    %edx
 8c8:	4e                   	dec    %esi
 8c9:	53                   	push   %ebx
 8ca:	74 31                	je     8fd <_init-0x8047d43>
 8cc:	31 63 68             	xor    %esp,0x68(%ebx)
 8cf:	61                   	popa   
 8d0:	72 5f                	jb     931 <_init-0x8047d0f>
 8d2:	74 72                	je     946 <_init-0x8047cfa>
 8d4:	61                   	popa   
 8d5:	69 74 73 49 63 45 37 	imul   $0x63374563,0x49(%ebx,%esi,2),%esi
 8dc:	63 
 8dd:	6f                   	outsl  %ds:(%esi),(%dx)
 8de:	6d                   	insl   (%dx),%es:(%edi)
 8df:	70 61                	jo     942 <_init-0x8047cfe>
 8e1:	72 65                	jb     948 <_init-0x8047cf8>
 8e3:	45                   	inc    %ebp
 8e4:	50                   	push   %eax
 8e5:	4b                   	dec    %ebx
 8e6:	63 53 32             	arpl   %dx,0x32(%ebx)
 8e9:	5f                   	pop    %edi
 8ea:	6a 00                	push   $0x0
 8ec:	6c                   	insb   (%dx),%es:(%edi)
 8ed:	6f                   	outsl  %ds:(%esi),(%dx)
 8ee:	6e                   	outsb  %ds:(%esi),(%dx)
 8ef:	67 20 6c 6f          	and    %ch,0x6f(%si)
 8f3:	6e                   	outsb  %ds:(%esi),(%dx)
 8f4:	67 20 75 6e          	and    %dh,0x6e(%di)
 8f8:	73 69                	jae    963 <_init-0x8047cdd>
 8fa:	67 6e                	outsb  %ds:(%si),(%dx)
 8fc:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 901:	74 00                	je     903 <_init-0x8047d3d>
 903:	77 63                	ja     968 <_init-0x8047cd8>
 905:	73 70                	jae    977 <_init-0x8047cc9>
 907:	62 72 6b             	bound  %esi,0x6b(%edx)
 90a:	00 77 63             	add    %dh,0x63(%edi)
 90d:	73 74                	jae    983 <_init-0x8047cbd>
 90f:	6f                   	outsl  %ds:(%esi),(%dx)
 910:	6c                   	insb   (%dx),%es:(%edi)
 911:	64 00 69 6e          	add    %ch,%fs:0x6e(%ecx)
 915:	74 5f                	je     976 <_init-0x8047cca>
 917:	70 5f                	jo     978 <_init-0x8047cc8>
 919:	73 65                	jae    980 <_init-0x8047cc0>
 91b:	70 5f                	jo     97c <_init-0x8047cc4>
 91d:	62 79 5f             	bound  %edi,0x5f(%ecx)
 920:	73 70                	jae    992 <_init-0x8047cae>
 922:	61                   	popa   
 923:	63 65 00             	arpl   %sp,0x0(%ebp)
 926:	5f                   	pop    %edi
 927:	53                   	push   %ebx
 928:	5f                   	pop    %edi
 929:	69 6f 73 5f 73 65 65 	imul   $0x6565735f,0x73(%edi),%ebp
 930:	6b 64 69 72 5f       	imul   $0x5f,0x72(%ecx,%ebp,2),%esp
 935:	65 6e                	outsb  %gs:(%esi),(%dx)
 937:	64 00 6c 65 6e       	add    %ch,%fs:0x6e(%ebp,%eiz,2)
 93c:	67 74 68             	addr16 je 9a7 <_init-0x8047c99>
 93f:	00 77 63             	add    %dh,0x63(%edi)
 942:	73 74                	jae    9b8 <_init-0x8047c88>
 944:	6f                   	outsl  %ds:(%esi),(%dx)
 945:	6c                   	insb   (%dx),%es:(%edi)
 946:	6c                   	insb   (%dx),%es:(%edi)
 947:	00 77 63             	add    %dh,0x63(%edi)
 94a:	73 73                	jae    9bf <_init-0x8047c81>
 94c:	74 72                	je     9c0 <_init-0x8047c80>
 94e:	00 5f 49             	add    %bl,0x49(%edi)
 951:	6f                   	outsl  %ds:(%esi),(%dx)
 952:	73 5f                	jae    9b3 <_init-0x8047c8d>
 954:	49                   	dec    %ecx
 955:	6f                   	outsl  %ds:(%esi),(%dx)
 956:	73 74                	jae    9cc <_init-0x8047c74>
 958:	61                   	popa   
 959:	74 65                	je     9c0 <_init-0x8047c80>
 95b:	00 5f 5a             	add    %bl,0x5a(%edi)
 95e:	4e                   	dec    %esi
 95f:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 962:	67 6e                	outsb  %ds:(%si),(%dx)
 964:	75 5f                	jne    9c5 <_init-0x8047c7b>
 966:	63 78 78             	arpl   %di,0x78(%eax)
 969:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 96c:	5f                   	pop    %edi
 96d:	6e                   	outsb  %ds:(%esi),(%dx)
 96e:	75 6d                	jne    9dd <_init-0x8047c63>
 970:	65 72 69             	gs jb  9dc <_init-0x8047c64>
 973:	63 5f 74             	arpl   %bx,0x74(%edi)
 976:	72 61                	jb     9d9 <_init-0x8047c67>
 978:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 97f:	65 
 980:	67 65 72 49          	addr16 gs jb 9cd <_init-0x8047c73>
 984:	63 45 35             	arpl   %ax,0x35(%ebp)
 987:	5f                   	pop    %edi
 988:	5f                   	pop    %edi
 989:	6d                   	insl   (%dx),%es:(%edi)
 98a:	61                   	popa   
 98b:	78 45                	js     9d2 <_init-0x8047c6e>
 98d:	00 5f 5a             	add    %bl,0x5a(%edi)
 990:	4e                   	dec    %esi
 991:	31 30                	xor    %esi,(%eax)
 993:	62 61 73             	bound  %esp,0x73(%ecx)
 996:	65 5f                	gs pop %edi
 998:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 99c:	73 31                	jae    9cf <_init-0x8047c71>
 99e:	31 76 69             	xor    %esi,0x69(%esi)
 9a1:	72 74                	jb     a17 <_init-0x8047c29>
 9a3:	75 61                	jne    a06 <_init-0x8047c3a>
 9a5:	6c                   	insb   (%dx),%es:(%edi)
 9a6:	5f                   	pop    %edi
 9a7:	66 75 63             	data16 jne a0d <_init-0x8047c33>
 9aa:	45                   	inc    %ebp
 9ab:	76 00                	jbe    9ad <_init-0x8047c93>
 9ad:	77 63                	ja     a12 <_init-0x8047c2e>
 9af:	73 72                	jae    a23 <_init-0x8047c1d>
 9b1:	74 6f                	je     a22 <_init-0x8047c1e>
 9b3:	6d                   	insl   (%dx),%es:(%edi)
 9b4:	62 73 00             	bound  %esi,0x0(%ebx)
 9b7:	74 6d                	je     a26 <_init-0x8047c1a>
 9b9:	5f                   	pop    %edi
 9ba:	77 64                	ja     a20 <_init-0x8047c20>
 9bc:	61                   	popa   
 9bd:	79 00                	jns    9bf <_init-0x8047c81>
 9bf:	5f                   	pop    %edi
 9c0:	53                   	push   %ebx
 9c1:	5f                   	pop    %edi
 9c2:	75 6e                	jne    a32 <_init-0x8047c0e>
 9c4:	69 74 62 75 66 00 5f 	imul   $0x5a5f0066,0x75(%edx,%eiz,2),%esi
 9cb:	5a 
 9cc:	4e                   	dec    %esi
 9cd:	53                   	push   %ebx
 9ce:	74 31                	je     a01 <_init-0x8047c3f>
 9d0:	31 63 68             	xor    %esp,0x68(%ebx)
 9d3:	61                   	popa   
 9d4:	72 5f                	jb     a35 <_init-0x8047c0b>
 9d6:	74 72                	je     a4a <_init-0x8047bf6>
 9d8:	61                   	popa   
 9d9:	69 74 73 49 63 45 32 	imul   $0x65324563,0x49(%ebx,%esi,2),%esi
 9e0:	65 
 9e1:	71 45                	jno    a28 <_init-0x8047c18>
 9e3:	52                   	push   %edx
 9e4:	4b                   	dec    %ebx
 9e5:	63 53 32             	arpl   %dx,0x32(%ebx)
 9e8:	5f                   	pop    %edi
 9e9:	00 5f 53             	add    %bl,0x53(%edi)
 9ec:	5f                   	pop    %edi
 9ed:	61                   	popa   
 9ee:	74 65                	je     a55 <_init-0x8047beb>
 9f0:	00 5f 5a             	add    %bl,0x5a(%edi)
 9f3:	4e                   	dec    %esi
 9f4:	31 33                	xor    %esi,(%ebx)
 9f6:	64 72 69             	fs jb  a62 <_init-0x8047bde>
 9f9:	76 65                	jbe    a60 <_init-0x8047be0>
 9fb:	64 5f                	fs pop %edi
 9fd:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 a01:	73 31                	jae    a34 <_init-0x8047c0c>
 a03:	31 31                	xor    %esi,(%ecx)
 a05:	6e                   	outsb  %ds:(%esi),(%dx)
 a06:	6f                   	outsl  %ds:(%esi),(%dx)
 a07:	72 6d                	jb     a76 <_init-0x8047bca>
 a09:	61                   	popa   
 a0a:	6c                   	insb   (%dx),%es:(%edi)
 a0b:	5f                   	pop    %edi
 a0c:	66 75 6e             	data16 jne a7d <_init-0x8047bc3>
 a0f:	63 45 76             	arpl   %ax,0x76(%ebp)
 a12:	00 5f 5f             	add    %bl,0x5f(%edi)
 a15:	64 69 67 69 74 73 00 	imul   $0x77007374,%fs:0x69(%edi),%esp
 a1c:	77 
 a1d:	63 73 74             	arpl   %si,0x74(%ebx)
 a20:	6f                   	outsl  %ds:(%esi),(%dx)
 a21:	64 00 77 63          	add    %dh,%fs:0x63(%edi)
 a25:	73 74                	jae    a9b <_init-0x8047ba5>
 a27:	6f                   	outsl  %ds:(%esi),(%dx)
 a28:	66 00 77 63          	data16 add %dh,0x63(%edi)
 a2c:	73 74                	jae    aa2 <_init-0x8047b9e>
 a2e:	6f                   	outsl  %ds:(%esi),(%dx)
 a2f:	6b 00 77             	imul   $0x77,(%eax),%eax
 a32:	63 73 74             	arpl   %si,0x74(%ebx)
 a35:	6f                   	outsl  %ds:(%esi),(%dx)
 a36:	6c                   	insb   (%dx),%es:(%edi)
 a37:	00 5f 5f             	add    %bl,0x5f(%edi)
 a3a:	46                   	inc    %esi
 a3b:	49                   	dec    %ecx
 a3c:	4c                   	dec    %esp
 a3d:	45                   	inc    %ebp
 a3e:	00 73 65             	add    %dh,0x65(%ebx)
 a41:	74 6c                	je     aaf <_init-0x8047b91>
 a43:	6f                   	outsl  %ds:(%esi),(%dx)
 a44:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 a47:	65 00 5f 5a          	add    %bl,%gs:0x5a(%edi)
 a4b:	4e                   	dec    %esi
 a4c:	31 30                	xor    %esi,(%eax)
 a4e:	62 61 73             	bound  %esp,0x73(%ecx)
 a51:	65 5f                	gs pop %edi
 a53:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 a57:	73 43                	jae    a9c <_init-0x8047ba4>
 a59:	32 45 76             	xor    0x76(%ebp),%al
 a5c:	00 77 63             	add    %dh,0x63(%edi)
 a5f:	73 72                	jae    ad3 <_init-0x8047b6d>
 a61:	63 68 72             	arpl   %bp,0x72(%eax)
 a64:	00 77 69             	add    %dh,0x69(%edi)
 a67:	6e                   	outsb  %ds:(%esi),(%dx)
 a68:	74 5f                	je     ac9 <_init-0x8047b77>
 a6a:	74 00                	je     a6c <_init-0x8047bd4>
 a6c:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 a73:	65 00 77 63          	add    %dh,%gs:0x63(%edi)
 a77:	73 6c                	jae    ae5 <_init-0x8047b5b>
 a79:	65 6e                	outsb  %gs:(%esi),(%dx)
 a7b:	00 69 6f             	add    %ch,0x6f(%ecx)
 a7e:	73 74                	jae    af4 <_init-0x8047b4c>
 a80:	61                   	popa   
 a81:	74 65                	je     ae8 <_init-0x8047b58>
 a83:	00 74 6f 5f          	add    %dh,0x5f(%edi,%ebp,2)
 a87:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 a8e:	65 00 74 6f 5f       	add    %dh,%gs:0x5f(%edi,%ebp,2)
 a93:	63 68 61             	arpl   %bp,0x61(%eax)
 a96:	72 5f                	jb     af7 <_init-0x8047b49>
 a98:	74 79                	je     b13 <_init-0x8047b2d>
 a9a:	70 65                	jo     b01 <_init-0x8047b3f>
 a9c:	00 5f 5f             	add    %bl,0x5f(%edi)
 a9f:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
 aa4:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 aa8:	67 6d                	insl   (%dx),%es:(%di)
 aaa:	74 6f                	je     b1b <_init-0x8047b25>
 aac:	66 66 00 63 75       	data16 data16 add %ah,0x75(%ebx)
 ab1:	72 72                	jb     b25 <_init-0x8047b1b>
 ab3:	65 6e                	outsb  %gs:(%esi),(%dx)
 ab5:	63 79 5f             	arpl   %di,0x5f(%ecx)
 ab8:	73 79                	jae    b33 <_init-0x8047b0d>
 aba:	6d                   	insl   (%dx),%es:(%edi)
 abb:	62 6f 6c             	bound  %ebp,0x6c(%edi)
 abe:	00 73 68             	add    %dh,0x68(%ebx)
 ac1:	6f                   	outsl  %ds:(%esi),(%dx)
 ac2:	72 74                	jb     b38 <_init-0x8047b08>
 ac4:	20 69 6e             	and    %ch,0x6e(%ecx)
 ac7:	74 00                	je     ac9 <_init-0x8047b77>
 ac9:	5f                   	pop    %edi
 aca:	5a                   	pop    %edx
 acb:	4e                   	dec    %esi
 acc:	53                   	push   %ebx
 acd:	74 31                	je     b00 <_init-0x8047b40>
 acf:	31 63 68             	xor    %esp,0x68(%ebx)
 ad2:	61                   	popa   
 ad3:	72 5f                	jb     b34 <_init-0x8047b0c>
 ad5:	74 72                	je     b49 <_init-0x8047af7>
 ad7:	61                   	popa   
 ad8:	69 74 73 49 63 45 36 	imul   $0x6c364563,0x49(%ebx,%esi,2),%esi
 adf:	6c 
 ae0:	65 6e                	outsb  %gs:(%esi),(%dx)
 ae2:	67 74 68             	addr16 je b4d <_init-0x8047af3>
 ae5:	45                   	inc    %ebp
 ae6:	50                   	push   %eax
 ae7:	4b                   	dec    %ebx
 ae8:	63 00                	arpl   %ax,(%eax)
 aea:	77 63                	ja     b4f <_init-0x8047af1>
 aec:	73 66                	jae    b54 <_init-0x8047aec>
 aee:	74 69                	je     b59 <_init-0x8047ae7>
 af0:	6d                   	insl   (%dx),%es:(%edi)
 af1:	65 00 6d 6f          	add    %ch,%gs:0x6f(%ebp)
 af5:	6e                   	outsb  %ds:(%esi),(%dx)
 af6:	5f                   	pop    %edi
 af7:	67 72 6f             	addr16 jb b69 <_init-0x8047ad7>
 afa:	75 70                	jne    b6c <_init-0x8047ad4>
 afc:	69 6e 67 00 5f 53 5f 	imul   $0x5f535f00,0x67(%esi),%ebp
 b03:	63 75 72             	arpl   %si,0x72(%ebp)
 b06:	00 5f 5a             	add    %bl,0x5a(%edi)
 b09:	4e                   	dec    %esi
 b0a:	31 33                	xor    %esi,(%ebx)
 b0c:	64 72 69             	fs jb  b78 <_init-0x8047ac8>
 b0f:	76 65                	jbe    b76 <_init-0x8047aca>
 b11:	64 5f                	fs pop %edi
 b13:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 b17:	73 31                	jae    b4a <_init-0x8047af6>
 b19:	31 31                	xor    %esi,(%ecx)
 b1b:	76 69                	jbe    b86 <_init-0x8047aba>
 b1d:	72 74                	jb     b93 <_init-0x8047aad>
 b1f:	75 61                	jne    b82 <_init-0x8047abe>
 b21:	6c                   	insb   (%dx),%es:(%edi)
 b22:	5f                   	pop    %edi
 b23:	66 75 63             	data16 jne b89 <_init-0x8047ab7>
 b26:	45                   	inc    %ebp
 b27:	76 00                	jbe    b29 <_init-0x8047b17>
 b29:	5f                   	pop    %edi
 b2a:	76 70                	jbe    b9c <_init-0x8047aa4>
 b2c:	74 72                	je     ba0 <_init-0x8047aa0>
 b2e:	2e 62 61 73          	bound  %esp,%cs:0x73(%ecx)
 b32:	65 5f                	gs pop %edi
 b34:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 b38:	73 00                	jae    b3a <_init-0x8047b06>
 b3a:	5f                   	pop    %edi
 b3b:	5a                   	pop    %edx
 b3c:	4e                   	dec    %esi
 b3d:	53                   	push   %ebx
 b3e:	74 31                	je     b71 <_init-0x8047acf>
 b40:	31 63 68             	xor    %esp,0x68(%ebx)
 b43:	61                   	popa   
 b44:	72 5f                	jb     ba5 <_init-0x8047a9b>
 b46:	74 72                	je     bba <_init-0x8047a86>
 b48:	61                   	popa   
 b49:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%ebx,%esi,2),%esi
 b50:	61 
 b51:	73 73                	jae    bc6 <_init-0x8047a7a>
 b53:	69 67 6e 45 52 63 52 	imul   $0x52635245,0x6e(%edi),%esp
 b5a:	4b                   	dec    %ebx
 b5b:	63 00                	arpl   %ax,(%eax)
 b5d:	77 63                	ja     bc2 <_init-0x8047a7e>
 b5f:	73 63                	jae    bc4 <_init-0x8047a7c>
 b61:	61                   	popa   
 b62:	74 00                	je     b64 <_init-0x8047adc>
 b64:	5f                   	pop    %edi
 b65:	5a                   	pop    %edx
 b66:	4e                   	dec    %esi
 b67:	31 30                	xor    %esi,(%eax)
 b69:	62 61 73             	bound  %esp,0x73(%ecx)
 b6c:	65 5f                	gs pop %edi
 b6e:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 b72:	73 44                	jae    bb8 <_init-0x8047a88>
 b74:	30 45 76             	xor    %al,0x76(%ebp)
 b77:	00 5f 5a             	add    %bl,0x5a(%edi)
 b7a:	4e                   	dec    %esi
 b7b:	31 33                	xor    %esi,(%ebx)
 b7d:	64 72 69             	fs jb  be9 <_init-0x8047a57>
 b80:	76 65                	jbe    be7 <_init-0x8047a59>
 b82:	64 5f                	fs pop %edi
 b84:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 b88:	73 32                	jae    bbc <_init-0x8047a84>
 b8a:	43                   	inc    %ebx
 b8b:	32 45 76             	xor    0x76(%ebp),%al
 b8e:	00 31                	add    %dh,(%ecx)
 b90:	31 5f 5f             	xor    %ebx,0x5f(%edi)
 b93:	6d                   	insl   (%dx),%es:(%edi)
 b94:	62 73 74             	bound  %esi,0x74(%ebx)
 b97:	61                   	popa   
 b98:	74 65                	je     bff <_init-0x8047a41>
 b9a:	5f                   	pop    %edi
 b9b:	74 00                	je     b9d <_init-0x8047aa3>
 b9d:	6e                   	outsb  %ds:(%esi),(%dx)
 b9e:	6f                   	outsl  %ds:(%esi),(%dx)
 b9f:	72 6d                	jb     c0e <_init-0x8047a32>
 ba1:	61                   	popa   
 ba2:	6c                   	insb   (%dx),%es:(%edi)
 ba3:	5f                   	pop    %edi
 ba4:	66 75 6e             	data16 jne c15 <_init-0x8047a2b>
 ba7:	63 00                	arpl   %ax,(%eax)
 ba9:	69 6e 74 5f 70 5f 73 	imul   $0x735f705f,0x74(%esi),%ebp
 bb0:	69 67 6e 5f 70 6f 73 	imul   $0x736f705f,0x6e(%edi),%esp
 bb7:	6e                   	outsb  %ds:(%esi),(%dx)
 bb8:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 bbc:	7a 6f                	jp     c2d <_init-0x8047a13>
 bbe:	6e                   	outsb  %ds:(%esi),(%dx)
 bbf:	65 00 76 74          	add    %dh,%gs:0x74(%esi)
 bc3:	62 6c 2e 63          	bound  %ebp,0x63(%esi,%ebp,1)
 bc7:	70 70                	jo     c39 <_init-0x8047a07>
 bc9:	00 76 77             	add    %dh,0x77(%esi)
 bcc:	73 63                	jae    c31 <_init-0x8047a0f>
 bce:	61                   	popa   
 bcf:	6e                   	outsb  %ds:(%esi),(%dx)
 bd0:	66 00 5f 53          	data16 add %bl,0x53(%edi)
 bd4:	5f                   	pop    %edi
 bd5:	69 6f 73 5f 69 6f 73 	imul   $0x736f695f,0x73(%edi),%ebp
 bdc:	74 61                	je     c3f <_init-0x8047a01>
 bde:	74 65                	je     c45 <_init-0x80479fb>
 be0:	5f                   	pop    %edi
 be1:	65 6e                	outsb  %gs:(%esi),(%dx)
 be3:	64 00 77 63          	add    %dh,%fs:0x63(%edi)
 be7:	72 74                	jb     c5d <_init-0x80479e3>
 be9:	6f                   	outsl  %ds:(%esi),(%dx)
 bea:	6d                   	insl   (%dx),%es:(%edi)
 beb:	62 00                	bound  %eax,(%eax)
 bed:	6c                   	insb   (%dx),%es:(%edi)
 bee:	63 6f 6e             	arpl   %bp,0x6e(%edi)
 bf1:	76 00                	jbe    bf3 <_init-0x8047a4d>
 bf3:	5f                   	pop    %edi
 bf4:	5a                   	pop    %edx
 bf5:	4e                   	dec    %esi
 bf6:	53                   	push   %ebx
 bf7:	74 31                	je     c2a <_init-0x8047a16>
 bf9:	31 63 68             	xor    %esp,0x68(%ebx)
 bfc:	61                   	popa   
 bfd:	72 5f                	jb     c5e <_init-0x80479e2>
 bff:	74 72                	je     c73 <_init-0x80479cd>
 c01:	61                   	popa   
 c02:	69 74 73 49 63 45 33 	imul   $0x65334563,0x49(%ebx,%esi,2),%esi
 c09:	65 
 c0a:	6f                   	outsl  %ds:(%esi),(%dx)
 c0b:	66 45                	inc    %bp
 c0d:	76 00                	jbe    c0f <_init-0x8047a31>
 c0f:	77 63                	ja     c74 <_init-0x80479cc>
 c11:	73 6e                	jae    c81 <_init-0x80479bf>
 c13:	63 61 74             	arpl   %sp,0x74(%ecx)
 c16:	00 5f 5f             	add    %bl,0x5f(%edi)
 c19:	6e                   	outsb  %ds:(%esi),(%dx)
 c1a:	75 6d                	jne    c89 <_init-0x80479b7>
 c1c:	65 72 69             	gs jb  c88 <_init-0x80479b8>
 c1f:	63 5f 74             	arpl   %bx,0x74(%edi)
 c22:	72 61                	jb     c85 <_init-0x80479bb>
 c24:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 c2b:	65 
 c2c:	67 65 72 3c          	addr16 gs jb c6c <_init-0x80479d4>
 c30:	73 68                	jae    c9a <_init-0x80479a6>
 c32:	6f                   	outsl  %ds:(%esi),(%dx)
 c33:	72 74                	jb     ca9 <_init-0x8047997>
 c35:	20 69 6e             	and    %ch,0x6e(%ecx)
 c38:	74 3e                	je     c78 <_init-0x80479c8>
 c3a:	00 5f 5f             	add    %bl,0x5f(%edi)
 c3d:	64 73 6f             	fs jae caf <_init-0x8047991>
 c40:	5f                   	pop    %edi
 c41:	68 61 6e 64 6c       	push   $0x6c646e61
 c46:	65 00 6c 6f 6e       	add    %ch,%gs:0x6e(%edi,%ebp,2)
 c4b:	67 20 6c 6f          	and    %ch,0x6f(%si)
 c4f:	6e                   	outsb  %ds:(%esi),(%dx)
 c50:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
 c54:	74 00                	je     c56 <_init-0x80479ea>
 c56:	66 70 75             	data16 jo cce <_init-0x8047972>
 c59:	74 77                	je     cd2 <_init-0x804796e>
 c5b:	63 00                	arpl   %ax,(%eax)
 c5d:	66 70 75             	data16 jo cd5 <_init-0x804796b>
 c60:	74 77                	je     cd9 <_init-0x8047967>
 c62:	73 00                	jae    c64 <_init-0x80479dc>
 c64:	7e 49                	jle    caf <_init-0x8047991>
 c66:	6e                   	outsb  %ds:(%esi),(%dx)
 c67:	69 74 00 6d 62 73 72 	imul   $0x74727362,0x6d(%eax,%eax,1),%esi
 c6e:	74 
 c6f:	6f                   	outsl  %ds:(%esi),(%dx)
 c70:	77 63                	ja     cd5 <_init-0x804796b>
 c72:	73 00                	jae    c74 <_init-0x80479cc>
 c74:	5f                   	pop    %edi
 c75:	53                   	push   %ebx
 c76:	5f                   	pop    %edi
 c77:	66 61                	popaw  
 c79:	69 6c 62 69 74 00 5f 	imul   $0x5f5f0074,0x69(%edx,%eiz,2),%ebp
 c80:	5f 
 c81:	6e                   	outsb  %ds:(%esi),(%dx)
 c82:	75 6d                	jne    cf1 <_init-0x804794f>
 c84:	65 72 69             	gs jb  cf0 <_init-0x8047950>
 c87:	63 5f 74             	arpl   %bx,0x74(%edi)
 c8a:	72 61                	jb     ced <_init-0x8047953>
 c8c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 c93:	65 
 c94:	67 65 72 3c          	addr16 gs jb cd4 <_init-0x804796c>
 c98:	6c                   	insb   (%dx),%es:(%edi)
 c99:	6f                   	outsl  %ds:(%esi),(%dx)
 c9a:	6e                   	outsb  %ds:(%esi),(%dx)
 c9b:	67 20 75 6e          	and    %dh,0x6e(%di)
 c9f:	73 69                	jae    d0a <_init-0x8047936>
 ca1:	67 6e                	outsb  %ds:(%si),(%dx)
 ca3:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 ca8:	74 3e                	je     ce8 <_init-0x8047958>
 caa:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 cae:	79 65                	jns    d15 <_init-0x804792b>
 cb0:	61                   	popa   
 cb1:	72 00                	jb     cb3 <_init-0x804798d>
 cb3:	73 68                	jae    d1d <_init-0x8047923>
 cb5:	6f                   	outsl  %ds:(%esi),(%dx)
 cb6:	72 74                	jb     d2c <_init-0x8047914>
 cb8:	20 75 6e             	and    %dh,0x6e(%ebp)
 cbb:	73 69                	jae    d26 <_init-0x804791a>
 cbd:	67 6e                	outsb  %ds:(%si),(%dx)
 cbf:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 cc4:	74 00                	je     cc6 <_init-0x804797a>
 cc6:	5f                   	pop    %edi
 cc7:	54                   	push   %esp
 cc8:	72 61                	jb     d2b <_init-0x8047915>
 cca:	69 74 73 00 5f 5f 6f 	imul   $0x706f5f5f,0x0(%ebx,%esi,2),%esi
 cd1:	70 
 cd2:	73 00                	jae    cd4 <_init-0x804796c>
 cd4:	76 66                	jbe    d3c <_init-0x8047904>
 cd6:	77 73                	ja     d4b <_init-0x80478f5>
 cd8:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 cdb:	66 00 5f 49          	data16 add %bl,0x49(%edi)
 cdf:	6f                   	outsl  %ds:(%esi),(%dx)
 ce0:	73 5f                	jae    d41 <_init-0x80478ff>
 ce2:	53                   	push   %ebx
 ce3:	65 65 6b 64 69 72 00 	gs imul $0x0,%gs:0x72(%ecx,%ebp,2),%esp
 cea:	66 6d                	insw   (%dx),%es:(%edi)
 cec:	74 66                	je     d54 <_init-0x80478ec>
 cee:	6c                   	insb   (%dx),%es:(%edi)
 cef:	61                   	popa   
 cf0:	67 73 00             	addr16 jae cf3 <_init-0x804794d>
 cf3:	5f                   	pop    %edi
 cf4:	5f                   	pop    %edi
 cf5:	69 6e 74 33 32 5f 74 	imul   $0x745f3233,0x74(%esi),%ebp
 cfc:	00 5f 5f             	add    %bl,0x5f(%edi)
 cff:	69 6e 5f 63 68 72 67 	imul   $0x67726863,0x5f(%esi),%ebp
 d06:	00 5f 5a             	add    %bl,0x5a(%edi)
 d09:	4e                   	dec    %esi
 d0a:	31 33                	xor    %esi,(%ebx)
 d0c:	64 72 69             	fs jb  d78 <_init-0x80478c8>
 d0f:	76 65                	jbe    d76 <_init-0x80478ca>
 d11:	64 5f                	fs pop %edi
 d13:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 d17:	73 32                	jae    d4b <_init-0x80478f5>
 d19:	44                   	inc    %esp
 d1a:	30 45 76             	xor    %al,0x76(%ebp)
 d1d:	00 6d 62             	add    %ch,0x62(%ebp)
 d20:	73 69                	jae    d8b <_init-0x80478b5>
 d22:	6e                   	outsb  %ds:(%esi),(%dx)
 d23:	69 74 00 69 73 77 63 	imul   $0x74637773,0x69(%eax,%eax,1),%esi
 d2a:	74 
 d2b:	79 70                	jns    d9d <_init-0x80478a3>
 d2d:	65 00 61 73          	add    %ah,%gs:0x73(%ecx)
 d31:	73 69                	jae    d9c <_init-0x80478a4>
 d33:	67 6e                	outsb  %ds:(%si),(%dx)
 d35:	00 5f 5a             	add    %bl,0x5a(%edi)
 d38:	4e                   	dec    %esi
 d39:	53                   	push   %ebx
 d3a:	74 31                	je     d6d <_init-0x80478d3>
 d3c:	31 63 68             	xor    %esp,0x68(%ebx)
 d3f:	61                   	popa   
 d40:	72 5f                	jb     da1 <_init-0x804789f>
 d42:	74 72                	je     db6 <_init-0x804788a>
 d44:	61                   	popa   
 d45:	69 74 73 49 63 45 37 	imul   $0x6e374563,0x49(%ebx,%esi,2),%esi
 d4c:	6e 
 d4d:	6f                   	outsl  %ds:(%esi),(%dx)
 d4e:	74 5f                	je     daf <_init-0x8047891>
 d50:	65 6f                	outsl  %gs:(%esi),(%dx)
 d52:	66 45                	inc    %bp
 d54:	52                   	push   %edx
 d55:	4b                   	dec    %ebx
 d56:	69 00 5f 5a 4e 53    	imul   $0x534e5a5f,(%eax),%eax
 d5c:	74 31                	je     d8f <_init-0x80478b1>
 d5e:	31 63 68             	xor    %esp,0x68(%ebx)
 d61:	61                   	popa   
 d62:	72 5f                	jb     dc3 <_init-0x804787d>
 d64:	74 72                	je     dd8 <_init-0x8047868>
 d66:	61                   	popa   
 d67:	69 74 73 49 63 45 34 	imul   $0x66344563,0x49(%ebx,%esi,2),%esi
 d6e:	66 
 d6f:	69 6e 64 45 50 4b 63 	imul   $0x634b5045,0x64(%esi),%ebp
 d76:	6a 52                	push   $0x52
 d78:	53                   	push   %ebx
 d79:	31 5f 00             	xor    %ebx,0x0(%edi)
 d7c:	77 63                	ja     de1 <_init-0x804785f>
 d7e:	68 61 72 5f 74       	push   $0x745f7261
 d83:	00 77 63             	add    %dh,0x63(%edi)
 d86:	73 74                	jae    dfc <_init-0x8047844>
 d88:	6f                   	outsl  %ds:(%esi),(%dx)
 d89:	75 6c                	jne    df7 <_init-0x8047849>
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	2b 88 04 08 d3 8a    	sub    -0x752cf7fc(%eax),%ecx
   6:	04 08                	add    $0x8,%al
   8:	d4 8a                	aam    $0x8a
   a:	04 08                	add    $0x8,%al
   c:	15 8b 04 08 16       	adc    $0x1608048b,%eax
  11:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  14:	6e                   	outsb  %ds:(%esi),(%dx)
  15:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  18:	6e                   	outsb  %ds:(%esi),(%dx)
  19:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  1c:	92                   	xchg   %eax,%edx
  1d:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  20:	92                   	xchg   %eax,%edx
  21:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  24:	c5 8b 04 08 c6 8b    	lds    -0x7439f7fc(%ebx),%ecx
  2a:	04 08                	add    $0x8,%al
  2c:	f9                   	stc    
  2d:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  30:	fa                   	cli    
  31:	8b 04 08             	mov    (%eax,%ecx,1),%eax
  34:	6c                   	insb   (%dx),%es:(%edi)
  35:	8c 04 08             	mov    %es,(%eax,%ecx,1)
  38:	6c                   	insb   (%dx),%es:(%edi)
  39:	8c 04 08             	mov    %es,(%eax,%ecx,1)
  3c:	f5                   	cmc    
  3d:	8c 04 08             	mov    %es,(%eax,%ecx,1)
  40:	f6                   	(bad)  
  41:	8c 04 08             	mov    %es,(%eax,%ecx,1)
  44:	1a 8d 04 08 1a 8d    	sbb    -0x72e5f7fc(%ebp),%cl
  4a:	04 08                	add    $0x8,%al
  4c:	4d                   	dec    %ebp
  4d:	8d 04 08             	lea    (%eax,%ecx,1),%eax
  50:	4e                   	dec    %esi
  51:	8d 04 08             	lea    (%eax,%ecx,1),%eax
  54:	c0 8d 04 08 c0 8d 04 	rorb   $0x4,-0x723ff7fc(%ebp)
  5b:	08 49 8e             	or     %cl,-0x72(%ecx)
  5e:	04 08                	add    $0x8,%al
  60:	4a                   	dec    %edx
  61:	8e 04 08             	mov    (%eax,%ecx,1),%es
  64:	6e                   	outsb  %ds:(%esi),(%dx)
  65:	8e 04 08             	mov    (%eax,%ecx,1),%es
  68:	6e                   	outsb  %ds:(%esi),(%dx)
  69:	8e 04 08             	mov    (%eax,%ecx,1),%es
  6c:	a1 8e 04 08 00       	mov    0x8048e,%eax
  71:	00 00                	add    %al,(%eax)
  73:	00 00                	add    %al,(%eax)
  75:	00 00                	add    %al,(%eax)
	...
