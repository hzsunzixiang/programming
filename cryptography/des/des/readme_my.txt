


注意虽然补足， 但是 非64的整数倍的时候仍然会有些问题
暂时先不管
 ./des  -e -i tools.c -o test.en -k "123456"
 ./des  -d -i test.en -o test.c -k "123456"
