
vtbl_no_inheritance:     file format elf32-i386


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
 8048177:	00 d6                	add    %dl,%dh
 8048179:	b8 5b 3c b8 b2       	mov    $0xb2b83c5b,%eax
 804817e:	08 7b 9c             	or     %bh,-0x64(%ebx)
 8048181:	4e                   	dec    %esi
 8048182:	8b aa 2d 05 75 55    	mov    0x5575052d(%edx),%ebp
 8048188:	56                   	push   %esi
 8048189:	ad                   	lods   %ds:(%esi),%eax
 804818a:	8b 3a                	mov    (%edx),%edi

Disassembly of section .gnu.hash:

0804818c <.gnu.hash>:
 804818c:	03 00                	add    (%eax),%eax
 804818e:	00 00                	add    %al,(%eax)
 8048190:	0c 00                	or     $0x0,%al
 8048192:	00 00                	add    %al,(%eax)
 8048194:	01 00                	add    %eax,(%eax)
 8048196:	00 00                	add    %al,(%eax)
 8048198:	05 00 00 00 01       	add    $0x1000000,%eax
 804819d:	63 10                	arpl   %dx,(%eax)
 804819f:	20 0c 00             	and    %cl,(%eax,%eax,1)
 80481a2:	00 00                	add    %al,(%eax)
 80481a4:	0d 00 00 00 0f       	or     $0xf000000,%eax
 80481a9:	00 00                	add    %al,(%eax)
 80481ab:	00 c9                	add    %cl,%cl
 80481ad:	81 0a d2 ac 4b e3    	orl    $0xe34bacd2,(%edx)
 80481b3:	c0 21 fd             	shlb   $0xfd,(%ecx)
 80481b6:	f4                   	hlt    
 80481b7:	09 28                	or     %ebp,(%eax)
 80481b9:	45                   	inc    %ebp
 80481ba:	d5 4c                	aad    $0x4c
 80481bc:	15                   	.byte 0x15
 80481bd:	98                   	cwtl   
 80481be:	0c 43                	or     $0x43,%al

Disassembly of section .dynsym:

080481c0 <.dynsym>:
	...
 80481d0:	ae                   	scas   %es:(%edi),%al
	...
 80481d9:	00 00                	add    %al,(%eax)
 80481db:	00 12                	add    %dl,(%edx)
 80481dd:	00 00                	add    %al,(%eax)
 80481df:	00 94 01 00 00 00 00 	add    %dl,0x0(%ecx,%eax,1)
 80481e6:	00 00                	add    %al,(%eax)
 80481e8:	00 00                	add    %al,(%eax)
 80481ea:	00 00                	add    %al,(%eax)
 80481ec:	12 00                	adc    (%eax),%al
 80481ee:	00 00                	add    %al,(%eax)
 80481f0:	10 00                	adc    %al,(%eax)
	...
 80481fa:	00 00                	add    %al,(%eax)
 80481fc:	20 00                	and    %al,(%eax)
 80481fe:	00 00                	add    %al,(%eax)
 8048200:	1f                   	pop    %ds
	...
 8048209:	00 00                	add    %al,(%eax)
 804820b:	00 20                	add    %ah,(%eax)
 804820d:	00 00                	add    %al,(%eax)
 804820f:	00 f0                	add    %dh,%al
	...
 8048219:	00 00                	add    %al,(%eax)
 804821b:	00 12                	add    %dl,(%edx)
 804821d:	00 00                	add    %al,(%eax)
 804821f:	00 a1 01 00 00 00    	add    %ah,0x1(%ecx)
 8048225:	00 00                	add    %al,(%eax)
 8048227:	00 00                	add    %al,(%eax)
 8048229:	00 00                	add    %al,(%eax)
 804822b:	00 12                	add    %dl,(%edx)
 804822d:	00 00                	add    %al,(%eax)
 804822f:	00 33                	add    %dh,(%ebx)
	...
 8048239:	00 00                	add    %al,(%eax)
 804823b:	00 20                	add    %ah,(%eax)
 804823d:	00 00                	add    %al,(%eax)
 804823f:	00 b8 00 00 00 00    	add    %bh,0x0(%eax)
 8048245:	00 00                	add    %al,(%eax)
 8048247:	00 00                	add    %al,(%eax)
 8048249:	00 00                	add    %al,(%eax)
 804824b:	00 12                	add    %dl,(%edx)
 804824d:	00 00                	add    %al,(%eax)
 804824f:	00 4f 00             	add    %cl,0x0(%edi)
	...
 804825a:	00 00                	add    %al,(%eax)
 804825c:	20 00                	and    %al,(%eax)
 804825e:	00 00                	add    %al,(%eax)
 8048260:	08 01                	or     %al,(%ecx)
	...
 804826a:	00 00                	add    %al,(%eax)
 804826c:	12 00                	adc    (%eax),%al
 804826e:	00 00                	add    %al,(%eax)
 8048270:	2c 01                	sub    $0x1,%al
	...
 804827a:	00 00                	add    %al,(%eax)
 804827c:	12 00                	adc    (%eax),%al
 804827e:	00 00                	add    %al,(%eax)
 8048280:	3d 01 00 00 80       	cmp    $0x80000001,%eax
 8048285:	91                   	xchg   %eax,%ecx
 8048286:	04 08                	add    $0x8,%al
 8048288:	2c 00                	sub    $0x0,%al
 804828a:	00 00                	add    %al,(%eax)
 804828c:	21 00                	and    %eax,(%eax)
 804828e:	19 00                	sbb    %eax,(%eax)
 8048290:	85 01                	test   %eax,(%ecx)
 8048292:	00 00                	add    %al,(%eax)
 8048294:	8c 8a 04 08 04 00    	mov    %cs,0x40804(%edx)
 804829a:	00 00                	add    %al,(%eax)
 804829c:	11 00                	adc    %eax,(%eax)
 804829e:	0f 00 69 00          	verw   0x0(%ecx)
 80482a2:	00 00                	add    %al,(%eax)
 80482a4:	60                   	pusha  
 80482a5:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 80482a8:	00 00                	add    %al,(%eax)
 80482aa:	00 00                	add    %al,(%eax)
 80482ac:	12 00                	adc    (%eax),%al
 80482ae:	00 00                	add    %al,(%eax)
 80482b0:	14 01                	adc    $0x1,%al
 80482b2:	00 00                	add    %al,(%eax)
 80482b4:	20 86 04 08 00 00    	and    %al,0x804(%esi)
 80482ba:	00 00                	add    %al,(%eax)
 80482bc:	12 00                	adc    (%eax),%al
 80482be:	00 00                	add    %al,(%eax)
 80482c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 80482c1:	00 00                	add    %al,(%eax)
 80482c3:	00 c0                	add    %al,%al
 80482c5:	91                   	xchg   %eax,%ecx
 80482c6:	04 08                	add    $0x8,%al
 80482c8:	8c 00                	mov    %es,(%eax)
 80482ca:	00 00                	add    %al,(%eax)
 80482cc:	11 00                	adc    %eax,(%eax)
 80482ce:	19 00                	sbb    %eax,(%eax)

Disassembly of section .dynstr:

080482d0 <.dynstr>:
 80482d0:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 80482d4:	73 74                	jae    804834a <_init-0x252>
 80482d6:	64 63 2b             	arpl   %bp,%fs:(%ebx)
 80482d9:	2b 2e                	sub    (%esi),%ebp
 80482db:	73 6f                	jae    804834c <_init-0x250>
 80482dd:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%edi)
 80482e2:	67 6d                	insl   (%dx),%es:(%di)
 80482e4:	6f                   	outsl  %ds:(%esi),(%dx)
 80482e5:	6e                   	outsb  %ds:(%esi),(%dx)
 80482e6:	5f                   	pop    %edi
 80482e7:	73 74                	jae    804835d <_init-0x23f>
 80482e9:	61                   	popa   
 80482ea:	72 74                	jb     8048360 <_init-0x23c>
 80482ec:	5f                   	pop    %edi
 80482ed:	5f                   	pop    %edi
 80482ee:	00 5f 4a             	add    %bl,0x4a(%edi)
 80482f1:	76 5f                	jbe    8048352 <_init-0x24a>
 80482f3:	52                   	push   %edx
 80482f4:	65 67 69 73 74 65 72 	imul   $0x6c437265,%gs:0x74(%bp,%di),%esi
 80482fb:	43 6c 
 80482fd:	61                   	popa   
 80482fe:	73 73                	jae    8048373 <_init-0x229>
 8048300:	65 73 00             	gs jae 8048303 <_init-0x299>
 8048303:	5f                   	pop    %edi
 8048304:	49                   	dec    %ecx
 8048305:	54                   	push   %esp
 8048306:	4d                   	dec    %ebp
 8048307:	5f                   	pop    %edi
 8048308:	64 65 72 65          	fs gs jb 8048371 <_init-0x22b>
 804830c:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%bp,%di),%esi
 8048313:	4d 
 8048314:	43                   	inc    %ebx
 8048315:	6c                   	insb   (%dx),%es:(%edi)
 8048316:	6f                   	outsl  %ds:(%esi),(%dx)
 8048317:	6e                   	outsb  %ds:(%esi),(%dx)
 8048318:	65 54                	gs push %esp
 804831a:	61                   	popa   
 804831b:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 804831f:	5f                   	pop    %edi
 8048320:	49                   	dec    %ecx
 8048321:	54                   	push   %esp
 8048322:	4d                   	dec    %ebp
 8048323:	5f                   	pop    %edi
 8048324:	72 65                	jb     804838b <_init-0x211>
 8048326:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%bp,%di),%esi
 804832d:	4d 
 804832e:	43                   	inc    %ebx
 804832f:	6c                   	insb   (%dx),%es:(%edi)
 8048330:	6f                   	outsl  %ds:(%esi),(%dx)
 8048331:	6e                   	outsb  %ds:(%esi),(%dx)
 8048332:	65 54                	gs push %esp
 8048334:	61                   	popa   
 8048335:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 8048339:	5f                   	pop    %edi
 804833a:	5a                   	pop    %edx
 804833b:	53                   	push   %ebx
 804833c:	74 34                	je     8048372 <_init-0x22a>
 804833e:	65 6e                	outsb  %gs:(%esi),(%dx)
 8048340:	64 6c                	fs insb (%dx),%es:(%edi)
 8048342:	49                   	dec    %ecx
 8048343:	63 53 74             	arpl   %dx,0x74(%ebx)
 8048346:	31 31                	xor    %esi,(%ecx)
 8048348:	63 68 61             	arpl   %bp,0x61(%eax)
 804834b:	72 5f                	jb     80483ac <_init-0x1f0>
 804834d:	74 72                	je     80483c1 <_init-0x1db>
 804834f:	61                   	popa   
 8048350:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%ebx,%esi,2),%esi
 8048357:	52 
 8048358:	53                   	push   %ebx
 8048359:	74 31                	je     804838c <_init-0x210>
 804835b:	33 62 61             	xor    0x61(%edx),%esp
 804835e:	73 69                	jae    80483c9 <_init-0x1d3>
 8048360:	63 5f 6f             	arpl   %bx,0x6f(%edi)
 8048363:	73 74                	jae    80483d9 <_init-0x1c3>
 8048365:	72 65                	jb     80483cc <_init-0x1d0>
 8048367:	61                   	popa   
 8048368:	6d                   	insl   (%dx),%es:(%edi)
 8048369:	49                   	dec    %ecx
 804836a:	54                   	push   %esp
 804836b:	5f                   	pop    %edi
 804836c:	54                   	push   %esp
 804836d:	30 5f 45             	xor    %bl,0x45(%edi)
 8048370:	53                   	push   %ebx
 8048371:	36 5f                	ss pop %edi
 8048373:	00 5f 5a             	add    %bl,0x5a(%edi)
 8048376:	53                   	push   %ebx
 8048377:	74 34                	je     80483ad <_init-0x1ef>
 8048379:	63 6f 75             	arpl   %bp,0x75(%edi)
 804837c:	74 00                	je     804837e <_init-0x21e>
 804837e:	5f                   	pop    %edi
 804837f:	5a                   	pop    %edx
 8048380:	4e                   	dec    %esi
 8048381:	53                   	push   %ebx
 8048382:	6f                   	outsl  %ds:(%esi),(%dx)
 8048383:	6c                   	insb   (%dx),%es:(%edi)
 8048384:	73 45                	jae    80483cb <_init-0x1d1>
 8048386:	69 00 5f 5a 53 74    	imul   $0x74535a5f,(%eax),%eax
 804838c:	6c                   	insb   (%dx),%es:(%edi)
 804838d:	73 49                	jae    80483d8 <_init-0x1c4>
 804838f:	53                   	push   %ebx
 8048390:	74 31                	je     80483c3 <_init-0x1d9>
 8048392:	31 63 68             	xor    %esp,0x68(%ebx)
 8048395:	61                   	popa   
 8048396:	72 5f                	jb     80483f7 <_init-0x1a5>
 8048398:	74 72                	je     804840c <_init-0x190>
 804839a:	61                   	popa   
 804839b:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%ebx,%esi,2),%esi
 80483a2:	52 
 80483a3:	53                   	push   %ebx
 80483a4:	74 31                	je     80483d7 <_init-0x1c5>
 80483a6:	33 62 61             	xor    0x61(%edx),%esp
 80483a9:	73 69                	jae    8048414 <_init-0x188>
 80483ab:	63 5f 6f             	arpl   %bx,0x6f(%edi)
 80483ae:	73 74                	jae    8048424 <_init-0x178>
 80483b0:	72 65                	jb     8048417 <_init-0x185>
 80483b2:	61                   	popa   
 80483b3:	6d                   	insl   (%dx),%es:(%edi)
 80483b4:	49                   	dec    %ecx
 80483b5:	63 54 5f 45          	arpl   %dx,0x45(%edi,%ebx,2)
 80483b9:	53                   	push   %ebx
 80483ba:	35 5f 50 4b 63       	xor    $0x634b505f,%eax
 80483bf:	00 5f 5a             	add    %bl,0x5a(%edi)
 80483c2:	4e                   	dec    %esi
 80483c3:	53                   	push   %ebx
 80483c4:	74 38                	je     80483fe <_init-0x19e>
 80483c6:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 80483cd:	65 34 49             	gs xor $0x49,%al
 80483d0:	6e                   	outsb  %ds:(%esi),(%dx)
 80483d1:	69 74 43 31 45 76 00 	imul   $0x5f007645,0x31(%ebx,%eax,2),%esi
 80483d8:	5f 
 80483d9:	5a                   	pop    %edx
 80483da:	4e                   	dec    %esi
 80483db:	53                   	push   %ebx
 80483dc:	6f                   	outsl  %ds:(%esi),(%dx)
 80483dd:	6c                   	insb   (%dx),%es:(%edi)
 80483de:	73 45                	jae    8048425 <_init-0x177>
 80483e0:	50                   	push   %eax
 80483e1:	4b                   	dec    %ebx
 80483e2:	76 00                	jbe    80483e4 <_init-0x1b8>
 80483e4:	5f                   	pop    %edi
 80483e5:	5a                   	pop    %edx
 80483e6:	4e                   	dec    %esi
 80483e7:	53                   	push   %ebx
 80483e8:	74 38                	je     8048422 <_init-0x17a>
 80483ea:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 80483f1:	65 34 49             	gs xor $0x49,%al
 80483f4:	6e                   	outsb  %ds:(%esi),(%dx)
 80483f5:	69 74 44 31 45 76 00 	imul   $0x5f007645,0x31(%esp,%eax,2),%esi
 80483fc:	5f 
 80483fd:	5a                   	pop    %edx
 80483fe:	4e                   	dec    %esi
 80483ff:	53                   	push   %ebx
 8048400:	6f                   	outsl  %ds:(%esi),(%dx)
 8048401:	6c                   	insb   (%dx),%es:(%edi)
 8048402:	73 45                	jae    8048449 <_init-0x153>
 8048404:	50                   	push   %eax
 8048405:	46                   	inc    %esi
 8048406:	52                   	push   %edx
 8048407:	53                   	push   %ebx
 8048408:	6f                   	outsl  %ds:(%esi),(%dx)
 8048409:	53                   	push   %ebx
 804840a:	5f                   	pop    %edi
 804840b:	45                   	inc    %ebp
 804840c:	00 5f 5a             	add    %bl,0x5a(%edi)
 804840f:	54                   	push   %esp
 8048410:	56                   	push   %esi
 8048411:	4e                   	dec    %esi
 8048412:	31 30                	xor    %esi,(%eax)
 8048414:	5f                   	pop    %edi
 8048415:	5f                   	pop    %edi
 8048416:	63 78 78             	arpl   %di,0x78(%eax)
 8048419:	61                   	popa   
 804841a:	62 69 76             	bound  %ebp,0x76(%ecx)
 804841d:	31 31                	xor    %esi,(%ecx)
 804841f:	37                   	aaa    
 8048420:	5f                   	pop    %edi
 8048421:	5f                   	pop    %edi
 8048422:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048426:	73 5f                	jae    8048487 <_init-0x115>
 8048428:	74 79                	je     80484a3 <_init-0xf9>
 804842a:	70 65                	jo     8048491 <_init-0x10b>
 804842c:	5f                   	pop    %edi
 804842d:	69 6e 66 6f 45 00 6c 	imul   $0x6c00456f,0x66(%esi),%ebp
 8048434:	69 62 6d 2e 73 6f 2e 	imul   $0x2e6f732e,0x6d(%edx),%esp
 804843b:	36 00 6c 69 62       	add    %ch,%ss:0x62(%ecx,%ebp,2)
 8048440:	67 63 63 5f          	arpl   %sp,0x5f(%bp,%di)
 8048444:	73 2e                	jae    8048474 <_init-0x128>
 8048446:	73 6f                	jae    80484b7 <_init-0xe5>
 8048448:	2e 31 00             	xor    %eax,%cs:(%eax)
 804844b:	6c                   	insb   (%dx),%es:(%edi)
 804844c:	69 62 63 2e 73 6f 2e 	imul   $0x2e6f732e,0x63(%edx),%esp
 8048453:	36 00 5f 49          	add    %bl,%ss:0x49(%edi)
 8048457:	4f                   	dec    %edi
 8048458:	5f                   	pop    %edi
 8048459:	73 74                	jae    80484cf <_init-0xcd>
 804845b:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
 8048462:	64 
 8048463:	00 5f 5f             	add    %bl,0x5f(%edi)
 8048466:	63 78 61             	arpl   %di,0x61(%eax)
 8048469:	5f                   	pop    %edi
 804846a:	61                   	popa   
 804846b:	74 65                	je     80484d2 <_init-0xca>
 804846d:	78 69                	js     80484d8 <_init-0xc4>
 804846f:	74 00                	je     8048471 <_init-0x12b>
 8048471:	5f                   	pop    %edi
 8048472:	5f                   	pop    %edi
 8048473:	6c                   	insb   (%dx),%es:(%edi)
 8048474:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%edx),%esp
 804847b:	72 74                	jb     80484f1 <_init-0xab>
 804847d:	5f                   	pop    %edi
 804847e:	6d                   	insl   (%dx),%es:(%edi)
 804847f:	61                   	popa   
 8048480:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%esi),%ebp
 8048487:	43                   	inc    %ebx
 8048488:	5f                   	pop    %edi
 8048489:	32 2e                	xor    (%esi),%ch
 804848b:	30 00                	xor    %al,(%eax)
 804848d:	47                   	inc    %edi
 804848e:	4c                   	dec    %esp
 804848f:	49                   	dec    %ecx
 8048490:	42                   	inc    %edx
 8048491:	43                   	inc    %ebx
 8048492:	5f                   	pop    %edi
 8048493:	32 2e                	xor    (%esi),%ch
 8048495:	31 2e                	xor    %ebp,(%esi)
 8048497:	33 00                	xor    (%eax),%eax
 8048499:	43                   	inc    %ebx
 804849a:	58                   	pop    %eax
 804849b:	58                   	pop    %eax
 804849c:	41                   	inc    %ecx
 804849d:	42                   	inc    %edx
 804849e:	49                   	dec    %ecx
 804849f:	5f                   	pop    %edi
 80484a0:	31 2e                	xor    %ebp,(%esi)
 80484a2:	33 00                	xor    (%eax),%eax
 80484a4:	47                   	inc    %edi
 80484a5:	4c                   	dec    %esp
 80484a6:	49                   	dec    %ecx
 80484a7:	42                   	inc    %edx
 80484a8:	43                   	inc    %ebx
 80484a9:	58                   	pop    %eax
 80484aa:	58                   	pop    %eax
 80484ab:	5f                   	pop    %edi
 80484ac:	33 2e                	xor    (%esi),%ebp
 80484ae:	34 00                	xor    $0x0,%al

Disassembly of section .gnu.version:

080484b0 <.gnu.version>:
 80484b0:	00 00                	add    %al,(%eax)
 80484b2:	02 00                	add    (%eax),%al
 80484b4:	03 00                	add    (%eax),%eax
 80484b6:	00 00                	add    %al,(%eax)
 80484b8:	00 00                	add    %al,(%eax)
 80484ba:	02 00                	add    (%eax),%al
 80484bc:	04 00                	add    $0x0,%al
 80484be:	00 00                	add    %al,(%eax)
 80484c0:	02 00                	add    (%eax),%al
 80484c2:	00 00                	add    %al,(%eax)
 80484c4:	02 00                	add    (%eax),%al
 80484c6:	02 00                	add    (%eax),%al
 80484c8:	05 00 01 00 02       	add    $0x2000100,%eax
 80484cd:	00 02                	add    %al,(%edx)
 80484cf:	00 02                	add    %al,(%edx)
	...

Disassembly of section .gnu.version_r:

080484d4 <.gnu.version_r>:
 80484d4:	01 00                	add    %eax,(%eax)
 80484d6:	02 00                	add    (%eax),%al
 80484d8:	7b 01                	jnp    80484db <_init-0xc1>
 80484da:	00 00                	add    %al,(%eax)
 80484dc:	10 00                	adc    %al,(%eax)
 80484de:	00 00                	add    %al,(%eax)
 80484e0:	30 00                	xor    %al,(%eax)
 80484e2:	00 00                	add    %al,(%eax)
 80484e4:	10 69 69             	adc    %ch,0x69(%ecx)
 80484e7:	0d 00 00 04 00       	or     $0x40000,%eax
 80484ec:	b3 01                	mov    $0x1,%bl
 80484ee:	00 00                	add    %al,(%eax)
 80484f0:	10 00                	adc    %al,(%eax)
 80484f2:	00 00                	add    %al,(%eax)
 80484f4:	73 1f                	jae    8048515 <_init-0x87>
 80484f6:	69 09 00 00 03 00    	imul   $0x30000,(%ecx),%ecx
 80484fc:	bd 01 00 00 00       	mov    $0x1,%ebp
 8048501:	00 00                	add    %al,(%eax)
 8048503:	00 01                	add    %al,(%ecx)
 8048505:	00 02                	add    %al,(%edx)
 8048507:	00 01                	add    %al,(%ecx)
 8048509:	00 00                	add    %al,(%eax)
 804850b:	00 10                	add    %dl,(%eax)
 804850d:	00 00                	add    %al,(%eax)
 804850f:	00 00                	add    %al,(%eax)
 8048511:	00 00                	add    %al,(%eax)
 8048513:	00 d3                	add    %dl,%bl
 8048515:	af                   	scas   %es:(%edi),%eax
 8048516:	6b 05 00 00 05 00 c9 	imul   $0xffffffc9,0x50000,%eax
 804851d:	01 00                	add    %eax,(%eax)
 804851f:	00 10                	add    %dl,(%eax)
 8048521:	00 00                	add    %al,(%eax)
 8048523:	00 74 29 92          	add    %dh,-0x6e(%ecx,%ebp,1)
 8048527:	08 00                	or     %al,(%eax)
 8048529:	00 02                	add    %al,(%edx)
 804852b:	00 d4                	add    %dl,%ah
 804852d:	01 00                	add    %eax,(%eax)
 804852f:	00 00                	add    %al,(%eax)
 8048531:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.dyn:

08048534 <.rel.dyn>:
 8048534:	10 91 04 08 06 03    	adc    %dl,0x3060804(%ecx)
 804853a:	00 00                	add    %al,(%eax)
 804853c:	80 91 04 08 05 0c 00 	adcb   $0x0,0xc050804(%ecx)
 8048543:	00 c0                	add    %al,%al
 8048545:	91                   	xchg   %eax,%ecx
 8048546:	04 08                	add    $0x8,%al
 8048548:	05                   	.byte 0x5
 8048549:	10 00                	adc    %al,(%eax)
	...

Disassembly of section .rel.plt:

0804854c <.rel.plt>:
 804854c:	20 91 04 08 07 01    	and    %dl,0x1070804(%ecx)
 8048552:	00 00                	add    %al,(%eax)
 8048554:	24 91                	and    $0x91,%al
 8048556:	04 08                	add    $0x8,%al
 8048558:	07                   	pop    %es
 8048559:	02 00                	add    (%eax),%al
 804855b:	00 28                	add    %ch,(%eax)
 804855d:	91                   	xchg   %eax,%ecx
 804855e:	04 08                	add    $0x8,%al
 8048560:	07                   	pop    %es
 8048561:	03 00                	add    (%eax),%eax
 8048563:	00 2c 91             	add    %ch,(%ecx,%edx,4)
 8048566:	04 08                	add    $0x8,%al
 8048568:	07                   	pop    %es
 8048569:	05 00 00 30 91       	add    $0x91300000,%eax
 804856e:	04 08                	add    $0x8,%al
 8048570:	07                   	pop    %es
 8048571:	06                   	push   %es
 8048572:	00 00                	add    %al,(%eax)
 8048574:	34 91                	xor    $0x91,%al
 8048576:	04 08                	add    $0x8,%al
 8048578:	07                   	pop    %es
 8048579:	0f 00 00             	sldt   (%eax)
 804857c:	38 91 04 08 07 08    	cmp    %dl,0x8070804(%ecx)
 8048582:	00 00                	add    %al,(%eax)
 8048584:	3c 91                	cmp    $0x91,%al
 8048586:	04 08                	add    $0x8,%al
 8048588:	07                   	pop    %es
 8048589:	0a 00                	or     (%eax),%al
 804858b:	00 40 91             	add    %al,-0x6f(%eax)
 804858e:	04 08                	add    $0x8,%al
 8048590:	07                   	pop    %es
 8048591:	0b 00                	or     (%eax),%eax
 8048593:	00 44 91 04          	add    %al,0x4(%ecx,%edx,4)
 8048597:	08 07                	or     %al,(%edi)
 8048599:	0e                   	push   %cs
	...

Disassembly of section .init:

0804859c <_init>:
 804859c:	53                   	push   %ebx
 804859d:	83 ec 08             	sub    $0x8,%esp
 80485a0:	e8 fb 00 00 00       	call   80486a0 <__x86.get_pc_thunk.bx>
 80485a5:	81 c3 6f 0b 00 00    	add    $0xb6f,%ebx
 80485ab:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80485b1:	85 c0                	test   %eax,%eax
 80485b3:	74 05                	je     80485ba <_init+0x1e>
 80485b5:	e8 36 00 00 00       	call   80485f0 <__gmon_start__@plt>
 80485ba:	83 c4 08             	add    $0x8,%esp
 80485bd:	5b                   	pop    %ebx
 80485be:	c3                   	ret    

Disassembly of section .plt:

080485c0 <_ZNSolsEi@plt-0x10>:
 80485c0:	ff 35 18 91 04 08    	pushl  0x8049118
 80485c6:	ff 25 1c 91 04 08    	jmp    *0x804911c
 80485cc:	00 00                	add    %al,(%eax)
	...

080485d0 <_ZNSolsEi@plt>:
 80485d0:	ff 25 20 91 04 08    	jmp    *0x8049120
 80485d6:	68 00 00 00 00       	push   $0x0
 80485db:	e9 e0 ff ff ff       	jmp    80485c0 <_init+0x24>

080485e0 <__cxa_atexit@plt>:
 80485e0:	ff 25 24 91 04 08    	jmp    *0x8049124
 80485e6:	68 08 00 00 00       	push   $0x8
 80485eb:	e9 d0 ff ff ff       	jmp    80485c0 <_init+0x24>

080485f0 <__gmon_start__@plt>:
 80485f0:	ff 25 28 91 04 08    	jmp    *0x8049128
 80485f6:	68 10 00 00 00       	push   $0x10
 80485fb:	e9 c0 ff ff ff       	jmp    80485c0 <_init+0x24>

08048600 <_ZNSt8ios_base4InitC1Ev@plt>:
 8048600:	ff 25 2c 91 04 08    	jmp    *0x804912c
 8048606:	68 18 00 00 00       	push   $0x18
 804860b:	e9 b0 ff ff ff       	jmp    80485c0 <_init+0x24>

08048610 <__libc_start_main@plt>:
 8048610:	ff 25 30 91 04 08    	jmp    *0x8049130
 8048616:	68 20 00 00 00       	push   $0x20
 804861b:	e9 a0 ff ff ff       	jmp    80485c0 <_init+0x24>

08048620 <_ZNSt8ios_base4InitD1Ev@plt>:
 8048620:	ff 25 34 91 04 08    	jmp    *0x8049134
 8048626:	68 28 00 00 00       	push   $0x28
 804862b:	e9 90 ff ff ff       	jmp    80485c0 <_init+0x24>

08048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
 8048630:	ff 25 38 91 04 08    	jmp    *0x8049138
 8048636:	68 30 00 00 00       	push   $0x30
 804863b:	e9 80 ff ff ff       	jmp    80485c0 <_init+0x24>

08048640 <_ZNSolsEPKv@plt>:
 8048640:	ff 25 3c 91 04 08    	jmp    *0x804913c
 8048646:	68 38 00 00 00       	push   $0x38
 804864b:	e9 70 ff ff ff       	jmp    80485c0 <_init+0x24>

08048650 <_ZNSolsEPFRSoS_E@plt>:
 8048650:	ff 25 40 91 04 08    	jmp    *0x8049140
 8048656:	68 40 00 00 00       	push   $0x40
 804865b:	e9 60 ff ff ff       	jmp    80485c0 <_init+0x24>

08048660 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
 8048660:	ff 25 44 91 04 08    	jmp    *0x8049144
 8048666:	68 48 00 00 00       	push   $0x48
 804866b:	e9 50 ff ff ff       	jmp    80485c0 <_init+0x24>

Disassembly of section .text:

08048670 <_start>:
 8048670:	31 ed                	xor    %ebp,%ebp
 8048672:	5e                   	pop    %esi
 8048673:	89 e1                	mov    %esp,%ecx
 8048675:	83 e4 f0             	and    $0xfffffff0,%esp
 8048678:	50                   	push   %eax
 8048679:	54                   	push   %esp
 804867a:	52                   	push   %edx
 804867b:	68 70 8a 04 08       	push   $0x8048a70
 8048680:	68 00 8a 04 08       	push   $0x8048a00
 8048685:	51                   	push   %ecx
 8048686:	56                   	push   %esi
 8048687:	68 6b 87 04 08       	push   $0x804876b
 804868c:	e8 7f ff ff ff       	call   8048610 <__libc_start_main@plt>
 8048691:	f4                   	hlt    
 8048692:	66 90                	xchg   %ax,%ax
 8048694:	66 90                	xchg   %ax,%ax
 8048696:	66 90                	xchg   %ax,%ax
 8048698:	66 90                	xchg   %ax,%ax
 804869a:	66 90                	xchg   %ax,%ax
 804869c:	66 90                	xchg   %ax,%ax
 804869e:	66 90                	xchg   %ax,%ax

080486a0 <__x86.get_pc_thunk.bx>:
 80486a0:	8b 1c 24             	mov    (%esp),%ebx
 80486a3:	c3                   	ret    
 80486a4:	66 90                	xchg   %ax,%ax
 80486a6:	66 90                	xchg   %ax,%ax
 80486a8:	66 90                	xchg   %ax,%ax
 80486aa:	66 90                	xchg   %ax,%ax
 80486ac:	66 90                	xchg   %ax,%ax
 80486ae:	66 90                	xchg   %ax,%ax

080486b0 <deregister_tm_clones>:
 80486b0:	b8 53 91 04 08       	mov    $0x8049153,%eax
 80486b5:	2d 50 91 04 08       	sub    $0x8049150,%eax
 80486ba:	83 f8 06             	cmp    $0x6,%eax
 80486bd:	76 1a                	jbe    80486d9 <deregister_tm_clones+0x29>
 80486bf:	b8 00 00 00 00       	mov    $0x0,%eax
 80486c4:	85 c0                	test   %eax,%eax
 80486c6:	74 11                	je     80486d9 <deregister_tm_clones+0x29>
 80486c8:	55                   	push   %ebp
 80486c9:	89 e5                	mov    %esp,%ebp
 80486cb:	83 ec 14             	sub    $0x14,%esp
 80486ce:	68 50 91 04 08       	push   $0x8049150
 80486d3:	ff d0                	call   *%eax
 80486d5:	83 c4 10             	add    $0x10,%esp
 80486d8:	c9                   	leave  
 80486d9:	f3 c3                	repz ret 
 80486db:	90                   	nop
 80486dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080486e0 <register_tm_clones>:
 80486e0:	b8 50 91 04 08       	mov    $0x8049150,%eax
 80486e5:	2d 50 91 04 08       	sub    $0x8049150,%eax
 80486ea:	c1 f8 02             	sar    $0x2,%eax
 80486ed:	89 c2                	mov    %eax,%edx
 80486ef:	c1 ea 1f             	shr    $0x1f,%edx
 80486f2:	01 d0                	add    %edx,%eax
 80486f4:	d1 f8                	sar    %eax
 80486f6:	74 1b                	je     8048713 <register_tm_clones+0x33>
 80486f8:	ba 00 00 00 00       	mov    $0x0,%edx
 80486fd:	85 d2                	test   %edx,%edx
 80486ff:	74 12                	je     8048713 <register_tm_clones+0x33>
 8048701:	55                   	push   %ebp
 8048702:	89 e5                	mov    %esp,%ebp
 8048704:	83 ec 10             	sub    $0x10,%esp
 8048707:	50                   	push   %eax
 8048708:	68 50 91 04 08       	push   $0x8049150
 804870d:	ff d2                	call   *%edx
 804870f:	83 c4 10             	add    $0x10,%esp
 8048712:	c9                   	leave  
 8048713:	f3 c3                	repz ret 
 8048715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048720 <__do_global_dtors_aux>:
 8048720:	80 3d 4c 92 04 08 00 	cmpb   $0x0,0x804924c
 8048727:	75 13                	jne    804873c <__do_global_dtors_aux+0x1c>
 8048729:	55                   	push   %ebp
 804872a:	89 e5                	mov    %esp,%ebp
 804872c:	83 ec 08             	sub    $0x8,%esp
 804872f:	e8 7c ff ff ff       	call   80486b0 <deregister_tm_clones>
 8048734:	c6 05 4c 92 04 08 01 	movb   $0x1,0x804924c
 804873b:	c9                   	leave  
 804873c:	f3 c3                	repz ret 
 804873e:	66 90                	xchg   %ax,%ax

