#!/usr/bin/env python3
# -*- coding:UTF-8
import os
import sys
def import_public_image():
    try:
        #global var
        var = 100
        raise 

    except Exception as e:
        print("var:%s"%(var,)) 
        #raise e

if __name__ == '__main__':
    import_public_image()
