
main:     file format elf32-i386


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
 8048177:	00 37                	add    %dh,(%edi)
 8048179:	66 5f                	pop    %di
 804817b:	be 85 86 81 9d       	mov    $0x9d818685,%esi
 8048180:	42                   	inc    %edx
 8048181:	fc                   	cld    
 8048182:	09 51 e3             	or     %edx,-0x1d(%ecx)
 8048185:	0f 9e d3             	setle  %bl
 8048188:	81                   	.byte 0x81
 8048189:	e1 c5                	loope  8048150 <_init-0x144>
 804818b:	b7                   	.byte 0xb7

Disassembly of section .gnu.hash:

0804818c <.gnu.hash>:
 804818c:	02 00                	add    (%eax),%al
 804818e:	00 00                	add    %al,(%eax)
 8048190:	04 00                	add    $0x0,%al
 8048192:	00 00                	add    %al,(%eax)
 8048194:	01 00                	add    %eax,(%eax)
 8048196:	00 00                	add    %al,(%eax)
 8048198:	05 00 00 00 00       	add    $0x0,%eax
 804819d:	20 00                	and    %al,(%eax)
 804819f:	20 00                	and    %al,(%eax)
 80481a1:	00 00                	add    %al,(%eax)
 80481a3:	00 04 00             	add    %al,(%eax,%eax,1)
 80481a6:	00 00                	add    %al,(%eax)
 80481a8:	ad                   	lods   %ds:(%esi),%eax
 80481a9:	4b                   	dec    %ebx
 80481aa:	e3 c0                	jecxz  804816c <_init-0x128>

Disassembly of section .dynsym:

080481ac <.dynsym>:
	...
 80481bc:	1a 00                	sbb    (%eax),%al
	...
 80481c6:	00 00                	add    %al,(%eax)
 80481c8:	12 00                	adc    (%eax),%al
 80481ca:	00 00                	add    %al,(%eax)
 80481cc:	33 00                	xor    (%eax),%eax
	...
 80481d6:	00 00                	add    %al,(%eax)
 80481d8:	20 00                	and    %al,(%eax)
 80481da:	00 00                	add    %al,(%eax)
 80481dc:	21 00                	and    %eax,(%eax)
	...
 80481e6:	00 00                	add    %al,(%eax)
 80481e8:	12 00                	adc    (%eax),%al
 80481ea:	00 00                	add    %al,(%eax)
 80481ec:	0b 00                	or     (%eax),%eax
 80481ee:	00 00                	add    %al,(%eax)
 80481f0:	0c 85                	or     $0x85,%al
 80481f2:	04 08                	add    $0x8,%al
 80481f4:	04 00                	add    $0x0,%al
 80481f6:	00 00                	add    %al,(%eax)
 80481f8:	11 00                	adc    %eax,(%eax)
 80481fa:	0f                   	.byte 0xf
	...

Disassembly of section .dynstr:

080481fc <.dynstr>:
 80481fc:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 8048200:	63 2e                	arpl   %bp,(%esi)
 8048202:	73 6f                	jae    8048273 <_init-0x21>
 8048204:	2e 36 00 5f 49       	cs add %bl,%ss:0x49(%edi)
 8048209:	4f                   	dec    %edi
 804820a:	5f                   	pop    %edi
 804820b:	73 74                	jae    8048281 <_init-0x13>
 804820d:	64 69 6e 5f 75 73 65 	imul   $0x64657375,%fs:0x5f(%esi),%ebp
 8048214:	64 
 8048215:	00 70 72             	add    %dh,0x72(%eax)
 8048218:	69 6e 74 66 00 5f 5f 	imul   $0x5f5f0066,0x74(%esi),%ebp
 804821f:	6c                   	insb   (%dx),%es:(%edi)
 8048220:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%edx),%esp
 8048227:	72 74                	jb     804829d <_init+0x9>
 8048229:	5f                   	pop    %edi
 804822a:	6d                   	insl   (%dx),%es:(%edi)
 804822b:	61                   	popa   
 804822c:	69 6e 00 5f 5f 67 6d 	imul   $0x6d675f5f,0x0(%esi),%ebp
 8048233:	6f                   	outsl  %ds:(%esi),(%dx)
 8048234:	6e                   	outsb  %ds:(%esi),(%dx)
 8048235:	5f                   	pop    %edi
 8048236:	73 74                	jae    80482ac <_init+0x18>
 8048238:	61                   	popa   
 8048239:	72 74                	jb     80482af <_init+0x1b>
 804823b:	5f                   	pop    %edi
 804823c:	5f                   	pop    %edi
 804823d:	00 47 4c             	add    %al,0x4c(%edi)
 8048240:	49                   	dec    %ecx
 8048241:	42                   	inc    %edx
 8048242:	43                   	inc    %ebx
 8048243:	5f                   	pop    %edi
 8048244:	32 2e                	xor    (%esi),%ch
 8048246:	30 00                	xor    %al,(%eax)

Disassembly of section .gnu.version:

08048248 <.gnu.version>:
 8048248:	00 00                	add    %al,(%eax)
 804824a:	02 00                	add    (%eax),%al
 804824c:	00 00                	add    %al,(%eax)
 804824e:	02 00                	add    (%eax),%al
 8048250:	01 00                	add    %eax,(%eax)

Disassembly of section .gnu.version_r:

08048254 <.gnu.version_r>:
 8048254:	01 00                	add    %eax,(%eax)
 8048256:	01 00                	add    %eax,(%eax)
 8048258:	01 00                	add    %eax,(%eax)
 804825a:	00 00                	add    %al,(%eax)
 804825c:	10 00                	adc    %al,(%eax)
 804825e:	00 00                	add    %al,(%eax)
 8048260:	00 00                	add    %al,(%eax)
 8048262:	00 00                	add    %al,(%eax)
 8048264:	10 69 69             	adc    %ch,0x69(%ecx)
 8048267:	0d 00 00 02 00       	or     $0x20000,%eax
 804826c:	42                   	inc    %edx
 804826d:	00 00                	add    %al,(%eax)
 804826f:	00 00                	add    %al,(%eax)
 8048271:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.dyn:

08048274 <.rel.dyn>:
 8048274:	30 97 04 08 06 02    	xor    %dl,0x2060804(%edi)
	...