08048740 <frame_dummy>:
 8048740:	b8 0c 90 04 08       	mov    $0x804900c,%eax
 8048745:	8b 10                	mov    (%eax),%edx
 8048747:	85 d2                	test   %edx,%edx
 8048749:	75 05                	jne    8048750 <frame_dummy+0x10>
 804874b:	eb 93                	jmp    80486e0 <register_tm_clones>
 804874d:	8d 76 00             	lea    0x0(%esi),%esi
 8048750:	ba 00 00 00 00       	mov    $0x0,%edx
 8048755:	85 d2                	test   %edx,%edx
 8048757:	74 f2                	je     804874b <frame_dummy+0xb>
 8048759:	55                   	push   %ebp
 804875a:	89 e5                	mov    %esp,%ebp
 804875c:	83 ec 14             	sub    $0x14,%esp
 804875f:	50                   	push   %eax
 8048760:	ff d2                	call   *%edx
 8048762:	83 c4 10             	add    $0x10,%esp
 8048765:	c9                   	leave  
 8048766:	e9 75 ff ff ff       	jmp    80486e0 <register_tm_clones>

0804876b <main>:
 804876b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804876f:	83 e4 f0             	and    $0xfffffff0,%esp
 8048772:	ff 71 fc             	pushl  -0x4(%ecx)
 8048775:	55                   	push   %ebp
 8048776:	89 e5                	mov    %esp,%ebp
 8048778:	53                   	push   %ebx
 8048779:	51                   	push   %ecx
 804877a:	83 ec 10             	sub    $0x10,%esp
 804877d:	83 ec 0c             	sub    $0xc,%esp
 8048780:	8d 45 f0             	lea    -0x10(%ebp),%eax
 8048783:	50                   	push   %eax
 8048784:	e8 5b 02 00 00       	call   80489e4 <_ZN10base_classC1Ev>
 8048789:	83 c4 10             	add    $0x10,%esp
 804878c:	83 ec 08             	sub    $0x8,%esp
 804878f:	68 f0 8a 04 08       	push   $0x8048af0
 8048794:	68 c0 91 04 08       	push   $0x80491c0
 8048799:	e8 92 fe ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 804879e:	83 c4 10             	add    $0x10,%esp
 80487a1:	89 c2                	mov    %eax,%edx
 80487a3:	83 ec 08             	sub    $0x8,%esp
 80487a6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80487a9:	50                   	push   %eax
 80487aa:	52                   	push   %edx
 80487ab:	e8 90 fe ff ff       	call   8048640 <_ZNSolsEPKv@plt>
 80487b0:	83 c4 10             	add    $0x10,%esp
 80487b3:	83 ec 08             	sub    $0x8,%esp
 80487b6:	68 60 86 04 08       	push   $0x8048660
 80487bb:	50                   	push   %eax
 80487bc:	e8 8f fe ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 80487c1:	83 c4 10             	add    $0x10,%esp
 80487c4:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80487c7:	8b 00                	mov    (%eax),%eax
 80487c9:	89 c3                	mov    %eax,%ebx
 80487cb:	83 ec 08             	sub    $0x8,%esp
 80487ce:	68 1c 8b 04 08       	push   $0x8048b1c
 80487d3:	68 c0 91 04 08       	push   $0x80491c0
 80487d8:	e8 53 fe ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 80487dd:	83 c4 10             	add    $0x10,%esp
 80487e0:	83 ec 08             	sub    $0x8,%esp
 80487e3:	53                   	push   %ebx
 80487e4:	50                   	push   %eax
 80487e5:	e8 56 fe ff ff       	call   8048640 <_ZNSolsEPKv@plt>
 80487ea:	83 c4 10             	add    $0x10,%esp
 80487ed:	83 ec 08             	sub    $0x8,%esp
 80487f0:	68 60 86 04 08       	push   $0x8048660
 80487f5:	50                   	push   %eax
 80487f6:	e8 55 fe ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 80487fb:	83 c4 10             	add    $0x10,%esp
 80487fe:	8d 45 f0             	lea    -0x10(%ebp),%eax
 8048801:	8b 00                	mov    (%eax),%eax
 8048803:	83 c0 04             	add    $0x4,%eax
 8048806:	89 c3                	mov    %eax,%ebx
 8048808:	83 ec 08             	sub    $0x8,%esp
 804880b:	68 48 8b 04 08       	push   $0x8048b48
 8048810:	68 c0 91 04 08       	push   $0x80491c0
 8048815:	e8 16 fe ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 804881a:	83 c4 10             	add    $0x10,%esp
 804881d:	83 ec 08             	sub    $0x8,%esp
 8048820:	53                   	push   %ebx
 8048821:	50                   	push   %eax
 8048822:	e8 19 fe ff ff       	call   8048640 <_ZNSolsEPKv@plt>
 8048827:	83 c4 10             	add    $0x10,%esp
 804882a:	83 ec 08             	sub    $0x8,%esp
 804882d:	68 60 86 04 08       	push   $0x8048660
 8048832:	50                   	push   %eax
 8048833:	e8 18 fe ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 8048838:	83 c4 10             	add    $0x10,%esp
 804883b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 804883e:	8b 00                	mov    (%eax),%eax
 8048840:	83 c0 08             	add    $0x8,%eax
 8048843:	89 c3                	mov    %eax,%ebx
 8048845:	83 ec 08             	sub    $0x8,%esp
 8048848:	68 74 8b 04 08       	push   $0x8048b74
 804884d:	68 c0 91 04 08       	push   $0x80491c0
 8048852:	e8 d9 fd ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048857:	83 c4 10             	add    $0x10,%esp
 804885a:	83 ec 08             	sub    $0x8,%esp
 804885d:	53                   	push   %ebx
 804885e:	50                   	push   %eax
 804885f:	e8 dc fd ff ff       	call   8048640 <_ZNSolsEPKv@plt>
 8048864:	83 c4 10             	add    $0x10,%esp
 8048867:	83 ec 08             	sub    $0x8,%esp
 804886a:	68 60 86 04 08       	push   $0x8048660
 804886f:	50                   	push   %eax
 8048870:	e8 db fd ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 8048875:	83 c4 10             	add    $0x10,%esp
 8048878:	8d 45 f0             	lea    -0x10(%ebp),%eax
 804887b:	8b 00                	mov    (%eax),%eax
 804887d:	83 c0 0c             	add    $0xc,%eax
 8048880:	8b 18                	mov    (%eax),%ebx
 8048882:	83 ec 08             	sub    $0x8,%esp
 8048885:	68 9f 8b 04 08       	push   $0x8048b9f
 804888a:	68 c0 91 04 08       	push   $0x80491c0
 804888f:	e8 9c fd ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048894:	83 c4 10             	add    $0x10,%esp
 8048897:	83 ec 08             	sub    $0x8,%esp
 804889a:	53                   	push   %ebx
 804889b:	50                   	push   %eax
 804889c:	e8 2f fd ff ff       	call   80485d0 <_ZNSolsEi@plt>
 80488a1:	83 c4 10             	add    $0x10,%esp
 80488a4:	83 ec 08             	sub    $0x8,%esp
 80488a7:	68 60 86 04 08       	push   $0x8048660
 80488ac:	50                   	push   %eax
 80488ad:	e8 9e fd ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 80488b2:	83 c4 10             	add    $0x10,%esp
 80488b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80488bc:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80488bf:	8b 00                	mov    (%eax),%eax
 80488c1:	8b 00                	mov    (%eax),%eax
 80488c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488c9:	ff d0                	call   *%eax
 80488cb:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80488ce:	8b 00                	mov    (%eax),%eax
 80488d0:	83 c0 04             	add    $0x4,%eax
 80488d3:	8b 00                	mov    (%eax),%eax
 80488d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488db:	ff d0                	call   *%eax
 80488dd:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80488e0:	8b 00                	mov    (%eax),%eax
 80488e2:	83 c0 08             	add    $0x8,%eax
 80488e5:	8b 00                	mov    (%eax),%eax
 80488e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488ed:	ff d0                	call   *%eax
 80488ef:	b8 00 00 00 00       	mov    $0x0,%eax
 80488f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 80488f7:	59                   	pop    %ecx
 80488f8:	5b                   	pop    %ebx
 80488f9:	5d                   	pop    %ebp
 80488fa:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80488fd:	c3                   	ret    

080488fe <_Z41__static_initialization_and_destruction_0ii>:
 80488fe:	55                   	push   %ebp
 80488ff:	89 e5                	mov    %esp,%ebp
 8048901:	83 ec 08             	sub    $0x8,%esp
 8048904:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 8048908:	75 33                	jne    804893d <_Z41__static_initialization_and_destruction_0ii+0x3f>
 804890a:	81 7d 0c ff ff 00 00 	cmpl   $0xffff,0xc(%ebp)
 8048911:	75 2a                	jne    804893d <_Z41__static_initialization_and_destruction_0ii+0x3f>
 8048913:	83 ec 0c             	sub    $0xc,%esp
 8048916:	68 4d 92 04 08       	push   $0x804924d
 804891b:	e8 e0 fc ff ff       	call   8048600 <_ZNSt8ios_base4InitC1Ev@plt>
 8048920:	83 c4 10             	add    $0x10,%esp
 8048923:	83 ec 04             	sub    $0x4,%esp
 8048926:	68 4c 91 04 08       	push   $0x804914c
 804892b:	68 4d 92 04 08       	push   $0x804924d
 8048930:	68 20 86 04 08       	push   $0x8048620
 8048935:	e8 a6 fc ff ff       	call   80485e0 <__cxa_atexit@plt>
 804893a:	83 c4 10             	add    $0x10,%esp
 804893d:	c9                   	leave  
 804893e:	c3                   	ret    

0804893f <_GLOBAL__sub_I_main>:
 804893f:	55                   	push   %ebp
 8048940:	89 e5                	mov    %esp,%ebp
 8048942:	83 ec 08             	sub    $0x8,%esp
 8048945:	83 ec 08             	sub    $0x8,%esp
 8048948:	68 ff ff 00 00       	push   $0xffff
 804894d:	6a 01                	push   $0x1
 804894f:	e8 aa ff ff ff       	call   80488fe <_Z41__static_initialization_and_destruction_0ii>
 8048954:	83 c4 10             	add    $0x10,%esp
 8048957:	c9                   	leave  
 8048958:	c3                   	ret    
 8048959:	90                   	nop

0804895a <_ZN10base_class7v_func1Ev>:
 804895a:	55                   	push   %ebp
 804895b:	89 e5                	mov    %esp,%ebp
 804895d:	83 ec 08             	sub    $0x8,%esp
 8048960:	83 ec 08             	sub    $0x8,%esp
 8048963:	68 90 8a 04 08       	push   $0x8048a90
 8048968:	68 c0 91 04 08       	push   $0x80491c0
 804896d:	e8 be fc ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 8048972:	83 c4 10             	add    $0x10,%esp
 8048975:	83 ec 08             	sub    $0x8,%esp
 8048978:	68 60 86 04 08       	push   $0x8048660
 804897d:	50                   	push   %eax
 804897e:	e8 cd fc ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 8048983:	83 c4 10             	add    $0x10,%esp
 8048986:	c9                   	leave  
 8048987:	c3                   	ret    

08048988 <_ZN10base_class7v_func2Ev>:
 8048988:	55                   	push   %ebp
 8048989:	89 e5                	mov    %esp,%ebp
 804898b:	83 ec 08             	sub    $0x8,%esp
 804898e:	83 ec 08             	sub    $0x8,%esp
 8048991:	68 b0 8a 04 08       	push   $0x8048ab0
 8048996:	68 c0 91 04 08       	push   $0x80491c0
 804899b:	e8 90 fc ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 80489a0:	83 c4 10             	add    $0x10,%esp
 80489a3:	83 ec 08             	sub    $0x8,%esp
 80489a6:	68 60 86 04 08       	push   $0x8048660
 80489ab:	50                   	push   %eax
 80489ac:	e8 9f fc ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 80489b1:	83 c4 10             	add    $0x10,%esp
 80489b4:	c9                   	leave  
 80489b5:	c3                   	ret    

080489b6 <_ZN10base_class7v_func3Ev>:
 80489b6:	55                   	push   %ebp
 80489b7:	89 e5                	mov    %esp,%ebp
 80489b9:	83 ec 08             	sub    $0x8,%esp
 80489bc:	83 ec 08             	sub    $0x8,%esp
 80489bf:	68 d0 8a 04 08       	push   $0x8048ad0
 80489c4:	68 c0 91 04 08       	push   $0x80491c0
 80489c9:	e8 62 fc ff ff       	call   8048630 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
 80489ce:	83 c4 10             	add    $0x10,%esp
 80489d1:	83 ec 08             	sub    $0x8,%esp
 80489d4:	68 60 86 04 08       	push   $0x8048660
 80489d9:	50                   	push   %eax
 80489da:	e8 71 fc ff ff       	call   8048650 <_ZNSolsEPFRSoS_E@plt>
 80489df:	83 c4 10             	add    $0x10,%esp
 80489e2:	c9                   	leave  
 80489e3:	c3                   	ret    

080489e4 <_ZN10base_classC1Ev>:
 80489e4:	55                   	push   %ebp
 80489e5:	89 e5                	mov    %esp,%ebp
 80489e7:	8b 45 08             	mov    0x8(%ebp),%eax
 80489ea:	c7 00 c8 8b 04 08    	movl   $0x8048bc8,(%eax)
 80489f0:	5d                   	pop    %ebp
 80489f1:	c3                   	ret    
 80489f2:	66 90                	xchg   %ax,%ax
 80489f4:	66 90                	xchg   %ax,%ax
 80489f6:	66 90                	xchg   %ax,%ax
 80489f8:	66 90                	xchg   %ax,%ax
 80489fa:	66 90                	xchg   %ax,%ax
 80489fc:	66 90                	xchg   %ax,%ax
 80489fe:	66 90                	xchg   %ax,%ax

08048a00 <__libc_csu_init>:
 8048a00:	55                   	push   %ebp
 8048a01:	57                   	push   %edi
 8048a02:	31 ff                	xor    %edi,%edi
 8048a04:	56                   	push   %esi
 8048a05:	53                   	push   %ebx
 8048a06:	e8 95 fc ff ff       	call   80486a0 <__x86.get_pc_thunk.bx>
 8048a0b:	81 c3 09 07 00 00    	add    $0x709,%ebx
 8048a11:	83 ec 1c             	sub    $0x1c,%esp
 8048a14:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8048a18:	8d b3 f4 fe ff ff    	lea    -0x10c(%ebx),%esi
 8048a1e:	e8 79 fb ff ff       	call   804859c <_init>
 8048a23:	8d 83 ec fe ff ff    	lea    -0x114(%ebx),%eax
 8048a29:	29 c6                	sub    %eax,%esi
 8048a2b:	c1 fe 02             	sar    $0x2,%esi
 8048a2e:	85 f6                	test   %esi,%esi
 8048a30:	74 27                	je     8048a59 <__libc_csu_init+0x59>
 8048a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048a38:	8b 44 24 38          	mov    0x38(%esp),%eax
 8048a3c:	89 2c 24             	mov    %ebp,(%esp)
 8048a3f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048a43:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048a47:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a4b:	ff 94 bb ec fe ff ff 	call   *-0x114(%ebx,%edi,4)
 8048a52:	83 c7 01             	add    $0x1,%edi
 8048a55:	39 f7                	cmp    %esi,%edi
 8048a57:	75 df                	jne    8048a38 <__libc_csu_init+0x38>
 8048a59:	83 c4 1c             	add    $0x1c,%esp
 8048a5c:	5b                   	pop    %ebx
 8048a5d:	5e                   	pop    %esi
 8048a5e:	5f                   	pop    %edi
 8048a5f:	5d                   	pop    %ebp
 8048a60:	c3                   	ret    
 8048a61:	eb 0d                	jmp    8048a70 <__libc_csu_fini>
 8048a63:	90                   	nop
 8048a64:	90                   	nop
 8048a65:	90                   	nop
 8048a66:	90                   	nop
 8048a67:	90                   	nop
 8048a68:	90                   	nop
 8048a69:	90                   	nop
 8048a6a:	90                   	nop
 8048a6b:	90                   	nop
 8048a6c:	90                   	nop
 8048a6d:	90                   	nop
 8048a6e:	90                   	nop
 8048a6f:	90                   	nop

08048a70 <__libc_csu_fini>:
 8048a70:	f3 c3                	repz ret 

Disassembly of section .fini:

08048a74 <_fini>:
 8048a74:	53                   	push   %ebx
 8048a75:	83 ec 08             	sub    $0x8,%esp
 8048a78:	e8 23 fc ff ff       	call   80486a0 <__x86.get_pc_thunk.bx>
 8048a7d:	81 c3 97 06 00 00    	add    $0x697,%ebx
 8048a83:	83 c4 08             	add    $0x8,%esp
 8048a86:	5b                   	pop    %ebx
 8048a87:	c3                   	ret    

Disassembly of section .rodata:

08048a88 <_fp_hw>:
 8048a88:	03 00                	add    (%eax),%eax
	...

08048a8c <_IO_stdin_used>:
 8048a8c:	01 00                	add    %eax,(%eax)
 8048a8e:	02 00                	add    (%eax),%al
 8048a90:	54                   	push   %esp
 8048a91:	68 69 73 20 69       	push   $0x69207369
 8048a96:	73 20                	jae    8048ab8 <_IO_stdin_used+0x2c>
 8048a98:	62 61 73             	bound  %esp,0x73(%ecx)
 8048a9b:	65 5f                	gs pop %edi
 8048a9d:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048aa1:	73 27                	jae    8048aca <_IO_stdin_used+0x3e>
 8048aa3:	73 20                	jae    8048ac5 <_IO_stdin_used+0x39>
 8048aa5:	76 5f                	jbe    8048b06 <_IO_stdin_used+0x7a>
 8048aa7:	66 75 6e             	data16 jne 8048b18 <_IO_stdin_used+0x8c>
 8048aaa:	63 31                	arpl   %si,(%ecx)
 8048aac:	28 29                	sub    %ch,(%ecx)
 8048aae:	00 00                	add    %al,(%eax)
 8048ab0:	54                   	push   %esp
 8048ab1:	68 69 73 20 69       	push   $0x69207369
 8048ab6:	73 20                	jae    8048ad8 <_IO_stdin_used+0x4c>
 8048ab8:	62 61 73             	bound  %esp,0x73(%ecx)
 8048abb:	65 5f                	gs pop %edi
 8048abd:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048ac1:	73 27                	jae    8048aea <_IO_stdin_used+0x5e>
 8048ac3:	73 20                	jae    8048ae5 <_IO_stdin_used+0x59>
 8048ac5:	76 5f                	jbe    8048b26 <_IO_stdin_used+0x9a>
 8048ac7:	66 75 6e             	data16 jne 8048b38 <_IO_stdin_used+0xac>
 8048aca:	63 32                	arpl   %si,(%edx)
 8048acc:	28 29                	sub    %ch,(%ecx)
 8048ace:	00 00                	add    %al,(%eax)
 8048ad0:	54                   	push   %esp
 8048ad1:	68 69 73 20 69       	push   $0x69207369
 8048ad6:	73 20                	jae    8048af8 <_IO_stdin_used+0x6c>
 8048ad8:	62 61 73             	bound  %esp,0x73(%ecx)
 8048adb:	65 5f                	gs pop %edi
 8048add:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048ae1:	73 27                	jae    8048b0a <_IO_stdin_used+0x7e>
 8048ae3:	73 20                	jae    8048b05 <_IO_stdin_used+0x79>
 8048ae5:	76 5f                	jbe    8048b46 <_IO_stdin_used+0xba>
 8048ae7:	66 75 6e             	data16 jne 8048b58 <_IO_stdin_used+0xcc>
 8048aea:	63 33                	arpl   %si,(%ebx)
 8048aec:	28 29                	sub    %ch,(%ecx)
 8048aee:	00 00                	add    %al,(%eax)
 8048af0:	62 61 73             	bound  %esp,0x73(%ecx)
 8048af3:	65 5f                	gs pop %edi
 8048af5:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048af9:	73 20                	jae    8048b1b <_IO_stdin_used+0x8f>
 8048afb:	e7 9a                	out    %eax,$0x9a
 8048afd:	84 e8                	test   %ch,%al
 8048aff:	99                   	cltd   
 8048b00:	9a e5 87 bd e6 95 b0 	lcall  $0xb095,$0xe6bd87e5
 8048b07:	e8 a1 a8 e9 a6       	call   aeee33ad <_end+0xa6e9a15d>
 8048b0c:	96                   	xchg   %eax,%esi
 8048b0d:	e5 9c                	in     $0x9c,%eax
 8048b0f:	b0 e5                	mov    $0xe5,%al
 8048b11:	9d                   	popf   
 8048b12:	80 e4 b8             	and    $0xb8,%ah
 8048b15:	ba ef bc 9a 00       	mov    $0x9abcef,%edx
 8048b1a:	00 00                	add    %al,(%eax)
 8048b1c:	62 61 73             	bound  %esp,0x73(%ecx)
 8048b1f:	65 5f                	gs pop %edi
 8048b21:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048b25:	73 20                	jae    8048b47 <_IO_stdin_used+0xbb>
 8048b27:	e7 9a                	out    %eax,$0x9a
 8048b29:	84 20                	test   %ah,(%eax)
 8048b2b:	e7 ac                	out    %eax,$0xac
 8048b2d:	ac                   	lods   %ds:(%esi),%al
 8048b2e:	e4 b8                	in     $0xb8,%al
 8048b30:	80 e4 b8             	and    $0xb8,%ah
 8048b33:	aa                   	stos   %al,%es:(%edi)
 8048b34:	e5 87                	in     $0x87,%eax
 8048b36:	bd e6 95 b0 e9       	mov    $0xe9b095e6,%ebp
 8048b3b:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 8048b3c:	96                   	xchg   %eax,%esi
 8048b3d:	e5 9c                	in     $0x9c,%eax
 8048b3f:	b0 e5                	mov    $0xe5,%al
 8048b41:	9d                   	popf   
 8048b42:	80 ef bc             	sub    $0xbc,%bh
 8048b45:	9a 00 00 62 61 73 65 	lcall  $0x6573,$0x61620000
 8048b4c:	5f                   	pop    %edi
 8048b4d:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048b51:	73 20                	jae    8048b73 <_IO_stdin_used+0xe7>
 8048b53:	e7 9a                	out    %eax,$0x9a
 8048b55:	84 20                	test   %ah,(%eax)
 8048b57:	e7 ac                	out    %eax,$0xac
 8048b59:	ac                   	lods   %ds:(%esi),%al
 8048b5a:	e4 ba                	in     $0xba,%al
 8048b5c:	8c e4                	mov    %fs,%esp
 8048b5e:	b8 aa e5 87 bd       	mov    $0xbd87e5aa,%eax
 8048b63:	e6 95                	out    %al,$0x95
 8048b65:	b0 e9                	mov    $0xe9,%al
 8048b67:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 8048b68:	96                   	xchg   %eax,%esi
 8048b69:	e5 9c                	in     $0x9c,%eax
 8048b6b:	b0 e5                	mov    $0xe5,%al
 8048b6d:	9d                   	popf   
 8048b6e:	80 ef bc             	sub    $0xbc,%bh
 8048b71:	9a 00 00 62 61 73 65 	lcall  $0x6573,$0x61620000
 8048b78:	5f                   	pop    %edi
 8048b79:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048b7d:	73 20                	jae    8048b9f <_IO_stdin_used+0x113>
 8048b7f:	e7 9a                	out    %eax,$0x9a
 8048b81:	84 20                	test   %ah,(%eax)
 8048b83:	e7 ac                	out    %eax,$0xac
 8048b85:	ac                   	lods   %ds:(%esi),%al
 8048b86:	e4 b8                	in     $0xb8,%al
 8048b88:	89 e4                	mov    %esp,%esp
 8048b8a:	b8 aa e5 87 bd       	mov    $0xbd87e5aa,%eax
 8048b8f:	e6 95                	out    %al,$0x95
 8048b91:	b0 e9                	mov    $0xe9,%al
 8048b93:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 8048b94:	96                   	xchg   %eax,%esi
 8048b95:	e5 9c                	in     $0x9c,%eax
 8048b97:	b0 e5                	mov    $0xe5,%al
 8048b99:	9d                   	popf   
 8048b9a:	80 ef bc             	sub    $0xbc,%bh
 8048b9d:	9a 00 62 61 73 65 5f 	lcall  $0x5f65,$0x73616200
 8048ba4:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048ba8:	73 20                	jae    8048bca <_ZTV10base_class+0xa>
 8048baa:	e7 9a                	out    %eax,$0x9a
 8048bac:	84 20                	test   %ah,(%eax)
 8048bae:	e7 bb                	out    %eax,$0xbb
 8048bb0:	93                   	xchg   %eax,%ebx
 8048bb1:	e6 9d                	out    %al,$0x9d
 8048bb3:	9f                   	lahf   
 8048bb4:	e6 a0                	out    %al,$0xa0
 8048bb6:	87 e5                	xchg   %esp,%ebp
 8048bb8:	bf 97 3a 20 00       	mov    $0x203a97,%edi
 8048bbd:	00 00                	add    %al,(%eax)
	...

08048bc0 <_ZTV10base_class>:
 8048bc0:	00 00                	add    %al,(%eax)
 8048bc2:	00 00                	add    %al,(%eax)
 8048bc4:	e4 8b                	in     $0x8b,%al
 8048bc6:	04 08                	add    $0x8,%al
 8048bc8:	5a                   	pop    %edx
 8048bc9:	89 04 08             	mov    %eax,(%eax,%ecx,1)
 8048bcc:	88 89 04 08 b6 89    	mov    %cl,-0x7649f7fc(%ecx)
 8048bd2:	04 08                	add    $0x8,%al

08048bd4 <_ZTS10base_class>:
 8048bd4:	31 30                	xor    %esi,(%eax)
 8048bd6:	62 61 73             	bound  %esp,0x73(%ecx)
 8048bd9:	65 5f                	gs pop %edi
 8048bdb:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 8048bdf:	73 00                	jae    8048be1 <_ZTS10base_class+0xd>
 8048be1:	00 00                	add    %al,(%eax)
	...

08048be4 <_ZTI10base_class>:
 8048be4:	88 91 04 08 d4 8b    	mov    %dl,-0x742bf7fc(%ecx)
 8048bea:	04 08                	add    $0x8,%al

Disassembly of section .eh_frame_hdr:

08048bec <.eh_frame_hdr>:
 8048bec:	01 1b                	add    %ebx,(%ebx)
 8048bee:	03 3b                	add    (%ebx),%edi
 8048bf0:	58                   	pop    %eax
 8048bf1:	00 00                	add    %al,(%eax)
 8048bf3:	00 0a                	add    %cl,(%edx)
 8048bf5:	00 00                	add    %al,(%eax)
 8048bf7:	00 d4                	add    %dl,%ah
 8048bf9:	f9                   	stc    
 8048bfa:	ff                   	(bad)  
 8048bfb:	ff 74 00 00          	pushl  0x0(%eax,%eax,1)
 8048bff:	00 7f fb             	add    %bh,-0x5(%edi)
 8048c02:	ff                   	(bad)  
 8048c03:	ff 18                	lcall  *(%eax)
 8048c05:	01 00                	add    %eax,(%eax)
 8048c07:	00 12                	add    %dl,(%edx)
 8048c09:	fd                   	std    
 8048c0a:	ff                   	(bad)  
 8048c0b:	ff 50 01             	call   *0x1(%eax)
 8048c0e:	00 00                	add    %al,(%eax)
 8048c10:	53                   	push   %ebx
 8048c11:	fd                   	std    
 8048c12:	ff                   	(bad)  
 8048c13:	ff 70 01             	pushl  0x1(%eax)
 8048c16:	00 00                	add    %al,(%eax)
 8048c18:	6e                   	outsb  %ds:(%esi),(%dx)
 8048c19:	fd                   	std    
 8048c1a:	ff                   	(bad)  
 8048c1b:	ff 98 00 00 00 9c    	lcall  *-0x64000000(%eax)
 8048c21:	fd                   	std    
 8048c22:	ff                   	(bad)  
 8048c23:	ff                   	(bad)  
 8048c24:	b8 00 00 00 ca       	mov    $0xca000000,%eax
 8048c29:	fd                   	std    
 8048c2a:	ff                   	(bad)  
 8048c2b:	ff                   	(bad)  
 8048c2c:	d8 00                	fadds  (%eax)
 8048c2e:	00 00                	add    %al,(%eax)
 8048c30:	f8                   	clc    
 8048c31:	fd                   	std    
 8048c32:	ff                   	(bad)  
 8048c33:	ff                   	(bad)  
 8048c34:	f8                   	clc    
 8048c35:	00 00                	add    %al,(%eax)
 8048c37:	00 14 fe             	add    %dl,(%esi,%edi,8)
 8048c3a:	ff                   	(bad)  
 8048c3b:	ff 90 01 00 00 84    	call   *-0x7bffffff(%eax)
 8048c41:	fe                   	(bad)  
 8048c42:	ff                   	(bad)  
 8048c43:	ff cc                	dec    %esp
 8048c45:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .eh_frame:

08048c48 <__FRAME_END__-0x184>:
 8048c48:	14 00                	adc    $0x0,%al
 8048c4a:	00 00                	add    %al,(%eax)
 8048c4c:	00 00                	add    %al,(%eax)
 8048c4e:	00 00                	add    %al,(%eax)
 8048c50:	01 7a 52             	add    %edi,0x52(%edx)
 8048c53:	00 01                	add    %al,(%ecx)
 8048c55:	7c 08                	jl     8048c5f <_ZTI10base_class+0x7b>
 8048c57:	01 1b                	add    %ebx,(%ebx)
 8048c59:	0c 04                	or     $0x4,%al
 8048c5b:	04 88                	add    $0x88,%al
 8048c5d:	01 00                	add    %eax,(%eax)
 8048c5f:	00 20                	add    %ah,(%eax)
 8048c61:	00 00                	add    %al,(%eax)
 8048c63:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048c66:	00 00                	add    %al,(%eax)
 8048c68:	58                   	pop    %eax
 8048c69:	f9                   	stc    
 8048c6a:	ff                   	(bad)  
 8048c6b:	ff b0 00 00 00 00    	pushl  0x0(%eax)
 8048c71:	0e                   	push   %cs
 8048c72:	08 46 0e             	or     %al,0xe(%esi)
 8048c75:	0c 4a                	or     $0x4a,%al
 8048c77:	0f 0b                	ud2    
 8048c79:	74 04                	je     8048c7f <_ZTI10base_class+0x9b>
 8048c7b:	78 00                	js     8048c7d <_ZTI10base_class+0x99>
 8048c7d:	3f                   	aas    
 8048c7e:	1a 3b                	sbb    (%ebx),%bh
 8048c80:	2a 32                	sub    (%edx),%dh
 8048c82:	24 22                	and    $0x22,%al
 8048c84:	1c 00                	sbb    $0x0,%al
 8048c86:	00 00                	add    %al,(%eax)
 8048c88:	40                   	inc    %eax
 8048c89:	00 00                	add    %al,(%eax)
 8048c8b:	00 ce                	add    %cl,%dh
 8048c8d:	fc                   	cld    
 8048c8e:	ff                   	(bad)  
 8048c8f:	ff 2e                	ljmp   *(%esi)
 8048c91:	00 00                	add    %al,(%eax)
 8048c93:	00 00                	add    %al,(%eax)
 8048c95:	41                   	inc    %ecx
 8048c96:	0e                   	push   %cs
 8048c97:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048c9d:	6a c5                	push   $0xffffffc5
 8048c9f:	0c 04                	or     $0x4,%al
 8048ca1:	04 00                	add    $0x0,%al
 8048ca3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048ca6:	00 00                	add    %al,(%eax)
 8048ca8:	60                   	pusha  
 8048ca9:	00 00                	add    %al,(%eax)
 8048cab:	00 dc                	add    %bl,%ah
 8048cad:	fc                   	cld    
 8048cae:	ff                   	(bad)  
 8048caf:	ff 2e                	ljmp   *(%esi)
 8048cb1:	00 00                	add    %al,(%eax)
 8048cb3:	00 00                	add    %al,(%eax)
 8048cb5:	41                   	inc    %ecx
 8048cb6:	0e                   	push   %cs
 8048cb7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048cbd:	6a c5                	push   $0xffffffc5
 8048cbf:	0c 04                	or     $0x4,%al
 8048cc1:	04 00                	add    $0x0,%al
 8048cc3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048cc6:	00 00                	add    %al,(%eax)
 8048cc8:	80 00 00             	addb   $0x0,(%eax)
 8048ccb:	00 ea                	add    %ch,%dl
 8048ccd:	fc                   	cld    
 8048cce:	ff                   	(bad)  
 8048ccf:	ff 2e                	ljmp   *(%esi)
 8048cd1:	00 00                	add    %al,(%eax)
 8048cd3:	00 00                	add    %al,(%eax)
 8048cd5:	41                   	inc    %ecx
 8048cd6:	0e                   	push   %cs
 8048cd7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048cdd:	6a c5                	push   $0xffffffc5
 8048cdf:	0c 04                	or     $0x4,%al
 8048ce1:	04 00                	add    $0x0,%al
 8048ce3:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048ce6:	00 00                	add    %al,(%eax)
 8048ce8:	a0 00 00 00 f8       	mov    0xf8000000,%al
 8048ced:	fc                   	cld    
 8048cee:	ff                   	(bad)  
 8048cef:	ff 0e                	decl   (%esi)
 8048cf1:	00 00                	add    %al,(%eax)
 8048cf3:	00 00                	add    %al,(%eax)
 8048cf5:	41                   	inc    %ecx
 8048cf6:	0e                   	push   %cs
 8048cf7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048cfd:	4a                   	dec    %edx
 8048cfe:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8048d01:	04 00                	add    $0x0,%al
 8048d03:	00 34 00             	add    %dh,(%eax,%eax,1)
 8048d06:	00 00                	add    %al,(%eax)
 8048d08:	c0 00 00             	rolb   $0x0,(%eax)
 8048d0b:	00 5f fa             	add    %bl,-0x6(%edi)
 8048d0e:	ff                   	(bad)  
 8048d0f:	ff 93 01 00 00 00    	call   *0x1(%ebx)
 8048d15:	44                   	inc    %esp
 8048d16:	0c 01                	or     $0x1,%al
 8048d18:	00 47 10             	add    %al,0x10(%edi)
 8048d1b:	05 02 75 00 44       	add    $0x44007502,%eax
 8048d20:	0f 03 75 78          	lsl    0x78(%ebp),%esi
 8048d24:	06                   	push   %es
 8048d25:	10 03                	adc    %al,(%ebx)
 8048d27:	02 75 7c             	add    0x7c(%ebp),%dh
 8048d2a:	03 7e 01             	add    0x1(%esi),%edi
 8048d2d:	c1 0c 01 00          	rorl   $0x0,(%ecx,%eax,1)
 8048d31:	41                   	inc    %ecx
 8048d32:	c3                   	ret    
 8048d33:	41                   	inc    %ecx
 8048d34:	c5 43 0c             	lds    0xc(%ebx),%eax
 8048d37:	04 04                	add    $0x4,%al
 8048d39:	00 00                	add    %al,(%eax)
 8048d3b:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048d3e:	00 00                	add    %al,(%eax)
 8048d40:	f8                   	clc    
 8048d41:	00 00                	add    %al,(%eax)
 8048d43:	00 ba fb ff ff 41    	add    %bh,0x41fffffb(%edx)
 8048d49:	00 00                	add    %al,(%eax)
 8048d4b:	00 00                	add    %al,(%eax)
 8048d4d:	41                   	inc    %ecx
 8048d4e:	0e                   	push   %cs
 8048d4f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048d55:	7d c5                	jge    8048d1c <_ZTI10base_class+0x138>
 8048d57:	0c 04                	or     $0x4,%al
 8048d59:	04 00                	add    $0x0,%al
 8048d5b:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048d5e:	00 00                	add    %al,(%eax)
 8048d60:	18 01                	sbb    %al,(%ecx)
 8048d62:	00 00                	add    %al,(%eax)
 8048d64:	db fb                	(bad)  
 8048d66:	ff                   	(bad)  
 8048d67:	ff 1a                	lcall  *(%edx)
 8048d69:	00 00                	add    %al,(%eax)
 8048d6b:	00 00                	add    %al,(%eax)
 8048d6d:	41                   	inc    %ecx
 8048d6e:	0e                   	push   %cs
 8048d6f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 8048d75:	56                   	push   %esi
 8048d76:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 8048d79:	04 00                	add    $0x0,%al
 8048d7b:	00 38                	add    %bh,(%eax)
 8048d7d:	00 00                	add    %al,(%eax)
 8048d7f:	00 38                	add    %bh,(%eax)
 8048d81:	01 00                	add    %eax,(%eax)
 8048d83:	00 7c fc ff          	add    %bh,-0x1(%esp,%edi,8)
 8048d87:	ff 61 00             	jmp    *0x0(%ecx)
 8048d8a:	00 00                	add    %al,(%eax)
 8048d8c:	00 41 0e             	add    %al,0xe(%ecx)
 8048d8f:	08 85 02 41 0e 0c    	or     %al,0xc0e4102(%ebp)
 8048d95:	87 03                	xchg   %eax,(%ebx)
 8048d97:	43                   	inc    %ebx
 8048d98:	0e                   	push   %cs
 8048d99:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
 8048d9f:	83 05 4e 0e 30 02 48 	addl   $0x48,0x2300e4e
 8048da6:	0e                   	push   %cs
 8048da7:	14 41                	adc    $0x41,%al
 8048da9:	c3                   	ret    
 8048daa:	0e                   	push   %cs
 8048dab:	10 41 c6             	adc    %al,-0x3a(%ecx)
 8048dae:	0e                   	push   %cs
 8048daf:	0c 41                	or     $0x41,%al
 8048db1:	c7                   	(bad)  
 8048db2:	0e                   	push   %cs
 8048db3:	08 41 c5             	or     %al,-0x3b(%ecx)
 8048db6:	0e                   	push   %cs
 8048db7:	04 10                	add    $0x10,%al
 8048db9:	00 00                	add    %al,(%eax)
 8048dbb:	00 74 01 00          	add    %dh,0x0(%ecx,%eax,1)
 8048dbf:	00 b0 fc ff ff 02    	add    %dh,0x2fffffc(%eax)
 8048dc5:	00 00                	add    %al,(%eax)
 8048dc7:	00 00                	add    %al,(%eax)
 8048dc9:	00 00                	add    %al,(%eax)
	...

