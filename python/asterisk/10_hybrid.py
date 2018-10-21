#!/usr/bin/env python3
# -*- coding:UTF-8

def hybrid(*args, **kwargs):
    print(args)
    print(kwargs)
    print(type(args))
    print(type(kwargs))
    for key, value in kwargs.items():
        print(key, value)
# 这样定义错误
#def hybrid1(*args, **kwargs, *args):
#    print(args)
#    print(kwargs)
		
# 这样定义也错误
#def hybrid2(*args, **kwargs, arg):
#    print(args)
#    print(kwargs)

def hybrid3(arg, *args, **kwargs):
    print(args)
    print(kwargs)

def hybrid4(arg, *args, z=100,  **kwargs):
    print(args)
    print(kwargs)
 
#语法错误
#def hybrid5(*args, **kwargs,z=100):
#    print(args)
#    print(kwargs)

# 同样错误
#def hybrid6(**kwargs,z=100):
#    print(kwargs)
#
# 这样定义通过， 调用不通过
def hybrid7(*args, arg):
    print(args)
# 总结一下 固定参数再非固定参数之前 
if __name__ == '__main__':
 
    a = [1, 50, 99]
    d = {"y": 23, "z": 56, "x": 15}
    
    # 下面三个恒等
    #hybrid(*a, **d)
    #hybrid(*[1, 50, 99], **{"y": 23, "z": 56, "x": 15})
    #hybrid(1, 50, 99, y=23, z=56, x=15)

	# SyntaxError: iterable argument unpacking follows keyword argument unpacking
    #hybrid(*a, **d, *a)
    #hybrid1(*a, **d, *a)
	
    #SyntaxError: iterable argument unpacking follows keyword argument unpacking
    #hybrid(**d, *a)

    # 
    #hybrid3("h", *a, **d)
    #hybrid3(*a, **d)
    # 恰好有默认参数时才会覆盖 
    hybrid4(*a, **d)


    #  调用不通过
    #hybrid7(*a)


