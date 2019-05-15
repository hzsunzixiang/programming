# -*- coding:utf-8 -*-

print("first in __init__ file")
def mount():
    print("in mount")
    import glob
    import pathlib
    import os
    import ast
    #from framework import conf
    #from framework import log
    py_files = pathlib.Path(os.path.dirname(__file__)).glob('**/*.py')
    #print(pathlib.Path(os.path.dirname(__file__)))
    print(pathlib.Path(os.path.dirname(__file__)).glob('**/*.py'))
    #print(glob.glob('**/*.py'))
    print(py_files)
    for py_file in py_files:
        #print (py_file)
        try:
            xx= str(py_file)
            #xx= py_file
            #open(str(py_file), "r")
            #open(xx, "r")
            #open(strpy_file)
            # contents = open(str(filename), "r").read()
            #print ("py_file:|%s|"% py_file)
            open(xx)
            print(xx)
            #open("/home/ericksun/programming/python/syntax/import_fun/business/test.py")
            #pass
            open(xx).read()
            #print((open(xx).read()))
            print(ast.parse(open(xx).read()))
            print(ast.walk(ast.parse(open(xx).read())))
            #for i in ast.walk(ast.parse(open(xx).read())):
            #   print(i)
            for i in ast.walk(ast.parse(open(xx).read())):
                if i.__dict__.get('name') == 'entry' and isinstance(i, ast.FunctionDef):
                    print("i.__dict__", i.__dict__.get('name') )

            has_entry = [
                i for i in ast.walk(ast.parse(open(xx).read()))
                if i.__dict__.get('name') == 'entry' and isinstance(i, ast.FunctionDef)
            ]
            print("has_entry:", has_entry)
        except:
            print(py_file, "not vaild.")
            print('{py_file}不是一个有效的Python文件')
            continue
        if has_entry:
            #parted = str(py_file).split('/')[-3:]
            parted = str(py_file).split('/')[-2:]
            print("parted:", parted)
            parted[-1] = parted[-1].split('.')[0]
            print("parted[-1]:", parted[-1])
            print("parted:", parted)
            try:
                print('ready  load', '.'.join(parted))
                __import__('.'.join(parted))
                print('finish load', '.'.join(parted))
            except Exception as e:
                print('{e}')
                print('{e}')
    ##from framework import hook
    ##from .common import cam
    ##from business.common import operation

    ##hook.add(hook.HOOK_TYPE_CAM, cam.get_hook())
    ##hook.add(hook.HOOK_TYPE_OPERATE_BEFORE, operation.get_hook_operate_before())
    ##hook.add(hook.HOOK_TYPE_OPERATE_FAILED, operation.get_hook_operate_failed())
    ##hook.add(hook.HOOK_TYPE_OPERATE_SUCCESS, operation.get_hook_operate_success())