08048dcc <__FRAME_END__>:
 8048dcc:	00 00                	add    %al,(%eax)
	...

Disassembly of section .init_array:

08049000 <__frame_dummy_init_array_entry>:
 8049000:	40                   	inc    %eax
 8049001:	87 04 08             	xchg   %eax,(%eax,%ecx,1)
 8049004:	3f                   	aas    
 8049005:	89 04 08             	mov    %eax,(%eax,%ecx,1)

Disassembly of section .fini_array:

08049008 <__do_global_dtors_aux_fini_array_entry>:
 8049008:	20                   	.byte 0x20
 8049009:	87 04 08             	xchg   %eax,(%eax,%ecx,1)

Disassembly of section .jcr:

0804900c <__JCR_END__>:
 804900c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

08049010 <_DYNAMIC>:
 8049010:	01 00                	add    %eax,(%eax)
 8049012:	00 00                	add    %al,(%eax)
 8049014:	01 00                	add    %eax,(%eax)
 8049016:	00 00                	add    %al,(%eax)
 8049018:	01 00                	add    %eax,(%eax)
 804901a:	00 00                	add    %al,(%eax)
 804901c:	63 01                	arpl   %ax,(%ecx)
 804901e:	00 00                	add    %al,(%eax)
 8049020:	01 00                	add    %eax,(%eax)
 8049022:	00 00                	add    %al,(%eax)
 8049024:	6d                   	insl   (%dx),%es:(%edi)
 8049025:	01 00                	add    %eax,(%eax)
 8049027:	00 01                	add    %al,(%ecx)
 8049029:	00 00                	add    %al,(%eax)
 804902b:	00 7b 01             	add    %bh,0x1(%ebx)
 804902e:	00 00                	add    %al,(%eax)
 8049030:	0c 00                	or     $0x0,%al
 8049032:	00 00                	add    %al,(%eax)
 8049034:	9c                   	pushf  
 8049035:	85 04 08             	test   %eax,(%eax,%ecx,1)
 8049038:	0d 00 00 00 74       	or     $0x74000000,%eax
 804903d:	8a 04 08             	mov    (%eax,%ecx,1),%al
 8049040:	19 00                	sbb    %eax,(%eax)
 8049042:	00 00                	add    %al,(%eax)
 8049044:	00 90 04 08 1b 00    	add    %dl,0x1b0804(%eax)
 804904a:	00 00                	add    %al,(%eax)
 804904c:	08 00                	or     %al,(%eax)
 804904e:	00 00                	add    %al,(%eax)
 8049050:	1a 00                	sbb    (%eax),%al
 8049052:	00 00                	add    %al,(%eax)
 8049054:	08 90 04 08 1c 00    	or     %dl,0x1c0804(%eax)
 804905a:	00 00                	add    %al,(%eax)
 804905c:	04 00                	add    $0x0,%al
 804905e:	00 00                	add    %al,(%eax)
 8049060:	f5                   	cmc    
 8049061:	fe                   	(bad)  
 8049062:	ff 6f 8c             	ljmp   *-0x74(%edi)
 8049065:	81 04 08 05 00 00 00 	addl   $0x5,(%eax,%ecx,1)
 804906c:	d0 82 04 08 06 00    	rolb   0x60804(%edx)
 8049072:	00 00                	add    %al,(%eax)
 8049074:	c0 81 04 08 0a 00 00 	rolb   $0x0,0xa0804(%ecx)
 804907b:	00 e0                	add    %ah,%al
 804907d:	01 00                	add    %eax,(%eax)
 804907f:	00 0b                	add    %cl,(%ebx)
 8049081:	00 00                	add    %al,(%eax)
 8049083:	00 10                	add    %dl,(%eax)
 8049085:	00 00                	add    %al,(%eax)
 8049087:	00 15 00 00 00 00    	add    %dl,0x0
 804908d:	00 00                	add    %al,(%eax)
 804908f:	00 03                	add    %al,(%ebx)
 8049091:	00 00                	add    %al,(%eax)
 8049093:	00 14 91             	add    %dl,(%ecx,%edx,4)
 8049096:	04 08                	add    $0x8,%al
 8049098:	02 00                	add    (%eax),%al
 804909a:	00 00                	add    %al,(%eax)
 804909c:	50                   	push   %eax
 804909d:	00 00                	add    %al,(%eax)
 804909f:	00 14 00             	add    %dl,(%eax,%eax,1)
 80490a2:	00 00                	add    %al,(%eax)
 80490a4:	11 00                	adc    %eax,(%eax)
 80490a6:	00 00                	add    %al,(%eax)
 80490a8:	17                   	pop    %ss
 80490a9:	00 00                	add    %al,(%eax)
 80490ab:	00 4c 85 04          	add    %cl,0x4(%ebp,%eax,4)
 80490af:	08 11                	or     %dl,(%ecx)
 80490b1:	00 00                	add    %al,(%eax)
 80490b3:	00 34 85 04 08 12 00 	add    %dh,0x120804(,%eax,4)
 80490ba:	00 00                	add    %al,(%eax)
 80490bc:	18 00                	sbb    %al,(%eax)
 80490be:	00 00                	add    %al,(%eax)
 80490c0:	13 00                	adc    (%eax),%eax
 80490c2:	00 00                	add    %al,(%eax)
 80490c4:	08 00                	or     %al,(%eax)
 80490c6:	00 00                	add    %al,(%eax)
 80490c8:	fe                   	(bad)  
 80490c9:	ff                   	(bad)  
 80490ca:	ff 6f d4             	ljmp   *-0x2c(%edi)
 80490cd:	84 04 08             	test   %al,(%eax,%ecx,1)
 80490d0:	ff                   	(bad)  
 80490d1:	ff                   	(bad)  
 80490d2:	ff 6f 02             	ljmp   *0x2(%edi)
 80490d5:	00 00                	add    %al,(%eax)
 80490d7:	00 f0                	add    %dh,%al
 80490d9:	ff                   	(bad)  
 80490da:	ff 6f b0             	ljmp   *-0x50(%edi)
 80490dd:	84 04 08             	test   %al,(%eax,%ecx,1)
	...

Disassembly of section .got:

08049110 <.got>:
 8049110:	00 00                	add    %al,(%eax)
	...

Disassembly of section .got.plt:

08049114 <_GLOBAL_OFFSET_TABLE_>:
 8049114:	10 90 04 08 00 00    	adc    %dl,0x804(%eax)
 804911a:	00 00                	add    %al,(%eax)
 804911c:	00 00                	add    %al,(%eax)
 804911e:	00 00                	add    %al,(%eax)
 8049120:	d6                   	(bad)  
 8049121:	85 04 08             	test   %eax,(%eax,%ecx,1)
 8049124:	e6 85                	out    %al,$0x85
 8049126:	04 08                	add    $0x8,%al
 8049128:	f6 85 04 08 06 86 04 	testb  $0x4,-0x79f9f7fc(%ebp)
 804912f:	08 16                	or     %dl,(%esi)
 8049131:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 8049134:	26 86 04 08          	xchg   %al,%es:(%eax,%ecx,1)
 8049138:	36 86 04 08          	xchg   %al,%ss:(%eax,%ecx,1)
 804913c:	46                   	inc    %esi
 804913d:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 8049140:	56                   	push   %esi
 8049141:	86 04 08             	xchg   %al,(%eax,%ecx,1)
 8049144:	66 86 04 08          	data16 xchg %al,(%eax,%ecx,1)

Disassembly of section .data:

08049148 <__data_start>:
 8049148:	00 00                	add    %al,(%eax)
	...

0804914c <__dso_handle>:
 804914c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .bss:

08049180 <_ZTVN10__cxxabiv117__class_type_infoE@@CXXABI_1.3>:
	...

080491c0 <_ZSt4cout@@GLIBCXX_3.4>:
	...

0804924c <completed.6279>:
	...

