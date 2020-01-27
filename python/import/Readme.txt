  


# 在相应模块的初始化文件中导入
        # 注意这里 需要在相应 module 里面的 __init__.py文件中写入
        # from flow import handler

# 用 pdb  dir 调试过程
ericksun@192.168.56.101:~/vstation_frame_for_private_cloud-1.0$ python -m pdb executor.py FLOW FLOW
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(6)<module>()
-> '''
(Pdb) break main
Breakpoint 1 at /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py:99
(Pdb) c
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(100)main()
-> argv_len = len(sys.argv)
(Pdb) dir()
[]
(Pdb) n
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(101)main()
-> if argv_len <= 2:
(Pdb)
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(105)main()
-> module_name = sys.argv[1]
(Pdb)
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(106)main()
-> print 'Info: %s' % sys.argv
(Pdb)
Info: ['executor.py', 'FLOW', 'FLOW']
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(107)main()
-> try:
(Pdb)
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(108)main()
-> module = __import__(module_name)
(Pdb) dir()
['argv_len', 'module_name']
(Pdb) n
> /home/ericksun/vstation_frame_for_private_cloud-1.0/executor.py(109)main()
-> callback = module.handler
(Pdb) dir()
['argv_len', 'module', 'module_name']
(Pdb) dir(module)
['__builtins__', '__doc__', '__file__', '__name__', '__package__', '__path__', 'flow', 'handler']

(Pdb) dir(module)
['__builtins__', '__doc__', '__file__', '__name__', '__package__', '__path__', 'flow', 'handler']
(Pdb) dir(module.flow)
['__builtins__', '__doc__', '__file__', '__name__', '__package__', 'handler']
(Pdb) dir(module.flow.handler)
['__call__', '__class__', '__closure__', '__code__', '__defaults__', '__delattr__', '__dict__', '__doc__', '__format__', '__get__', '__getattribute__', '__globals__', '__hash__', '__init__', '__module__', '__name__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'func_closure', 'func_code', 'func_defaults', 'func_dict', 'func_doc', 'func_globals', 'func_name']