Disassembly of section .rel.plt:

0804827c <.rel.plt>:
 804827c:	40                   	inc    %eax
 804827d:	97                   	xchg   %eax,%edi
 804827e:	04 08                	add    $0x8,%al
 8048280:	07                   	pop    %es
 8048281:	01 00                	add    %eax,(%eax)
 8048283:	00 44 97 04          	add    %al,0x4(%edi,%edx,4)
 8048287:	08 07                	or     %al,(%edi)
 8048289:	02 00                	add    (%eax),%al
 804828b:	00 48 97             	add    %cl,-0x69(%eax)
 804828e:	04 08                	add    $0x8,%al
 8048290:	07                   	pop    %es
 8048291:	03 00                	add    (%eax),%eax
	...

Disassembly of section .init:

08048294 <_init>:
 8048294:	53                   	push   %ebx
 8048295:	83 ec 08             	sub    $0x8,%esp
 8048298:	e8 93 00 00 00       	call   8048330 <__x86.get_pc_thunk.bx>
 804829d:	81 c3 97 14 00 00    	add    $0x1497,%ebx
 80482a3:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80482a9:	85 c0                	test   %eax,%eax
 80482ab:	74 05                	je     80482b2 <_init+0x1e>
 80482ad:	e8 2e 00 00 00       	call   80482e0 <__gmon_start__@plt>
 80482b2:	83 c4 08             	add    $0x8,%esp
 80482b5:	5b                   	pop    %ebx
 80482b6:	c3                   	ret    

Disassembly of section .plt:

080482c0 <printf@plt-0x10>:
 80482c0:	ff 35 38 97 04 08    	pushl  0x8049738
 80482c6:	ff 25 3c 97 04 08    	jmp    *0x804973c
 80482cc:	00 00                	add    %al,(%eax)
	...

080482d0 <printf@plt>:
 80482d0:	ff 25 40 97 04 08    	jmp    *0x8049740
 80482d6:	68 00 00 00 00       	push   $0x0
 80482db:	e9 e0 ff ff ff       	jmp    80482c0 <_init+0x2c>

080482e0 <__gmon_start__@plt>:
 80482e0:	ff 25 44 97 04 08    	jmp    *0x8049744
 80482e6:	68 08 00 00 00       	push   $0x8
 80482eb:	e9 d0 ff ff ff       	jmp    80482c0 <_init+0x2c>

080482f0 <__libc_start_main@plt>:
 80482f0:	ff 25 48 97 04 08    	jmp    *0x8049748
 80482f6:	68 10 00 00 00       	push   $0x10
 80482fb:	e9 c0 ff ff ff       	jmp    80482c0 <_init+0x2c>

Disassembly of section .text:

08048300 <_start>:
 8048300:	31 ed                	xor    %ebp,%ebp
 8048302:	5e                   	pop    %esi
 8048303:	89 e1                	mov    %esp,%ecx
 8048305:	83 e4 f0             	and    $0xfffffff0,%esp
 8048308:	50                   	push   %eax
 8048309:	54                   	push   %esp
 804830a:	52                   	push   %edx
 804830b:	68 f0 84 04 08       	push   $0x80484f0
 8048310:	68 80 84 04 08       	push   $0x8048480
 8048315:	51                   	push   %ecx
 8048316:	56                   	push   %esi
 8048317:	68 0c 84 04 08       	push   $0x804840c
 804831c:	e8 cf ff ff ff       	call   80482f0 <__libc_start_main@plt>
 8048321:	f4                   	hlt    
 8048322:	66 90                	xchg   %ax,%ax
 8048324:	66 90                	xchg   %ax,%ax
 8048326:	66 90                	xchg   %ax,%ax
 8048328:	66 90                	xchg   %ax,%ax
 804832a:	66 90                	xchg   %ax,%ax
 804832c:	66 90                	xchg   %ax,%ax
 804832e:	66 90                	xchg   %ax,%ax

08048330 <__x86.get_pc_thunk.bx>:
 8048330:	8b 1c 24             	mov    (%esp),%ebx
 8048333:	c3                   	ret    
 8048334:	66 90                	xchg   %ax,%ax
 8048336:	66 90                	xchg   %ax,%ax
 8048338:	66 90                	xchg   %ax,%ax
 804833a:	66 90                	xchg   %ax,%ax
 804833c:	66 90                	xchg   %ax,%ax
 804833e:	66 90                	xchg   %ax,%ax

08048340 <deregister_tm_clones>:
 8048340:	b8 57 97 04 08       	mov    $0x8049757,%eax
 8048345:	2d 54 97 04 08       	sub    $0x8049754,%eax
 804834a:	83 f8 06             	cmp    $0x6,%eax
 804834d:	76 1a                	jbe    8048369 <deregister_tm_clones+0x29>
 804834f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048354:	85 c0                	test   %eax,%eax
 8048356:	74 11                	je     8048369 <deregister_tm_clones+0x29>
 8048358:	55                   	push   %ebp
 8048359:	89 e5                	mov    %esp,%ebp
 804835b:	83 ec 14             	sub    $0x14,%esp
 804835e:	68 54 97 04 08       	push   $0x8049754
 8048363:	ff d0                	call   *%eax
 8048365:	83 c4 10             	add    $0x10,%esp
 8048368:	c9                   	leave  
 8048369:	f3 c3                	repz ret 
 804836b:	90                   	nop
 804836c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048370 <register_tm_clones>:
 8048370:	b8 54 97 04 08       	mov    $0x8049754,%eax
 8048375:	2d 54 97 04 08       	sub    $0x8049754,%eax
 804837a:	c1 f8 02             	sar    $0x2,%eax
 804837d:	89 c2                	mov    %eax,%edx
 804837f:	c1 ea 1f             	shr    $0x1f,%edx
 8048382:	01 d0                	add    %edx,%eax
 8048384:	d1 f8                	sar    %eax
 8048386:	74 1b                	je     80483a3 <register_tm_clones+0x33>
 8048388:	ba 00 00 00 00       	mov    $0x0,%edx
 804838d:	85 d2                	test   %edx,%edx
 804838f:	74 12                	je     80483a3 <register_tm_clones+0x33>
 8048391:	55                   	push   %ebp
 8048392:	89 e5                	mov    %esp,%ebp
 8048394:	83 ec 10             	sub    $0x10,%esp
 8048397:	50                   	push   %eax
 8048398:	68 54 97 04 08       	push   $0x8049754
 804839d:	ff d2                	call   *%edx
 804839f:	83 c4 10             	add    $0x10,%esp
 80483a2:	c9                   	leave  
 80483a3:	f3 c3                	repz ret 
 80483a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483b0 <__do_global_dtors_aux>:
 80483b0:	80 3d 54 97 04 08 00 	cmpb   $0x0,0x8049754
 80483b7:	75 13                	jne    80483cc <__do_global_dtors_aux+0x1c>
 80483b9:	55                   	push   %ebp
 80483ba:	89 e5                	mov    %esp,%ebp
 80483bc:	83 ec 08             	sub    $0x8,%esp
 80483bf:	e8 7c ff ff ff       	call   8048340 <deregister_tm_clones>
 80483c4:	c6 05 54 97 04 08 01 	movb   $0x1,0x8049754
 80483cb:	c9                   	leave  
 80483cc:	f3 c3                	repz ret 
 80483ce:	66 90                	xchg   %ax,%ax