0804924d <_ZStL8__ioinit>:
 804924d:	00 00                	add    %al,(%eax)
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
   0:	3c 00                	cmp    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	6b 87 04 08 ee 01 00 	imul   $0x0,0x1ee0804(%edi),%eax
  17:	00 5a 89             	add    %bl,-0x77(%edx)
  1a:	04 08                	add    $0x8,%al
  1c:	2e 00 00             	add    %al,%cs:(%eax)
  1f:	00 88 89 04 08 2e    	add    %cl,0x2e080489(%eax)
  25:	00 00                	add    %al,(%eax)
  27:	00 b6 89 04 08 2e    	add    %dh,0x2e080489(%esi)
  2d:	00 00                	add    %al,(%eax)
  2f:	00 e4                	add    %ah,%ah
  31:	89 04 08             	mov    %eax,(%eax,%ecx,1)
  34:	0e                   	push   %cs
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	5a                   	pop    %edx
       1:	16                   	push   %ss
       2:	00 00                	add    %al,(%eax)
       4:	04 00                	add    $0x0,%al
       6:	00 00                	add    %al,(%eax)
       8:	00 00                	add    %al,(%eax)
       a:	04 01                	add    $0x1,%al
       c:	24 01                	and    $0x1,%al
       e:	00 00                	add    %al,(%eax)
      10:	04 b3                	add    $0xb3,%al
      12:	09 00                	or     %eax,(%eax)
      14:	00 25 04 00 00 00    	add    %ah,0x4
	...
      22:	00 00                	add    %al,(%eax)
      24:	00 02                	add    %al,(%edx)
      26:	17                   	pop    %ss
      27:	02 00                	add    (%eax),%al
      29:	00 03                	add    %al,(%ebx)
      2b:	22 09                	and    (%ecx),%cl
      2d:	00 00                	add    %al,(%eax)
      2f:	03 40 25             	add    0x25(%eax),%eax
      32:	00 00                	add    %al,(%eax)
      34:	00 03                	add    %al,(%ebx)
      36:	f1                   	icebp  
      37:	02 00                	add    (%eax),%al
      39:	00 04 28             	add    %al,(%eax,%ebp,1)
      3c:	40                   	inc    %eax
      3d:	00 00                	add    %al,(%eax)
      3f:	00 04 04             	add    %al,(%esp,%eax,1)
      42:	d7                   	xlat   %ds:(%ebx)
      43:	02 00                	add    (%eax),%al
      45:	00 4a 00             	add    %cl,0x0(%edx)
      48:	00 00                	add    %al,(%eax)
      4a:	05 01 06 7f 02       	add    $0x27f0601,%eax
      4f:	00 00                	add    %al,(%eax)
      51:	03 1b                	add    (%ebx),%ebx
      53:	00 00                	add    %al,(%eax)
      55:	00 05 d4 5c 00 00    	add    %al,0x5cd4
      5b:	00 05 04 07 21 08    	add    %al,0x8210704
      61:	00 00                	add    %al,(%eax)
      63:	06                   	push   %es
      64:	4f                   	dec    %edi
      65:	09 00                	or     %eax,(%eax)
      67:	00 05 61 01 5c 00    	add    %al,0x5c0161
      6d:	00 00                	add    %al,(%eax)
      6f:	07                   	pop    %es
      70:	08 06                	or     %al,(%esi)
      72:	53                   	push   %ebx
      73:	83 0a 00             	orl    $0x0,(%edx)
      76:	00 b3 00 00 00 08    	add    %dh,0x8000000(%ebx)
      7c:	04 06                	add    $0x6,%al
      7e:	56                   	push   %esi
      7f:	9a 00 00 00 09 11 01 	lcall  $0x111,$0x9000000
      86:	00 00                	add    %al,(%eax)
      88:	06                   	push   %es
      89:	58                   	pop    %eax
      8a:	5c                   	pop    %esp
      8b:	00 00                	add    %al,(%eax)
      8d:	00 09                	add    %cl,(%ecx)
      8f:	b9 07 00 00 06       	mov    $0x6000007,%ecx
      94:	5c                   	pop    %esp
      95:	b3 00                	mov    $0x0,%bl
      97:	00 00                	add    %al,(%eax)
      99:	00 0a                	add    %cl,(%edx)
      9b:	73 07                	jae    a4 <_init-0x80484f8>
      9d:	00 00                	add    %al,(%eax)
      9f:	06                   	push   %es
      a0:	54                   	push   %esp
      a1:	ca 00 00             	lret   $0x0
      a4:	00 00                	add    %al,(%eax)
      a6:	0a 33                	or     (%ebx),%dh
      a8:	00 00                	add    %al,(%eax)
      aa:	00 06                	add    %al,(%esi)
      ac:	5d                   	pop    %ebp
      ad:	7b 00                	jnp    af <_init-0x80484ed>
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
      cf:	74 00                	je     d1 <_init-0x80484cb>
      d1:	03 85 0a 00 00 06    	add    0x600000a(%ebp),%eax
      d7:	5e                   	pop    %esi
      d8:	6f                   	outsl  %ds:(%esi),(%dx)
      d9:	00 00                	add    %al,(%eax)
      db:	00 03                	add    %al,(%ebx)
      dd:	87 0a                	xchg   %ecx,(%edx)
      df:	00 00                	add    %al,(%eax)
      e1:	06                   	push   %es
      e2:	6a d1                	push   $0xffffffd1
      e4:	00 00                	add    %al,(%eax)
      e6:	00 05 02 07 92 0b    	add    %al,0xb920702
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
      ff:	73 74                	jae    175 <_init-0x8048427>
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
     14b:	77 09                	ja     156 <_init-0x8048446>
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
     18a:	7d 0a                	jge    196 <_init-0x8048406>
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
     1c2:	75 0b                	jne    1cf <_init-0x80483cd>
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
     2b8:	a1 09 00 00 0f       	mov    0xf000009,%eax
     2bd:	30 14 be             	xor    %dl,(%esi,%edi,4)
     2c0:	06                   	push   %es
     2c1:	00 00                	add    %al,(%eax)
     2c3:	01 08                	add    %ecx,(%eax)
     2c5:	e9 86 04 00 00       	jmp    750 <_init-0x8047e4c>
     2ca:	03 97 09 00 00 08    	add    0x8000009(%edi),%edx
     2d0:	eb 4a                	jmp    31c <_init-0x8048280>
     2d2:	00 00                	add    %al,(%eax)
     2d4:	00 03                	add    %al,(%ebx)
     2d6:	8b 09                	mov    (%ecx),%ecx
     2d8:	00 00                	add    %al,(%eax)
     2da:	08 ec                	or     %ch,%ah
     2dc:	ca 00 00             	lret   $0x0
     2df:	00 15 ed 0b 00 00    	add    %dl,0xbed
     2e5:	08 f2                	or     %dh,%dl
     2e7:	41                   	inc    %ecx
     2e8:	0a 00                	or     (%eax),%al
     2ea:	00 fa                	add    %bh,%dl
     2ec:	02 00                	add    (%eax),%al
     2ee:	00 16                	add    %dl,(%esi)
     2f0:	be 11 00 00 16       	mov    $0x16000011,%esi
     2f5:	c4 11                	les    (%ecx),%edx
     2f7:	00 00                	add    %al,(%eax)
     2f9:	00 0e                	add    %cl,(%esi)
     2fb:	ca 02 00             	lret   $0x2
     2fe:	00 17                	add    %dl,(%edi)
     300:	65 71 00             	gs jno 303 <_init-0x8048299>
     303:	08 f6                	or     %dh,%dh
     305:	d6                   	(bad)  
     306:	08 00                	or     %al,(%eax)
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
     31e:	74 00                	je     320 <_init-0x804827c>
     320:	08 fa                	or     %bh,%dl
     322:	e6 04                	out    %al,$0x4
     324:	00 00                	add    %al,(%eax)
     326:	ca 11 00             	lret   $0x11
     329:	00 39                	add    %bh,(%ecx)
     32b:	03 00                	add    (%eax),%eax
     32d:	00 16                	add    %dl,(%esi)
     32f:	c4 11                	les    (%ecx),%edx
     331:	00 00                	add    %al,(%eax)
     333:	16                   	push   %ss
     334:	c4 11                	les    (%ecx),%edx
     336:	00 00                	add    %al,(%eax)
     338:	00 18                	add    %bl,(%eax)
     33a:	15 04 00 00 08       	adc    $0x8000004,%eax
     33f:	02 01                	add    (%ecx),%al
     341:	f1                   	icebp  
     342:	07                   	pop    %es
     343:	00 00                	add    %al,(%eax)
     345:	ca 00 00             	lret   $0x0
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
     35d:	18 64 08 00          	sbb    %ah,0x0(%eax,%ecx,1)
     361:	00 08                	add    %cl,(%eax)
     363:	06                   	push   %es
     364:	01 f2                	add    %esi,%edx
     366:	09 00                	or     %eax,(%eax)
     368:	00 86 04 00 00 77    	add    %al,0x77000004(%esi)
     36e:	03 00                	add    (%eax),%eax
     370:	00 16                	add    %dl,(%esi)
     372:	d1 11                	rcll   (%ecx)
     374:	00 00                	add    %al,(%eax)
     376:	00 18                	add    %bl,(%eax)
     378:	4e                   	dec    %esi
     379:	04 00                	add    $0x0,%al
     37b:	00 08                	add    %cl,(%eax)
     37d:	0a 01                	or     (%ecx),%al
     37f:	16                   	push   %ss
     380:	0c 00                	or     $0x0,%al
     382:	00 d1                	add    %dl,%cl
     384:	11 00                	adc    %eax,(%eax)
     386:	00 9b 03 00 00 16    	add    %bl,0x16000003(%ebx)
     38c:	d1 11                	rcll   (%ecx)
     38e:	00 00                	add    %al,(%eax)
     390:	16                   	push   %ss
     391:	86 04 00             	xchg   %al,(%eax,%eax,1)
     394:	00 16                	add    %dl,(%esi)
     396:	c4 11                	les    (%ecx),%edx
     398:	00 00                	add    %al,(%eax)
     39a:	00 18                	add    %bl,(%eax)
     39c:	61                   	popa   
     39d:	03 00                	add    (%eax),%eax
     39f:	00 08                	add    %cl,(%eax)
     3a1:	0e                   	push   %cs
     3a2:	01 1a                	add    %ebx,(%edx)
     3a4:	03 00                	add    (%eax),%eax
     3a6:	00 d7                	add    %dl,%bh
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
     3bf:	18 db                	sbb    %bl,%bl
     3c1:	01 00                	add    %eax,(%eax)
     3c3:	00 08                	add    %cl,(%eax)
     3c5:	12 01                	adc    (%ecx),%al
     3c7:	c4 04 00             	les    (%eax,%eax,1),%eax
     3ca:	00 d7                	add    %dl,%bh
     3cc:	11 00                	adc    %eax,(%eax)
     3ce:	00 e3                	add    %ah,%bl
     3d0:	03 00                	add    (%eax),%eax
     3d2:	00 16                	add    %dl,(%esi)
     3d4:	d7                   	xlat   %ds:(%ebx)
     3d5:	11 00                	adc    %eax,(%eax)
     3d7:	00 16                	add    %dl,(%esi)
     3d9:	d1 11                	rcll   (%ecx)
     3db:	00 00                	add    %al,(%eax)
     3dd:	16                   	push   %ss
     3de:	86 04 00             	xchg   %al,(%eax,%eax,1)
     3e1:	00 00                	add    %al,(%eax)
     3e3:	18 ed                	sbb    %ch,%ch
     3e5:	0b 00                	or     (%eax),%eax
     3e7:	00 08                	add    %cl,(%eax)
     3e9:	16                   	push   %ss
     3ea:	01 48 06             	add    %ecx,0x6(%eax)
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
     407:	18 94 09 00 00 08 1a 	sbb    %dl,0x1a080000(%ecx,%ecx,1)
     40e:	01 7b 05             	add    %edi,0x5(%ebx)
     411:	00 00                	add    %al,(%eax)
     413:	ca 02 00             	lret   $0x2
     416:	00 21                	add    %ah,(%ecx)
     418:	04 00                	add    $0x0,%al
     41a:	00 16                	add    %dl,(%esi)
     41c:	dd 11                	fstl   (%ecx)
     41e:	00 00                	add    %al,(%eax)
     420:	00 0e                	add    %cl,(%esi)
     422:	d5 02                	aad    $0x2
     424:	00 00                	add    %al,(%eax)
     426:	18 88 09 00 00 08    	sbb    %cl,0x8000009(%eax)
     42c:	20 01                	and    %al,(%ecx)
     42e:	50                   	push   %eax
     42f:	01 00                	add    %eax,(%eax)
     431:	00 d5                	add    %dl,%ch
     433:	02 00                	add    (%eax),%al
     435:	00 40 04             	add    %al,0x4(%eax)
     438:	00 00                	add    %al,(%eax)
     43a:	16                   	push   %ss
     43b:	c4 11                	les    (%ecx),%edx
     43d:	00 00                	add    %al,(%eax)
     43f:	00 18                	add    %bl,(%eax)
     441:	63 05 00 00 08 24    	arpl   %ax,0x24080000
     447:	01 f9                	add    %edi,%ecx
     449:	06                   	push   %es
     44a:	00 00                	add    %al,(%eax)
     44c:	ca 11 00             	lret   $0x11
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
     467:	d2 0a                	rorb   %cl,(%edx)
     469:	00 00                	add    %al,(%eax)
     46b:	d5 02                	aad    $0x2
     46d:	00 00                	add    %al,(%eax)
     46f:	1a e9                	sbb    %cl,%ch
     471:	02 00                	add    (%eax),%al
     473:	00 08                	add    %cl,(%eax)
     475:	2c 01                	sub    $0x1,%al
     477:	f4                   	hlt    
     478:	0b 00                	or     (%eax),%eax
     47a:	00 d5                	add    %dl,%ch
     47c:	02 00                	add    (%eax),%al
     47e:	00 16                	add    %dl,(%esi)
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
     4a6:	03 8c 03 00 00 09 bd 	add    -0x42f70000(%ebx,%eax,1),%ecx
     4ad:	ca 00 00             	lret   $0x0
     4b0:	00 1b                	add    %bl,(%ebx)
     4b2:	dc 05 00 00 04 0b    	faddl  0xb040000
     4b8:	33 40 05             	xor    0x5(%eax),%eax
     4bb:	00 00                	add    %al,(%eax)
     4bd:	1c cb                	sbb    $0xcb,%al
     4bf:	00 00                	add    %al,(%eax)
     4c1:	00 01                	add    %al,(%ecx)
     4c3:	1c d5                	sbb    $0xd5,%al
     4c5:	05 00 00 02 1c       	add    $0x1c020000,%eax
     4ca:	06                   	push   %es
     4cb:	05 00 00 04 1c       	add    $0x1c040000,%eax
     4d0:	e7 03                	out    %eax,$0x3
     4d2:	00 00                	add    %al,(%eax)
     4d4:	08 1c 09             	or     %bl,(%ecx,%ecx,1)
     4d7:	04 00                	add    $0x0,%al
     4d9:	00 10                	add    %dl,(%eax)
     4db:	1c b6                	sbb    $0xb6,%al
     4dd:	06                   	push   %es
     4de:	00 00                	add    %al,(%eax)
     4e0:	20 1c b2             	and    %bl,(%edx,%esi,4)
     4e3:	07                   	pop    %es
     4e4:	00 00                	add    %al,(%eax)
     4e6:	c0 00 1c             	rolb   $0x1c,(%eax)
     4e9:	6d                   	insl   (%dx),%es:(%edi)
     4ea:	02 00                	add    (%eax),%al
     4ec:	00 80 01 1c 96 07    	add    %al,0x7961c01(%eax)
     4f2:	00 00                	add    %al,(%eax)
     4f4:	80 02 1c             	addb   $0x1c,(%edx)
     4f7:	2d 05 00 00 80       	sub    $0x80000005,%eax
     4fc:	04 1c                	add    $0x1c,%al
     4fe:	22 06                	and    (%esi),%al
     500:	00 00                	add    %al,(%eax)
     502:	80 08 1c             	orb    $0x1c,(%eax)
     505:	bb 05 00 00 80       	mov    $0x80000005,%ebx
     50a:	10 1c 2f             	adc    %bl,(%edi,%ebp,1)
     50d:	06                   	push   %es
     50e:	00 00                	add    %al,(%eax)
     510:	80 20 1c             	andb   $0x1c,(%eax)
     513:	cb                   	lret   
     514:	08 00                	or     %al,(%eax)
     516:	00 80 c0 00 1c 23    	add    %al,0x231c00c0(%eax)
     51c:	07                   	pop    %es
     51d:	00 00                	add    %al,(%eax)
     51f:	80 80 01 1c 39 06 00 	addb   $0x0,0x6391c01(%eax)
     526:	00 b0 01 1c 17 01    	add    %dh,0x1171c01(%eax)
     52c:	00 00                	add    %al,(%eax)
     52e:	ca 00 1c             	lret   $0x1c00
     531:	a4                   	movsb  %ds:(%esi),%es:(%edi)
     532:	07                   	pop    %es
     533:	00 00                	add    %al,(%eax)
     535:	84 02                	test   %al,(%edx)
     537:	1c 57                	sbb    $0x57,%al
     539:	07                   	pop    %es
     53a:	00 00                	add    %al,(%eax)
     53c:	80 80 04 00 1b b1 01 	addb   $0x1,-0x4ee4fffc(%eax)
     543:	00 00                	add    %al,(%eax)
     545:	04 0b                	add    $0xb,%al
     547:	67 79 05             	addr16 jns 54f <_init-0x804804d>
     54a:	00 00                	add    %al,(%eax)
     54c:	1c 13                	sbb    $0x13,%al
     54e:	03 00                	add    (%eax),%eax
     550:	00 01                	add    %al,(%ecx)
     552:	1c f6                	sbb    $0xf6,%al
     554:	08 00                	or     %al,(%eax)
     556:	00 02                	add    %al,(%edx)
     558:	1c c9                	sbb    $0xc9,%al
     55a:	02 00                	add    (%eax),%al
     55c:	00 04 1c             	add    %al,(%esp,%ebx,1)
     55f:	39 05 00 00 08 1c    	cmp    %eax,0x1c080000
     565:	0c 03                	or     $0x3,%al
     567:	00 00                	add    %al,(%eax)
     569:	10 1c a3             	adc    %bl,(%ebx,%eiz,4)
     56c:	05 00 00 20 1c       	add    $0x1c200000,%eax
     571:	de 06                	fiadd  (%esi)
     573:	00 00                	add    %al,(%eax)
     575:	80 80 04 00 1b 7a 08 	addb   $0x8,0x7a1b0004(%eax)
     57c:	00 00                	add    %al,(%eax)
     57e:	04 0b                	add    $0xb,%al
     580:	8f                   	(bad)  
     581:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     582:	05 00 00 1c 8c       	add    $0x8c1c0000,%eax
     587:	02 00                	add    (%eax),%al
     589:	00 00                	add    %al,(%eax)
     58b:	1c d8                	sbb    $0xd8,%al
     58d:	00 00                	add    %al,(%eax)
     58f:	00 01                	add    %al,(%ecx)
     591:	1c 05                	sbb    $0x5,%al
     593:	02 00                	add    (%eax),%al
     595:	00 02                	add    %al,(%edx)
     597:	1c 53                	sbb    $0x53,%al
     599:	0b 00                	or     (%eax),%eax
     59b:	00 04 1c             	add    %al,(%esp,%ebx,1)
     59e:	b1 0a                	mov    $0xa,%cl
     5a0:	00 00                	add    %al,(%eax)
     5a2:	80 80 04 00 1b bc 0b 	addb   $0xb,-0x43e4fffc(%eax)
     5a9:	00 00                	add    %al,(%eax)
     5ab:	04 0b                	add    $0xb,%al
     5ad:	b5 cd                	mov    $0xcd,%ch
     5af:	05 00 00 1c 02       	add    $0x21c0000,%eax
     5b4:	01 00                	add    %eax,(%eax)
     5b6:	00 00                	add    %al,(%eax)
     5b8:	1c 29                	sbb    $0x29,%al
     5ba:	0a 00                	or     (%eax),%al
     5bc:	00 01                	add    %al,(%ecx)
     5be:	1c 14                	sbb    $0x14,%al
     5c0:	00 00                	add    %al,(%eax)
     5c2:	00 02                	add    %al,(%edx)
     5c4:	1c 51                	sbb    $0x51,%al
     5c6:	08 00                	or     %al,(%eax)
     5c8:	00 80 80 04 00 1d    	add    %al,0x1d000480(%eax)
     5ce:	56                   	push   %esi
     5cf:	09 00                	or     %eax,(%eax)
     5d1:	00 2d 08 00 00 1e    	add    %ch,0x1e000008
     5d7:	44                   	inc    %esp
     5d8:	0b 00                	or     (%eax),%eax
     5da:	00 01                	add    %al,(%ecx)
     5dc:	0b 15 02 01 2c 06    	or     0x62c0102,%edx
     5e2:	00 00                	add    %al,(%eax)
     5e4:	1f                   	pop    %ds
     5e5:	6f                   	outsl  %ds:(%esi),(%dx)
     5e6:	05 00 00 0b 1d       	add    $0x1d0b0000,%eax
     5eb:	02 48 13             	add    0x13(%eax),%cl
     5ee:	00 00                	add    %al,(%eax)
     5f0:	1f                   	pop    %ds
     5f1:	e9 01 00 00 0b       	jmp    b0005f7 <_end+0x2fb73a7>
     5f6:	1e                   	push   %ds
     5f7:	02 ca                	add    %dl,%cl
     5f9:	11 00                	adc    %eax,(%eax)
     5fb:	00 20                	add    %ah,(%eax)
     5fd:	44                   	inc    %esp
     5fe:	0b 00                	or     (%eax),%eax
     600:	00 0b                	add    %cl,(%ebx)
     602:	19 02                	sbb    %eax,(%edx)
     604:	01 0d 06 00 00 13    	add    %ecx,0x13000006
     60a:	06                   	push   %es
     60b:	00 00                	add    %al,(%eax)
     60d:	21 5d 13             	and    %ebx,0x13(%ebp)
     610:	00 00                	add    %al,(%eax)
     612:	00 22                	add    %ah,(%edx)
     614:	43                   	inc    %ebx
     615:	0b 00                	or     (%eax),%eax
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
     62d:	c9                   	leave  
     62e:	0b 00                	or     (%eax),%eax
     630:	00 0b                	add    %cl,(%ebx)
     632:	ff b1 04 00 00 01    	pushl  0x1000004(%ecx)
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
     658:	02 24 09             	add    (%ecx,%ecx,1),%ah
     65b:	05 00 00 0b 08       	add    $0x80b0000,%eax
     660:	01 46 06             	add    %eax,0x6(%esi)
     663:	00 00                	add    %al,(%eax)
     665:	01 04 25 68 65 78 00 	add    %eax,0x786568(,%eiz,1)
     66c:	0b 0b                	or     (%ebx),%ecx
     66e:	01 46 06             	add    %eax,0x6(%esi)
     671:	00 00                	add    %al,(%eax)
     673:	01 08                	add    %ecx,(%eax)
     675:	24 0c                	and    $0xc,%al
     677:	04 00                	add    $0x0,%al
     679:	00 0b                	add    %cl,(%ebx)
     67b:	10 01                	adc    %al,(%ecx)
     67d:	46                   	inc    %esi
     67e:	06                   	push   %es
     67f:	00 00                	add    %al,(%eax)
     681:	01 10                	add    %edx,(%eax)
     683:	24 b9                	and    $0xb9,%al
     685:	06                   	push   %es
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
     6a0:	70 02                	jo     6a4 <_init-0x8047ef8>
     6a2:	00 00                	add    %al,(%eax)
     6a4:	0b 1b                	or     (%ebx),%ebx
     6a6:	01 46 06             	add    %eax,0x6(%esi)
     6a9:	00 00                	add    %al,(%eax)
     6ab:	01 80 26 99 07 00    	add    %eax,0x79926(%eax)
     6b1:	00 0b                	add    %cl,(%ebx)
     6b3:	1e                   	push   %ds
     6b4:	01 46 06             	add    %eax,0x6(%esi)
     6b7:	00 00                	add    %al,(%eax)
     6b9:	01 00                	add    %eax,(%eax)
     6bb:	01 26                	add    %esp,(%esi)
     6bd:	30 05 00 00 0b 22    	xor    %al,0x220b0000
     6c3:	01 46 06             	add    %eax,0x6(%esi)
     6c6:	00 00                	add    %al,(%eax)
     6c8:	01 00                	add    %eax,(%eax)
     6ca:	02 26                	add    (%esi),%ah
     6cc:	25 06 00 00 0b       	and    $0xb000006,%eax
     6d1:	26 01 46 06          	add    %eax,%es:0x6(%esi)
     6d5:	00 00                	add    %al,(%eax)
     6d7:	01 00                	add    %eax,(%eax)
     6d9:	04 26                	add    $0x26,%al
     6db:	be 05 00 00 0b       	mov    $0xb000005,%esi
     6e0:	29 01                	sub    %eax,(%ecx)
     6e2:	46                   	inc    %esi
     6e3:	06                   	push   %es
     6e4:	00 00                	add    %al,(%eax)
     6e6:	01 00                	add    %eax,(%eax)
     6e8:	08 26                	or     %ah,(%esi)
     6ea:	32 06                	xor    (%esi),%al
     6ec:	00 00                	add    %al,(%eax)
     6ee:	0b 2c 01             	or     (%ecx,%eax,1),%ebp
     6f1:	46                   	inc    %esi
     6f2:	06                   	push   %es
     6f3:	00 00                	add    %al,(%eax)
     6f5:	01 00                	add    %eax,(%eax)
     6f7:	10 26                	adc    %ah,(%esi)
     6f9:	ce                   	into   
     6fa:	08 00                	or     %al,(%eax)
     6fc:	00 0b                	add    %cl,(%ebx)
     6fe:	2f                   	das    
     6ff:	01 46 06             	add    %eax,0x6(%esi)
     702:	00 00                	add    %al,(%eax)
     704:	01 00                	add    %eax,(%eax)
     706:	20 26                	and    %ah,(%esi)
     708:	26 07                	es pop %es
     70a:	00 00                	add    %al,(%eax)
     70c:	0b 33                	or     (%ebx),%esi
     70e:	01 46 06             	add    %eax,0x6(%esi)
     711:	00 00                	add    %al,(%eax)
     713:	01 00                	add    %eax,(%eax)
     715:	40                   	inc    %eax
     716:	24 3c                	and    $0x3c,%al
     718:	06                   	push   %es
     719:	00 00                	add    %al,(%eax)
     71b:	0b 36                	or     (%esi),%esi
     71d:	01 46 06             	add    %eax,0x6(%esi)
     720:	00 00                	add    %al,(%eax)
     722:	01 b0 24 1a 01 00    	add    %esi,0x11a24(%eax)
     728:	00 0b                	add    %cl,(%ebx)
     72a:	39 01                	cmp    %eax,(%ecx)
     72c:	46                   	inc    %esi
     72d:	06                   	push   %es
     72e:	00 00                	add    %al,(%eax)
     730:	01 4a 26             	add    %ecx,0x26(%edx)
     733:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     734:	07                   	pop    %es
     735:	00 00                	add    %al,(%eax)
     737:	0b 3c 01             	or     (%ecx,%eax,1),%edi
     73a:	46                   	inc    %esi
     73b:	06                   	push   %es
     73c:	00 00                	add    %al,(%eax)
     73e:	01 04 01             	add    %eax,(%ecx,%eax,1)
     741:	27                   	daa    
     742:	80 09 00             	orb    $0x0,(%ecx)
     745:	00 0b                	add    %cl,(%ebx)
     747:	4a                   	dec    %edx
     748:	01 79 05             	add    %edi,0x5(%ecx)
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
     761:	24 08                	and    $0x8,%al
     763:	02 00                	add    (%eax),%al
     765:	00 0b                	add    %cl,(%ebx)
     767:	51                   	push   %ecx
     768:	01 5c 07 00          	add    %ebx,0x0(%edi,%eax,1)
     76c:	00 01                	add    %al,(%ecx)
     76e:	02 24 56             	add    (%esi,%edx,2),%ah
     771:	0b 00                	or     (%eax),%eax
     773:	00 0b                	add    %cl,(%ebx)
     775:	56                   	push   %esi
     776:	01 5c 07 00          	add    %ebx,0x0(%edi,%eax,1)
     77a:	00 01                	add    %al,(%ecx)
     77c:	04 24                	add    $0x24,%al
     77e:	8f 02                	popl   (%edx)
     780:	00 00                	add    %al,(%eax)
     782:	0b 59 01             	or     0x1(%ecx),%ebx
     785:	5c                   	pop    %esp
     786:	07                   	pop    %es
     787:	00 00                	add    %al,(%eax)
     789:	01 00                	add    %eax,(%eax)
     78b:	27                   	daa    
     78c:	3c 03                	cmp    $0x3,%al
     78e:	00 00                	add    %al,(%eax)
     790:	0b 69 01             	or     0x1(%ecx),%ebp
     793:	40                   	inc    %eax
     794:	05 00 00 01 25       	add    $0x25010000,%eax
     799:	61                   	popa   
     79a:	70 70                	jo     80c <_init-0x8047d90>
     79c:	00 0b                	add    %cl,(%ebx)
     79e:	6c                   	insb   (%dx),%es:(%edi)
     79f:	01 a6 07 00 00 01    	add    %esp,0x1000007(%esi)
     7a5:	01 0e                	add    %ecx,(%esi)
     7a7:	8b 07                	mov    (%edi),%eax
     7a9:	00 00                	add    %al,(%eax)
     7ab:	25 61 74 65 00       	and    $0x657461,%eax
     7b0:	0b 6f 01             	or     0x1(%edi),%ebp
     7b3:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
     7b4:	07                   	pop    %es
     7b5:	00 00                	add    %al,(%eax)
     7b7:	01 02                	add    %eax,(%edx)
     7b9:	24 c0                	and    $0xc0,%al
     7bb:	07                   	pop    %es
     7bc:	00 00                	add    %al,(%eax)
     7be:	0b 74 01 a6          	or     -0x5a(%ecx,%eax,1),%esi
     7c2:	07                   	pop    %es
     7c3:	00 00                	add    %al,(%eax)
     7c5:	01 04 25 69 6e 00 0b 	add    %eax,0xb006e69(,%eiz,1)
     7cc:	77 01                	ja     7cf <_init-0x8047dcd>
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
     7e2:	24 a6                	and    $0xa6,%al
     7e4:	05 00 00 0b 7d       	add    $0x7d0b0000,%eax
     7e9:	01 a6 07 00 00 01    	add    %esp,0x1000007(%esi)
     7ef:	20 27                	and    %ah,(%edi)
     7f1:	73 04                	jae    7f7 <_init-0x8047da5>
     7f3:	00 00                	add    %al,(%eax)
     7f5:	0b 89 01 a6 05 00    	or     0x5a601(%ecx),%ecx
     7fb:	00 01                	add    %al,(%ecx)
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
     85e:	1d 20 02 00 00       	sbb    $0x220,%eax
     863:	7a 08                	jp     86d <_init-0x8047d2f>
     865:	00 00                	add    %al,(%eax)
     867:	28 5a 04             	sub    %bl,0x4(%edx)
     86a:	00 00                	add    %al,(%eax)
     86c:	4a                   	dec    %edx
     86d:	00 00                	add    %al,(%eax)
     86f:	00 29                	add    %ch,(%ecx)
     871:	a5                   	movsl  %ds:(%esi),%es:(%edi)
     872:	0b 00                	or     (%eax),%eax
     874:	00 be 02 00 00 00    	add    %bh,0x2(%esi)
     87a:	03 6b 07             	add    0x7(%ebx),%ebp
     87d:	00 00                	add    %al,(%eax)
     87f:	0d 88 5e 08 00       	or     $0x85e88,%eax
     884:	00 2a                	add    %ch,(%edx)
     886:	aa                   	stos   %al,%es:(%edi)
     887:	06                   	push   %es
     888:	00 00                	add    %al,(%eax)
     88a:	02 3d a5 06 00 00    	add    0x6a5,%bh
     890:	7a 08                	jp     89a <_init-0x8047d02>
     892:	00 00                	add    %al,(%eax)
     894:	2b e0                	sub    %eax,%esp
     896:	01 00                	add    %eax,(%eax)
     898:	00 02                	add    %al,(%edx)
     89a:	4a                   	dec    %edx
     89b:	d6                   	(bad)  
     89c:	05 00 00 00 2c       	add    $0x2c000000,%eax
     8a1:	6c                   	insb   (%dx),%es:(%edi)
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
     8b6:	2c 56                	sub    $0x56,%al
     8b8:	02 00                	add    (%eax),%al
     8ba:	00 06                	add    %al,(%esi)
     8bc:	e9 02 63 00 00       	jmp    6bc3 <_init-0x80419d9>
     8c1:	00 cc                	add    %cl,%ah
     8c3:	08 00                	or     %al,(%eax)
     8c5:	00 16                	add    %dl,(%esi)
     8c7:	cc                   	int3   
     8c8:	08 00                	or     %al,(%eax)
     8ca:	00 00                	add    %al,(%eax)
     8cc:	0f 04                	(bad)  
     8ce:	2a 00                	sub    (%eax),%al
     8d0:	00 00                	add    %al,(%eax)
     8d2:	2c 66                	sub    $0x66,%al
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
     8f7:	00 05 04 05 3a 0c    	add    %al,0xc3a0504
     8fd:	00 00                	add    %al,(%eax)
     8ff:	2c 35                	sub    $0x35,%al
     901:	0b 00                	or     (%eax),%eax
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
     91a:	2c 3c                	sub    $0x3c,%al
     91c:	0b 00                	or     (%eax),%eax
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
     93f:	00 2c 7b             	add    %ch,(%ebx,%edi,2)
     942:	04 00                	add    $0x0,%al
     944:	00 06                	add    %al,(%esi)
     946:	4b                   	dec    %ebx
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
     95b:	2c 4c                	sub    $0x4c,%al
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
     976:	00 2c b4             	add    %ch,(%esp,%esi,4)
     979:	0b 00                	or     (%eax),%eax
     97b:	00 06                	add    %al,(%esi)
     97d:	7b 02                	jnp    981 <_init-0x8047c1b>
     97f:	ca 00 00             	lret   $0x0
     982:	00 93 09 00 00 16    	add    %dl,0x16000009(%ebx)
     988:	cc                   	int3   
     989:	08 00                	or     %al,(%eax)
     98b:	00 16                	add    %dl,(%esi)
     98d:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     992:	00 2c 57             	add    %ch,(%edi,%edx,2)
     995:	02 00                	add    (%eax),%al
     997:	00 06                	add    %al,(%esi)
     999:	ea 02 63 00 00 00 a9 	ljmp   $0xa900,$0x6302
     9a0:	09 00                	or     %eax,(%eax)
     9a2:	00 16                	add    %dl,(%esi)
     9a4:	cc                   	int3   
     9a5:	08 00                	or     %al,(%eax)
     9a7:	00 00                	add    %al,(%eax)
     9a9:	2e 5d                	cs pop %ebp
     9ab:	02 00                	add    (%eax),%al
     9ad:	00 06                	add    %al,(%esi)
     9af:	f0 02 63 00          	lock add 0x0(%ebx),%ah
     9b3:	00 00                	add    %al,(%eax)
     9b5:	2c d2                	sub    $0xd2,%al
     9b7:	03 00                	add    (%eax),%eax
     9b9:	00 06                	add    %al,(%esi)
     9bb:	78 01                	js     9be <_init-0x8047bde>
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
     9ff:	00 2c dc             	add    %ch,(%esp,%ebx,8)
     a02:	0b 00                	or     (%eax),%eax
     a04:	00 06                	add    %al,(%esi)
     a06:	69 01 ca 00 00 00    	imul   $0xca,(%ecx),%eax
     a0c:	16                   	push   %ss
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
     a21:	2c 49                	sub    $0x49,%al
     a23:	0b 00                	or     (%eax),%eax
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
     a4b:	00 2c 36             	add    %ch,(%esi,%esi,1)
     a4e:	0b 00                	or     (%eax),%eax
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
     a67:	2c 99                	sub    $0x99,%al
     a69:	04 00                	add    $0x0,%al
     a6b:	00 06                	add    %al,(%esi)
     a6d:	fe 02                	incb   (%edx)
     a6f:	63 00                	arpl   %ax,(%eax)
     a71:	00 00                	add    %al,(%eax)
     a73:	7d 0a                	jge    a7f <_init-0x8047b1d>
     a75:	00 00                	add    %al,(%eax)
     a77:	16                   	push   %ss
     a78:	f8                   	clc    
     a79:	08 00                	or     %al,(%eax)
     a7b:	00 00                	add    %al,(%eax)
     a7d:	2c 62                	sub    $0x62,%al
     a7f:	04 00                	add    $0x0,%al
     a81:	00 06                	add    %al,(%esi)
     a83:	5c                   	pop    %esp
     a84:	02 ca                	add    %dl,%cl
     a86:	00 00                	add    %al,(%eax)
     a88:	00 9e 0a 00 00 16    	add    %bl,0x1600000a(%esi)
     a8e:	f2 08 00             	repnz or %al,(%eax)
     a91:	00 16                	add    %dl,(%esi)
     a93:	51                   	push   %ecx
     a94:	00 00                	add    %al,(%eax)
     a96:	00 16                	add    %dl,(%esi)
     a98:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     a9d:	00 2c 5b             	add    %ch,(%ebx,%ebx,2)
     aa0:	05 00 00 06 85       	add    $0x85060000,%eax
     aa5:	02 ca                	add    %dl,%cl
     aa7:	00 00                	add    %al,(%eax)
     aa9:	00 ba 0a 00 00 16    	add    %bh,0x1600000a(%edx)
     aaf:	35 09 00 00 16       	xor    $0x16000009,%eax
     ab4:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     ab9:	00 2c 84             	add    %ch,(%esp,%eax,4)
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
     ad5:	2c 4b                	sub    $0x4b,%al
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
     af5:	2c b3                	sub    $0xb3,%al
     af7:	0b 00                	or     (%eax),%eax
     af9:	00 06                	add    %al,(%esi)
     afb:	b1 02                	mov    $0x2,%cl
     afd:	ca 00 00             	lret   $0x0
     b00:	00 15 0b 00 00 16    	add    %dl,0x1600000b
     b06:	cc                   	int3   
     b07:	08 00                	or     %al,(%eax)
     b09:	00 16                	add    %dl,(%esi)
     b0b:	35 09 00 00 16       	xor    $0x16000009,%eax
     b10:	35 00 00 00 00       	xor    $0x0,%eax
     b15:	2c 61                	sub    $0x61,%al
     b17:	04 00                	add    $0x0,%al
     b19:	00 06                	add    %al,(%esi)
     b1b:	71 02                	jno    b1f <_init-0x8047a7d>
     b1d:	ca 00 00             	lret   $0x0
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
     b3a:	2c 5a                	sub    $0x5a,%al
     b3c:	05 00 00 06 bd       	add    $0xbd060000,%eax
     b41:	02 ca                	add    %dl,%cl
     b43:	00 00                	add    %al,(%eax)
     b45:	00 5a 0b             	add    %bl,0xb(%edx)
     b48:	00 00                	add    %al,(%eax)
     b4a:	16                   	push   %ss
     b4b:	35 09 00 00 16       	xor    $0x16000009,%eax
     b50:	35 09 00 00 16       	xor    $0x16000009,%eax
     b55:	35 00 00 00 00       	xor    $0x0,%eax
     b5a:	2c a8                	sub    $0xa8,%al
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
     b75:	2c a9                	sub    $0xa9,%al
     b77:	0a 00                	or     (%eax),%al
     b79:	00 06                	add    %al,(%esi)
     b7b:	b9 02 ca 00 00       	mov    $0xca02,%ecx
     b80:	00 90 0b 00 00 16    	add    %dl,0x1600000b(%eax)
     b86:	35 09 00 00 16       	xor    $0x16000009,%eax
     b8b:	35 00 00 00 00       	xor    $0x0,%eax
     b90:	2c c4                	sub    $0xc4,%al
     b92:	0a 00                	or     (%eax),%al
     b94:	00 06                	add    %al,(%esi)
     b96:	72 01                	jb     b99 <_init-0x8047a03>
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
     bb7:	64 0a 00             	or     %fs:(%eax),%al
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
     bd1:	d0 02                	rolb   (%edx)
     bd3:	00 00                	add    %al,(%eax)
     bd5:	06                   	push   %es
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
     c05:	53                   	push   %ebx
     c06:	04 00                	add    $0x0,%al
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
     c38:	2c 13                	sub    $0x13,%al
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
     c69:	74 6d                	je     cd8 <_init-0x80478c4>
     c6b:	00 2c 0e             	add    %ch,(%esi,%ecx,1)
     c6e:	85 f8                	test   %edi,%eax
     c70:	0c 00                	or     $0x0,%al
     c72:	00 0a                	add    %cl,(%edx)
     c74:	81 04 00 00 0e 87 ca 	addl   $0xca870e00,(%eax,%eax,1)
     c7b:	00 00                	add    %al,(%eax)
     c7d:	00 00                	add    %al,(%eax)
     c7f:	0a af 06 00 00 0e    	or     0xe000006(%edi),%ch
     c85:	88 ca                	mov    %cl,%dl
     c87:	00 00                	add    %al,(%eax)
     c89:	00 04 0a             	add    %al,(%edx,%ecx,1)
     c8c:	2b 00                	sub    (%eax),%eax
     c8e:	00 00                	add    %al,(%eax)
     c90:	0e                   	push   %cs
     c91:	89 ca                	mov    %ecx,%edx
     c93:	00 00                	add    %al,(%eax)
     c95:	00 08                	add    %cl,(%eax)
     c97:	0a 1d 04 00 00 0e    	or     0xe000004,%bl
     c9d:	8a ca                	mov    %dl,%cl
     c9f:	00 00                	add    %al,(%eax)
     ca1:	00 0c 0a             	add    %cl,(%edx,%ecx,1)
     ca4:	ce                   	into   
     ca5:	05 00 00 0e 8b       	add    $0x8b0e0000,%eax
     caa:	ca 00 00             	lret   $0x0
     cad:	00 10                	add    %dl,(%eax)
     caf:	0a 8a 0b 00 00 0e    	or     0xe00000b(%edx),%cl
     cb5:	8c ca                	mov    %cs,%edx
     cb7:	00 00                	add    %al,(%eax)
     cb9:	00 14 0a             	add    %dl,(%edx,%ecx,1)
     cbc:	c3                   	ret    
     cbd:	08 00                	or     %al,(%eax)
     cbf:	00 0e                	add    %cl,(%esi)
     cc1:	8d                   	(bad)  
     cc2:	ca 00 00             	lret   $0x0
     cc5:	00 18                	add    %bl,(%eax)
     cc7:	0a 0f                	or     (%edi),%cl
     cc9:	02 00                	add    (%eax),%al
     ccb:	00 0e                	add    %cl,(%esi)
     ccd:	8e ca                	mov    %edx,%cs
     ccf:	00 00                	add    %al,(%eax)
     cd1:	00 1c 0a             	add    %bl,(%edx,%ecx,1)
     cd4:	88 04 00             	mov    %al,(%eax,%eax,1)
     cd7:	00 0e                	add    %cl,(%esi)
     cd9:	8f ca                	(bad)  
     cdb:	00 00                	add    %al,(%eax)
     cdd:	00 20                	add    %ah,(%eax)
     cdf:	0a a9 09 00 00 0e    	or     0xe000009(%ecx),%ch
     ce5:	92                   	xchg   %eax,%edx
     ce6:	3b 0e                	cmp    (%esi),%ecx
     ce8:	00 00                	add    %al,(%eax)
     cea:	24 0a                	and    $0xa,%al
     cec:	a1 0a 00 00 0e       	mov    0xe00000a,%eax
     cf1:	93                   	xchg   %eax,%ebx
     cf2:	f3 00 00             	repz add %al,(%eax)
     cf5:	00 28                	add    %ch,(%eax)
     cf7:	00 2c 5f             	add    %ch,(%edi,%ebx,2)
     cfa:	09 00                	or     %eax,(%eax)
     cfc:	00 06                	add    %al,(%esi)
     cfe:	1f                   	pop    %ds
     cff:	01 51 00             	add    %edx,0x0(%ecx)
     d02:	00 00                	add    %al,(%eax)
     d04:	0e                   	push   %cs
     d05:	0d 00 00 16 35       	or     $0x35160000,%eax
     d0a:	09 00                	or     %eax,(%eax)
     d0c:	00 00                	add    %al,(%eax)
     d0e:	2f                   	das    
     d0f:	ee                   	out    %al,(%dx)
     d10:	0a 00                	or     (%eax),%al
     d12:	00 06                	add    %al,(%esi)
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
     d2e:	45                   	inc    %ebp
     d2f:	03 00                	add    (%eax),%eax
     d31:	00 06                	add    %al,(%esi)
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
     d4d:	91                   	xchg   %eax,%ecx
     d4e:	04 00                	add    $0x0,%al
     d50:	00 06                	add    %al,(%esi)
     d52:	96                   	xchg   %eax,%esi
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
     d6b:	2c b9                	sub    $0xb9,%al
     d6d:	08 00                	or     %al,(%eax)
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
     d95:	00 2c f2             	add    %ch,(%edx,%esi,8)
     d98:	06                   	push   %es
     d99:	00 00                	add    %al,(%eax)
     d9b:	06                   	push   %es
     d9c:	00 01                	add    %al,(%ecx)
     d9e:	51                   	push   %ecx
     d9f:	00 00                	add    %al,(%eax)
     da1:	00 b1 0d 00 00 16    	add    %dh,0x1600000d(%ecx)
     da7:	35 09 00 00 16       	xor    $0x16000009,%eax
     dac:	35 09 00 00 00       	xor    $0x9,%eax
     db1:	2c 06                	sub    $0x6,%al
     db3:	09 00                	or     %eax,(%eax)
     db5:	00 06                	add    %al,(%esi)
     db7:	c2 01 cc             	ret    $0xcc01
     dba:	0d 00 00 cc 0d       	or     $0xdcc0000,%eax
     dbf:	00 00                	add    %al,(%eax)
     dc1:	16                   	push   %ss
     dc2:	35 09 00 00 16       	xor    $0x16000009,%eax
     dc7:	d3 0d 00 00 00 05    	rorl   %cl,0x5000000
     dcd:	08 04 8f             	or     %al,(%edi,%ecx,4)
     dd0:	07                   	pop    %es
     dd1:	00 00                	add    %al,(%eax)
     dd3:	0f 04                	(bad)  
     dd5:	f2 08 00             	repnz or %al,(%eax)
     dd8:	00 2c 0d 09 00 00 06 	add    %ch,0x6000009(,%ecx,1)
     ddf:	c9                   	leave  
     de0:	01 f4                	add    %esi,%esp
     de2:	0d 00 00 f4 0d       	or     $0xdf40000,%eax
     de7:	00 00                	add    %al,(%eax)
     de9:	16                   	push   %ss
     dea:	35 09 00 00 16       	xor    $0x16000009,%eax
     def:	d3 0d 00 00 00 05    	rorl   %cl,0x5000000
     df5:	04 04                	add    $0x4,%al
     df7:	9f                   	lahf   
     df8:	06                   	push   %es
     df9:	00 00                	add    %al,(%eax)
     dfb:	2c 14                	sub    $0x14,%al
     dfd:	09 00                	or     %eax,(%eax)
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
     e1c:	1b 09                	sbb    (%ecx),%ecx
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
     e3b:	05 04 05 2c 0b       	add    $0xb2c0504,%eax
     e40:	00 00                	add    %al,(%eax)
     e42:	2c 42                	sub    $0x42,%al
     e44:	0c 00                	or     $0x0,%al
     e46:	00 06                	add    %al,(%esi)
     e48:	d9 01                	flds   (%ecx)
     e4a:	62 0e                	bound  %ecx,(%esi)
     e4c:	00 00                	add    %al,(%eax)
     e4e:	62 0e                	bound  %ecx,(%esi)
     e50:	00 00                	add    %al,(%eax)
     e52:	16                   	push   %ss
     e53:	35 09 00 00 16       	xor    $0x16000009,%eax
     e58:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
     e5e:	00 00                	add    %al,(%eax)
     e60:	00 00                	add    %al,(%eax)
     e62:	05 04 07 1c 08       	add    $0x81c0704,%eax
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
     e88:	2c 1c                	sub    $0x1c,%al
     e8a:	06                   	push   %es
     e8b:	00 00                	add    %al,(%eax)
     e8d:	06                   	push   %es
     e8e:	65 01 ca             	gs add %ecx,%edx
     e91:	00 00                	add    %al,(%eax)
     e93:	00 9e 0e 00 00 16    	add    %bl,0x1600000e(%esi)
     e99:	63 00                	arpl   %ax,(%eax)
     e9b:	00 00                	add    %al,(%eax)
     e9d:	00 2c bc             	add    %ch,(%esp,%edi,4)
     ea0:	04 00                	add    $0x0,%al
     ea2:	00 06                	add    %al,(%esi)
     ea4:	45                   	inc    %ebp
     ea5:	01 ca                	add    %ecx,%edx
     ea7:	00 00                	add    %al,(%eax)
     ea9:	00 be 0e 00 00 16    	add    %bh,0x1600000e(%esi)
     eaf:	35 09 00 00 16       	xor    $0x16000009,%eax
     eb4:	35 09 00 00 16       	xor    $0x16000009,%eax
     eb9:	51                   	push   %ecx
     eba:	00 00                	add    %al,(%eax)
     ebc:	00 00                	add    %al,(%eax)
     ebe:	2c c6                	sub    $0xc6,%al
     ec0:	05 00 00 06 49       	add    $0x49060000,%eax
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
     ede:	2c 5d                	sub    $0x5d,%al
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
     efe:	2c 6b                	sub    $0x6b,%al
     f00:	04 00                	add    $0x0,%al
     f02:	00 06                	add    %al,(%esi)
     f04:	52                   	push   %edx
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
     f1e:	2c 4d                	sub    $0x4d,%al
     f20:	05 00 00 06 59       	add    $0x59060000,%eax
     f25:	02 ca                	add    %dl,%cl
     f27:	00 00                	add    %al,(%eax)
     f29:	00 35 0f 00 00 16    	add    %dh,0x1600000f
     f2f:	35 09 00 00 2d       	xor    $0x2d000009,%eax
     f34:	00 2c b5 0b 00 00 06 	add    %ch,0x600000b(,%esi,4)
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
     f52:	e0 c4                	loopne f18 <_init-0x8047684>
     f54:	00 00                	add    %al,(%eax)
     f56:	00 35 09 00 00 6a    	add    %dh,0x6a000009
     f5c:	0f 00 00             	sldt   (%eax)
     f5f:	16                   	push   %ss
     f60:	35 09 00 00 16       	xor    $0x16000009,%eax
     f65:	f8                   	clc    
     f66:	08 00                	or     %al,(%eax)
     f68:	00 00                	add    %al,(%eax)
     f6a:	18 2e                	sbb    %ch,(%esi)
     f6c:	08 00                	or     %al,(%eax)
     f6e:	00 06                	add    %al,(%esi)
     f70:	06                   	push   %es
     f71:	01 2e                	add    %ebp,(%esi)
     f73:	08 00                	or     %al,(%eax)
     f75:	00 35 09 00 00 89    	add    %dh,0x89000009
     f7b:	0f 00 00             	sldt   (%eax)
     f7e:	16                   	push   %ss
     f7f:	35 09 00 00 16       	xor    $0x16000009,%eax
     f84:	35 09 00 00 00       	xor    $0x9,%eax
     f89:	31 47 09             	xor    %eax,0x9(%edi)
     f8c:	00 00                	add    %al,(%eax)
     f8e:	06                   	push   %es
     f8f:	ea 47 09 00 00 35 09 	ljmp   $0x935,$0x947
     f96:	00 00                	add    %al,(%eax)
     f98:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
     f99:	0f 00 00             	sldt   (%eax)
     f9c:	16                   	push   %ss
     f9d:	35 09 00 00 16       	xor    $0x16000009,%eax
     fa2:	f8                   	clc    
     fa3:	08 00                	or     %al,(%eax)
     fa5:	00 00                	add    %al,(%eax)
     fa7:	18 73 08             	sbb    %dh,0x8(%ebx)
     faa:	00 00                	add    %al,(%eax)
     fac:	06                   	push   %es
     fad:	11 01                	adc    %eax,(%ecx)
     faf:	73 08                	jae    fb9 <_init-0x80475e3>
     fb1:	00 00                	add    %al,(%eax)
     fb3:	35 09 00 00 c6       	xor    $0xc6000009,%eax
     fb8:	0f 00 00             	sldt   (%eax)
     fbb:	16                   	push   %ss
     fbc:	35 09 00 00 16       	xor    $0x16000009,%eax
     fc1:	35 09 00 00 00       	xor    $0x9,%eax
     fc6:	18 84 02 00 00 06 3c 	sbb    %al,0x3c060000(%edx,%eax,1)
     fcd:	01 84 02 00 00 35 09 	add    %eax,0x9350000(%edx,%eax,1)
     fd4:	00 00                	add    %al,(%eax)
     fd6:	ea 0f 00 00 16 35 09 	ljmp   $0x935,$0x1600000f
     fdd:	00 00                	add    %al,(%eax)
     fdf:	16                   	push   %ss
     fe0:	f8                   	clc    
     fe1:	08 00                	or     %al,(%eax)
     fe3:	00 16                	add    %dl,(%esi)
     fe5:	51                   	push   %ecx
     fe6:	00 00                	add    %al,(%eax)
     fe8:	00 00                	add    %al,(%eax)
     fea:	32 7b 07             	xor    0x7(%ebx),%bh
     fed:	00 00                	add    %al,(%eax)
     fef:	07                   	pop    %es
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
    100d:	ad                   	lods   %ds:(%esi),%eax
    100e:	0b 00                	or     (%eax),%eax
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
    102d:	33 66 03             	xor    0x3(%esi),%esp
    1030:	00 00                	add    %al,(%eax)
    1032:	12 3a                	adc    (%edx),%bh
    1034:	ee                   	out    %al,(%dx)
    1035:	00 00                	add    %al,(%eax)
    1037:	00 33                	add    %dh,(%ebx)
    1039:	8b 00                	mov    (%eax),%eax
    103b:	00 00                	add    %al,(%eax)
    103d:	12 3b                	adc    (%ebx),%bh
    103f:	ee                   	out    %al,(%dx)
    1040:	00 00                	add    %al,(%eax)
    1042:	00 33                	add    %dh,(%ebx)
    1044:	00 03                	add    %al,(%ebx)
    1046:	00 00                	add    %al,(%eax)
    1048:	12 3f                	adc    (%edi),%bh
    104a:	53                   	push   %ebx
    104b:	13 00                	adc    (%eax),%eax
    104d:	00 33                	add    %dh,(%ebx)
    104f:	fd                   	std    
    1050:	08 00                	or     %al,(%eax)
    1052:	00 12                	add    %dl,(%edx)
    1054:	40                   	inc    %eax
    1055:	ee                   	out    %al,(%dx)
    1056:	00 00                	add    %al,(%eax)
    1058:	00 28                	add    %ch,(%eax)
    105a:	fe 01                	incb   (%ecx)
    105c:	00 00                	add    %al,(%eax)
    105e:	ca 00 00             	lret   $0x0
    1061:	00 00                	add    %al,(%eax)
    1063:	14 5e                	adc    $0x5e,%al
    1065:	0b 00                	or     (%eax),%eax
    1067:	00 01                	add    %al,(%ecx)
    1069:	12 37                	adc    (%edi),%dh
    106b:	a5                   	movsl  %ds:(%esi),%es:(%edi)
    106c:	10 00                	adc    %al,(%eax)
    106e:	00 33                	add    %dh,(%ebx)
    1070:	66 03 00             	add    (%eax),%ax
    1073:	00 12                	add    %dl,(%edx)
    1075:	3a 58 13             	cmp    0x13(%eax),%bl
    1078:	00 00                	add    %al,(%eax)
    107a:	33 8b 00 00 00 12    	xor    0x12000000(%ebx),%ecx
    1080:	3b 58 13             	cmp    0x13(%eax),%ebx
    1083:	00 00                	add    %al,(%eax)
    1085:	33 00                	xor    (%eax),%eax
    1087:	03 00                	add    (%eax),%eax
    1089:	00 12                	add    %dl,(%edx)
    108b:	3f                   	aas    
    108c:	53                   	push   %ebx
    108d:	13 00                	adc    (%eax),%eax
    108f:	00 33                	add    %dh,(%ebx)
    1091:	fd                   	std    
    1092:	08 00                	or     %al,(%eax)
    1094:	00 12                	add    %dl,(%edx)
    1096:	40                   	inc    %eax
    1097:	ee                   	out    %al,(%dx)
    1098:	00 00                	add    %al,(%eax)
    109a:	00 28                	add    %ch,(%eax)
    109c:	fe 01                	incb   (%ecx)
    109e:	00 00                	add    %al,(%eax)
    10a0:	62 0e                	bound  %ecx,(%esi)
    10a2:	00 00                	add    %al,(%eax)
    10a4:	00 14 89             	add    %dl,(%ecx,%ecx,4)
    10a7:	01 00                	add    %eax,(%eax)
    10a9:	00 01                	add    %al,(%ecx)
    10ab:	12 37                	adc    (%edi),%dh
    10ad:	e7 10                	out    %eax,$0x10
    10af:	00 00                	add    %al,(%eax)
    10b1:	33 66 03             	xor    0x3(%esi),%esp
    10b4:	00 00                	add    %al,(%eax)
    10b6:	12 3a                	adc    (%edx),%bh
    10b8:	f9                   	stc    
    10b9:	00 00                	add    %al,(%eax)
    10bb:	00 33                	add    %dh,(%ebx)
    10bd:	8b 00                	mov    (%eax),%eax
    10bf:	00 00                	add    %al,(%eax)
    10c1:	12 3b                	adc    (%ebx),%bh
    10c3:	f9                   	stc    
    10c4:	00 00                	add    %al,(%eax)
    10c6:	00 33                	add    %dh,(%ebx)
    10c8:	00 03                	add    %al,(%ebx)
    10ca:	00 00                	add    %al,(%eax)
    10cc:	12 3f                	adc    (%edi),%bh
    10ce:	53                   	push   %ebx
    10cf:	13 00                	adc    (%eax),%eax
    10d1:	00 33                	add    %dh,(%ebx)
    10d3:	fd                   	std    
    10d4:	08 00                	or     %al,(%eax)
    10d6:	00 12                	add    %dl,(%edx)
    10d8:	40                   	inc    %eax
    10d9:	ee                   	out    %al,(%dx)
    10da:	00 00                	add    %al,(%eax)
    10dc:	00 28                	add    %ch,(%eax)
    10de:	fe 01                	incb   (%ecx)
    10e0:	00 00                	add    %al,(%eax)
    10e2:	4a                   	dec    %edx
    10e3:	00 00                	add    %al,(%eax)
    10e5:	00 00                	add    %al,(%eax)
    10e7:	34 f6                	xor    $0xf6,%al
    10e9:	0a 00                	or     (%eax),%al
    10eb:	00 01                	add    %al,(%ecx)
    10ed:	12 37                	adc    (%edi),%dh
    10ef:	33 66 03             	xor    0x3(%esi),%esp
    10f2:	00 00                	add    %al,(%eax)
    10f4:	12 3a                	adc    (%edx),%bh
    10f6:	e2 13                	loop   110b <_init-0x8047491>
    10f8:	00 00                	add    %al,(%eax)
    10fa:	33 8b 00 00 00 12    	xor    0x12000000(%ebx),%ecx
    1100:	3b e2                	cmp    %edx,%esp
    1102:	13 00                	adc    (%eax),%eax
    1104:	00 33                	add    %dh,(%ebx)
    1106:	00 03                	add    %al,(%ebx)
    1108:	00 00                	add    %al,(%eax)
    110a:	12 3f                	adc    (%edi),%bh
    110c:	53                   	push   %ebx
    110d:	13 00                	adc    (%eax),%eax
    110f:	00 33                	add    %dh,(%ebx)
    1111:	fd                   	std    
    1112:	08 00                	or     %al,(%eax)
    1114:	00 12                	add    %dl,(%edx)
    1116:	40                   	inc    %eax
    1117:	ee                   	out    %al,(%dx)
    1118:	00 00                	add    %al,(%eax)
    111a:	00 28                	add    %ch,(%eax)
    111c:	fe 01                	incb   (%ecx)
    111e:	00 00                	add    %al,(%eax)
    1120:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    1121:	11 00                	adc    %eax,(%eax)
    1123:	00 00                	add    %al,(%eax)
    1125:	00 2c 36             	add    %ch,(%esi,%esi,1)
    1128:	08 00                	or     %al,(%eax)
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
    1144:	8a 07                	mov    (%edi),%al
    1146:	00 00                	add    %al,(%eax)
    1148:	2c 6b                	sub    $0x6b,%al
    114a:	08 00                	or     %al,(%eax)
    114c:	00 06                	add    %al,(%esi)
    114e:	e3 01                	jecxz  1151 <_init-0x804744b>
    1150:	68 11 00 00 68       	push   $0x68000011
    1155:	11 00                	adc    %eax,(%eax)
    1157:	00 16                	add    %dl,(%esi)
    1159:	35 09 00 00 16       	xor    $0x16000009,%eax
    115e:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
    1164:	00 00                	add    %al,(%eax)
    1166:	00 00                	add    %al,(%eax)
    1168:	05 08 05 27 0b       	add    $0xb270508,%eax
    116d:	00 00                	add    %al,(%eax)
    116f:	2c 00                	sub    $0x0,%al
    1171:	04 00                	add    $0x0,%al
    1173:	00 06                	add    %al,(%esi)
    1175:	ea 01 8f 11 00 00 8f 	ljmp   $0x8f00,$0x118f01
    117c:	11 00                	adc    %eax,(%eax)
    117e:	00 16                	add    %dl,(%esi)
    1180:	35 09 00 00 16       	xor    $0x16000009,%eax
    1185:	d3 0d 00 00 16 ca    	rorl   %cl,0xca160000
    118b:	00 00                	add    %al,(%eax)
    118d:	00 00                	add    %al,(%eax)
    118f:	05 08 07 17 08       	add    $0x8170708,%eax
    1194:	00 00                	add    %al,(%eax)
    1196:	05 01 08 76 02       	add    $0x2760801,%eax
    119b:	00 00                	add    %al,(%eax)
    119d:	05 01 06 78 02       	add    $0x2780601,%eax
    11a2:	00 00                	add    %al,(%eax)
    11a4:	05 02 05 e8 09       	add    $0x9e80502,%eax
    11a9:	00 00                	add    %al,(%eax)
    11ab:	32 3f                	xor    (%edi),%bh
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
    11c9:	00 05 01 02 85 07    	add    %al,0x7850201
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
    11e2:	00 14 cc             	add    %dl,(%esp,%ecx,8)
    11e5:	0a 00                	or     (%eax),%al
    11e7:	00 38                	add    %bh,(%eax)
    11e9:	13 35 10 13 00 00    	adc    0x1310,%esi
    11ef:	0a 7b 01             	or     0x1(%ebx),%bh
    11f2:	00 00                	add    %al,(%eax)
    11f4:	13 39                	adc    (%ecx),%edi
    11f6:	b0 0b                	mov    $0xb,%al
    11f8:	00 00                	add    %al,(%eax)
    11fa:	00 0a                	add    %cl,(%edx)
    11fc:	76 03                	jbe    1201 <_init-0x804739b>
    11fe:	00 00                	add    %al,(%eax)
    1200:	13 3a                	adc    (%edx),%edi
    1202:	b0 0b                	mov    $0xb,%al
    1204:	00 00                	add    %al,(%eax)
    1206:	04 0a                	add    $0xa,%al
    1208:	20 0a                	and    %cl,(%edx)
    120a:	00 00                	add    %al,(%eax)
    120c:	13 40 b0             	adc    -0x50(%eax),%eax
    120f:	0b 00                	or     (%eax),%eax
    1211:	00 08                	add    %cl,(%eax)
    1213:	0a b4 00 00 00 13 46 	or     0x46130000(%eax,%eax,1),%dh
    121a:	b0 0b                	mov    $0xb,%al
    121c:	00 00                	add    %al,(%eax)
    121e:	0c 0a                	or     $0xa,%al
    1220:	d8 09                	fmuls  (%ecx)
    1222:	00 00                	add    %al,(%eax)
    1224:	13 47 b0             	adc    -0x50(%edi),%eax
    1227:	0b 00                	or     (%eax),%eax
    1229:	00 10                	add    %dl,(%eax)
    122b:	0a 77 01             	or     0x1(%edi),%dh
    122e:	00 00                	add    %al,(%eax)
    1230:	13 48 b0             	adc    -0x50(%eax),%ecx
    1233:	0b 00                	or     (%eax),%eax
    1235:	00 14 0a             	add    %dl,(%edx,%ecx,1)
    1238:	72 03                	jb     123d <_init-0x804735f>
    123a:	00 00                	add    %al,(%eax)
    123c:	13 49 b0             	adc    -0x50(%ecx),%ecx
    123f:	0b 00                	or     (%eax),%eax
    1241:	00 18                	add    %bl,(%eax)
    1243:	0a 1c 0a             	or     (%edx,%ecx,1),%bl
    1246:	00 00                	add    %al,(%eax)
    1248:	13 4a b0             	adc    -0x50(%edx),%ecx
    124b:	0b 00                	or     (%eax),%eax
    124d:	00 1c 0a             	add    %bl,(%edx,%ecx,1)
    1250:	d0 06                	rolb   (%esi)
    1252:	00 00                	add    %al,(%eax)
    1254:	13 4b b0             	adc    -0x50(%ebx),%ecx
    1257:	0b 00                	or     (%eax),%eax
    1259:	00 20                	add    %ah,(%eax)
    125b:	0a d9                	or     %cl,%bl
    125d:	03 00                	add    (%eax),%eax
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
    127f:	0a f2                	or     %dl,%dh
    1281:	03 00                	add    (%eax),%eax
    1283:	00 13                	add    %dl,(%ebx)
    1285:	50                   	push   %eax
    1286:	4a                   	dec    %edx
    1287:	00 00                	add    %al,(%eax)
    1289:	00 2a                	add    %ch,(%edx)
    128b:	0a 42 08             	or     0x8(%edx),%al
    128e:	00 00                	add    %al,(%eax)
    1290:	13 52 4a             	adc    0x4a(%edx),%edx
    1293:	00 00                	add    %al,(%eax)
    1295:	00 2b                	add    %ch,(%ebx)
    1297:	0a c3                	or     %bl,%al
    1299:	01 00                	add    %eax,(%eax)
    129b:	00 13                	add    %dl,(%ebx)
    129d:	54                   	push   %esp
    129e:	4a                   	dec    %edx
    129f:	00 00                	add    %al,(%eax)
    12a1:	00 2c 0a             	add    %ch,(%edx,%ecx,1)
    12a4:	13 05 00 00 13 56    	adc    0x56130000,%eax
    12aa:	4a                   	dec    %edx
    12ab:	00 00                	add    %al,(%eax)
    12ad:	00 2d 0a 95 0a 00    	add    %ch,0xa950a
    12b3:	00 13                	add    %dl,(%ebx)
    12b5:	5d                   	pop    %ebp
    12b6:	4a                   	dec    %edx
    12b7:	00 00                	add    %al,(%eax)
    12b9:	00 2e                	add    %ch,(%esi)
    12bb:	0a 51 03             	or     0x3(%ecx),%dl
    12be:	00 00                	add    %al,(%eax)
    12c0:	13 5e 4a             	adc    0x4a(%esi),%ebx
    12c3:	00 00                	add    %al,(%eax)
    12c5:	00 2f                	add    %ch,(%edi)
    12c7:	0a ee                	or     %dh,%ch
    12c9:	03 00                	add    (%eax),%eax
    12cb:	00 13                	add    %dl,(%ebx)
    12cd:	61                   	popa   
    12ce:	4a                   	dec    %edx
    12cf:	00 00                	add    %al,(%eax)
    12d1:	00 30                	add    %dh,(%eax)
    12d3:	0a 3e                	or     (%esi),%bh
    12d5:	08 00                	or     %al,(%eax)
    12d7:	00 13                	add    %dl,(%ebx)
    12d9:	63 4a 00             	arpl   %cx,0x0(%edx)
    12dc:	00 00                	add    %al,(%eax)
    12de:	31 0a                	xor    %ecx,(%edx)
    12e0:	bf 01 00 00 13       	mov    $0x13000001,%edi
    12e5:	65 4a                	gs dec %edx
    12e7:	00 00                	add    %al,(%eax)
    12e9:	00 32                	add    %dh,(%edx)
    12eb:	0a 0f                	or     (%edi),%cl
    12ed:	05 00 00 13 67       	add    $0x67130000,%eax
    12f2:	4a                   	dec    %edx
    12f3:	00 00                	add    %al,(%eax)
    12f5:	00 33                	add    %dh,(%ebx)
    12f7:	0a 91 0a 00 00 13    	or     0x1300000a(%ecx),%dl
    12fd:	6e                   	outsb  %ds:(%esi),(%dx)
    12fe:	4a                   	dec    %edx
    12ff:	00 00                	add    %al,(%eax)
    1301:	00 34 0a             	add    %dh,(%edx,%ecx,1)
    1304:	4d                   	dec    %ebp
    1305:	03 00                	add    (%eax),%eax
    1307:	00 13                	add    %dl,(%ebx)
    1309:	6f                   	outsl  %ds:(%esi),(%dx)
    130a:	4a                   	dec    %edx
    130b:	00 00                	add    %al,(%eax)
    130d:	00 35 00 2f 29 09    	add    %dh,0x9292f00
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
    1330:	7f 35                	jg     1367 <_init-0x8047235>
    1332:	13 00                	adc    (%eax),%eax
    1334:	00 0f                	add    %cl,(%edi)
    1336:	04 e3                	add    $0xe3,%al
    1338:	11 00                	adc    %eax,(%eax)
    133a:	00 03                	add    %al,(%ebx)
    133c:	d2 0b                	rorb   %cl,(%ebx)
    133e:	00 00                	add    %al,(%eax)
    1340:	14 28                	adc    $0x28,%al
    1342:	ca 00 00             	lret   $0x0
    1345:	00 38                	add    %bh,(%eax)
    1347:	04 03                	add    $0x3,%al
    1349:	30 07                	xor    %al,(%edi)
    134b:	00 00                	add    %al,(%eax)
    134d:	15 20 ca 00 00       	adc    $0xca20,%eax
    1352:	00 0e                	add    %cl,(%esi)
    1354:	ca 11 00             	lret   $0x11
    1357:	00 0e                	add    %cl,(%esi)
    1359:	62 0e                	bound  %ecx,(%esi)
    135b:	00 00                	add    %al,(%eax)
    135d:	0f 04                	(bad)  
    135f:	d6                   	(bad)  
    1360:	05 00 00 03 4d       	add    $0x4d030000,%eax
    1365:	02 00                	add    (%eax),%al
    1367:	00 16                	add    %dl,(%esi)
    1369:	34 62                	xor    $0x62,%al
    136b:	0e                   	push   %cs
    136c:	00 00                	add    %al,(%eax)
    136e:	03 c8                	add    %eax,%ecx
    1370:	03 00                	add    (%eax),%eax
    1372:	00 16                	add    %dl,(%esi)
    1374:	ba 79 13 00 00       	mov    $0x1379,%edx
    1379:	0f 04                	(bad)  
    137b:	7f 13                	jg     1390 <_init-0x804720c>
    137d:	00 00                	add    %al,(%eax)
    137f:	0e                   	push   %cs
    1380:	3b 13                	cmp    (%ebx),%edx
    1382:	00 00                	add    %al,(%eax)
    1384:	2f                   	das    
    1385:	e4 0b                	in     $0xb,%al
    1387:	00 00                	add    %al,(%eax)
    1389:	16                   	push   %ss
    138a:	af                   	scas   %es:(%edi),%eax
    138b:	ca 00 00             	lret   $0x0
    138e:	00 9e 13 00 00 16    	add    %bl,0x16000013(%esi)
    1394:	63 00                	arpl   %ax,(%eax)
    1396:	00 00                	add    %al,(%eax)
    1398:	16                   	push   %ss
    1399:	63 13                	arpl   %dx,(%ebx)
    139b:	00 00                	add    %al,(%eax)
    139d:	00 2f                	add    %ch,(%edi)
    139f:	d1 01                	roll   (%ecx)
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
    13b9:	d3 01                	roll   %cl,(%ecx)
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
    13ce:	e6 0b                	out    %al,$0xb
    13d0:	00 00                	add    %al,(%eax)
    13d2:	16                   	push   %ss
    13d3:	ab                   	stos   %eax,%es:(%edi)
    13d4:	63 13                	arpl   %dx,(%ebx)
    13d6:	00 00                	add    %al,(%eax)
    13d8:	e2 13                	loop   13ed <_init-0x80471af>
    13da:	00 00                	add    %al,(%eax)
    13dc:	16                   	push   %ss
    13dd:	f3 00 00             	repz add %al,(%eax)
    13e0:	00 00                	add    %al,(%eax)
    13e2:	0e                   	push   %cs
    13e3:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    13e4:	11 00                	adc    %eax,(%eax)
    13e6:	00 35 01 02 fe 00    	add    %dh,0xfe0201
    13ec:	00 00                	add    %al,(%eax)
    13ee:	39 36                	cmp    %esi,(%esi)
    13f0:	0a 00                	or     (%eax),%al
    13f2:	00 04 01             	add    %al,(%ecx,%eax,1)
    13f5:	04 ee                	add    $0xee,%al
    13f7:	13 00                	adc    (%eax),%eax
    13f9:	00 99 14 00 00 3a    	add    %bl,0x3a000014(%ecx)
    13ff:	30 0a                	xor    %cl,(%edx)
    1401:	00 00                	add    %al,(%eax)
    1403:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    1404:	14 00                	adc    $0x0,%al
    1406:	00 00                	add    %al,(%eax)
    1408:	01 3b                	add    %edi,(%ebx)
    140a:	36 0a 00             	or     %ss:(%eax),%al
    140d:	00 01                	add    %al,(%ecx)
    140f:	17                   	pop    %ss
    1410:	14 00                	adc    $0x0,%al
    1412:	00 22                	add    %ah,(%edx)
    1414:	14 00                	adc    $0x0,%al
    1416:	00 21                	add    %ah,(%ecx)
    1418:	b4 14                	mov    $0x14,%ah
    141a:	00 00                	add    %al,(%eax)
    141c:	16                   	push   %ss
    141d:	ba 14 00 00 00       	mov    $0x14,%edx
    1422:	3b 36                	cmp    (%esi),%esi
    1424:	0a 00                	or     (%eax),%al
    1426:	00 01                	add    %al,(%ecx)
    1428:	30 14 00             	xor    %dl,(%eax,%eax,1)
    142b:	00 36                	add    %dh,(%esi)
    142d:	14 00                	adc    $0x0,%al
    142f:	00 21                	add    %ah,(%ecx)
    1431:	b4 14                	mov    $0x14,%ah
    1433:	00 00                	add    %al,(%eax)
    1435:	00 3c 6b             	add    %bh,(%ebx,%ebp,2)
    1438:	0a 00                	or     (%eax),%al
    143a:	00 01                	add    %al,(%ecx)
    143c:	07                   	pop    %es
    143d:	a2 04 00 00 01       	mov    %al,0x1000004
    1442:	02 10                	add    (%eax),%dl
    1444:	00 ee                	add    %ch,%dh
    1446:	13 00                	adc    (%eax),%eax
    1448:	00 01                	add    %al,(%ecx)
    144a:	52                   	push   %edx
    144b:	14 00                	adc    $0x0,%al
    144d:	00 58 14             	add    %bl,0x14(%eax)
    1450:	00 00                	add    %al,(%eax)
    1452:	21 b4 14 00 00 00 3c 	and    %esi,0x3c000000(%esp,%edx,1)
    1459:	73 0a                	jae    1465 <_init-0x8047137>
    145b:	00 00                	add    %al,(%eax)
    145d:	01 0b                	add    %ecx,(%ebx)
    145f:	3d 07 00 00 01       	cmp    $0x1000007,%eax
    1464:	02 10                	add    (%eax),%dl
    1466:	01 ee                	add    %ebp,%esi
    1468:	13 00                	adc    (%eax),%eax
    146a:	00 01                	add    %al,(%ecx)
    146c:	74 14                	je     1482 <_init-0x804711a>
    146e:	00 00                	add    %al,(%eax)
    1470:	7a 14                	jp     1486 <_init-0x8047116>
    1472:	00 00                	add    %al,(%eax)
    1474:	21 b4 14 00 00 00 3d 	and    %esi,0x3d000000(%esp,%edx,1)
    147b:	7b 0a                	jnp    1487 <_init-0x8047115>
    147d:	00 00                	add    %al,(%eax)
    147f:	01 0f                	add    %ecx,(%edi)
    1481:	66 09 00             	or     %ax,(%eax)
    1484:	00 01                	add    %al,(%ecx)
    1486:	02 10                	add    (%eax),%dl
    1488:	02 ee                	add    %dh,%ch
    148a:	13 00                	adc    (%eax),%eax
    148c:	00 01                	add    %al,(%ecx)
    148e:	92                   	xchg   %eax,%edx
    148f:	14 00                	adc    $0x0,%al
    1491:	00 21                	add    %ah,(%ecx)
    1493:	b4 14                	mov    $0x14,%ah
    1495:	00 00                	add    %al,(%eax)
    1497:	00 00                	add    %al,(%eax)
    1499:	3e ca 00 00          	ds lret $0x0
    149d:	00 a4 14 00 00 2d 00 	add    %ah,0x2d0000(%esp,%edx,1)
    14a4:	0f 04                	(bad)  
    14a6:	aa                   	stos   %al,%es:(%edi)
    14a7:	14 00                	adc    $0x0,%al
    14a9:	00 04 04             	add    %al,(%esp,%eax,1)
    14ac:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    14ad:	00 00                	add    %al,(%eax)
    14af:	00 99 14 00 00 0f    	add    %bl,0xf000014(%ecx)
    14b5:	04 ee                	add    $0xee,%al
    14b7:	13 00                	adc    (%eax),%eax
    14b9:	00 36                	add    %dh,(%esi)
    14bb:	04 c0                	add    $0xc0,%al
    14bd:	14 00                	adc    $0x0,%al
    14bf:	00 0e                	add    %cl,(%esi)
    14c1:	ee                   	out    %al,(%dx)
    14c2:	13 00                	adc    (%eax),%eax
    14c4:	00 3f                	add    %bh,(%edi)
    14c6:	36 14 00             	ss adc $0x0,%al
    14c9:	00 5a 89             	add    %bl,-0x77(%edx)
    14cc:	04 08                	add    $0x8,%al
    14ce:	2e 00 00             	add    %al,%cs:(%eax)
    14d1:	00 01                	add    %al,(%ecx)
    14d3:	9c                   	pushf  
    14d4:	dc 14 00             	fcoml  (%eax,%eax,1)
    14d7:	00 e9                	add    %ch,%cl
    14d9:	14 00                	adc    $0x0,%al
    14db:	00 40 55             	add    %al,0x55(%eax)
    14de:	05 00 00 e9 14       	add    $0x14e90000,%eax
    14e3:	00 00                	add    %al,(%eax)
    14e5:	02 91 00 00 0e b4    	add    -0x4bf20000(%ecx),%dl
    14eb:	14 00                	adc    $0x0,%al
    14ed:	00 3f                	add    %bh,(%edi)
    14ef:	58                   	pop    %eax
    14f0:	14 00                	adc    $0x0,%al
    14f2:	00 88 89 04 08 2e    	add    %cl,0x2e080489(%eax)
    14f8:	00 00                	add    %al,(%eax)
    14fa:	00 01                	add    %al,(%ecx)
    14fc:	9c                   	pushf  
    14fd:	05 15 00 00 12       	add    $0x12000015,%eax
    1502:	15 00 00 40 55       	adc    $0x55400000,%eax
    1507:	05 00 00 e9 14       	add    $0x14e90000,%eax
    150c:	00 00                	add    %al,(%eax)
    150e:	02 91 00 00 3f 7a    	add    0x7a3f0000(%ecx),%dl
    1514:	14 00                	adc    $0x0,%al
    1516:	00 b6 89 04 08 2e    	add    %dh,0x2e080489(%esi)
    151c:	00 00                	add    %al,(%eax)
    151e:	00 01                	add    %al,(%ecx)
    1520:	9c                   	pushf  
    1521:	29 15 00 00 36 15    	sub    %edx,0x15360000
    1527:	00 00                	add    %al,(%eax)
    1529:	40                   	inc    %eax
    152a:	55                   	push   %ebp
    152b:	05 00 00 e9 14       	add    $0x14e90000,%eax
    1530:	00 00                	add    %al,(%eax)
    1532:	02 91 00 00 41 22    	add    0x22410000(%ecx),%dl
    1538:	14 00                	adc    $0x0,%al
    153a:	00 01                	add    %al,(%ecx)
    153c:	04 02                	add    $0x2,%al
    153e:	46                   	inc    %esi
    153f:	15 00 00 50 15       	adc    $0x15500000,%eax
    1544:	00 00                	add    %al,(%eax)
    1546:	42                   	inc    %edx
    1547:	55                   	push   %ebp
    1548:	05 00 00 e9 14       	add    $0x14e90000,%eax
    154d:	00 00                	add    %al,(%eax)
    154f:	00 43 36             	add    %al,0x36(%ebx)
    1552:	15 00 00 33 09       	adc    $0x9330000,%eax
    1557:	00 00                	add    %al,(%eax)
    1559:	e4 89                	in     $0x89,%al
    155b:	04 08                	add    $0x8,%al
    155d:	0e                   	push   %cs
    155e:	00 00                	add    %al,(%eax)
    1560:	00 01                	add    %al,(%ecx)
    1562:	9c                   	pushf  
    1563:	6b 15 00 00 74 15 00 	imul   $0x0,0x15740000,%edx
    156a:	00 44 46 15          	add    %al,0x15(%esi,%eax,2)
    156e:	00 00                	add    %al,(%eax)
    1570:	02 91 00 00 45 0f    	add    0xf450000(%ecx),%dl
    1576:	00 00                	add    %al,(%eax)
    1578:	00 01                	add    %al,(%ecx)
    157a:	15 ca 00 00 00       	adc    $0xca,%eax
    157f:	6b 87 04 08 93 01 00 	imul   $0x0,0x1930804(%edi),%eax
    1586:	00 01                	add    %al,(%ecx)
    1588:	9c                   	pushf  
    1589:	bd 15 00 00 46       	mov    $0x46000015,%ebp
    158e:	7d 87                	jge    1517 <_init-0x8047085>
    1590:	04 08                	add    $0x8,%al
    1592:	77 01                	ja     1595 <_init-0x8047007>
    1594:	00 00                	add    %al,(%eax)
    1596:	47                   	inc    %edi
    1597:	62 63 00             	bound  %esp,0x0(%ebx)
    159a:	01 18                	add    %ebx,(%eax)
    159c:	ee                   	out    %al,(%dx)
    159d:	13 00                	adc    (%eax),%eax
    159f:	00 02                	add    %al,(%edx)
    15a1:	75 70                	jne    1613 <_init-0x8046f89>
    15a3:	03 cb                	add    %ebx,%ecx
    15a5:	09 00                	or     %eax,(%eax)
    15a7:	00 01                	add    %al,(%ecx)
    15a9:	20 bd 15 00 00 47    	and    %bh,0x47000015(%ebp)
    15af:	66 70 00             	data16 jo 15b2 <_init-0x8046fea>
    15b2:	01 21                	add    %esp,(%ecx)
    15b4:	a3 15 00 00 02       	mov    %eax,0x2000015
    15b9:	75 74                	jne    162f <_init-0x8046f6d>
    15bb:	00 00                	add    %al,(%eax)
    15bd:	0f 04                	(bad)  
    15bf:	c3                   	ret    
    15c0:	15 00 00 48 49       	adc    $0x49480000,%eax
    15c5:	c7 07 00 00 fe 88    	movl   $0x88fe0000,(%edi)
    15cb:	04 08                	add    $0x8,%al
    15cd:	41                   	inc    %ecx
    15ce:	00 00                	add    %al,(%eax)
    15d0:	00 01                	add    %al,(%ecx)
    15d2:	9c                   	pushf  
    15d3:	f4                   	hlt    
    15d4:	15 00 00 4a ac       	adc    $0xac4a0000,%eax
    15d9:	05 00 00 01 29       	add    $0x29010000,%eax
    15de:	ca 00 00             	lret   $0x0
    15e1:	00 02                	add    %al,(%edx)
    15e3:	91                   	xchg   %eax,%ecx
    15e4:	00 4a 22             	add    %cl,0x22(%edx)
    15e7:	05 00 00 01 29       	add    $0x29010000,%eax
    15ec:	ca 00 00             	lret   $0x0
    15ef:	00 02                	add    %al,(%edx)
    15f1:	91                   	xchg   %eax,%ecx
    15f2:	04 00                	add    $0x0,%al
    15f4:	4b                   	dec    %ebx
    15f5:	00 00                	add    %al,(%eax)
    15f7:	00 00                	add    %al,(%eax)
    15f9:	3f                   	aas    
    15fa:	89 04 08             	mov    %eax,(%eax,%ecx,1)
    15fd:	1a 00                	sbb    (%eax),%al
    15ff:	00 00                	add    %al,(%eax)
    1601:	01 9c 4c 1a 0b 00 00 	add    %ebx,0xb1a(%esp,%ecx,2)
    1608:	46                   	inc    %esi
    1609:	13 00                	adc    (%eax),%eax
    160b:	00 4d 94             	add    %cl,-0x6c(%ebp)
    160e:	08 00                	or     %al,(%eax)
    1610:	00 05 03 4d 92 04    	add    %al,0x4924d03
    1616:	08 4e 2d             	or     %cl,0x2d(%esi)
    1619:	10 00                	adc    %al,(%eax)
    161b:	00 96 03 00 00 80    	add    %dl,-0x7ffffffd(%esi)
    1621:	80 80 80 78 4f 38 10 	addb   $0x10,0x384f7880(%eax)
    1628:	00 00                	add    %al,(%eax)
    162a:	59                   	pop    %ecx
    162b:	00 00                	add    %al,(%eax)
    162d:	00 ff                	add    %bh,%bh
    162f:	ff                   	(bad)  
    1630:	ff                   	(bad)  
    1631:	7f 50                	jg     1683 <_init-0x8046f19>
    1633:	90                   	nop
    1634:	10 00                	adc    %al,(%eax)
    1636:	00 6a 06             	add    %ch,0x6(%edx)
    1639:	00 00                	add    %al,(%eax)
    163b:	20 50 bc             	and    %dl,-0x44(%eax)
    163e:	10 00                	adc    %al,(%eax)
    1640:	00 87 08 00 00 7f    	add    %al,0x7f000008(%edi)
    1646:	4e                   	dec    %esi
    1647:	ef                   	out    %eax,(%dx)
    1648:	10 00                	adc    %al,(%eax)
    164a:	00 ea                	add    %ch,%dl
    164c:	05 00 00 80 80       	add    $0x80800000,%eax
    1651:	7e 51                	jle    16a4 <_init-0x8046ef8>
    1653:	fa                   	cli    
    1654:	10 00                	adc    %al,(%eax)
    1656:	00 97 02 00 00 ff    	add    %dl,-0xfffffe(%edi)
    165c:	7f 00                	jg     165e <_init-0x8046f3e>

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
 32a:	0d 00 03 0e 49       	or     $0x490e0300,%eax
 32f:	13 38                	adc    (%eax),%edi
 331:	0b 34 19             	or     (%ecx,%ebx,1),%esi
 334:	32 0b                	xor    (%ebx),%cl
 336:	00 00                	add    %al,(%eax)
 338:	3b 2e                	cmp    (%esi),%ebp
 33a:	01 3f                	add    %edi,(%edi)
 33c:	19 03                	sbb    %eax,(%ebx)
 33e:	0e                   	push   %cs
 33f:	34 19                	xor    $0x19,%al
 341:	32 0b                	xor    (%ebx),%cl
 343:	3c 19                	cmp    $0x19,%al
 345:	64 13 01             	adc    %fs:(%ecx),%eax
 348:	13 00                	adc    (%eax),%eax
 34a:	00 3c 2e             	add    %bh,(%esi,%ebp,1)
 34d:	01 3f                	add    %edi,(%edi)
 34f:	19 03                	sbb    %eax,(%ebx)
 351:	0e                   	push   %cs
 352:	3a 0b                	cmp    (%ebx),%cl
 354:	3b 0b                	cmp    (%ebx),%ecx
 356:	6e                   	outsb  %ds:(%esi),(%dx)
 357:	0e                   	push   %cs
 358:	4c                   	dec    %esp
 359:	0b 4d 18             	or     0x18(%ebp),%ecx
 35c:	1d 13 32 0b 3c       	sbb    $0x3c0b3213,%eax
 361:	19 64 13 01          	sbb    %esp,0x1(%ebx,%edx,1)
 365:	13 00                	adc    (%eax),%eax
 367:	00 3d 2e 01 3f 19    	add    %bh,0x193f012e
 36d:	03 0e                	add    (%esi),%ecx
 36f:	3a 0b                	cmp    (%ebx),%cl
 371:	3b 0b                	cmp    (%ebx),%ecx
 373:	6e                   	outsb  %ds:(%esi),(%dx)
 374:	0e                   	push   %cs
 375:	4c                   	dec    %esp
 376:	0b 4d 18             	or     0x18(%ebp),%ecx
 379:	1d 13 32 0b 3c       	sbb    $0x3c0b3213,%eax
 37e:	19 64 13 00          	sbb    %esp,0x0(%ebx,%edx,1)
 382:	00 3e                	add    %bh,(%esi)
 384:	15 01 49 13 01       	adc    $0x1134901,%eax
 389:	13 00                	adc    (%eax),%eax
 38b:	00 3f                	add    %bh,(%edi)
 38d:	2e 01 47 13          	add    %eax,%cs:0x13(%edi)
 391:	11 01                	adc    %eax,(%ecx)
 393:	12 06                	adc    (%esi),%al
 395:	40                   	inc    %eax
 396:	18 64 13 96          	sbb    %ah,-0x6a(%ebx,%edx,1)
 39a:	42                   	inc    %edx
 39b:	19 01                	sbb    %eax,(%ecx)
 39d:	13 00                	adc    (%eax),%eax
 39f:	00 40 05             	add    %al,0x5(%eax)
 3a2:	00 03                	add    %al,(%ebx)
 3a4:	0e                   	push   %cs
 3a5:	49                   	dec    %ecx
 3a6:	13 34 19             	adc    (%ecx,%ebx,1),%esi
 3a9:	02 18                	add    (%eax),%bl
 3ab:	00 00                	add    %al,(%eax)
 3ad:	41                   	inc    %ecx
 3ae:	2e 01 47 13          	add    %eax,%cs:0x13(%edi)
 3b2:	3a 0b                	cmp    (%ebx),%cl
 3b4:	3b 0b                	cmp    (%ebx),%ecx
 3b6:	20 0b                	and    %cl,(%ebx)
 3b8:	64 13 01             	adc    %fs:(%ecx),%eax
 3bb:	13 00                	adc    (%eax),%eax
 3bd:	00 42 05             	add    %al,0x5(%edx)
 3c0:	00 03                	add    %al,(%ebx)
 3c2:	0e                   	push   %cs
 3c3:	49                   	dec    %ecx
 3c4:	13 34 19             	adc    (%ecx,%ebx,1),%esi
 3c7:	00 00                	add    %al,(%eax)
 3c9:	43                   	inc    %ebx
 3ca:	2e 01 31             	add    %esi,%cs:(%ecx)
 3cd:	13 6e 0e             	adc    0xe(%esi),%ebp
 3d0:	11 01                	adc    %eax,(%ecx)
 3d2:	12 06                	adc    (%esi),%al
 3d4:	40                   	inc    %eax
 3d5:	18 64 13 97          	sbb    %ah,-0x69(%ebx,%edx,1)
 3d9:	42                   	inc    %edx
 3da:	19 01                	sbb    %eax,(%ecx)
 3dc:	13 00                	adc    (%eax),%eax
 3de:	00 44 05 00          	add    %al,0x0(%ebp,%eax,1)
 3e2:	31 13                	xor    %edx,(%ebx)
 3e4:	02 18                	add    (%eax),%bl
 3e6:	00 00                	add    %al,(%eax)
 3e8:	45                   	inc    %ebp
 3e9:	2e 01 3f             	add    %edi,%cs:(%edi)
 3ec:	19 03                	sbb    %eax,(%ebx)
 3ee:	0e                   	push   %cs
 3ef:	3a 0b                	cmp    (%ebx),%cl
 3f1:	3b 0b                	cmp    (%ebx),%ecx
 3f3:	49                   	dec    %ecx
 3f4:	13 11                	adc    (%ecx),%edx
 3f6:	01 12                	add    %edx,(%edx)
 3f8:	06                   	push   %es
 3f9:	40                   	inc    %eax
 3fa:	18 96 42 19 01 13    	sbb    %dl,0x13011942(%esi)
 400:	00 00                	add    %al,(%eax)
 402:	46                   	inc    %esi
 403:	0b 01                	or     (%ecx),%eax
 405:	11 01                	adc    %eax,(%ecx)
 407:	12 06                	adc    (%esi),%al
 409:	00 00                	add    %al,(%eax)
 40b:	47                   	inc    %edi
 40c:	34 00                	xor    $0x0,%al
 40e:	03 08                	add    (%eax),%ecx
 410:	3a 0b                	cmp    (%ebx),%cl
 412:	3b 0b                	cmp    (%ebx),%ecx
 414:	49                   	dec    %ecx
 415:	13 02                	adc    (%edx),%eax
 417:	18 00                	sbb    %al,(%eax)
 419:	00 48 15             	add    %cl,0x15(%eax)
 41c:	00 00                	add    %al,(%eax)
 41e:	00 49 2e             	add    %cl,0x2e(%ecx)
 421:	01 03                	add    %eax,(%ebx)
 423:	0e                   	push   %cs
 424:	34 19                	xor    $0x19,%al
 426:	11 01                	adc    %eax,(%ecx)
 428:	12 06                	adc    (%esi),%al
 42a:	40                   	inc    %eax
 42b:	18 96 42 19 01 13    	sbb    %dl,0x13011942(%esi)
 431:	00 00                	add    %al,(%eax)
 433:	4a                   	dec    %edx
 434:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 439:	0b 3b                	or     (%ebx),%edi
 43b:	0b 49 13             	or     0x13(%ecx),%ecx
 43e:	02 18                	add    (%eax),%bl
 440:	00 00                	add    %al,(%eax)
 442:	4b                   	dec    %ebx
 443:	2e 00 03             	add    %al,%cs:(%ebx)
 446:	0e                   	push   %cs
 447:	34 19                	xor    $0x19,%al
 449:	11 01                	adc    %eax,(%ecx)
 44b:	12 06                	adc    (%esi),%al
 44d:	40                   	inc    %eax
 44e:	18 96 42 19 00 00    	sbb    %dl,0x1942(%esi)
 454:	4c                   	dec    %esp
 455:	34 00                	xor    $0x0,%al
 457:	03 0e                	add    (%esi),%ecx
 459:	49                   	dec    %ecx
 45a:	13 3f                	adc    (%edi),%edi
 45c:	19 34 19             	sbb    %esi,(%ecx,%ebx,1)
 45f:	3c 19                	cmp    $0x19,%al
 461:	00 00                	add    %al,(%eax)
 463:	4d                   	dec    %ebp
 464:	34 00                	xor    $0x0,%al
 466:	47                   	inc    %edi
 467:	13 02                	adc    (%edx),%eax
 469:	18 00                	sbb    %al,(%eax)
 46b:	00 4e 34             	add    %cl,0x34(%esi)
 46e:	00 47 13             	add    %al,0x13(%edi)
 471:	6e                   	outsb  %ds:(%esi),(%dx)
 472:	0e                   	push   %cs
 473:	1c 0d                	sbb    $0xd,%al
 475:	00 00                	add    %al,(%eax)
 477:	4f                   	dec    %edi
 478:	34 00                	xor    $0x0,%al
 47a:	47                   	inc    %edi
 47b:	13 6e 0e             	adc    0xe(%esi),%ebp
 47e:	1c 06                	sbb    $0x6,%al
 480:	00 00                	add    %al,(%eax)
 482:	50                   	push   %eax
 483:	34 00                	xor    $0x0,%al
 485:	47                   	inc    %edi
 486:	13 6e 0e             	adc    0xe(%esi),%ebp
 489:	1c 0b                	sbb    $0xb,%al
 48b:	00 00                	add    %al,(%eax)
 48d:	51                   	push   %ecx
 48e:	34 00                	xor    $0x0,%al
 490:	47                   	inc    %edi
 491:	13 6e 0e             	adc    0xe(%esi),%ebp
 494:	1c 05                	sbb    $0x5,%al
 496:	00 00                	add    %al,(%eax)
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	bf 02 00 00 02       	mov    $0x2000002,%edi
   5:	00 34 02             	add    %dh,(%edx,%eax,1)
   8:	00 00                	add    %al,(%eax)
   a:	01 01                	add    %eax,(%ecx)
   c:	fb                   	sti    
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	2f                   	das    
  1c:	75 73                	jne    91 <_init-0x804850b>
  1e:	72 2f                	jb     4f <_init-0x804854d>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  27:	2f                   	das    
  28:	63 2b                	arpl   %bp,(%ebx)
  2a:	2b 2f                	sub    (%edi),%ebp
  2c:	34 2e                	xor    $0x2e,%al
  2e:	39 00                	cmp    %eax,(%eax)
  30:	2f                   	das    
  31:	75 73                	jne    a6 <_init-0x80484f6>
  33:	72 2f                	jb     64 <_init-0x8048538>
  35:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  3c:	00 2f                	add    %ch,(%edi)
  3e:	75 73                	jne    b3 <_init-0x80484e9>
  40:	72 2f                	jb     71 <_init-0x804852b>
  42:	6c                   	insb   (%dx),%es:(%edi)
  43:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%edx),%esp
  4a:	69 35 38 36 2d 6c 69 	imul   $0x78756e69,0x6c2d3638,%esi
  51:	6e 75 78 
  54:	2d 67 6e 75 2f       	sub    $0x2f756e67,%eax
  59:	34 2e                	xor    $0x2e,%al
  5b:	39 2f                	cmp    %ebp,(%edi)
  5d:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  64:	00 2f                	add    %ch,(%edi)
  66:	75 73                	jne    db <_init-0x80484c1>
  68:	72 2f                	jb     99 <_init-0x8048503>
  6a:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  71:	2f                   	das    
  72:	63 2b                	arpl   %bp,(%ebx)
  74:	2b 2f                	sub    (%edi),%ebp
  76:	34 2e                	xor    $0x2e,%al
  78:	39 2f                	cmp    %ebp,(%edi)
  7a:	62 69 74             	bound  %ebp,0x74(%ecx)
  7d:	73 00                	jae    7f <_init-0x804851d>
  7f:	2f                   	das    
  80:	75 73                	jne    f5 <_init-0x80484a7>
  82:	72 2f                	jb     b3 <_init-0x80484e9>
  84:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  8b:	2f                   	das    
  8c:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
  92:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%esi),%ebp
  99:	75 2f                	jne    ca <_init-0x80484d2>
  9b:	63 2b                	arpl   %bp,(%ebx)
  9d:	2b 2f                	sub    (%edi),%ebp
  9f:	34 2e                	xor    $0x2e,%al
  a1:	39 2f                	cmp    %ebp,(%edi)
  a3:	62 69 74             	bound  %ebp,0x74(%ecx)
  a6:	73 00                	jae    a8 <_init-0x80484f4>
  a8:	2f                   	das    
  a9:	75 73                	jne    11e <_init-0x804847e>
  ab:	72 2f                	jb     dc <_init-0x80484c0>
  ad:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  b4:	2f                   	das    
  b5:	63 2b                	arpl   %bp,(%ebx)
  b7:	2b 2f                	sub    (%edi),%ebp
  b9:	34 2e                	xor    $0x2e,%al
  bb:	39 2f                	cmp    %ebp,(%edi)
  bd:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
  c2:	00 2f                	add    %ch,(%edi)
  c4:	75 73                	jne    139 <_init-0x8048463>
  c6:	72 2f                	jb     f7 <_init-0x80484a5>
  c8:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  cf:	2f                   	das    
  d0:	63 2b                	arpl   %bp,(%ebx)
  d2:	2b 2f                	sub    (%edi),%ebp
  d4:	34 2e                	xor    $0x2e,%al
  d6:	39 2f                	cmp    %ebp,(%edi)
  d8:	65 78 74             	gs js  14f <_init-0x804844d>
  db:	00 2f                	add    %ch,(%edi)
  dd:	75 73                	jne    152 <_init-0x804844a>
  df:	72 2f                	jb     110 <_init-0x804848c>
  e1:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%esi),%ebp
  e8:	2f                   	das    
  e9:	69 33 38 36 2d 6c    	imul   $0x6c2d3638,(%ebx),%esi
  ef:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%esi),%ebp
  f6:	75 2f                	jne    127 <_init-0x8048475>
  f8:	62 69 74             	bound  %ebp,0x74(%ecx)
  fb:	73 00                	jae    fd <_init-0x804849f>
  fd:	00 76 74             	add    %dh,0x74(%esi)
 100:	62 6c 5f 6e          	bound  %ebp,0x6e(%edi,%ebx,2)
 104:	6f                   	outsl  %ds:(%esi),(%dx)
 105:	5f                   	pop    %edi
 106:	69 6e 68 65 72 69 74 	imul   $0x74697265,0x68(%esi),%ebp
 10d:	61                   	popa   
 10e:	6e                   	outsb  %ds:(%esi),(%dx)
 10f:	63 65 2e             	arpl   %sp,0x2e(%ebp)
 112:	63 70 70             	arpl   %si,0x70(%eax)
 115:	00 00                	add    %al,(%eax)
 117:	00 00                	add    %al,(%eax)
 119:	69 6f 73 74 72 65 61 	imul   $0x61657274,0x73(%edi),%ebp
 120:	6d                   	insl   (%dx),%es:(%edi)
 121:	00 01                	add    %al,(%ecx)
 123:	00 00                	add    %al,(%eax)
 125:	73 74                	jae    19b <_init-0x8048401>
 127:	64 69 6f 2e 68 00 02 	imul   $0x20068,%fs:0x2e(%edi),%ebp
 12e:	00 
 12f:	00 73 74             	add    %dh,0x74(%ebx)
 132:	64 61                	fs popa 
 134:	72 67                	jb     19d <_init-0x80483ff>
 136:	2e 68 00 03 00 00    	cs push $0x300
 13c:	73 74                	jae    1b2 <_init-0x80483ea>
 13e:	64 64 65 66 2e 68 00 	fs fs gs cs pushw $0x300
 145:	03 
 146:	00 00                	add    %al,(%eax)
 148:	77 63                	ja     1ad <_init-0x80483ef>
 14a:	68 61 72 2e 68       	push   $0x682e7261
 14f:	00 02                	add    %al,(%edx)
 151:	00 00                	add    %al,(%eax)
 153:	63 77 63             	arpl   %si,0x63(%edi)
 156:	68 61 72 00 01       	push   $0x1007261
 15b:	00 00                	add    %al,(%eax)
 15d:	63 68 61             	arpl   %bp,0x61(%eax)
 160:	72 5f                	jb     1c1 <_init-0x80483db>
 162:	74 72                	je     1d6 <_init-0x80483c6>
 164:	61                   	popa   
 165:	69 74 73 2e 68 00 04 	imul   $0x40068,0x2e(%ebx,%esi,2),%esi
 16c:	00 
 16d:	00 63 2b             	add    %ah,0x2b(%ebx)
 170:	2b 63 6f             	sub    0x6f(%ebx),%esp
 173:	6e                   	outsb  %ds:(%esi),(%dx)
 174:	66 69 67 2e 68 00    	imul   $0x68,0x2e(%edi),%sp
 17a:	05 00 00 63 6c       	add    $0x6c630000,%eax
 17f:	6f                   	outsl  %ds:(%esi),(%dx)
 180:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 183:	65 00 01             	add    %al,%gs:(%ecx)
 186:	00 00                	add    %al,(%eax)
 188:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 18f:	65 2e 68 00 04 00 00 	gs cs push $0x400
 196:	63 77 63             	arpl   %si,0x63(%edi)
 199:	74 79                	je     214 <_init-0x8048388>
 19b:	70 65                	jo     202 <_init-0x804839a>
 19d:	00 01                	add    %al,(%ecx)
 19f:	00 00                	add    %al,(%eax)
 1a1:	69 6f 73 66 77 64 00 	imul   $0x647766,0x73(%edi),%ebp
 1a8:	01 00                	add    %eax,(%eax)
 1aa:	00 74 69 6d          	add    %dh,0x6d(%ecx,%ebp,2)
 1ae:	65 2e 68 00 02 00 00 	gs cs push $0x200
 1b5:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
 1ba:	2e 68 00 06 00 00    	cs push $0x600
 1c0:	70 72                	jo     234 <_init-0x8048368>
 1c2:	65 64 65 66 69 6e 65 	gs fs imul $0x5f64,%gs:0x65(%esi),%bp
 1c9:	64 5f 
 1cb:	6f                   	outsl  %ds:(%esi),(%dx)
 1cc:	70 73                	jo     241 <_init-0x804835b>
 1ce:	2e 68 00 04 00 00    	cs push $0x400
 1d4:	6e                   	outsb  %ds:(%esi),(%dx)
 1d5:	65 77 5f             	gs ja  237 <_init-0x8048365>
 1d8:	61                   	popa   
 1d9:	6c                   	insb   (%dx),%es:(%edi)
 1da:	6c                   	insb   (%dx),%es:(%edi)
 1db:	6f                   	outsl  %ds:(%esi),(%dx)
 1dc:	63 61 74             	arpl   %sp,0x74(%ecx)
 1df:	6f                   	outsl  %ds:(%esi),(%dx)
 1e0:	72 2e                	jb     210 <_init-0x804838c>
 1e2:	68 00 07 00 00       	push   $0x700
 1e7:	6e                   	outsb  %ds:(%esi),(%dx)
 1e8:	75 6d                	jne    257 <_init-0x8048345>
 1ea:	65 72 69             	gs jb  256 <_init-0x8048346>
 1ed:	63 5f 74             	arpl   %bx,0x74(%edi)
 1f0:	72 61                	jb     253 <_init-0x8048349>
 1f2:	69 74 73 2e 68 00 07 	imul   $0x70068,0x2e(%ebx,%esi,2),%esi
 1f9:	00 
 1fa:	00 6c 6f 63          	add    %ch,0x63(%edi,%ebp,2)
 1fe:	61                   	popa   
 1ff:	6c                   	insb   (%dx),%es:(%edi)
 200:	65 2e 68 00 02 00 00 	gs cs push $0x200
 207:	74 79                	je     282 <_init-0x804831a>
 209:	70 65                	jo     270 <_init-0x804832c>
 20b:	73 2e                	jae    23b <_init-0x8048361>
 20d:	68 00 08 00 00       	push   $0x800
 212:	61                   	popa   
 213:	74 6f                	je     284 <_init-0x8048318>
 215:	6d                   	insl   (%dx),%es:(%edi)
 216:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%ebx),%esp
 21d:	2e 68 00 05 00 00    	cs push $0x500
 223:	77 63                	ja     288 <_init-0x8048314>
 225:	74 79                	je     2a0 <_init-0x80482fc>
 227:	70 65                	jo     28e <_init-0x804830e>
 229:	2e 68 00 02 00 00    	cs push $0x200
 22f:	3c 62                	cmp    $0x62,%al
 231:	75 69                	jne    29c <_init-0x8048300>
 233:	6c                   	insb   (%dx),%es:(%edi)
 234:	74 2d                	je     263 <_init-0x8048339>
 236:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%esi),%ebp
 23d:	00 00                	add    %al,(%eax)
 23f:	05 02 5a 89 04       	add    $0x4895a02,%eax
 244:	08 18                	or     %bl,(%eax)
 246:	68 02 26 13 02       	push   $0x2132602
 24b:	02 00                	add    (%eax),%al
 24d:	01 01                	add    %eax,(%ecx)
 24f:	00 05 02 88 89 04    	add    %al,0x4898802
 255:	08 03                	or     %al,(%ebx)
 257:	0a 01                	or     (%ecx),%al
 259:	68 02 26 13 02       	push   $0x2132602
 25e:	02 00                	add    (%eax),%al
 260:	01 01                	add    %eax,(%ecx)
 262:	00 05 02 b6 89 04    	add    %al,0x489b602
 268:	08 03                	or     %al,(%ebx)
 26a:	0e                   	push   %cs
 26b:	01 68 02             	add    %ebp,0x2(%eax)
 26e:	26 13 02             	adc    %es:(%edx),%eax
 271:	02 00                	add    (%eax),%al
 273:	01 01                	add    %eax,(%ecx)
 275:	00 05 02 e4 89 04    	add    %al,0x489e402
 27b:	08 15 3c 02 0b 00    	or     %dl,0xb023c
 281:	01 01                	add    %eax,(%ecx)
 283:	00 05 02 6b 87 04    	add    %al,0x4876b02
 289:	08 03                	or     %al,(%ebx)
 28b:	15 01 08 22 e5       	adc    $0xe5220801,%eax
 290:	02 38                	add    (%eax),%bh
 292:	13 02                	adc    (%edx),%eax
 294:	3a 13                	cmp    (%ebx),%dl
 296:	02 3d 13 02 3d 13    	add    0x133d0213,%bh
 29c:	02 3d 16 75 9f 59    	add    0x599f7516,%bh
 2a2:	c9                   	leave  
 2a3:	59                   	pop    %ecx
 2a4:	c9                   	leave  
 2a5:	59                   	pop    %ecx
 2a6:	59                   	pop    %ecx
 2a7:	9e                   	sahf   
 2a8:	66 00 02             	data16 add %al,(%edx)
 2ab:	04 01                	add    $0x1,%al
 2ad:	06                   	push   %es
 2ae:	66 04 02             	data16 add $0x2,%al
 2b1:	06                   	push   %es
 2b2:	03 21                	add    (%ecx),%esp
 2b4:	90                   	nop
 2b5:	04 01                	add    $0x1,%al
 2b7:	03 5f 02             	add    0x2(%edi),%ebx
 2ba:	2a 01                	sub    (%ecx),%al
 2bc:	2e 66 02 14 00       	data16 add %cs:(%eax,%eax,1),%dl
 2c1:	01 01                	add    %eax,(%ecx)

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
   9:	73 75                	jae    80 <_init-0x804851c>
   b:	62 5f 49             	bound  %ebx,0x49(%edi)
   e:	5f                   	pop    %edi
   f:	6d                   	insl   (%dx),%es:(%edi)
  10:	61                   	popa   
  11:	69 6e 00 5f 53 5f 65 	imul   $0x655f535f,0x0(%esi),%ebp
  18:	6e                   	outsb  %ds:(%esi),(%dx)
  19:	64 00 73 69          	add    %dh,%fs:0x69(%ebx)
  1d:	7a 65                	jp     84 <_init-0x8048518>
  1f:	5f                   	pop    %edi
  20:	74 00                	je     22 <_init-0x804857a>
  22:	73 69                	jae    8d <_init-0x804850f>
  24:	7a 65                	jp     8b <_init-0x8048511>
  26:	74 79                	je     a1 <_init-0x80484fb>
  28:	70 65                	jo     8f <_init-0x804850d>
  2a:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
  2e:	68 6f 75 72 00       	push   $0x72756f
  33:	5f                   	pop    %edi
  34:	5f                   	pop    %edi
  35:	76 61                	jbe    98 <_init-0x8048504>
  37:	6c                   	insb   (%dx),%es:(%edi)
  38:	75 65                	jne    9f <_init-0x80484fd>
  3a:	00 5f 5f             	add    %bl,0x5f(%edi)
  3d:	6e                   	outsb  %ds:(%esi),(%dx)
  3e:	75 6d                	jne    ad <_init-0x80484ef>
  40:	65 72 69             	gs jb  ac <_init-0x80484f0>
  43:	63 5f 74             	arpl   %bx,0x74(%edi)
  46:	72 61                	jb     a9 <_init-0x80484f3>
  48:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
  4f:	65 
  50:	67 65 72 3c          	addr16 gs jb 90 <_init-0x804850c>
  54:	69 6e 74 3e 00 5f 5a 	imul   $0x5a5f003e,0x74(%esi),%ebp
  5b:	4e                   	dec    %esi
  5c:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
  5f:	67 6e                	outsb  %ds:(%si),(%dx)
  61:	75 5f                	jne    c2 <_init-0x80484da>
  63:	63 78 78             	arpl   %di,0x78(%eax)
  66:	32 34 5f             	xor    (%edi,%ebx,2),%dh
  69:	5f                   	pop    %edi
  6a:	6e                   	outsb  %ds:(%esi),(%dx)
  6b:	75 6d                	jne    da <_init-0x80484c2>
  6d:	65 72 69             	gs jb  d9 <_init-0x80484c3>
  70:	63 5f 74             	arpl   %bx,0x74(%edi)
  73:	72 61                	jb     d6 <_init-0x80484c6>
  75:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
  7c:	65 
  7d:	67 65 72 49          	addr16 gs jb ca <_init-0x80484d2>
  81:	69 45 35 5f 5f 6d 61 	imul   $0x616d5f5f,0x35(%ebp),%eax
  88:	78 45                	js     cf <_init-0x80484cd>
  8a:	00 5f 5f             	add    %bl,0x5f(%edi)
  8d:	6d                   	insl   (%dx),%es:(%edi)
  8e:	61                   	popa   
  8f:	78 00                	js     91 <_init-0x804850b>
  91:	77 63                	ja     f6 <_init-0x80484a6>
  93:	73 63                	jae    f8 <_init-0x80484a4>
  95:	73 70                	jae    107 <_init-0x8048495>
  97:	6e                   	outsb  %ds:(%esi),(%dx)
  98:	00 6c 6f 63          	add    %ch,0x63(%edi,%ebp,2)
  9c:	61                   	popa   
  9d:	6c                   	insb   (%dx),%es:(%edi)
  9e:	65 63 6f 6e          	arpl   %bp,%gs:0x6e(%edi)
  a2:	76 00                	jbe    a4 <_init-0x80484f8>
  a4:	5f                   	pop    %edi
  a5:	5f                   	pop    %edi
  a6:	76 74                	jbe    11c <_init-0x8048480>
  a8:	62 6c 5f 70          	bound  %ebp,0x70(%edi,%ebx,2)
  ac:	74 72                	je     120 <_init-0x804847c>
  ae:	5f                   	pop    %edi
  af:	74 79                	je     12a <_init-0x8048472>
  b1:	70 65                	jo     118 <_init-0x8048484>
  b3:	00 69 6e             	add    %ch,0x6e(%ecx)
  b6:	74 5f                	je     117 <_init-0x8048485>
  b8:	63 75 72             	arpl   %si,0x72(%ebp)
  bb:	72 5f                	jb     11c <_init-0x8048480>
  bd:	73 79                	jae    138 <_init-0x8048464>
  bf:	6d                   	insl   (%dx),%es:(%edi)
  c0:	62 6f 6c             	bound  %ebp,0x6c(%edi)
  c3:	00 77 63             	add    %dh,0x63(%edi)
  c6:	73 63                	jae    12b <_init-0x8048471>
  c8:	68 72 00 5f 53       	push   $0x535f0072
  cd:	5f                   	pop    %edi
  ce:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  d1:	6c                   	insb   (%dx),%es:(%edi)
  d2:	61                   	popa   
  d3:	6c                   	insb   (%dx),%es:(%edi)
  d4:	70 68                	jo     13e <_init-0x804845e>
  d6:	61                   	popa   
  d7:	00 5f 53             	add    %bl,0x53(%edi)
  da:	5f                   	pop    %edi
  db:	62 61 64             	bound  %esp,0x64(%ecx)
  de:	62 69 74             	bound  %ebp,0x74(%ecx)
  e1:	00 6d 62             	add    %ch,0x62(%ebp)
  e4:	72 74                	jb     15a <_init-0x8048442>
  e6:	6f                   	outsl  %ds:(%esi),(%dx)
  e7:	77 63                	ja     14c <_init-0x8048450>
  e9:	00 77 63             	add    %dh,0x63(%edi)
  ec:	73 78                	jae    166 <_init-0x8048436>
  ee:	66 72 6d             	data16 jb 15e <_init-0x804843e>
  f1:	00 69 6e             	add    %ch,0x6e(%ecx)
  f4:	74 5f                	je     155 <_init-0x8048447>
  f6:	66 72 61             	data16 jb 15a <_init-0x8048442>
  f9:	63 5f 64             	arpl   %bx,0x64(%edi)
  fc:	69 67 69 74 73 00 5f 	imul   $0x5f007374,0x69(%edi),%esp
 103:	53                   	push   %ebx
 104:	5f                   	pop    %edi
 105:	62 65 67             	bound  %esp,0x67(%ebp)
 108:	00 77 63             	add    %dh,0x63(%edi)
 10b:	73 63                	jae    170 <_init-0x804842c>
 10d:	6f                   	outsl  %ds:(%esi),(%dx)
 10e:	6c                   	insb   (%dx),%es:(%edi)
 10f:	6c                   	insb   (%dx),%es:(%edi)
 110:	00 5f 5f             	add    %bl,0x5f(%edi)
 113:	77 63                	ja     178 <_init-0x8048424>
 115:	68 00 5f 53 5f       	push   $0x5f535f00
 11a:	62 61 73             	bound  %esp,0x73(%ecx)
 11d:	65 66 69 65 6c 64 00 	imul   $0x64,%gs:0x6c(%ebp),%sp
 124:	47                   	inc    %edi
 125:	4e                   	dec    %esi
 126:	55                   	push   %ebp
 127:	20 43 2b             	and    %al,0x2b(%ebx)
 12a:	2b 20                	sub    (%eax),%esp
 12c:	34 2e                	xor    $0x2e,%al
 12e:	39 2e                	cmp    %ebp,(%esi)
 130:	32 20                	xor    (%eax),%ah
 132:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
 137:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
 13d:	72 69                	jb     1a8 <_init-0x80483f4>
 13f:	63 20                	arpl   %sp,(%eax)
 141:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 146:	68 3d 69 35 38       	push   $0x3835693d
 14b:	36 20 2d 67 00 5f 5a 	and    %ch,%ss:0x5a5f0067
 152:	4e                   	dec    %esi
 153:	53                   	push   %ebx
 154:	74 31                	je     187 <_init-0x8048415>
 156:	31 63 68             	xor    %esp,0x68(%ebx)
 159:	61                   	popa   
 15a:	72 5f                	jb     1bb <_init-0x80483e1>
 15c:	74 72                	je     1d0 <_init-0x80483cc>
 15e:	61                   	popa   
 15f:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%ebx,%esi,2),%esi
 166:	31 
 167:	74 6f                	je     1d8 <_init-0x80483c4>
 169:	5f                   	pop    %edi
 16a:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 171:	65 45                	gs inc %ebp
 173:	52                   	push   %edx
 174:	4b                   	dec    %ebx
 175:	63 00                	arpl   %ax,(%eax)
 177:	6d                   	insl   (%dx),%es:(%edi)
 178:	6f                   	outsl  %ds:(%esi),(%dx)
 179:	6e                   	outsb  %ds:(%esi),(%dx)
 17a:	5f                   	pop    %edi
 17b:	64 65 63 69 6d       	fs arpl %bp,%gs:0x6d(%ecx)
 180:	61                   	popa   
 181:	6c                   	insb   (%dx),%es:(%edi)
 182:	5f                   	pop    %edi
 183:	70 6f                	jo     1f4 <_init-0x80483a8>
 185:	69 6e 74 00 5f 5f 6e 	imul   $0x6e5f5f00,0x74(%esi),%ebp
 18c:	75 6d                	jne    1fb <_init-0x80483a1>
 18e:	65 72 69             	gs jb  1fa <_init-0x80483a2>
 191:	63 5f 74             	arpl   %bx,0x74(%edi)
 194:	72 61                	jb     1f7 <_init-0x80483a5>
 196:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 19d:	65 
 19e:	67 65 72 3c          	addr16 gs jb 1de <_init-0x80483be>
 1a2:	63 68 61             	arpl   %bp,0x61(%eax)
 1a5:	72 3e                	jb     1e5 <_init-0x80483b7>
 1a7:	00 76 77             	add    %dh,0x77(%esi)
 1aa:	70 72                	jo     21e <_init-0x804837e>
 1ac:	69 6e 74 66 00 5f 49 	imul   $0x495f0066,0x74(%esi),%ebp
 1b3:	6f                   	outsl  %ds:(%esi),(%dx)
 1b4:	73 5f                	jae    215 <_init-0x8048387>
 1b6:	4f                   	dec    %edi
 1b7:	70 65                	jo     21e <_init-0x804837e>
 1b9:	6e                   	outsb  %ds:(%esi),(%dx)
 1ba:	6d                   	insl   (%dx),%es:(%edi)
 1bb:	6f                   	outsl  %ds:(%esi),(%dx)
 1bc:	64 65 00 69 6e       	fs add %ch,%gs:0x6e(%ecx)
 1c1:	74 5f                	je     222 <_init-0x804837a>
 1c3:	6e                   	outsb  %ds:(%esi),(%dx)
 1c4:	5f                   	pop    %edi
 1c5:	63 73 5f             	arpl   %si,0x5f(%ebx)
 1c8:	70 72                	jo     23c <_init-0x8048360>
 1ca:	65 63 65 64          	arpl   %sp,%gs:0x64(%ebp)
 1ce:	65 73 00             	gs jae 1d1 <_init-0x80483cb>
 1d1:	74 6f                	je     242 <_init-0x804835a>
 1d3:	77 63                	ja     238 <_init-0x8048364>
 1d5:	74 72                	je     249 <_init-0x8048353>
 1d7:	61                   	popa   
 1d8:	6e                   	outsb  %ds:(%esi),(%dx)
 1d9:	73 00                	jae    1db <_init-0x80483c1>
 1db:	63 6f 70             	arpl   %bp,0x70(%edi)
 1de:	79 00                	jns    1e0 <_init-0x80483bc>
 1e0:	5f                   	pop    %edi
 1e1:	5f                   	pop    %edi
 1e2:	69 6f 69 6e 69 74 00 	imul   $0x74696e,0x69(%edi),%ebp
 1e9:	5f                   	pop    %edi
 1ea:	53                   	push   %ebx
 1eb:	5f                   	pop    %edi
 1ec:	73 79                	jae    267 <_init-0x8048335>
 1ee:	6e                   	outsb  %ds:(%esi),(%dx)
 1ef:	63 65 64             	arpl   %sp,0x64(%ebp)
 1f2:	5f                   	pop    %edi
 1f3:	77 69                	ja     25e <_init-0x804833e>
 1f5:	74 68                	je     25f <_init-0x804833d>
 1f7:	5f                   	pop    %edi
 1f8:	73 74                	jae    26e <_init-0x804832e>
 1fa:	64 69 6f 00 5f 56 61 	imul   $0x6c61565f,%fs:0x0(%edi),%ebp
 201:	6c 
 202:	75 65                	jne    269 <_init-0x8048333>
 204:	00 5f 53             	add    %bl,0x53(%edi)
 207:	5f                   	pop    %edi
 208:	65 6f                	outsl  %gs:(%esi),(%dx)
 20a:	66 62 69 74          	bound  %bp,0x74(%ecx)
 20e:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 212:	79 64                	jns    278 <_init-0x8048324>
 214:	61                   	popa   
 215:	79 00                	jns    217 <_init-0x8048385>
 217:	5f                   	pop    %edi
 218:	49                   	dec    %ecx
 219:	4f                   	dec    %edi
 21a:	5f                   	pop    %edi
 21b:	46                   	inc    %esi
 21c:	49                   	dec    %ecx
 21d:	4c                   	dec    %esp
 21e:	45                   	inc    %ebp
 21f:	00 62 61             	add    %ah,0x61(%edx)
 222:	73 69                	jae    28d <_init-0x804830f>
 224:	63 5f 6f             	arpl   %bx,0x6f(%edi)
 227:	73 74                	jae    29d <_init-0x80482ff>
 229:	72 65                	jb     290 <_init-0x804830c>
 22b:	61                   	popa   
 22c:	6d                   	insl   (%dx),%es:(%edi)
 22d:	3c 63                	cmp    $0x63,%al
 22f:	68 61 72 2c 20       	push   $0x202c7261
 234:	73 74                	jae    2aa <_init-0x80482f2>
 236:	64 3a 3a             	cmp    %fs:(%edx),%bh
 239:	63 68 61             	arpl   %bp,0x61(%eax)
 23c:	72 5f                	jb     29d <_init-0x80482ff>
 23e:	74 72                	je     2b2 <_init-0x80482ea>
 240:	61                   	popa   
 241:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%ebx,%esi,2),%esi
 248:	72 
 249:	3e 20 3e             	and    %bh,%ds:(%esi)
 24c:	00 77 63             	add    %dh,0x63(%edi)
 24f:	74 79                	je     2ca <_init-0x80482d2>
 251:	70 65                	jo     2b8 <_init-0x80482e4>
 253:	5f                   	pop    %edi
 254:	74 00                	je     256 <_init-0x8048346>
 256:	66 67 65 74 77       	data16 addr16 gs je 2d2 <_init-0x80482ca>
 25b:	63 00                	arpl   %ax,(%eax)
 25d:	67 65 74 77          	addr16 gs je 2d8 <_init-0x80482c4>
 261:	63 68 61             	arpl   %bp,0x61(%eax)
 264:	72 00                	jb     266 <_init-0x8048336>
 266:	66 67 65 74 77       	data16 addr16 gs je 2e2 <_init-0x80482ba>
 26b:	73 00                	jae    26d <_init-0x804832f>
 26d:	5f                   	pop    %edi
 26e:	53                   	push   %ebx
 26f:	5f                   	pop    %edi
 270:	72 69                	jb     2db <_init-0x80482c1>
 272:	67 68 74 00 75 6e    	addr16 push $0x6e750074
 278:	73 69                	jae    2e3 <_init-0x80482b9>
 27a:	67 6e                	outsb  %ds:(%si),(%dx)
 27c:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
 281:	61                   	popa   
 282:	72 00                	jb     284 <_init-0x8048318>
 284:	77 6d                	ja     2f3 <_init-0x80482a9>
 286:	65 6d                	gs insl (%dx),%es:(%edi)
 288:	63 68 72             	arpl   %bp,0x72(%eax)
 28b:	00 5f 53             	add    %bl,0x53(%edi)
 28e:	5f                   	pop    %edi
 28f:	67 6f                	outsl  %ds:(%si),(%dx)
 291:	6f                   	outsl  %ds:(%esi),(%dx)
 292:	64 62 69 74          	bound  %ebp,%fs:0x74(%ecx)
 296:	00 5f 5a             	add    %bl,0x5a(%edi)
 299:	4e                   	dec    %esi
 29a:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 29d:	67 6e                	outsb  %ds:(%si),(%dx)
 29f:	75 5f                	jne    300 <_init-0x804829c>
 2a1:	63 78 78             	arpl   %di,0x78(%eax)
 2a4:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 2a7:	5f                   	pop    %edi
 2a8:	6e                   	outsb  %ds:(%esi),(%dx)
 2a9:	75 6d                	jne    318 <_init-0x8048284>
 2ab:	65 72 69             	gs jb  317 <_init-0x8048285>
 2ae:	63 5f 74             	arpl   %bx,0x74(%edi)
 2b1:	72 61                	jb     314 <_init-0x8048288>
 2b3:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 2ba:	65 
 2bb:	67 65 72 49          	addr16 gs jb 308 <_init-0x8048294>
 2bf:	73 45                	jae    306 <_init-0x8048296>
 2c1:	35 5f 5f 6d 61       	xor    $0x616d5f5f,%eax
 2c6:	78 45                	js     30d <_init-0x804828f>
 2c8:	00 5f 53             	add    %bl,0x53(%edi)
 2cb:	5f                   	pop    %edi
 2cc:	62 69 6e             	bound  %ebp,0x6e(%ecx)
 2cf:	00 77 63             	add    %dh,0x63(%edi)
 2d2:	73 63                	jae    337 <_init-0x8048265>
 2d4:	6d                   	insl   (%dx),%es:(%edi)
 2d5:	70 00                	jo     2d7 <_init-0x80482c5>
 2d7:	5f                   	pop    %edi
 2d8:	5f                   	pop    %edi
 2d9:	62 75 69             	bound  %esi,0x69(%ebp)
 2dc:	6c                   	insb   (%dx),%es:(%edi)
 2dd:	74 69                	je     348 <_init-0x8048254>
 2df:	6e                   	outsb  %ds:(%esi),(%dx)
 2e0:	5f                   	pop    %edi
 2e1:	76 61                	jbe    344 <_init-0x8048258>
 2e3:	5f                   	pop    %edi
 2e4:	6c                   	insb   (%dx),%es:(%edi)
 2e5:	69 73 74 00 6e 6f 74 	imul   $0x746f6e00,0x74(%ebx),%esi
 2ec:	5f                   	pop    %edi
 2ed:	65 6f                	outsl  %gs:(%esi),(%dx)
 2ef:	66 00 5f 5f          	data16 add %bl,0x5f(%edi)
 2f3:	67 6e                	outsb  %ds:(%si),(%dx)
 2f5:	75 63                	jne    35a <_init-0x8048242>
 2f7:	5f                   	pop    %edi
 2f8:	76 61                	jbe    35b <_init-0x8048241>
 2fa:	5f                   	pop    %edi
 2fb:	6c                   	insb   (%dx),%es:(%edi)
 2fc:	69 73 74 00 5f 5f 69 	imul   $0x695f5f00,0x74(%ebx),%esi
 303:	73 5f                	jae    364 <_init-0x8048238>
 305:	73 69                	jae    370 <_init-0x804822c>
 307:	67 6e                	outsb  %ds:(%si),(%dx)
 309:	65 64 00 5f 53       	gs add %bl,%fs:0x53(%edi)
 30e:	5f                   	pop    %edi
 30f:	6f                   	outsl  %ds:(%esi),(%dx)
 310:	75 74                	jne    386 <_init-0x8048216>
 312:	00 5f 53             	add    %bl,0x53(%edi)
 315:	5f                   	pop    %edi
 316:	61                   	popa   
 317:	70 70                	jo     389 <_init-0x8048213>
 319:	00 5f 5a             	add    %bl,0x5a(%edi)
 31c:	4e                   	dec    %esi
 31d:	53                   	push   %ebx
 31e:	74 31                	je     351 <_init-0x804824b>
 320:	31 63 68             	xor    %esp,0x68(%ebx)
 323:	61                   	popa   
 324:	72 5f                	jb     385 <_init-0x8048217>
 326:	74 72                	je     39a <_init-0x8048202>
 328:	61                   	popa   
 329:	69 74 73 49 63 45 34 	imul   $0x6d344563,0x49(%ebx,%esi,2),%esi
 330:	6d 
 331:	6f                   	outsl  %ds:(%esi),(%dx)
 332:	76 65                	jbe    399 <_init-0x8048203>
 334:	45                   	inc    %ebp
 335:	50                   	push   %eax
 336:	63 50 4b             	arpl   %dx,0x4b(%eax)
 339:	63 6a 00             	arpl   %bp,0x0(%edx)
 33c:	6f                   	outsl  %ds:(%esi),(%dx)
 33d:	70 65                	jo     3a4 <_init-0x80481f8>
 33f:	6e                   	outsb  %ds:(%esi),(%dx)
 340:	6d                   	insl   (%dx),%es:(%edi)
 341:	6f                   	outsl  %ds:(%esi),(%dx)
 342:	64 65 00 77 63       	fs add %dh,%gs:0x63(%edi)
 347:	73 6e                	jae    3b7 <_init-0x80481e5>
 349:	63 6d 70             	arpl   %bp,0x70(%ebp)
 34c:	00 69 6e             	add    %ch,0x6e(%ecx)
 34f:	74 5f                	je     3b0 <_init-0x80481ec>
 351:	6e                   	outsb  %ds:(%esi),(%dx)
 352:	5f                   	pop    %edi
 353:	73 69                	jae    3be <_init-0x80481de>
 355:	67 6e                	outsb  %ds:(%si),(%dx)
 357:	5f                   	pop    %edi
 358:	70 6f                	jo     3c9 <_init-0x80481d3>
 35a:	73 6e                	jae    3ca <_init-0x80481d2>
 35c:	00 77 6d             	add    %dh,0x6d(%edi)
 35f:	65 6d                	gs insl (%dx),%es:(%edi)
 361:	6d                   	insl   (%dx),%es:(%edi)
 362:	6f                   	outsl  %ds:(%esi),(%dx)
 363:	76 65                	jbe    3ca <_init-0x80481d2>
 365:	00 5f 5f             	add    %bl,0x5f(%edi)
 368:	6d                   	insl   (%dx),%es:(%edi)
 369:	69 6e 00 62 74 6f 77 	imul   $0x776f7462,0x0(%esi),%ebp
 370:	63 00                	arpl   %ax,(%eax)
 372:	6d                   	insl   (%dx),%es:(%edi)
 373:	6f                   	outsl  %ds:(%esi),(%dx)
 374:	6e                   	outsb  %ds:(%esi),(%dx)
 375:	5f                   	pop    %edi
 376:	74 68                	je     3e0 <_init-0x80481bc>
 378:	6f                   	outsl  %ds:(%esi),(%dx)
 379:	75 73                	jne    3ee <_init-0x80481ae>
 37b:	61                   	popa   
 37c:	6e                   	outsb  %ds:(%esi),(%dx)
 37d:	64 73 5f             	fs jae 3df <_init-0x80481bd>
 380:	73 65                	jae    3e7 <_init-0x80481b5>
 382:	70 00                	jo     384 <_init-0x8048218>
 384:	75 6e                	jne    3f4 <_init-0x80481a8>
 386:	67 65 74 77          	addr16 gs je 401 <_init-0x804819b>
 38a:	63 00                	arpl   %ax,(%eax)
 38c:	70 74                	jo     402 <_init-0x804819a>
 38e:	72 64                	jb     3f4 <_init-0x80481a8>
 390:	69 66 66 5f 74 00 5f 	imul   $0x5f00745f,0x66(%esi),%esp
 397:	5a                   	pop    %edx
 398:	4e                   	dec    %esi
 399:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 39c:	67 6e                	outsb  %ds:(%si),(%dx)
 39e:	75 5f                	jne    3ff <_init-0x804819d>
 3a0:	63 78 78             	arpl   %di,0x78(%eax)
 3a3:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 3a6:	5f                   	pop    %edi
 3a7:	6e                   	outsb  %ds:(%esi),(%dx)
 3a8:	75 6d                	jne    417 <_init-0x8048185>
 3aa:	65 72 69             	gs jb  416 <_init-0x8048186>
 3ad:	63 5f 74             	arpl   %bx,0x74(%edi)
 3b0:	72 61                	jb     413 <_init-0x8048189>
 3b2:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 3b9:	65 
 3ba:	67 65 72 49          	addr16 gs jb 407 <_init-0x8048195>
 3be:	69 45 35 5f 5f 6d 69 	imul   $0x696d5f5f,0x35(%ebp),%eax
 3c5:	6e                   	outsb  %ds:(%esi),(%dx)
 3c6:	45                   	inc    %ebp
 3c7:	00 77 63             	add    %dh,0x63(%edi)
 3ca:	74 72                	je     43e <_init-0x804815e>
 3cc:	61                   	popa   
 3cd:	6e                   	outsb  %ds:(%esi),(%dx)
 3ce:	73 5f                	jae    42f <_init-0x804816d>
 3d0:	74 00                	je     3d2 <_init-0x80481ca>
 3d2:	6d                   	insl   (%dx),%es:(%edi)
 3d3:	62 72 6c             	bound  %esi,0x6c(%edx)
 3d6:	65 6e                	outsb  %gs:(%esi),(%dx)
 3d8:	00 6e 65             	add    %ch,0x65(%esi)
 3db:	67 61                	addr16 popa 
 3dd:	74 69                	je     448 <_init-0x8048154>
 3df:	76 65                	jbe    446 <_init-0x8048156>
 3e1:	5f                   	pop    %edi
 3e2:	73 69                	jae    44d <_init-0x804814f>
 3e4:	67 6e                	outsb  %ds:(%si),(%dx)
 3e6:	00 5f 53             	add    %bl,0x53(%edi)
 3e9:	5f                   	pop    %edi
 3ea:	68 65 78 00 69       	push   $0x69007865
 3ef:	6e                   	outsb  %ds:(%esi),(%dx)
 3f0:	74 5f                	je     451 <_init-0x804814b>
 3f2:	70 5f                	jo     453 <_init-0x8048149>
 3f4:	63 73 5f             	arpl   %si,0x5f(%ebx)
 3f7:	70 72                	jo     46b <_init-0x8048131>
 3f9:	65 63 65 64          	arpl   %sp,%gs:0x64(%ebp)
 3fd:	65 73 00             	gs jae 400 <_init-0x804819c>
 400:	77 63                	ja     465 <_init-0x8048137>
 402:	73 74                	jae    478 <_init-0x8048124>
 404:	6f                   	outsl  %ds:(%esi),(%dx)
 405:	75 6c                	jne    473 <_init-0x8048129>
 407:	6c                   	insb   (%dx),%es:(%edi)
 408:	00 5f 53             	add    %bl,0x53(%edi)
 40b:	5f                   	pop    %edi
 40c:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%esi),%ebp
 413:	6c                   	insb   (%dx),%es:(%edi)
 414:	00 63 6f             	add    %ah,0x6f(%ebx)
 417:	6d                   	insl   (%dx),%es:(%edi)
 418:	70 61                	jo     47b <_init-0x8048121>
 41a:	72 65                	jb     481 <_init-0x804811b>
 41c:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 420:	6d                   	insl   (%dx),%es:(%edi)
 421:	64 61                	fs popa 
 423:	79 00                	jns    425 <_init-0x8048177>
 425:	2f                   	das    
 426:	72 6f                	jb     497 <_init-0x8048105>
 428:	6f                   	outsl  %ds:(%esi),(%dx)
 429:	74 2f                	je     45a <_init-0x8048142>
 42b:	70 72                	jo     49f <_init-0x80480fd>
 42d:	6f                   	outsl  %ds:(%esi),(%dx)
 42e:	67 72 61             	addr16 jb 492 <_init-0x804810a>
 431:	6d                   	insl   (%dx),%es:(%edi)
 432:	6d                   	insl   (%dx),%es:(%edi)
 433:	69 6e 67 2f 63 70 70 	imul   $0x7070632f,0x67(%esi),%ebp
 43a:	2f                   	das    
 43b:	76 69                	jbe    4a6 <_init-0x80480f6>
 43d:	72 74                	jb     4b3 <_init-0x80480e9>
 43f:	75 61                	jne    4a2 <_init-0x80480fa>
 441:	6c                   	insb   (%dx),%es:(%edi)
 442:	2f                   	das    
 443:	76 74                	jbe    4b9 <_init-0x80480e3>
 445:	62 6c 5f 70          	bound  %ebp,0x70(%edi,%ebx,2)
 449:	72 6f                	jb     4ba <_init-0x80480e2>
 44b:	62 65 00             	bound  %esp,0x0(%ebp)
 44e:	66 69 6e 64 00 77    	imul   $0x7700,0x64(%esi),%bp
 454:	63 73 63             	arpl   %si,0x63(%ebx)
 457:	70 79                	jo     4d2 <_init-0x80480ca>
 459:	00 5f 43             	add    %bl,0x43(%edi)
 45c:	68 61 72 54 00       	push   $0x547261
 461:	76 73                	jbe    4d6 <_init-0x80480c6>
 463:	77 70                	ja     4d5 <_init-0x80480c7>
 465:	72 69                	jb     4d0 <_init-0x80480cc>
 467:	6e                   	outsb  %ds:(%esi),(%dx)
 468:	74 66                	je     4d0 <_init-0x80480cc>
 46a:	00 77 6d             	add    %dh,0x6d(%edi)
 46d:	65 6d                	gs insl (%dx),%es:(%edi)
 46f:	73 65                	jae    4d6 <_init-0x80480c6>
 471:	74 00                	je     473 <_init-0x8048129>
 473:	73 65                	jae    4da <_init-0x80480c2>
 475:	65 6b 64 69 72 00    	imul   $0x0,%gs:0x72(%ecx,%ebp,2),%esp
 47b:	66 77 69             	data16 ja 4e7 <_init-0x80480b5>
 47e:	64 65 00 74 6d 5f    	fs add %dh,%gs:0x5f(%ebp,%ebp,2)
 484:	73 65                	jae    4eb <_init-0x80480b1>
 486:	63 00                	arpl   %ax,(%eax)
 488:	74 6d                	je     4f7 <_init-0x80480a5>
 48a:	5f                   	pop    %edi
 48b:	69 73 64 73 74 00 77 	imul   $0x77007473,0x64(%ebx),%esi
 492:	63 73 6e             	arpl   %si,0x6e(%ebx)
 495:	63 70 79             	arpl   %si,0x79(%eax)
 498:	00 70 75             	add    %dh,0x75(%eax)
 49b:	74 77                	je     514 <_init-0x8048088>
 49d:	63 68 61             	arpl   %bp,0x61(%eax)
 4a0:	72 00                	jb     4a2 <_init-0x80480fa>
 4a2:	5f                   	pop    %edi
 4a3:	5a                   	pop    %edx
 4a4:	4e                   	dec    %esi
 4a5:	31 30                	xor    %esi,(%eax)
 4a7:	62 61 73             	bound  %esp,0x73(%ecx)
 4aa:	65 5f                	gs pop %edi
 4ac:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 4b0:	73 37                	jae    4e9 <_init-0x80480b3>
 4b2:	76 5f                	jbe    513 <_init-0x8048089>
 4b4:	66 75 6e             	data16 jne 525 <_init-0x8048077>
 4b7:	63 31                	arpl   %si,(%ecx)
 4b9:	45                   	inc    %ebp
 4ba:	76 00                	jbe    4bc <_init-0x80480e0>
 4bc:	77 6d                	ja     52b <_init-0x8048071>
 4be:	65 6d                	gs insl (%dx),%es:(%edi)
 4c0:	63 6d 70             	arpl   %bp,0x70(%ebp)
 4c3:	00 5f 5a             	add    %bl,0x5a(%edi)
 4c6:	4e                   	dec    %esi
 4c7:	53                   	push   %ebx
 4c8:	74 31                	je     4fb <_init-0x80480a1>
 4ca:	31 63 68             	xor    %esp,0x68(%ebx)
 4cd:	61                   	popa   
 4ce:	72 5f                	jb     52f <_init-0x804806d>
 4d0:	74 72                	je     544 <_init-0x8048058>
 4d2:	61                   	popa   
 4d3:	69 74 73 49 63 45 34 	imul   $0x63344563,0x49(%ebx,%esi,2),%esi
 4da:	63 
 4db:	6f                   	outsl  %ds:(%esi),(%dx)
 4dc:	70 79                	jo     557 <_init-0x8048045>
 4de:	45                   	inc    %ebp
 4df:	50                   	push   %eax
 4e0:	63 50 4b             	arpl   %dx,0x4b(%eax)
 4e3:	63 6a 00             	arpl   %bp,0x0(%edx)
 4e6:	5f                   	pop    %edi
 4e7:	5a                   	pop    %edx
 4e8:	4e                   	dec    %esi
 4e9:	53                   	push   %ebx
 4ea:	74 31                	je     51d <_init-0x804807f>
 4ec:	31 63 68             	xor    %esp,0x68(%ebx)
 4ef:	61                   	popa   
 4f0:	72 5f                	jb     551 <_init-0x804804b>
 4f2:	74 72                	je     566 <_init-0x8048036>
 4f4:	61                   	popa   
 4f5:	69 74 73 49 63 45 32 	imul   $0x6c324563,0x49(%ebx,%esi,2),%esi
 4fc:	6c 
 4fd:	74 45                	je     544 <_init-0x8048058>
 4ff:	52                   	push   %edx
 500:	4b                   	dec    %ebx
 501:	63 53 32             	arpl   %dx,0x32(%ebx)
 504:	5f                   	pop    %edi
 505:	00 5f 53             	add    %bl,0x53(%edi)
 508:	5f                   	pop    %edi
 509:	66 69 78 65 64 00    	imul   $0x64,0x65(%eax),%di
 50f:	69 6e 74 5f 6e 5f 73 	imul   $0x735f6e5f,0x74(%esi),%ebp
 516:	65 70 5f             	gs jo  578 <_init-0x8048024>
 519:	62 79 5f             	bound  %edi,0x5f(%ecx)
 51c:	73 70                	jae    58e <_init-0x804800e>
 51e:	61                   	popa   
 51f:	63 65 00             	arpl   %sp,0x0(%ebp)
 522:	5f                   	pop    %edi
 523:	5f                   	pop    %edi
 524:	70 72                	jo     598 <_init-0x8048004>
 526:	69 6f 72 69 74 79 00 	imul   $0x797469,0x72(%edi),%ebp
 52d:	5f                   	pop    %edi
 52e:	53                   	push   %ebx
 52f:	5f                   	pop    %edi
 530:	73 68                	jae    59a <_init-0x8048002>
 532:	6f                   	outsl  %ds:(%esi),(%dx)
 533:	77 62                	ja     597 <_init-0x8048005>
 535:	61                   	popa   
 536:	73 65                	jae    59d <_init-0x8047fff>
 538:	00 5f 53             	add    %bl,0x53(%edi)
 53b:	5f                   	pop    %edi
 53c:	69 6e 00 5f 5f 67 6e 	imul   $0x6e675f5f,0x0(%esi),%ebp
 543:	75 5f                	jne    5a4 <_init-0x8047ff8>
 545:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
 54a:	00 76 66             	add    %dh,0x66(%esi)
 54d:	77 70                	ja     5bf <_init-0x8047fdd>
 54f:	72 69                	jb     5ba <_init-0x8047fe2>
 551:	6e                   	outsb  %ds:(%esi),(%dx)
 552:	74 66                	je     5ba <_init-0x8047fe2>
 554:	00 74 68 69          	add    %dh,0x69(%eax,%ebp,2)
 558:	73 00                	jae    55a <_init-0x8048042>
 55a:	76 73                	jbe    5cf <_init-0x8047fcd>
 55c:	77 73                	ja     5d1 <_init-0x8047fcb>
 55e:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 561:	66 00 65 71          	data16 add %ah,0x71(%ebp)
 565:	5f                   	pop    %edi
 566:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 56d:	65 00 5f 53          	add    %bl,%gs:0x53(%edi)
 571:	5f                   	pop    %edi
 572:	72 65                	jb     5d9 <_init-0x8047fc3>
 574:	66 63 6f 75          	data16 arpl %bp,0x75(%edi)
 578:	6e                   	outsb  %ds:(%esi),(%dx)
 579:	74 00                	je     57b <_init-0x8048021>
 57b:	5f                   	pop    %edi
 57c:	5a                   	pop    %edx
 57d:	4e                   	dec    %esi
 57e:	53                   	push   %ebx
 57f:	74 31                	je     5b2 <_init-0x8047fea>
 581:	31 63 68             	xor    %esp,0x68(%ebx)
 584:	61                   	popa   
 585:	72 5f                	jb     5e6 <_init-0x8047fb6>
 587:	74 72                	je     5fb <_init-0x8047fa1>
 589:	61                   	popa   
 58a:	69 74 73 49 63 45 31 	imul   $0x32314563,0x49(%ebx,%esi,2),%esi
 591:	32 
 592:	74 6f                	je     603 <_init-0x8047f99>
 594:	5f                   	pop    %edi
 595:	63 68 61             	arpl   %bp,0x61(%eax)
 598:	72 5f                	jb     5f9 <_init-0x8047fa3>
 59a:	74 79                	je     615 <_init-0x8047f87>
 59c:	70 65                	jo     603 <_init-0x8047f99>
 59e:	45                   	inc    %ebp
 59f:	52                   	push   %edx
 5a0:	4b                   	dec    %ebx
 5a1:	69 00 5f 53 5f 74    	imul   $0x745f535f,(%eax),%eax
 5a7:	72 75                	jb     61e <_init-0x8047f7e>
 5a9:	6e                   	outsb  %ds:(%esi),(%dx)
 5aa:	63 00                	arpl   %ax,(%eax)
 5ac:	5f                   	pop    %edi
 5ad:	5f                   	pop    %edi
 5ae:	69 6e 69 74 69 61 6c 	imul   $0x6c616974,0x69(%esi),%ebp
 5b5:	69 7a 65 5f 70 00 5f 	imul   $0x5f00705f,0x65(%edx),%edi
 5bc:	53                   	push   %ebx
 5bd:	5f                   	pop    %edi
 5be:	73 68                	jae    628 <_init-0x8047f74>
 5c0:	6f                   	outsl  %ds:(%esi),(%dx)
 5c1:	77 70                	ja     633 <_init-0x8047f69>
 5c3:	6f                   	outsl  %ds:(%esi),(%dx)
 5c4:	73 00                	jae    5c6 <_init-0x8047fd6>
 5c6:	77 6d                	ja     635 <_init-0x8047f67>
 5c8:	65 6d                	gs insl (%dx),%es:(%edi)
 5ca:	63 70 79             	arpl   %si,0x79(%eax)
 5cd:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 5d1:	6d                   	insl   (%dx),%es:(%edi)
 5d2:	6f                   	outsl  %ds:(%esi),(%dx)
 5d3:	6e                   	outsb  %ds:(%esi),(%dx)
 5d4:	00 5f 53             	add    %bl,0x53(%edi)
 5d7:	5f                   	pop    %edi
 5d8:	64 65 63 00          	fs arpl %ax,%gs:(%eax)
 5dc:	5f                   	pop    %edi
 5dd:	49                   	dec    %ecx
 5de:	6f                   	outsl  %ds:(%esi),(%dx)
 5df:	73 5f                	jae    640 <_init-0x8047f5c>
 5e1:	46                   	inc    %esi
 5e2:	6d                   	insl   (%dx),%es:(%edi)
 5e3:	74 66                	je     64b <_init-0x8047f51>
 5e5:	6c                   	insb   (%dx),%es:(%edi)
 5e6:	61                   	popa   
 5e7:	67 73 00             	addr16 jae 5ea <_init-0x8047fb2>
 5ea:	5f                   	pop    %edi
 5eb:	5a                   	pop    %edx
 5ec:	4e                   	dec    %esi
 5ed:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 5f0:	67 6e                	outsb  %ds:(%si),(%dx)
 5f2:	75 5f                	jne    653 <_init-0x8047f49>
 5f4:	63 78 78             	arpl   %di,0x78(%eax)
 5f7:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 5fa:	5f                   	pop    %edi
 5fb:	6e                   	outsb  %ds:(%esi),(%dx)
 5fc:	75 6d                	jne    66b <_init-0x8047f31>
 5fe:	65 72 69             	gs jb  66a <_init-0x8047f32>
 601:	63 5f 74             	arpl   %bx,0x74(%edi)
 604:	72 61                	jb     667 <_init-0x8047f35>
 606:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 60d:	65 
 60e:	67 65 72 49          	addr16 gs jb 65b <_init-0x8047f41>
 612:	73 45                	jae    659 <_init-0x8047f43>
 614:	35 5f 5f 6d 69       	xor    $0x696d5f5f,%eax
 619:	6e                   	outsb  %ds:(%esi),(%dx)
 61a:	45                   	inc    %ebp
 61b:	00 77 63             	add    %dh,0x63(%edi)
 61e:	74 6f                	je     68f <_init-0x8047f0d>
 620:	62 00                	bound  %eax,(%eax)
 622:	5f                   	pop    %edi
 623:	53                   	push   %ebx
 624:	5f                   	pop    %edi
 625:	73 68                	jae    68f <_init-0x8047f0d>
 627:	6f                   	outsl  %ds:(%esi),(%dx)
 628:	77 70                	ja     69a <_init-0x8047f02>
 62a:	6f                   	outsl  %ds:(%esi),(%dx)
 62b:	69 6e 74 00 5f 53 5f 	imul   $0x5f535f00,0x74(%esi),%ebp
 632:	73 6b                	jae    69f <_init-0x8047efd>
 634:	69 70 77 73 00 5f 53 	imul   $0x535f0073,0x77(%eax),%esi
 63b:	5f                   	pop    %edi
 63c:	61                   	popa   
 63d:	64 6a 75             	fs push $0x75
 640:	73 74                	jae    6b6 <_init-0x8047ee6>
 642:	66 69 65 6c 64 00    	imul   $0x64,0x6c(%ebp),%sp
 648:	5f                   	pop    %edi
 649:	5a                   	pop    %edx
 64a:	4e                   	dec    %esi
 64b:	53                   	push   %ebx
 64c:	74 31                	je     67f <_init-0x8047f1d>
 64e:	31 63 68             	xor    %esp,0x68(%ebx)
 651:	61                   	popa   
 652:	72 5f                	jb     6b3 <_init-0x8047ee9>
 654:	74 72                	je     6c8 <_init-0x8047ed4>
 656:	61                   	popa   
 657:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%ebx,%esi,2),%esi
 65e:	61 
 65f:	73 73                	jae    6d4 <_init-0x8047ec8>
 661:	69 67 6e 45 50 63 6a 	imul   $0x6a635045,0x6e(%edi),%esp
 668:	63 00                	arpl   %ax,(%eax)
 66a:	5f                   	pop    %edi
 66b:	5a                   	pop    %edx
 66c:	4e                   	dec    %esi
 66d:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 670:	67 6e                	outsb  %ds:(%si),(%dx)
 672:	75 5f                	jne    6d3 <_init-0x8047ec9>
 674:	63 78 78             	arpl   %di,0x78(%eax)
 677:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 67a:	5f                   	pop    %edi
 67b:	6e                   	outsb  %ds:(%esi),(%dx)
 67c:	75 6d                	jne    6eb <_init-0x8047eb1>
 67e:	65 72 69             	gs jb  6ea <_init-0x8047eb2>
 681:	63 5f 74             	arpl   %bx,0x74(%edi)
 684:	72 61                	jb     6e7 <_init-0x8047eb5>
 686:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 68d:	65 
 68e:	67 65 72 49          	addr16 gs jb 6db <_init-0x8047ec1>
 692:	6d                   	insl   (%dx),%es:(%edi)
 693:	45                   	inc    %ebp
 694:	38 5f 5f             	cmp    %bl,0x5f(%edi)
 697:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%edi),%esp
 69e:	00 
 69f:	66 6c                	data16 insb (%dx),%es:(%edi)
 6a1:	6f                   	outsl  %ds:(%esi),(%dx)
 6a2:	61                   	popa   
 6a3:	74 00                	je     6a5 <_init-0x8047ef7>
 6a5:	5f                   	pop    %edi
 6a6:	5a                   	pop    %edx
 6a7:	53                   	push   %ebx
 6a8:	74 34                	je     6de <_init-0x8047ebe>
 6aa:	63 6f 75             	arpl   %bp,0x75(%edi)
 6ad:	74 00                	je     6af <_init-0x8047eed>
 6af:	74 6d                	je     71e <_init-0x8047e7e>
 6b1:	5f                   	pop    %edi
 6b2:	6d                   	insl   (%dx),%es:(%edi)
 6b3:	69 6e 00 5f 53 5f 6c 	imul   $0x6c5f535f,0x0(%esi),%ebp
 6ba:	65 66 74 00          	gs data16 je 6be <_init-0x8047ede>
 6be:	63 68 61             	arpl   %bp,0x61(%eax)
 6c1:	72 5f                	jb     722 <_init-0x8047e7a>
 6c3:	74 72                	je     737 <_init-0x8047e65>
 6c5:	61                   	popa   
 6c6:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%ebx,%esi,2),%esi
 6cd:	72 
 6ce:	3e 00 70 6f          	add    %dh,%ds:0x6f(%eax)
 6d2:	73 69                	jae    73d <_init-0x8047e5f>
 6d4:	74 69                	je     73f <_init-0x8047e5d>
 6d6:	76 65                	jbe    73d <_init-0x8047e5f>
 6d8:	5f                   	pop    %edi
 6d9:	73 69                	jae    744 <_init-0x8047e58>
 6db:	67 6e                	outsb  %ds:(%si),(%dx)
 6dd:	00 5f 53             	add    %bl,0x53(%edi)
 6e0:	5f                   	pop    %edi
 6e1:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%edi),%ebp
 6e8:	6e                   	outsb  %ds:(%esi),(%dx)
 6e9:	6d                   	insl   (%dx),%es:(%edi)
 6ea:	6f                   	outsl  %ds:(%esi),(%dx)
 6eb:	64 65 5f             	fs gs pop %edi
 6ee:	65 6e                	outsb  %gs:(%esi),(%dx)
 6f0:	64 00 77 63          	add    %dh,%fs:0x63(%edi)
 6f4:	73 73                	jae    769 <_init-0x8047e33>
 6f6:	70 6e                	jo     766 <_init-0x8047e36>
 6f8:	00 5f 5a             	add    %bl,0x5a(%edi)
 6fb:	4e                   	dec    %esi
 6fc:	53                   	push   %ebx
 6fd:	74 31                	je     730 <_init-0x8047e6c>
 6ff:	31 63 68             	xor    %esp,0x68(%ebx)
 702:	61                   	popa   
 703:	72 5f                	jb     764 <_init-0x8047e38>
 705:	74 72                	je     779 <_init-0x8047e23>
 707:	61                   	popa   
 708:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%ebx,%esi,2),%esi
 70f:	31 
 710:	65 71 5f             	gs jno 772 <_init-0x8047e2a>
 713:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 71a:	65 45                	gs inc %ebp
 71c:	52                   	push   %edx
 71d:	4b                   	dec    %ebx
 71e:	69 53 32 5f 00 5f 53 	imul   $0x535f005f,0x32(%ebx),%edx
 725:	5f                   	pop    %edi
 726:	75 70                	jne    798 <_init-0x8047e04>
 728:	70 65                	jo     78f <_init-0x8047e0d>
 72a:	72 63                	jb     78f <_init-0x8047e0d>
 72c:	61                   	popa   
 72d:	73 65                	jae    794 <_init-0x8047e08>
 72f:	00 5f 41             	add    %bl,0x41(%edi)
 732:	74 6f                	je     7a3 <_init-0x8047df9>
 734:	6d                   	insl   (%dx),%es:(%edi)
 735:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%ebx),%esp
 73c:	00 5f 5a             	add    %bl,0x5a(%edi)
 73f:	4e                   	dec    %esi
 740:	31 30                	xor    %esi,(%eax)
 742:	62 61 73             	bound  %esp,0x73(%ecx)
 745:	65 5f                	gs pop %edi
 747:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 74b:	73 37                	jae    784 <_init-0x8047e18>
 74d:	76 5f                	jbe    7ae <_init-0x8047dee>
 74f:	66 75 6e             	data16 jne 7c0 <_init-0x8047ddc>
 752:	63 32                	arpl   %si,(%edx)
 754:	45                   	inc    %ebp
 755:	76 00                	jbe    757 <_init-0x8047e45>
 757:	5f                   	pop    %edi
 758:	53                   	push   %ebx
 759:	5f                   	pop    %edi
 75a:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%edi),%ebp
 761:	66 6c                	data16 insb (%dx),%es:(%edi)
 763:	61                   	popa   
 764:	67 73 5f             	addr16 jae 7c6 <_init-0x8047dd6>
 767:	65 6e                	outsb  %gs:(%esi),(%dx)
 769:	64 00 6f 73          	add    %ch,%fs:0x73(%edi)
 76d:	74 72                	je     7e1 <_init-0x8047dbb>
 76f:	65 61                	gs popa 
 771:	6d                   	insl   (%dx),%es:(%edi)
 772:	00 5f 5f             	add    %bl,0x5f(%edi)
 775:	63 6f 75             	arpl   %bp,0x75(%edi)
 778:	6e                   	outsb  %ds:(%esi),(%dx)
 779:	74 00                	je     77b <_init-0x8047e21>
 77b:	5f                   	pop    %edi
 77c:	5f                   	pop    %edi
 77d:	67 6e                	outsb  %ds:(%si),(%dx)
 77f:	75 5f                	jne    7e0 <_init-0x8047dbc>
 781:	63 78 78             	arpl   %di,0x78(%eax)
 784:	00 62 6f             	add    %ah,0x6f(%edx)
 787:	6f                   	outsl  %ds:(%esi),(%dx)
 788:	6c                   	insb   (%dx),%es:(%edi)
 789:	00 6c 6f 6e          	add    %ch,0x6e(%edi,%ebp,2)
 78d:	67 20 64 6f          	and    %ah,0x6f(%si)
 791:	75 62                	jne    7f5 <_init-0x8047da7>
 793:	6c                   	insb   (%dx),%es:(%edi)
 794:	65 00 5f 53          	add    %bl,%gs:0x53(%edi)
 798:	5f                   	pop    %edi
 799:	73 63                	jae    7fe <_init-0x8047d9e>
 79b:	69 65 6e 74 69 66 69 	imul   $0x69666974,0x6e(%ebp),%esp
 7a2:	63 00                	arpl   %ax,(%eax)
 7a4:	5f                   	pop    %edi
 7a5:	53                   	push   %ebx
 7a6:	5f                   	pop    %edi
 7a7:	66 6c                	data16 insb (%dx),%es:(%edi)
 7a9:	6f                   	outsl  %ds:(%esi),(%dx)
 7aa:	61                   	popa   
 7ab:	74 66                	je     813 <_init-0x8047d89>
 7ad:	69 65 6c 64 00 5f 53 	imul   $0x535f0064,0x6c(%ebp),%esp
 7b4:	5f                   	pop    %edi
 7b5:	6f                   	outsl  %ds:(%esi),(%dx)
 7b6:	63 74 00 5f          	arpl   %si,0x5f(%eax,%eax,1)
 7ba:	5f                   	pop    %edi
 7bb:	77 63                	ja     820 <_init-0x8047d7c>
 7bd:	68 62 00 62 69       	push   $0x69620062
 7c2:	6e                   	outsb  %ds:(%esi),(%dx)
 7c3:	61                   	popa   
 7c4:	72 79                	jb     83f <_init-0x8047d5d>
 7c6:	00 5f 5f             	add    %bl,0x5f(%edi)
 7c9:	73 74                	jae    83f <_init-0x8047d5d>
 7cb:	61                   	popa   
 7cc:	74 69                	je     837 <_init-0x8047d65>
 7ce:	63 5f 69             	arpl   %bx,0x69(%edi)
 7d1:	6e                   	outsb  %ds:(%esi),(%dx)
 7d2:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%ecx,%ebp,2),%esi
 7d9:	61 
 7da:	74 69                	je     845 <_init-0x8047d57>
 7dc:	6f                   	outsl  %ds:(%esi),(%dx)
 7dd:	6e                   	outsb  %ds:(%esi),(%dx)
 7de:	5f                   	pop    %edi
 7df:	61                   	popa   
 7e0:	6e                   	outsb  %ds:(%esi),(%dx)
 7e1:	64 5f                	fs pop %edi
 7e3:	64 65 73 74          	fs gs jae 85b <_init-0x8047d41>
 7e7:	72 75                	jb     85e <_init-0x8047d3e>
 7e9:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
 7ed:	6e                   	outsb  %ds:(%esi),(%dx)
 7ee:	5f                   	pop    %edi
 7ef:	30 00                	xor    %al,(%eax)
 7f1:	5f                   	pop    %edi
 7f2:	5a                   	pop    %edx
 7f3:	4e                   	dec    %esi
 7f4:	53                   	push   %ebx
 7f5:	74 31                	je     828 <_init-0x8047d74>
 7f7:	31 63 68             	xor    %esp,0x68(%ebx)
 7fa:	61                   	popa   
 7fb:	72 5f                	jb     85c <_init-0x8047d40>
 7fd:	74 72                	je     871 <_init-0x8047d2b>
 7ff:	61                   	popa   
 800:	69 74 73 49 63 45 37 	imul   $0x63374563,0x49(%ebx,%esi,2),%esi
 807:	63 
 808:	6f                   	outsl  %ds:(%esi),(%dx)
 809:	6d                   	insl   (%dx),%es:(%edi)
 80a:	70 61                	jo     86d <_init-0x8047d2f>
 80c:	72 65                	jb     873 <_init-0x8047d29>
 80e:	45                   	inc    %ebp
 80f:	50                   	push   %eax
 810:	4b                   	dec    %ebx
 811:	63 53 32             	arpl   %dx,0x32(%ebx)
 814:	5f                   	pop    %edi
 815:	6a 00                	push   $0x0
 817:	6c                   	insb   (%dx),%es:(%edi)
 818:	6f                   	outsl  %ds:(%esi),(%dx)
 819:	6e                   	outsb  %ds:(%esi),(%dx)
 81a:	67 20 6c 6f          	and    %ch,0x6f(%si)
 81e:	6e                   	outsb  %ds:(%esi),(%dx)
 81f:	67 20 75 6e          	and    %dh,0x6e(%di)
 823:	73 69                	jae    88e <_init-0x8047d0e>
 825:	67 6e                	outsb  %ds:(%si),(%dx)
 827:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 82c:	74 00                	je     82e <_init-0x8047d6e>
 82e:	77 63                	ja     893 <_init-0x8047d09>
 830:	73 70                	jae    8a2 <_init-0x8047cfa>
 832:	62 72 6b             	bound  %esi,0x6b(%edx)
 835:	00 77 63             	add    %dh,0x63(%edi)
 838:	73 74                	jae    8ae <_init-0x8047cee>
 83a:	6f                   	outsl  %ds:(%esi),(%dx)
 83b:	6c                   	insb   (%dx),%es:(%edi)
 83c:	64 00 69 6e          	add    %ch,%fs:0x6e(%ecx)
 840:	74 5f                	je     8a1 <_init-0x8047cfb>
 842:	70 5f                	jo     8a3 <_init-0x8047cf9>
 844:	73 65                	jae    8ab <_init-0x8047cf1>
 846:	70 5f                	jo     8a7 <_init-0x8047cf5>
 848:	62 79 5f             	bound  %edi,0x5f(%ecx)
 84b:	73 70                	jae    8bd <_init-0x8047cdf>
 84d:	61                   	popa   
 84e:	63 65 00             	arpl   %sp,0x0(%ebp)
 851:	5f                   	pop    %edi
 852:	53                   	push   %ebx
 853:	5f                   	pop    %edi
 854:	69 6f 73 5f 73 65 65 	imul   $0x6565735f,0x73(%edi),%ebp
 85b:	6b 64 69 72 5f       	imul   $0x5f,0x72(%ecx,%ebp,2),%esp
 860:	65 6e                	outsb  %gs:(%esi),(%dx)
 862:	64 00 6c 65 6e       	add    %ch,%fs:0x6e(%ebp,%eiz,2)
 867:	67 74 68             	addr16 je 8d2 <_init-0x8047cca>
 86a:	00 77 63             	add    %dh,0x63(%edi)
 86d:	73 74                	jae    8e3 <_init-0x8047cb9>
 86f:	6f                   	outsl  %ds:(%esi),(%dx)
 870:	6c                   	insb   (%dx),%es:(%edi)
 871:	6c                   	insb   (%dx),%es:(%edi)
 872:	00 77 63             	add    %dh,0x63(%edi)
 875:	73 73                	jae    8ea <_init-0x8047cb2>
 877:	74 72                	je     8eb <_init-0x8047cb1>
 879:	00 5f 49             	add    %bl,0x49(%edi)
 87c:	6f                   	outsl  %ds:(%esi),(%dx)
 87d:	73 5f                	jae    8de <_init-0x8047cbe>
 87f:	49                   	dec    %ecx
 880:	6f                   	outsl  %ds:(%esi),(%dx)
 881:	73 74                	jae    8f7 <_init-0x8047ca5>
 883:	61                   	popa   
 884:	74 65                	je     8eb <_init-0x8047cb1>
 886:	00 5f 5a             	add    %bl,0x5a(%edi)
 889:	4e                   	dec    %esi
 88a:	39 5f 5f             	cmp    %ebx,0x5f(%edi)
 88d:	67 6e                	outsb  %ds:(%si),(%dx)
 88f:	75 5f                	jne    8f0 <_init-0x8047cac>
 891:	63 78 78             	arpl   %di,0x78(%eax)
 894:	32 34 5f             	xor    (%edi,%ebx,2),%dh
 897:	5f                   	pop    %edi
 898:	6e                   	outsb  %ds:(%esi),(%dx)
 899:	75 6d                	jne    908 <_init-0x8047c94>
 89b:	65 72 69             	gs jb  907 <_init-0x8047c95>
 89e:	63 5f 74             	arpl   %bx,0x74(%edi)
 8a1:	72 61                	jb     904 <_init-0x8047c98>
 8a3:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 8aa:	65 
 8ab:	67 65 72 49          	addr16 gs jb 8f8 <_init-0x8047ca4>
 8af:	63 45 35             	arpl   %ax,0x35(%ebp)
 8b2:	5f                   	pop    %edi
 8b3:	5f                   	pop    %edi
 8b4:	6d                   	insl   (%dx),%es:(%edi)
 8b5:	61                   	popa   
 8b6:	78 45                	js     8fd <_init-0x8047c9f>
 8b8:	00 77 63             	add    %dh,0x63(%edi)
 8bb:	73 72                	jae    92f <_init-0x8047c6d>
 8bd:	74 6f                	je     92e <_init-0x8047c6e>
 8bf:	6d                   	insl   (%dx),%es:(%edi)
 8c0:	62 73 00             	bound  %esi,0x0(%ebx)
 8c3:	74 6d                	je     932 <_init-0x8047c6a>
 8c5:	5f                   	pop    %edi
 8c6:	77 64                	ja     92c <_init-0x8047c70>
 8c8:	61                   	popa   
 8c9:	79 00                	jns    8cb <_init-0x8047cd1>
 8cb:	5f                   	pop    %edi
 8cc:	53                   	push   %ebx
 8cd:	5f                   	pop    %edi
 8ce:	75 6e                	jne    93e <_init-0x8047c5e>
 8d0:	69 74 62 75 66 00 5f 	imul   $0x5a5f0066,0x75(%edx,%eiz,2),%esi
 8d7:	5a 
 8d8:	4e                   	dec    %esi
 8d9:	53                   	push   %ebx
 8da:	74 31                	je     90d <_init-0x8047c8f>
 8dc:	31 63 68             	xor    %esp,0x68(%ebx)
 8df:	61                   	popa   
 8e0:	72 5f                	jb     941 <_init-0x8047c5b>
 8e2:	74 72                	je     956 <_init-0x8047c46>
 8e4:	61                   	popa   
 8e5:	69 74 73 49 63 45 32 	imul   $0x65324563,0x49(%ebx,%esi,2),%esi
 8ec:	65 
 8ed:	71 45                	jno    934 <_init-0x8047c68>
 8ef:	52                   	push   %edx
 8f0:	4b                   	dec    %ebx
 8f1:	63 53 32             	arpl   %dx,0x32(%ebx)
 8f4:	5f                   	pop    %edi
 8f5:	00 5f 53             	add    %bl,0x53(%edi)
 8f8:	5f                   	pop    %edi
 8f9:	61                   	popa   
 8fa:	74 65                	je     961 <_init-0x8047c3b>
 8fc:	00 5f 5f             	add    %bl,0x5f(%edi)
 8ff:	64 69 67 69 74 73 00 	imul   $0x77007374,%fs:0x69(%edi),%esp
 906:	77 
 907:	63 73 74             	arpl   %si,0x74(%ebx)
 90a:	6f                   	outsl  %ds:(%esi),(%dx)
 90b:	64 00 77 63          	add    %dh,%fs:0x63(%edi)
 90f:	73 74                	jae    985 <_init-0x8047c17>
 911:	6f                   	outsl  %ds:(%esi),(%dx)
 912:	66 00 77 63          	data16 add %dh,0x63(%edi)
 916:	73 74                	jae    98c <_init-0x8047c10>
 918:	6f                   	outsl  %ds:(%esi),(%dx)
 919:	6b 00 77             	imul   $0x77,(%eax),%eax
 91c:	63 73 74             	arpl   %si,0x74(%ebx)
 91f:	6f                   	outsl  %ds:(%esi),(%dx)
 920:	6c                   	insb   (%dx),%es:(%edi)
 921:	00 5f 5f             	add    %bl,0x5f(%edi)
 924:	46                   	inc    %esi
 925:	49                   	dec    %ecx
 926:	4c                   	dec    %esp
 927:	45                   	inc    %ebp
 928:	00 73 65             	add    %dh,0x65(%ebx)
 92b:	74 6c                	je     999 <_init-0x8047c03>
 92d:	6f                   	outsl  %ds:(%esi),(%dx)
 92e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 931:	65 00 5f 5a          	add    %bl,%gs:0x5a(%edi)
 935:	4e                   	dec    %esi
 936:	31 30                	xor    %esi,(%eax)
 938:	62 61 73             	bound  %esp,0x73(%ecx)
 93b:	65 5f                	gs pop %edi
 93d:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 941:	73 43                	jae    986 <_init-0x8047c16>
 943:	32 45 76             	xor    0x76(%ebp),%al
 946:	00 77 63             	add    %dh,0x63(%edi)
 949:	73 72                	jae    9bd <_init-0x8047bdf>
 94b:	63 68 72             	arpl   %bp,0x72(%eax)
 94e:	00 77 69             	add    %dh,0x69(%edi)
 951:	6e                   	outsb  %ds:(%esi),(%dx)
 952:	74 5f                	je     9b3 <_init-0x8047be9>
 954:	74 00                	je     956 <_init-0x8047c46>
 956:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%edi),%ebp
 95d:	65 00 77 63          	add    %dh,%gs:0x63(%edi)
 961:	73 6c                	jae    9cf <_init-0x8047bcd>
 963:	65 6e                	outsb  %gs:(%esi),(%dx)
 965:	00 5f 5a             	add    %bl,0x5a(%edi)
 968:	4e                   	dec    %esi
 969:	31 30                	xor    %esi,(%eax)
 96b:	62 61 73             	bound  %esp,0x73(%ecx)
 96e:	65 5f                	gs pop %edi
 970:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 974:	73 37                	jae    9ad <_init-0x8047bef>
 976:	76 5f                	jbe    9d7 <_init-0x8047bc5>
 978:	66 75 6e             	data16 jne 9e9 <_init-0x8047bb3>
 97b:	63 33                	arpl   %si,(%ebx)
 97d:	45                   	inc    %ebp
 97e:	76 00                	jbe    980 <_init-0x8047c1c>
 980:	69 6f 73 74 61 74 65 	imul   $0x65746174,0x73(%edi),%ebp
 987:	00 74 6f 5f          	add    %dh,0x5f(%edi,%ebp,2)
 98b:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%esi),%ebp
 992:	65 00 74 6f 5f       	add    %dh,%gs:0x5f(%edi,%ebp,2)
 997:	63 68 61             	arpl   %bp,0x61(%eax)
 99a:	72 5f                	jb     9fb <_init-0x8047ba1>
 99c:	74 79                	je     a17 <_init-0x8047b85>
 99e:	70 65                	jo     a05 <_init-0x8047b97>
 9a0:	00 5f 5f             	add    %bl,0x5f(%edi)
 9a3:	64 65 62 75 67       	fs bound %esi,%gs:0x67(%ebp)
 9a8:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 9ac:	67 6d                	insl   (%dx),%es:(%di)
 9ae:	74 6f                	je     a1f <_init-0x8047b7d>
 9b0:	66 66 00 76 74       	data16 data16 add %dh,0x74(%esi)
 9b5:	62 6c 5f 6e          	bound  %ebp,0x6e(%edi,%ebx,2)
 9b9:	6f                   	outsl  %ds:(%esi),(%dx)
 9ba:	5f                   	pop    %edi
 9bb:	69 6e 68 65 72 69 74 	imul   $0x74697265,0x68(%esi),%ebp
 9c2:	61                   	popa   
 9c3:	6e                   	outsb  %ds:(%esi),(%dx)
 9c4:	63 65 2e             	arpl   %sp,0x2e(%ebp)
 9c7:	63 70 70             	arpl   %si,0x70(%eax)
 9ca:	00 66 75             	add    %ah,0x75(%esi)
 9cd:	6e                   	outsb  %ds:(%esi),(%dx)
 9ce:	63 5f 70             	arpl   %bx,0x70(%edi)
 9d1:	6f                   	outsl  %ds:(%esi),(%dx)
 9d2:	69 6e 74 65 72 00 63 	imul   $0x63007265,0x74(%esi),%ebp
 9d9:	75 72                	jne    a4d <_init-0x8047b4f>
 9db:	72 65                	jb     a42 <_init-0x8047b5a>
 9dd:	6e                   	outsb  %ds:(%esi),(%dx)
 9de:	63 79 5f             	arpl   %di,0x5f(%ecx)
 9e1:	73 79                	jae    a5c <_init-0x8047b40>
 9e3:	6d                   	insl   (%dx),%es:(%edi)
 9e4:	62 6f 6c             	bound  %ebp,0x6c(%edi)
 9e7:	00 73 68             	add    %dh,0x68(%ebx)
 9ea:	6f                   	outsl  %ds:(%esi),(%dx)
 9eb:	72 74                	jb     a61 <_init-0x8047b3b>
 9ed:	20 69 6e             	and    %ch,0x6e(%ecx)
 9f0:	74 00                	je     9f2 <_init-0x8047baa>
 9f2:	5f                   	pop    %edi
 9f3:	5a                   	pop    %edx
 9f4:	4e                   	dec    %esi
 9f5:	53                   	push   %ebx
 9f6:	74 31                	je     a29 <_init-0x8047b73>
 9f8:	31 63 68             	xor    %esp,0x68(%ebx)
 9fb:	61                   	popa   
 9fc:	72 5f                	jb     a5d <_init-0x8047b3f>
 9fe:	74 72                	je     a72 <_init-0x8047b2a>
 a00:	61                   	popa   
 a01:	69 74 73 49 63 45 36 	imul   $0x6c364563,0x49(%ebx,%esi,2),%esi
 a08:	6c 
 a09:	65 6e                	outsb  %gs:(%esi),(%dx)
 a0b:	67 74 68             	addr16 je a76 <_init-0x8047b26>
 a0e:	45                   	inc    %ebp
 a0f:	50                   	push   %eax
 a10:	4b                   	dec    %ebx
 a11:	63 00                	arpl   %ax,(%eax)
 a13:	77 63                	ja     a78 <_init-0x8047b24>
 a15:	73 66                	jae    a7d <_init-0x8047b1f>
 a17:	74 69                	je     a82 <_init-0x8047b1a>
 a19:	6d                   	insl   (%dx),%es:(%edi)
 a1a:	65 00 6d 6f          	add    %ch,%gs:0x6f(%ebp)
 a1e:	6e                   	outsb  %ds:(%esi),(%dx)
 a1f:	5f                   	pop    %edi
 a20:	67 72 6f             	addr16 jb a92 <_init-0x8047b0a>
 a23:	75 70                	jne    a95 <_init-0x8047b07>
 a25:	69 6e 67 00 5f 53 5f 	imul   $0x5f535f00,0x67(%esi),%ebp
 a2c:	63 75 72             	arpl   %si,0x72(%ebp)
 a2f:	00 5f 76             	add    %bl,0x76(%edi)
 a32:	70 74                	jo     aa8 <_init-0x8047af4>
 a34:	72 2e                	jb     a64 <_init-0x8047b38>
 a36:	62 61 73             	bound  %esp,0x73(%ecx)
 a39:	65 5f                	gs pop %edi
 a3b:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 a3f:	73 00                	jae    a41 <_init-0x8047b5b>
 a41:	5f                   	pop    %edi
 a42:	5a                   	pop    %edx
 a43:	4e                   	dec    %esi
 a44:	53                   	push   %ebx
 a45:	74 31                	je     a78 <_init-0x8047b24>
 a47:	31 63 68             	xor    %esp,0x68(%ebx)
 a4a:	61                   	popa   
 a4b:	72 5f                	jb     aac <_init-0x8047af0>
 a4d:	74 72                	je     ac1 <_init-0x8047adb>
 a4f:	61                   	popa   
 a50:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%ebx,%esi,2),%esi
 a57:	61 
 a58:	73 73                	jae    acd <_init-0x8047acf>
 a5a:	69 67 6e 45 52 63 52 	imul   $0x52635245,0x6e(%edi),%esp
 a61:	4b                   	dec    %ebx
 a62:	63 00                	arpl   %ax,(%eax)
 a64:	77 63                	ja     ac9 <_init-0x8047ad3>
 a66:	73 63                	jae    acb <_init-0x8047ad1>
 a68:	61                   	popa   
 a69:	74 00                	je     a6b <_init-0x8047b31>
 a6b:	76 5f                	jbe    acc <_init-0x8047ad0>
 a6d:	66 75 6e             	data16 jne ade <_init-0x8047abe>
 a70:	63 31                	arpl   %si,(%ecx)
 a72:	00 76 5f             	add    %dh,0x5f(%esi)
 a75:	66 75 6e             	data16 jne ae6 <_init-0x8047ab6>
 a78:	63 32                	arpl   %si,(%edx)
 a7a:	00 76 5f             	add    %dh,0x5f(%esi)
 a7d:	66 75 6e             	data16 jne aee <_init-0x8047aae>
 a80:	63 33                	arpl   %si,(%ebx)
 a82:	00 31                	add    %dh,(%ecx)
 a84:	31 5f 5f             	xor    %ebx,0x5f(%edi)
 a87:	6d                   	insl   (%dx),%es:(%edi)
 a88:	62 73 74             	bound  %esi,0x74(%ebx)
 a8b:	61                   	popa   
 a8c:	74 65                	je     af3 <_init-0x8047aa9>
 a8e:	5f                   	pop    %edi
 a8f:	74 00                	je     a91 <_init-0x8047b0b>
 a91:	69 6e 74 5f 70 5f 73 	imul   $0x735f705f,0x74(%esi),%ebp
 a98:	69 67 6e 5f 70 6f 73 	imul   $0x736f705f,0x6e(%edi),%esp
 a9f:	6e                   	outsb  %ds:(%esi),(%dx)
 aa0:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 aa4:	7a 6f                	jp     b15 <_init-0x8047a87>
 aa6:	6e                   	outsb  %ds:(%esi),(%dx)
 aa7:	65 00 76 77          	add    %dh,%gs:0x77(%esi)
 aab:	73 63                	jae    b10 <_init-0x8047a8c>
 aad:	61                   	popa   
 aae:	6e                   	outsb  %ds:(%esi),(%dx)
 aaf:	66 00 5f 53          	data16 add %bl,0x53(%edi)
 ab3:	5f                   	pop    %edi
 ab4:	69 6f 73 5f 69 6f 73 	imul   $0x736f695f,0x73(%edi),%ebp
 abb:	74 61                	je     b1e <_init-0x8047a7e>
 abd:	74 65                	je     b24 <_init-0x8047a78>
 abf:	5f                   	pop    %edi
 ac0:	65 6e                	outsb  %gs:(%esi),(%dx)
 ac2:	64 00 77 63          	add    %dh,%fs:0x63(%edi)
 ac6:	72 74                	jb     b3c <_init-0x8047a60>
 ac8:	6f                   	outsl  %ds:(%esi),(%dx)
 ac9:	6d                   	insl   (%dx),%es:(%edi)
 aca:	62 00                	bound  %eax,(%eax)
 acc:	6c                   	insb   (%dx),%es:(%edi)
 acd:	63 6f 6e             	arpl   %bp,0x6e(%edi)
 ad0:	76 00                	jbe    ad2 <_init-0x8047aca>
 ad2:	5f                   	pop    %edi
 ad3:	5a                   	pop    %edx
 ad4:	4e                   	dec    %esi
 ad5:	53                   	push   %ebx
 ad6:	74 31                	je     b09 <_init-0x8047a93>
 ad8:	31 63 68             	xor    %esp,0x68(%ebx)
 adb:	61                   	popa   
 adc:	72 5f                	jb     b3d <_init-0x8047a5f>
 ade:	74 72                	je     b52 <_init-0x8047a4a>
 ae0:	61                   	popa   
 ae1:	69 74 73 49 63 45 33 	imul   $0x65334563,0x49(%ebx,%esi,2),%esi
 ae8:	65 
 ae9:	6f                   	outsl  %ds:(%esi),(%dx)
 aea:	66 45                	inc    %bp
 aec:	76 00                	jbe    aee <_init-0x8047aae>
 aee:	77 63                	ja     b53 <_init-0x8047a49>
 af0:	73 6e                	jae    b60 <_init-0x8047a3c>
 af2:	63 61 74             	arpl   %sp,0x74(%ecx)
 af5:	00 5f 5f             	add    %bl,0x5f(%edi)
 af8:	6e                   	outsb  %ds:(%esi),(%dx)
 af9:	75 6d                	jne    b68 <_init-0x8047a34>
 afb:	65 72 69             	gs jb  b67 <_init-0x8047a35>
 afe:	63 5f 74             	arpl   %bx,0x74(%edi)
 b01:	72 61                	jb     b64 <_init-0x8047a38>
 b03:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 b0a:	65 
 b0b:	67 65 72 3c          	addr16 gs jb b4b <_init-0x8047a51>
 b0f:	73 68                	jae    b79 <_init-0x8047a23>
 b11:	6f                   	outsl  %ds:(%esi),(%dx)
 b12:	72 74                	jb     b88 <_init-0x8047a14>
 b14:	20 69 6e             	and    %ch,0x6e(%ecx)
 b17:	74 3e                	je     b57 <_init-0x8047a45>
 b19:	00 5f 5f             	add    %bl,0x5f(%edi)
 b1c:	64 73 6f             	fs jae b8e <_init-0x8047a0e>
 b1f:	5f                   	pop    %edi
 b20:	68 61 6e 64 6c       	push   $0x6c646e61
 b25:	65 00 6c 6f 6e       	add    %ch,%gs:0x6e(%edi,%ebp,2)
 b2a:	67 20 6c 6f          	and    %ch,0x6f(%si)
 b2e:	6e                   	outsb  %ds:(%esi),(%dx)
 b2f:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
 b33:	74 00                	je     b35 <_init-0x8047a67>
 b35:	66 70 75             	data16 jo bad <_init-0x80479ef>
 b38:	74 77                	je     bb1 <_init-0x80479eb>
 b3a:	63 00                	arpl   %ax,(%eax)
 b3c:	66 70 75             	data16 jo bb4 <_init-0x80479e8>
 b3f:	74 77                	je     bb8 <_init-0x80479e4>
 b41:	73 00                	jae    b43 <_init-0x8047a59>
 b43:	7e 49                	jle    b8e <_init-0x8047a0e>
 b45:	6e                   	outsb  %ds:(%esi),(%dx)
 b46:	69 74 00 6d 62 73 72 	imul   $0x74727362,0x6d(%eax,%eax,1),%esi
 b4d:	74 
 b4e:	6f                   	outsl  %ds:(%esi),(%dx)
 b4f:	77 63                	ja     bb4 <_init-0x80479e8>
 b51:	73 00                	jae    b53 <_init-0x8047a49>
 b53:	5f                   	pop    %edi
 b54:	53                   	push   %ebx
 b55:	5f                   	pop    %edi
 b56:	66 61                	popaw  
 b58:	69 6c 62 69 74 00 5f 	imul   $0x5f5f0074,0x69(%edx,%eiz,2),%ebp
 b5f:	5f 
 b60:	6e                   	outsb  %ds:(%esi),(%dx)
 b61:	75 6d                	jne    bd0 <_init-0x80479cc>
 b63:	65 72 69             	gs jb  bcf <_init-0x80479cd>
 b66:	63 5f 74             	arpl   %bx,0x74(%edi)
 b69:	72 61                	jb     bcc <_init-0x80479d0>
 b6b:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%ebx,%esi,2),%esi
 b72:	65 
 b73:	67 65 72 3c          	addr16 gs jb bb3 <_init-0x80479e9>
 b77:	6c                   	insb   (%dx),%es:(%edi)
 b78:	6f                   	outsl  %ds:(%esi),(%dx)
 b79:	6e                   	outsb  %ds:(%esi),(%dx)
 b7a:	67 20 75 6e          	and    %dh,0x6e(%di)
 b7e:	73 69                	jae    be9 <_init-0x80479b3>
 b80:	67 6e                	outsb  %ds:(%si),(%dx)
 b82:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 b87:	74 3e                	je     bc7 <_init-0x80479d5>
 b89:	00 74 6d 5f          	add    %dh,0x5f(%ebp,%ebp,2)
 b8d:	79 65                	jns    bf4 <_init-0x80479a8>
 b8f:	61                   	popa   
 b90:	72 00                	jb     b92 <_init-0x8047a0a>
 b92:	73 68                	jae    bfc <_init-0x80479a0>
 b94:	6f                   	outsl  %ds:(%esi),(%dx)
 b95:	72 74                	jb     c0b <_init-0x8047991>
 b97:	20 75 6e             	and    %dh,0x6e(%ebp)
 b9a:	73 69                	jae    c05 <_init-0x8047997>
 b9c:	67 6e                	outsb  %ds:(%si),(%dx)
 b9e:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 ba3:	74 00                	je     ba5 <_init-0x80479f7>
 ba5:	5f                   	pop    %edi
 ba6:	54                   	push   %esp
 ba7:	72 61                	jb     c0a <_init-0x8047992>
 ba9:	69 74 73 00 5f 5f 6f 	imul   $0x706f5f5f,0x0(%ebx,%esi,2),%esi
 bb0:	70 
 bb1:	73 00                	jae    bb3 <_init-0x80479e9>
 bb3:	76 66                	jbe    c1b <_init-0x8047981>
 bb5:	77 73                	ja     c2a <_init-0x8047972>
 bb7:	63 61 6e             	arpl   %sp,0x6e(%ecx)
 bba:	66 00 5f 49          	data16 add %bl,0x49(%edi)
 bbe:	6f                   	outsl  %ds:(%esi),(%dx)
 bbf:	73 5f                	jae    c20 <_init-0x804797c>
 bc1:	53                   	push   %ebx
 bc2:	65 65 6b 64 69 72 00 	gs imul $0x0,%gs:0x72(%ecx,%ebp,2),%esp
 bc9:	66 6d                	insw   (%dx),%es:(%edi)
 bcb:	74 66                	je     c33 <_init-0x8047969>
 bcd:	6c                   	insb   (%dx),%es:(%edi)
 bce:	61                   	popa   
 bcf:	67 73 00             	addr16 jae bd2 <_init-0x80479ca>
 bd2:	5f                   	pop    %edi
 bd3:	5f                   	pop    %edi
 bd4:	69 6e 74 33 32 5f 74 	imul   $0x745f3233,0x74(%esi),%ebp
 bdb:	00 6d 62             	add    %ch,0x62(%ebp)
 bde:	73 69                	jae    c49 <_init-0x8047953>
 be0:	6e                   	outsb  %ds:(%esi),(%dx)
 be1:	69 74 00 69 73 77 63 	imul   $0x74637773,0x69(%eax,%eax,1),%esi
 be8:	74 
 be9:	79 70                	jns    c5b <_init-0x8047941>
 beb:	65 00 61 73          	add    %ah,%gs:0x73(%ecx)
 bef:	73 69                	jae    c5a <_init-0x8047942>
 bf1:	67 6e                	outsb  %ds:(%si),(%dx)
 bf3:	00 5f 5a             	add    %bl,0x5a(%edi)
 bf6:	4e                   	dec    %esi
 bf7:	53                   	push   %ebx
 bf8:	74 31                	je     c2b <_init-0x8047971>
 bfa:	31 63 68             	xor    %esp,0x68(%ebx)
 bfd:	61                   	popa   
 bfe:	72 5f                	jb     c5f <_init-0x804793d>
 c00:	74 72                	je     c74 <_init-0x8047928>
 c02:	61                   	popa   
 c03:	69 74 73 49 63 45 37 	imul   $0x6e374563,0x49(%ebx,%esi,2),%esi
 c0a:	6e 
 c0b:	6f                   	outsl  %ds:(%esi),(%dx)
 c0c:	74 5f                	je     c6d <_init-0x804792f>
 c0e:	65 6f                	outsl  %gs:(%esi),(%dx)
 c10:	66 45                	inc    %bp
 c12:	52                   	push   %edx
 c13:	4b                   	dec    %ebx
 c14:	69 00 5f 5a 4e 53    	imul   $0x534e5a5f,(%eax),%eax
 c1a:	74 31                	je     c4d <_init-0x804794f>
 c1c:	31 63 68             	xor    %esp,0x68(%ebx)
 c1f:	61                   	popa   
 c20:	72 5f                	jb     c81 <_init-0x804791b>
 c22:	74 72                	je     c96 <_init-0x8047906>
 c24:	61                   	popa   
 c25:	69 74 73 49 63 45 34 	imul   $0x66344563,0x49(%ebx,%esi,2),%esi
 c2c:	66 
 c2d:	69 6e 64 45 50 4b 63 	imul   $0x634b5045,0x64(%esi),%ebp
 c34:	6a 52                	push   $0x52
 c36:	53                   	push   %ebx
 c37:	31 5f 00             	xor    %ebx,0x0(%edi)
 c3a:	77 63                	ja     c9f <_init-0x80478fd>
 c3c:	68 61 72 5f 74       	push   $0x745f7261
 c41:	00 77 63             	add    %dh,0x63(%edi)
 c44:	73 74                	jae    cba <_init-0x80478e2>
 c46:	6f                   	outsl  %ds:(%esi),(%dx)
 c47:	75 6c                	jne    cb5 <_init-0x80478e7>
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	6b 87 04 08 59 89 04 	imul   $0x4,-0x76a6f7fc(%edi),%eax
   7:	08 5a 89             	or     %bl,-0x77(%edx)
   a:	04 08                	add    $0x8,%al
   c:	88 89 04 08 88 89    	mov    %cl,-0x7677f7fc(%ecx)
  12:	04 08                	add    $0x8,%al
  14:	b6 89                	mov    $0x89,%dh
  16:	04 08                	add    $0x8,%al
  18:	b6 89                	mov    $0x89,%dh
  1a:	04 08                	add    $0x8,%al
  1c:	e4 89                	in     $0x89,%al
  1e:	04 08                	add    $0x8,%al
  20:	e4 89                	in     $0x89,%al
  22:	04 08                	add    $0x8,%al
  24:	f2 89 04 08          	repnz mov %eax,(%eax,%ecx,1)
	...
