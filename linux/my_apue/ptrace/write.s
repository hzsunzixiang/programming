
a.out:     file format elf32-i386


Disassembly of section .init:

080482bc <_init>:
 80482bc:	55                   	push   %ebp
 80482bd:	89 e5                	mov    %esp,%ebp
 80482bf:	53                   	push   %ebx
 80482c0:	83 ec 04             	sub    $0x4,%esp
 80482c3:	e8 00 00 00 00       	call   80482c8 <_init+0xc>
 80482c8:	5b                   	pop    %ebx
 80482c9:	81 c3 9c 13 00 00    	add    $0x139c,%ebx
 80482cf:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 80482d5:	85 d2                	test   %edx,%edx
 80482d7:	74 05                	je     80482de <_init+0x22>
 80482d9:	e8 22 00 00 00       	call   8048300 <__gmon_start__@plt>
 80482de:	58                   	pop    %eax
 80482df:	5b                   	pop    %ebx
 80482e0:	c9                   	leave  
 80482e1:	c3                   	ret    

Disassembly of section .plt:

080482f0 <__gmon_start__@plt-0x10>:
 80482f0:	ff 35 68 96 04 08    	pushl  0x8049668
 80482f6:	ff 25 6c 96 04 08    	jmp    *0x804966c
 80482fc:	00 00                	add    %al,(%eax)
	...

08048300 <__gmon_start__@plt>:
 8048300:	ff 25 70 96 04 08    	jmp    *0x8049670
 8048306:	68 00 00 00 00       	push   $0x0
 804830b:	e9 e0 ff ff ff       	jmp    80482f0 <_init+0x34>

08048310 <__libc_start_main@plt>:
 8048310:	ff 25 74 96 04 08    	jmp    *0x8049674
 8048316:	68 08 00 00 00       	push   $0x8
 804831b:	e9 d0 ff ff ff       	jmp    80482f0 <_init+0x34>

08048320 <write@plt>:
 8048320:	ff 25 78 96 04 08    	jmp    *0x8049678
 8048326:	68 10 00 00 00       	push   $0x10
 804832b:	e9 c0 ff ff ff       	jmp    80482f0 <_init+0x34>

Disassembly of section .text:

08048330 <_start>:
 8048330:	31 ed                	xor    %ebp,%ebp
 8048332:	5e                   	pop    %esi
 8048333:	89 e1                	mov    %esp,%ecx
 8048335:	83 e4 f0             	and    $0xfffffff0,%esp
 8048338:	50                   	push   %eax
 8048339:	54                   	push   %esp
 804833a:	52                   	push   %edx
 804833b:	68 50 84 04 08       	push   $0x8048450
 8048340:	68 60 84 04 08       	push   $0x8048460
 8048345:	51                   	push   %ecx
 8048346:	56                   	push   %esi
 8048347:	68 1c 84 04 08       	push   $0x804841c
 804834c:	e8 bf ff ff ff       	call   8048310 <__libc_start_main@plt>
 8048351:	f4                   	hlt    
 8048352:	90                   	nop
 8048353:	90                   	nop
 8048354:	90                   	nop
 8048355:	90                   	nop
 8048356:	90                   	nop
 8048357:	90                   	nop
 8048358:	90                   	nop
 8048359:	90                   	nop
 804835a:	90                   	nop
 804835b:	90                   	nop
 804835c:	90                   	nop
 804835d:	90                   	nop
 804835e:	90                   	nop
 804835f:	90                   	nop