080483d0 <frame_dummy>:
 80483d0:	b8 44 96 04 08       	mov    $0x8049644,%eax
 80483d5:	8b 10                	mov    (%eax),%edx
 80483d7:	85 d2                	test   %edx,%edx
 80483d9:	75 05                	jne    80483e0 <frame_dummy+0x10>
 80483db:	eb 93                	jmp    8048370 <register_tm_clones>
 80483dd:	8d 76 00             	lea    0x0(%esi),%esi
 80483e0:	ba 00 00 00 00       	mov    $0x0,%edx
 80483e5:	85 d2                	test   %edx,%edx
 80483e7:	74 f2                	je     80483db <frame_dummy+0xb>
 80483e9:	55                   	push   %ebp
 80483ea:	89 e5                	mov    %esp,%ebp
 80483ec:	83 ec 14             	sub    $0x14,%esp
 80483ef:	50                   	push   %eax
 80483f0:	ff d2                	call   *%edx
 80483f2:	83 c4 10             	add    $0x10,%esp
 80483f5:	c9                   	leave  
 80483f6:	e9 75 ff ff ff       	jmp    8048370 <register_tm_clones>

080483fb <max>:
 80483fb:	55                   	push   %ebp
 80483fc:	89 e5                	mov    %esp,%ebp
 80483fe:	8b 55 08             	mov    0x8(%ebp),%edx
 8048401:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048404:	39 d0                	cmp    %edx,%eax
 8048406:	7d 02                	jge    804840a <max+0xf>
 8048408:	89 d0                	mov    %edx,%eax
 804840a:	5d                   	pop    %ebp
 804840b:	c3                   	ret    
	int (* p)(int, int) = & max; // &可以省略
	int a = 1, b = 2, c = 3, d;
	d = p(p(a, b), c); 
	printf("the maxumum number is: %d\n", d);
0804840c <main>:
 804840c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048410:	83 e4 f0             	and    $0xfffffff0,%esp
 8048413:	ff 71 fc             	pushl  -0x4(%ecx)
 8048416:	55                   	push   %ebp
 8048417:	89 e5                	mov    %esp,%ebp
 8048419:	51                   	push   %ecx
 804841a:	83 ec 24             	sub    $0x24,%esp
 804841d:	c7 45 f4 fb 83 04 08 	movl   $0x80483fb,-0xc(%ebp)
 8048424:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804842b:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
 8048432:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
 8048439:	83 ec 08             	sub    $0x8,%esp
 804843c:	ff 75 ec             	pushl  -0x14(%ebp)
 804843f:	ff 75 f0             	pushl  -0x10(%ebp)
 8048442:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048445:	ff d0                	call   *%eax
 8048447:	83 c4 10             	add    $0x10,%esp
 804844a:	83 ec 08             	sub    $0x8,%esp
 804844d:	ff 75 e8             	pushl  -0x18(%ebp)
 8048450:	50                   	push   %eax
 8048451:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048454:	ff d0                	call   *%eax
 8048456:	83 c4 10             	add    $0x10,%esp
 8048459:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804845c:	83 ec 08             	sub    $0x8,%esp
 804845f:	ff 75 e4             	pushl  -0x1c(%ebp)
 8048462:	68 10 85 04 08       	push   $0x8048510
 8048467:	e8 64 fe ff ff       	call   80482d0 <printf@plt>
 804846c:	83 c4 10             	add    $0x10,%esp
 804846f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048474:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048477:	c9                   	leave  
 8048478:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804847b:	c3                   	ret    
 804847c:	66 90                	xchg   %ax,%ax
 804847e:	66 90                	xchg   %ax,%ax

08048480 <__libc_csu_init>:
 8048480:	55                   	push   %ebp
 8048481:	57                   	push   %edi
 8048482:	31 ff                	xor    %edi,%edi
 8048484:	56                   	push   %esi
 8048485:	53                   	push   %ebx
 8048486:	e8 a5 fe ff ff       	call   8048330 <__x86.get_pc_thunk.bx>
 804848b:	81 c3 a9 12 00 00    	add    $0x12a9,%ebx
 8048491:	83 ec 1c             	sub    $0x1c,%esp
 8048494:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8048498:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804849e:	e8 f1 fd ff ff       	call   8048294 <_init>
 80484a3:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 80484a9:	29 c6                	sub    %eax,%esi
 80484ab:	c1 fe 02             	sar    $0x2,%esi
 80484ae:	85 f6                	test   %esi,%esi
 80484b0:	74 27                	je     80484d9 <__libc_csu_init+0x59>
 80484b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80484b8:	8b 44 24 38          	mov    0x38(%esp),%eax
 80484bc:	89 2c 24             	mov    %ebp,(%esp)
 80484bf:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484c3:	8b 44 24 34          	mov    0x34(%esp),%eax
 80484c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484cb:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 80484d2:	83 c7 01             	add    $0x1,%edi
 80484d5:	39 f7                	cmp    %esi,%edi
 80484d7:	75 df                	jne    80484b8 <__libc_csu_init+0x38>
 80484d9:	83 c4 1c             	add    $0x1c,%esp
 80484dc:	5b                   	pop    %ebx
 80484dd:	5e                   	pop    %esi
 80484de:	5f                   	pop    %edi
 80484df:	5d                   	pop    %ebp
 80484e0:	c3                   	ret    
 80484e1:	eb 0d                	jmp    80484f0 <__libc_csu_fini>
 80484e3:	90                   	nop
 80484e4:	90                   	nop
 80484e5:	90                   	nop
 80484e6:	90                   	nop
 80484e7:	90                   	nop
 80484e8:	90                   	nop
 80484e9:	90                   	nop
 80484ea:	90                   	nop
 80484eb:	90                   	nop
 80484ec:	90                   	nop
 80484ed:	90                   	nop
 80484ee:	90                   	nop
 80484ef:	90                   	nop

