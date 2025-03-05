#! /bin/sh

#http://hi.baidu.com/ashinehan/blog/item/f08d0a1eaae545c3a786699b.html
#http://hi.baidu.com/code4fun/blog/item/7e12b231169e52a35fdf0e25.html

variable=100;
awk 'BEGIN{ print "the variable:\t", '"$variable"'}'
awk 'BEGIN{ print "the variable:\t", "'$variable'"}'