08048360 <deregister_tm_clones>:
 8048360:	b8 87 96 04 08       	mov    $0x8049687,%eax
 8048365:	2d 84 96 04 08       	sub    $0x8049684,%eax
 804836a:	83 f8 06             	cmp    $0x6,%eax
 804836d:	77 02                	ja     8048371 <deregister_tm_clones+0x11>
 804836f:	f3 c3                	repz ret 
 8048371:	b8 00 00 00 00       	mov    $0x0,%eax
 8048376:	85 c0                	test   %eax,%eax
 8048378:	74 f5                	je     804836f <deregister_tm_clones+0xf>
 804837a:	55                   	push   %ebp
 804837b:	89 e5                	mov    %esp,%ebp
 804837d:	83 ec 18             	sub    $0x18,%esp
 8048380:	c7 04 24 84 96 04 08 	movl   $0x8049684,(%esp)
 8048387:	ff d0                	call   *%eax
 8048389:	c9                   	leave  
 804838a:	c3                   	ret    
 804838b:	90                   	nop
 804838c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048390 <register_tm_clones>:
 8048390:	b8 84 96 04 08       	mov    $0x8049684,%eax
 8048395:	2d 84 96 04 08       	sub    $0x8049684,%eax
 804839a:	c1 f8 02             	sar    $0x2,%eax
 804839d:	89 c2                	mov    %eax,%edx
 804839f:	c1 ea 1f             	shr    $0x1f,%edx
 80483a2:	01 d0                	add    %edx,%eax
 80483a4:	d1 f8                	sar    %eax
 80483a6:	75 02                	jne    80483aa <register_tm_clones+0x1a>
 80483a8:	f3 c3                	repz ret 
 80483aa:	ba 00 00 00 00       	mov    $0x0,%edx
 80483af:	85 d2                	test   %edx,%edx
 80483b1:	74 f5                	je     80483a8 <register_tm_clones+0x18>
 80483b3:	55                   	push   %ebp
 80483b4:	89 e5                	mov    %esp,%ebp
 80483b6:	83 ec 18             	sub    $0x18,%esp
 80483b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80483bd:	c7 04 24 84 96 04 08 	movl   $0x8049684,(%esp)
 80483c4:	ff d2                	call   *%edx
 80483c6:	c9                   	leave  
 80483c7:	c3                   	ret    
 80483c8:	90                   	nop
 80483c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

080483d0 <__do_global_dtors_aux>:
 80483d0:	80 3d 84 96 04 08 00 	cmpb   $0x0,0x8049684
 80483d7:	75 13                	jne    80483ec <__do_global_dtors_aux+0x1c>
 80483d9:	55                   	push   %ebp
 80483da:	89 e5                	mov    %esp,%ebp
 80483dc:	83 ec 08             	sub    $0x8,%esp
 80483df:	e8 7c ff ff ff       	call   8048360 <deregister_tm_clones>
 80483e4:	c6 05 84 96 04 08 01 	movb   $0x1,0x8049684
 80483eb:	c9                   	leave  
 80483ec:	f3 c3                	repz ret 
 80483ee:	66 90                	xchg   %ax,%ax

080483f0 <frame_dummy>:
 80483f0:	a1 6c 95 04 08       	mov    0x804956c,%eax
 80483f5:	85 c0                	test   %eax,%eax
 80483f7:	74 1e                	je     8048417 <frame_dummy+0x27>
 80483f9:	b8 00 00 00 00       	mov    $0x0,%eax
 80483fe:	85 c0                	test   %eax,%eax
 8048400:	74 15                	je     8048417 <frame_dummy+0x27>
 8048402:	55                   	push   %ebp
 8048403:	89 e5                	mov    %esp,%ebp
 8048405:	83 ec 18             	sub    $0x18,%esp
 8048408:	c7 04 24 6c 95 04 08 	movl   $0x804956c,(%esp)
 804840f:	ff d0                	call   *%eax
 8048411:	c9                   	leave  
 8048412:	e9 79 ff ff ff       	jmp    8048390 <register_tm_clones>
 8048417:	e9 74 ff ff ff       	jmp    8048390 <register_tm_clones>