080484f0 <__libc_csu_fini>:
 80484f0:	f3 c3                	repz ret 

Disassembly of section .fini:

080484f4 <_fini>:
 80484f4:	53                   	push   %ebx
 80484f5:	83 ec 08             	sub    $0x8,%esp
 80484f8:	e8 33 fe ff ff       	call   8048330 <__x86.get_pc_thunk.bx>
 80484fd:	81 c3 37 12 00 00    	add    $0x1237,%ebx
 8048503:	83 c4 08             	add    $0x8,%esp
 8048506:	5b                   	pop    %ebx
 8048507:	c3                   	ret    

Disassembly of section .rodata:

08048508 <_fp_hw>:
 8048508:	03 00                	add    (%eax),%eax
	...

0804850c <_IO_stdin_used>:
 804850c:	01 00                	add    %eax,(%eax)
 804850e:	02 00                	add    (%eax),%al
 8048510:	74 68                	je     804857a <_IO_stdin_used+0x6e>
 8048512:	65 20 6d 61          	and    %ch,%gs:0x61(%ebp)
 8048516:	78 75                	js     804858d <_IO_stdin_used+0x81>
 8048518:	6d                   	insl   (%dx),%es:(%edi)
 8048519:	75 6d                	jne    8048588 <_IO_stdin_used+0x7c>
 804851b:	20 6e 75             	and    %ch,0x75(%esi)
 804851e:	6d                   	insl   (%dx),%es:(%edi)
 804851f:	62 65 72             	bound  %esp,0x72(%ebp)
 8048522:	20 69 73             	and    %ch,0x73(%ecx)
 8048525:	3a 20                	cmp    (%eax),%ah
 8048527:	25                   	.byte 0x25
 8048528:	64 0a 00             	or     %fs:(%eax),%al

Disassembly of section .eh_frame_hdr:

0804852c <.eh_frame_hdr>:
 804852c:	01 1b                	add    %ebx,(%ebx)
 804852e:	03 3b                	add    (%ebx),%edi
 8048530:	30 00                	xor    %al,(%eax)
 8048532:	00 00                	add    %al,(%eax)
 8048534:	05 00 00 00 94       	add    $0x94000000,%eax
 8048539:	fd                   	std    
 804853a:	ff                   	(bad)  
 804853b:	ff 4c 00 00          	decl   0x0(%eax,%eax,1)
 804853f:	00 cf                	add    %cl,%bh
 8048541:	fe                   	(bad)  
 8048542:	ff                   	(bad)  
 8048543:	ff 70 00             	pushl  0x0(%eax)
 8048546:	00 00                	add    %al,(%eax)
 8048548:	e0 fe                	loopne 8048548 <_IO_stdin_used+0x3c>
 804854a:	ff                   	(bad)  
 804854b:	ff 90 00 00 00 54    	call   *0x54000000(%eax)
 8048551:	ff                   	(bad)  
 8048552:	ff                   	(bad)  
 8048553:	ff                   	(bad)  
 8048554:	bc 00 00 00 c4       	mov    $0xc4000000,%esp
 8048559:	ff                   	(bad)  
 804855a:	ff                   	(bad)  
 804855b:	ff                   	(bad)  
 804855c:	f8                   	clc    
 804855d:	00 00                	add    %al,(%eax)
	...

Disassembly of section .eh_frame:

