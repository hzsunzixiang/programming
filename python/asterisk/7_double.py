#!/usr/bin/env python3
# -*- coding:UTF-8


def bar(**args):
    print(*args)
    print(args)

if __name__ == '__main__':
    date_info = {'year': "2020", 'month': "01", 'day': "01"}
    filename = "{year}-{month}-{day}.txt".format(**date_info)
    print(filename)
    print(*date_info)
    #print(**date_info)
    print(date_info)
    bar(**date_info)