#write(2, "Hello", 5);
0804841c <main>:
 804841c:	55                   	push   %ebp
 804841d:	89 e5                	mov    %esp,%ebp
 804841f:	83 e4 f0             	and    $0xfffffff0,%esp
 8048422:	83 ec 10             	sub    $0x10,%esp
 8048425:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
 804842c:	00 
 804842d:	c7 44 24 04 e0 84 04 	movl   $0x80484e0,0x4(%esp)
 8048434:	08 
 8048435:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804843c:	e8 df fe ff ff       	call   8048320 <write@plt>
 8048441:	b8 00 00 00 00       	mov    $0x0,%eax
 8048446:	c9                   	leave  
 8048447:	c3                   	ret    
 8048448:	90                   	nop
 8048449:	90                   	nop
 804844a:	90                   	nop
 804844b:	90                   	nop
 804844c:	90                   	nop
 804844d:	90                   	nop
 804844e:	90                   	nop
 804844f:	90                   	nop

08048450 <__libc_csu_fini>:
 8048450:	55                   	push   %ebp
 8048451:	89 e5                	mov    %esp,%ebp
 8048453:	5d                   	pop    %ebp
 8048454:	c3                   	ret    
 8048455:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048460 <__libc_csu_init>:
 8048460:	55                   	push   %ebp
 8048461:	89 e5                	mov    %esp,%ebp
 8048463:	57                   	push   %edi
 8048464:	56                   	push   %esi
 8048465:	53                   	push   %ebx
 8048466:	e8 4f 00 00 00       	call   80484ba <__i686.get_pc_thunk.bx>
 804846b:	81 c3 f9 11 00 00    	add    $0x11f9,%ebx
 8048471:	83 ec 1c             	sub    $0x1c,%esp
 8048474:	e8 43 fe ff ff       	call   80482bc <_init>
 8048479:	8d bb 04 ff ff ff    	lea    -0xfc(%ebx),%edi
 804847f:	8d 83 00 ff ff ff    	lea    -0x100(%ebx),%eax
 8048485:	29 c7                	sub    %eax,%edi
 8048487:	c1 ff 02             	sar    $0x2,%edi
 804848a:	85 ff                	test   %edi,%edi
 804848c:	74 24                	je     80484b2 <__libc_csu_init+0x52>
 804848e:	31 f6                	xor    %esi,%esi
 8048490:	8b 45 10             	mov    0x10(%ebp),%eax
 8048493:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048497:	8b 45 0c             	mov    0xc(%ebp),%eax
 804849a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804849e:	8b 45 08             	mov    0x8(%ebp),%eax
 80484a1:	89 04 24             	mov    %eax,(%esp)
 80484a4:	ff 94 b3 00 ff ff ff 	call   *-0x100(%ebx,%esi,4)
 80484ab:	83 c6 01             	add    $0x1,%esi
 80484ae:	39 fe                	cmp    %edi,%esi
 80484b0:	72 de                	jb     8048490 <__libc_csu_init+0x30>
 80484b2:	83 c4 1c             	add    $0x1c,%esp
 80484b5:	5b                   	pop    %ebx
 80484b6:	5e                   	pop    %esi
 80484b7:	5f                   	pop    %edi
 80484b8:	5d                   	pop    %ebp
 80484b9:	c3                   	ret    

080484ba <__i686.get_pc_thunk.bx>:
 80484ba:	8b 1c 24             	mov    (%esp),%ebx
 80484bd:	c3                   	ret    
 80484be:	90                   	nop
 80484bf:	90                   	nop

Disassembly of section .fini:

080484c0 <_fini>:
 80484c0:	55                   	push   %ebp
 80484c1:	89 e5                	mov    %esp,%ebp
 80484c3:	53                   	push   %ebx
 80484c4:	83 ec 04             	sub    $0x4,%esp
 80484c7:	e8 00 00 00 00       	call   80484cc <_fini+0xc>
 80484cc:	5b                   	pop    %ebx
 80484cd:	81 c3 98 11 00 00    	add    $0x1198,%ebx
 80484d3:	59                   	pop    %ecx
 80484d4:	5b                   	pop    %ebx
 80484d5:	c9                   	leave  
 80484d6:	c3                   	ret    