08048560 <__FRAME_END__-0xd8>:
 8048560:	14 00                	adc    $0x0,%al
 8048562:	00 00                	add    %al,(%eax)
 8048564:	00 00                	add    %al,(%eax)
 8048566:	00 00                	add    %al,(%eax)
 8048568:	01 7a 52             	add    %edi,0x52(%edx)
 804856b:	00 01                	add    %al,(%ecx)
 804856d:	7c 08                	jl     8048577 <_IO_stdin_used+0x6b>
 804856f:	01 1b                	add    %ebx,(%ebx)
 8048571:	0c 04                	or     $0x4,%al
 8048573:	04 88                	add    $0x88,%al
 8048575:	01 00                	add    %eax,(%eax)
 8048577:	00 20                	add    %ah,(%eax)
 8048579:	00 00                	add    %al,(%eax)
 804857b:	00 1c 00             	add    %bl,(%eax,%eax,1)
 804857e:	00 00                	add    %al,(%eax)
 8048580:	40                   	inc    %eax
 8048581:	fd                   	std    
 8048582:	ff                   	(bad)  
 8048583:	ff 40 00             	incl   0x0(%eax)
 8048586:	00 00                	add    %al,(%eax)
 8048588:	00 0e                	add    %cl,(%esi)
 804858a:	08 46 0e             	or     %al,0xe(%esi)
 804858d:	0c 4a                	or     $0x4a,%al
 804858f:	0f 0b                	ud2    
 8048591:	74 04                	je     8048597 <_IO_stdin_used+0x8b>
 8048593:	78 00                	js     8048595 <_IO_stdin_used+0x89>
 8048595:	3f                   	aas    
 8048596:	1a 3b                	sbb    (%ebx),%bh
 8048598:	2a 32                	sub    (%edx),%dh
 804859a:	24 22                	and    $0x22,%al
 804859c:	1c 00                	sbb    $0x0,%al
 804859e:	00 00                	add    %al,(%eax)
 80485a0:	40                   	inc    %eax
 80485a1:	00 00                	add    %al,(%eax)
 80485a3:	00 57 fe             	add    %dl,-0x2(%edi)
 80485a6:	ff                   	(bad)  
 80485a7:	ff 11                	call   *(%ecx)
 80485a9:	00 00                	add    %al,(%eax)
 80485ab:	00 00                	add    %al,(%eax)
 80485ad:	41                   	inc    %ecx
 80485ae:	0e                   	push   %cs
 80485af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
 80485b5:	4d                   	dec    %ebp
 80485b6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
 80485b9:	04 00                	add    $0x0,%al
 80485bb:	00 28                	add    %ch,(%eax)
 80485bd:	00 00                	add    %al,(%eax)
 80485bf:	00 60 00             	add    %ah,0x0(%eax)
 80485c2:	00 00                	add    %al,(%eax)
 80485c4:	48                   	dec    %eax
 80485c5:	fe                   	(bad)  
 80485c6:	ff                   	(bad)  
 80485c7:	ff 70 00             	pushl  0x0(%eax)
 80485ca:	00 00                	add    %al,(%eax)
 80485cc:	00 44 0c 01          	add    %al,0x1(%esp,%ecx,1)
 80485d0:	00 47 10             	add    %al,0x10(%edi)
 80485d3:	05 02 75 00 43       	add    $0x43007502,%eax
 80485d8:	0f 03 75 7c          	lsl    0x7c(%ebp),%esi
 80485dc:	06                   	push   %es
 80485dd:	02 5d 0c             	add    0xc(%ebp),%bl
 80485e0:	01 00                	add    %eax,(%eax)
 80485e2:	41                   	inc    %ecx
 80485e3:	c5 43 0c             	lds    0xc(%ebx),%eax
 80485e6:	04 04                	add    $0x4,%al
 80485e8:	38 00                	cmp    %al,(%eax)
 80485ea:	00 00                	add    %al,(%eax)
 80485ec:	8c 00                	mov    %es,(%eax)
 80485ee:	00 00                	add    %al,(%eax)
 80485f0:	90                   	nop
 80485f1:	fe                   	(bad)  
 80485f2:	ff                   	(bad)  
 80485f3:	ff 61 00             	jmp    *0x0(%ecx)
 80485f6:	00 00                	add    %al,(%eax)
 80485f8:	00 41 0e             	add    %al,0xe(%ecx)
 80485fb:	08 85 02 41 0e 0c    	or     %al,0xc0e4102(%ebp)
 8048601:	87 03                	xchg   %eax,(%ebx)
 8048603:	43                   	inc    %ebx
 8048604:	0e                   	push   %cs
 8048605:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
 804860b:	83 05 4e 0e 30 02 48 	addl   $0x48,0x2300e4e
 8048612:	0e                   	push   %cs
 8048613:	14 41                	adc    $0x41,%al
 8048615:	c3                   	ret    
 8048616:	0e                   	push   %cs
 8048617:	10 41 c6             	adc    %al,-0x3a(%ecx)
 804861a:	0e                   	push   %cs
 804861b:	0c 41                	or     $0x41,%al
 804861d:	c7                   	(bad)  
 804861e:	0e                   	push   %cs
 804861f:	08 41 c5             	or     %al,-0x3b(%ecx)
 8048622:	0e                   	push   %cs
 8048623:	04 10                	add    $0x10,%al
 8048625:	00 00                	add    %al,(%eax)
 8048627:	00 c8                	add    %cl,%al
 8048629:	00 00                	add    %al,(%eax)
 804862b:	00 c4                	add    %al,%ah
 804862d:	fe                   	(bad)  
 804862e:	ff                   	(bad)  
 804862f:	ff 02                	incl   (%edx)
 8048631:	00 00                	add    %al,(%eax)
 8048633:	00 00                	add    %al,(%eax)
 8048635:	00 00                	add    %al,(%eax)
	...

08048638 <__FRAME_END__>:
 8048638:	00 00                	add    %al,(%eax)
	...

Disassembly of section .init_array:

0804963c <__frame_dummy_init_array_entry>:
 804963c:	d0                   	.byte 0xd0
 804963d:	83                   	.byte 0x83
 804963e:	04 08                	add    $0x8,%al

Disassembly of section .fini_array:

08049640 <__do_global_dtors_aux_fini_array_entry>:
 8049640:	b0 83                	mov    $0x83,%al
 8049642:	04 08                	add    $0x8,%al

Disassembly of section .jcr:

08049644 <__JCR_END__>:
 8049644:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

