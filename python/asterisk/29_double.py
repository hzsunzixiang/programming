#!/usr/bin/env python3
# -*- coding:UTF-8
date_info = {'year': "2020", 'month': "01", 'day': "01"}
track_info = {'artist': "Beethoven", 'title': 'Symphony No 5'}
all_info = {**date_info, **track_info}
print(all_info)
#{'year': '2020', 'month': '01', 'day': '01', 'artist': 'Beethoven', 'title': 'Symphony No 5'}



date_info = {'year': '2020', 'month': '01', 'day': '7'}
event_info = {**date_info, 'group': "Python Meetup"}
print(event_info)
#{'year': '2020', 'month': '01', 'day': '7', 'group': 'Python Meetup'}


