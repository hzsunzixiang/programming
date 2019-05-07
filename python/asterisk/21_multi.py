#!/usr/bin/env python3
# -*- coding:UTF-8

# 不允许这样定义
#def bar(**args1, **args2):
#    print(args1, args2)
#
# 在2.x下运行不过
if __name__ == '__main__':
    date_info = {'year': "2020", 'month': "01", 'day': "01"}
    track_info = {'artist': "Beethoven", 'title': 'Symphony No 5'}
    filename = "{year}-{month}-{day}-{artist}-{title}.txt".format(
        **date_info,
        **track_info,
    )
    print(filename)
    #bar(date_info, track_info)