08049648 <_DYNAMIC>:
 8049648:	01 00                	add    %eax,(%eax)
 804964a:	00 00                	add    %al,(%eax)
 804964c:	01 00                	add    %eax,(%eax)
 804964e:	00 00                	add    %al,(%eax)
 8049650:	0c 00                	or     $0x0,%al
 8049652:	00 00                	add    %al,(%eax)
 8049654:	94                   	xchg   %eax,%esp
 8049655:	82                   	(bad)  
 8049656:	04 08                	add    $0x8,%al
 8049658:	0d 00 00 00 f4       	or     $0xf4000000,%eax
 804965d:	84 04 08             	test   %al,(%eax,%ecx,1)
 8049660:	19 00                	sbb    %eax,(%eax)
 8049662:	00 00                	add    %al,(%eax)
 8049664:	3c 96                	cmp    $0x96,%al
 8049666:	04 08                	add    $0x8,%al
 8049668:	1b 00                	sbb    (%eax),%eax
 804966a:	00 00                	add    %al,(%eax)
 804966c:	04 00                	add    $0x0,%al
 804966e:	00 00                	add    %al,(%eax)
 8049670:	1a 00                	sbb    (%eax),%al
 8049672:	00 00                	add    %al,(%eax)
 8049674:	40                   	inc    %eax
 8049675:	96                   	xchg   %eax,%esi
 8049676:	04 08                	add    $0x8,%al
 8049678:	1c 00                	sbb    $0x0,%al
 804967a:	00 00                	add    %al,(%eax)
 804967c:	04 00                	add    $0x0,%al
 804967e:	00 00                	add    %al,(%eax)
 8049680:	f5                   	cmc    
 8049681:	fe                   	(bad)  
 8049682:	ff 6f 8c             	ljmp   *-0x74(%edi)
 8049685:	81 04 08 05 00 00 00 	addl   $0x5,(%eax,%ecx,1)
 804968c:	fc                   	cld    
 804968d:	81 04 08 06 00 00 00 	addl   $0x6,(%eax,%ecx,1)
 8049694:	ac                   	lods   %ds:(%esi),%al
 8049695:	81 04 08 0a 00 00 00 	addl   $0xa,(%eax,%ecx,1)
 804969c:	4c                   	dec    %esp
 804969d:	00 00                	add    %al,(%eax)
 804969f:	00 0b                	add    %cl,(%ebx)
 80496a1:	00 00                	add    %al,(%eax)
 80496a3:	00 10                	add    %dl,(%eax)
 80496a5:	00 00                	add    %al,(%eax)
 80496a7:	00 15 00 00 00 00    	add    %dl,0x0
 80496ad:	00 00                	add    %al,(%eax)
 80496af:	00 03                	add    %al,(%ebx)
 80496b1:	00 00                	add    %al,(%eax)
 80496b3:	00 34 97             	add    %dh,(%edi,%edx,4)
 80496b6:	04 08                	add    $0x8,%al
 80496b8:	02 00                	add    (%eax),%al
 80496ba:	00 00                	add    %al,(%eax)
 80496bc:	18 00                	sbb    %al,(%eax)
 80496be:	00 00                	add    %al,(%eax)
 80496c0:	14 00                	adc    $0x0,%al
 80496c2:	00 00                	add    %al,(%eax)
 80496c4:	11 00                	adc    %eax,(%eax)
 80496c6:	00 00                	add    %al,(%eax)
 80496c8:	17                   	pop    %ss
 80496c9:	00 00                	add    %al,(%eax)
 80496cb:	00 7c 82 04          	add    %bh,0x4(%edx,%eax,4)
 80496cf:	08 11                	or     %dl,(%ecx)
 80496d1:	00 00                	add    %al,(%eax)
 80496d3:	00 74 82 04          	add    %dh,0x4(%edx,%eax,4)
 80496d7:	08 12                	or     %dl,(%edx)
 80496d9:	00 00                	add    %al,(%eax)
 80496db:	00 08                	add    %cl,(%eax)
 80496dd:	00 00                	add    %al,(%eax)
 80496df:	00 13                	add    %dl,(%ebx)
 80496e1:	00 00                	add    %al,(%eax)
 80496e3:	00 08                	add    %cl,(%eax)
 80496e5:	00 00                	add    %al,(%eax)
 80496e7:	00 fe                	add    %bh,%dh
 80496e9:	ff                   	(bad)  
 80496ea:	ff 6f 54             	ljmp   *0x54(%edi)
 80496ed:	82                   	(bad)  
 80496ee:	04 08                	add    $0x8,%al
 80496f0:	ff                   	(bad)  
 80496f1:	ff                   	(bad)  
 80496f2:	ff 6f 01             	ljmp   *0x1(%edi)
 80496f5:	00 00                	add    %al,(%eax)
 80496f7:	00 f0                	add    %dh,%al
 80496f9:	ff                   	(bad)  
 80496fa:	ff 6f 48             	ljmp   *0x48(%edi)
 80496fd:	82                   	(bad)  
 80496fe:	04 08                	add    $0x8,%al
	...

Disassembly of section .got:

08049730 <.got>:
 8049730:	00 00                	add    %al,(%eax)
	...

Disassembly of section .got.plt:

08049734 <_GLOBAL_OFFSET_TABLE_>:
 8049734:	48                   	dec    %eax
 8049735:	96                   	xchg   %eax,%esi
 8049736:	04 08                	add    $0x8,%al
	...
 8049740:	d6                   	(bad)  
 8049741:	82                   	(bad)  
 8049742:	04 08                	add    $0x8,%al
 8049744:	e6 82                	out    %al,$0x82
 8049746:	04 08                	add    $0x8,%al
 8049748:	f6                   	.byte 0xf6
 8049749:	82                   	(bad)  
 804974a:	04 08                	add    $0x8,%al

Disassembly of section .data:

0804974c <__data_start>:
 804974c:	00 00                	add    %al,(%eax)
	...

08049750 <__dso_handle>:
 8049750:	00 00                	add    %al,(%eax)
	...

Disassembly of section .bss:

08049754 <__bss_start>:
 8049754:	00 00                	add    %al,(%eax)
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
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	fb                   	sti    
  11:	83 04 08 81          	addl   $0xffffff81,(%eax,%ecx,1)
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	18 01                	sbb    %al,(%ecx)
   2:	00 00                	add    %al,(%eax)
   4:	04 00                	add    $0x0,%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 01                	add    $0x1,%al
   c:	38 00                	cmp    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	01 75 00             	add    %esi,0x0(%ebp)
  13:	00 00                	add    %al,(%eax)
  15:	7c 00                	jl     17 <_init-0x804827d>
  17:	00 00                	add    %al,(%eax)
  19:	fb                   	sti    
  1a:	83 04 08 81          	addl   $0xffffff81,(%eax,%ecx,1)
  1e:	00 00                	add    %al,(%eax)
  20:	00 00                	add    %al,(%eax)
  22:	00 00                	add    %al,(%eax)
  24:	00 02                	add    %al,(%edx)
  26:	04 07                	add    $0x7,%al
  28:	2b 00                	sub    (%eax),%eax
  2a:	00 00                	add    %al,(%eax)
  2c:	02 01                	add    (%ecx),%al
  2e:	08 62 00             	or     %ah,0x0(%edx)
  31:	00 00                	add    %al,(%eax)
  33:	02 02                	add    (%edx),%al
  35:	07                   	pop    %es
  36:	0e                   	push   %cs
  37:	00 00                	add    %al,(%eax)
  39:	00 02                	add    %al,(%edx)
  3b:	04 07                	add    $0x7,%al
  3d:	26 00 00             	add    %al,%es:(%eax)
  40:	00 02                	add    %al,(%edx)
  42:	01 06                	add    %eax,(%esi)
  44:	64 00 00             	add    %al,%fs:(%eax)
  47:	00 02                	add    %al,(%edx)
  49:	02 05 9b 00 00 00    	add    0x9b,%al
  4f:	03 04 05 69 6e 74 00 	add    0x746e69(,%eax,1),%eax
  56:	02 08                	add    (%eax),%cl
  58:	05 00 00 00 00       	add    $0x0,%eax
  5d:	02 08                	add    (%eax),%cl
  5f:	07                   	pop    %es
  60:	21 00                	and    %eax,(%eax)
  62:	00 00                	add    %al,(%eax)
  64:	02 04 05 05 00 00 00 	add    0x5(,%eax,1),%al
  6b:	02 04 07             	add    (%edi,%eax,1),%al
  6e:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  6f:	00 00                	add    %al,(%eax)
  71:	00 02                	add    %al,(%edx)
  73:	01 06                	add    %eax,(%esi)
  75:	6b 00 00             	imul   $0x0,(%eax),%eax
  78:	00 04 6d 61 78 00 01 	add    %al,0x1007861(,%ebp,2)
  7f:	11 4f 00             	adc    %ecx,0x0(%edi)
  82:	00 00                	add    %al,(%eax)
  84:	fb                   	sti    
  85:	83 04 08 11          	addl   $0x11,(%eax,%ecx,1)
  89:	00 00                	add    %al,(%eax)
  8b:	00 01                	add    %al,(%ecx)
  8d:	9c                   	pushf  
  8e:	ab                   	stos   %eax,%es:(%edi)
  8f:	00 00                	add    %al,(%eax)
  91:	00 05 78 00 01 11    	add    %al,0x11010078
  97:	4f                   	dec    %edi
  98:	00 00                	add    %al,(%eax)
  9a:	00 02                	add    %al,(%edx)
  9c:	91                   	xchg   %eax,%ecx
  9d:	00 05 79 00 01 11    	add    %al,0x11010079
  a3:	4f                   	dec    %edi
  a4:	00 00                	add    %al,(%eax)
  a6:	00 02                	add    %al,(%edx)
  a8:	91                   	xchg   %eax,%ecx
  a9:	04 00                	add    $0x0,%al
  ab:	06                   	push   %es
  ac:	70 00                	jo     ae <_init-0x80481e6>
  ae:	00 00                	add    %al,(%eax)
  b0:	01 16                	add    %edx,(%esi)
  b2:	4f                   	dec    %edi
  b3:	00 00                	add    %al,(%eax)
  b5:	00 0c 84             	add    %cl,(%esp,%eax,4)
  b8:	04 08                	add    $0x8,%al
  ba:	70 00                	jo     bc <_init-0x80481d8>
  bc:	00 00                	add    %al,(%eax)
  be:	01 9c 01 01 00 00 07 	add    %ebx,0x7000001(%ecx,%eax,1)
  c5:	70 00                	jo     c7 <_init-0x80481cd>
  c7:	01 19                	add    %ebx,(%ecx)
  c9:	15 01 00 00 02       	adc    $0x2000001,%eax
  ce:	75 74                	jne    144 <_init-0x8048150>
  d0:	07                   	pop    %es
  d1:	61                   	popa   
  d2:	00 01                	add    %al,(%ecx)
  d4:	1a 4f 00             	sbb    0x0(%edi),%cl
  d7:	00 00                	add    %al,(%eax)
  d9:	02 75 70             	add    0x70(%ebp),%dh
  dc:	07                   	pop    %es
  dd:	62 00                	bound  %eax,(%eax)
  df:	01 1a                	add    %ebx,(%edx)
  e1:	4f                   	dec    %edi
  e2:	00 00                	add    %al,(%eax)
  e4:	00 02                	add    %al,(%edx)
  e6:	75 6c                	jne    154 <_init-0x8048140>
  e8:	07                   	pop    %es
  e9:	63 00                	arpl   %ax,(%eax)
  eb:	01 1a                	add    %ebx,(%edx)
  ed:	4f                   	dec    %edi
  ee:	00 00                	add    %al,(%eax)
  f0:	00 02                	add    %al,(%edx)
  f2:	75 68                	jne    15c <_init-0x8048138>
  f4:	07                   	pop    %es
  f5:	64 00 01             	add    %al,%fs:(%ecx)
  f8:	1a 4f 00             	sbb    0x0(%edi),%cl
  fb:	00 00                	add    %al,(%eax)
  fd:	02 75 64             	add    0x64(%ebp),%dh
 100:	00 08                	add    %cl,(%eax)
 102:	4f                   	dec    %edi
 103:	00 00                	add    %al,(%eax)
 105:	00 15 01 00 00 09    	add    %dl,0x9000001
 10b:	4f                   	dec    %edi
 10c:	00 00                	add    %al,(%eax)
 10e:	00 09                	add    %cl,(%ecx)
 110:	4f                   	dec    %edi
 111:	00 00                	add    %al,(%eax)
 113:	00 00                	add    %al,(%eax)
 115:	0a 04 01             	or     (%ecx,%eax,1),%al
 118:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
   8:	0e                   	push   %cs
   9:	1b 0e                	sbb    (%esi),%ecx
   b:	11 01                	adc    %eax,(%ecx)
   d:	12 06                	adc    (%esi),%al
   f:	10 17                	adc    %dl,(%edi)
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
  28:	00 04 2e             	add    %al,(%esi,%ebp,1)
  2b:	01 3f                	add    %edi,(%edi)
  2d:	19 03                	sbb    %eax,(%ebx)
  2f:	08 3a                	or     %bh,(%edx)
  31:	0b 3b                	or     (%ebx),%edi
  33:	0b 27                	or     (%edi),%esp
  35:	19 49 13             	sbb    %ecx,0x13(%ecx)
  38:	11 01                	adc    %eax,(%ecx)
  3a:	12 06                	adc    (%esi),%al
  3c:	40                   	inc    %eax
  3d:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
  43:	00 00                	add    %al,(%eax)
  45:	05 05 00 03 08       	add    $0x8030005,%eax
  4a:	3a 0b                	cmp    (%ebx),%cl
  4c:	3b 0b                	cmp    (%ebx),%ecx
  4e:	49                   	dec    %ecx
  4f:	13 02                	adc    (%edx),%eax
  51:	18 00                	sbb    %al,(%eax)
  53:	00 06                	add    %al,(%esi)
  55:	2e 01 3f             	add    %edi,%cs:(%edi)
  58:	19 03                	sbb    %eax,(%ebx)
  5a:	0e                   	push   %cs
  5b:	3a 0b                	cmp    (%ebx),%cl
  5d:	3b 0b                	cmp    (%ebx),%ecx
  5f:	27                   	daa    
  60:	19 49 13             	sbb    %ecx,0x13(%ecx)
  63:	11 01                	adc    %eax,(%ecx)
  65:	12 06                	adc    (%esi),%al
  67:	40                   	inc    %eax
  68:	18 96 42 19 01 13    	sbb    %dl,0x13011942(%esi)
  6e:	00 00                	add    %al,(%eax)
  70:	07                   	pop    %es
  71:	34 00                	xor    $0x0,%al
  73:	03 08                	add    (%eax),%ecx
  75:	3a 0b                	cmp    (%ebx),%cl
  77:	3b 0b                	cmp    (%ebx),%ecx
  79:	49                   	dec    %ecx
  7a:	13 02                	adc    (%edx),%eax
  7c:	18 00                	sbb    %al,(%eax)
  7e:	00 08                	add    %cl,(%eax)
  80:	15 01 27 19 49       	adc    $0x49192701,%eax
  85:	13 01                	adc    (%ecx),%eax
  87:	13 00                	adc    (%eax),%eax
  89:	00 09                	add    %cl,(%ecx)
  8b:	05 00 49 13 00       	add    $0x134900,%eax
  90:	00 0a                	add    %cl,(%edx)
  92:	0f 00 0b             	str    (%ebx)
  95:	0b 49 13             	or     0x13(%ecx),%ecx
  98:	00 00                	add    %al,(%eax)
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	44                   	inc    %esp
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 1d 00 00 00 01    	add    %bl,0x1000000
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	00 6d 61             	add    %ch,0x61(%ebp)
  1e:	69 6e 2e 63 00 00 00 	imul   $0x63,0x2e(%esi),%ebp
  25:	00 00                	add    %al,(%eax)
  27:	00 05 02 fb 83 04    	add    %al,0x483fb02
  2d:	08 03                	or     %al,(%ebx)
  2f:	11 01                	adc    %eax,(%ecx)
  31:	3d 00 02 04 01       	cmp    $0x1040200,%eax
  36:	bb 31 08 14 75       	mov    $0x75140831,%ebx
  3b:	08 4d 02             	or     %cl,0x2(%ebp)
  3e:	23 14 08             	and    (%eax,%ecx,1),%edx
  41:	30 59 02             	xor    %bl,0x2(%ecx)
  44:	08 00                	or     %al,(%eax)
  46:	01 01                	add    %eax,(%ecx)

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	insb   (%dx),%es:(%edi)
   1:	6f                   	outsl  %ds:(%esi),(%dx)
   2:	6e                   	outsb  %ds:(%esi),(%dx)
   3:	67 20 6c 6f          	and    %ch,0x6f(%si)
   7:	6e                   	outsb  %ds:(%esi),(%dx)
   8:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
   c:	74 00                	je     e <_init-0x8048286>
   e:	73 68                	jae    78 <_init-0x804821c>
  10:	6f                   	outsl  %ds:(%esi),(%dx)
  11:	72 74                	jb     87 <_init-0x804820d>
  13:	20 75 6e             	and    %dh,0x6e(%ebp)
  16:	73 69                	jae    81 <_init-0x8048213>
  18:	67 6e                	outsb  %ds:(%si),(%dx)
  1a:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  1f:	74 00                	je     21 <_init-0x8048273>
  21:	6c                   	insb   (%dx),%es:(%edi)
  22:	6f                   	outsl  %ds:(%esi),(%dx)
  23:	6e                   	outsb  %ds:(%esi),(%dx)
  24:	67 20 6c 6f          	and    %ch,0x6f(%si)
  28:	6e                   	outsb  %ds:(%esi),(%dx)
  29:	67 20 75 6e          	and    %dh,0x6e(%di)
  2d:	73 69                	jae    98 <_init-0x80481fc>
  2f:	67 6e                	outsb  %ds:(%si),(%dx)
  31:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
  36:	74 00                	je     38 <_init-0x804825c>
  38:	47                   	inc    %edi
  39:	4e                   	dec    %esi
  3a:	55                   	push   %ebp
  3b:	20 43 20             	and    %al,0x20(%ebx)
  3e:	34 2e                	xor    $0x2e,%al
  40:	39 2e                	cmp    %ebp,(%esi)
  42:	32 20                	xor    (%eax),%ah
  44:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
  49:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
  4f:	72 69                	jb     ba <_init-0x80481da>
  51:	63 20                	arpl   %sp,(%eax)
  53:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
  58:	68 3d 69 35 38       	push   $0x3835693d
  5d:	36 20 2d 67 00 75 6e 	and    %ch,%ss:0x6e750067
  64:	73 69                	jae    cf <_init-0x80481c5>
  66:	67 6e                	outsb  %ds:(%si),(%dx)
  68:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
  6d:	61                   	popa   
  6e:	72 00                	jb     70 <_init-0x8048224>
  70:	6d                   	insl   (%dx),%es:(%edi)
  71:	61                   	popa   
  72:	69 6e 00 6d 61 69 6e 	imul   $0x6e69616d,0x0(%esi),%ebp
  79:	2e 63 00             	arpl   %ax,%cs:(%eax)
  7c:	2f                   	das    
  7d:	72 6f                	jb     ee <_init-0x80481a6>
  7f:	6f                   	outsl  %ds:(%esi),(%dx)
  80:	74 2f                	je     b1 <_init-0x80481e3>
  82:	70 72                	jo     f6 <_init-0x804819e>
  84:	6f                   	outsl  %ds:(%esi),(%dx)
  85:	67 72 61             	addr16 jb e9 <_init-0x80481ab>
  88:	6d                   	insl   (%dx),%es:(%edi)
  89:	6d                   	insl   (%dx),%es:(%edi)
  8a:	69 6e 67 2f 63 2f 66 	imul   $0x662f632f,0x67(%esi),%ebp
  91:	75 6e                	jne    101 <_init-0x8048193>
  93:	70 6f                	jo     104 <_init-0x8048190>
  95:	69 6e 74 65 72 00 73 	imul   $0x73007265,0x74(%esi),%ebp
  9c:	68 6f 72 74 20       	push   $0x2074726f
  a1:	69 6e 74 00 73 69 7a 	imul   $0x7a697300,0x74(%esi),%ebp
  a8:	65 74 79             	gs je  124 <_init-0x8048170>
  ab:	70 65                	jo     112 <_init-0x8048182>
	...
