# 结果输出到标准输出
StephenSun@debian-1:~/programming/bash/tar$ tar zcvf - * |hexdump  
1/
1/x
1/2/
1/2/y
1/2/3/
1/2/3/4/
tar.man
zcvf.sh
ztvf.sh
zxvf.sh
0000000 8b1f 0008 efd1 59d8 0300 3ced 736b 38db
0000010 f992 5fac ab81 3aba 5b3b 2da2 99f9 cf8d
0000020 a755 8a38 8da3 f92d 3924 b993 2a54 9143
0000030 c490 5f35 87cb b92c b6ae 47f6 2fdc 5fbc
.......

tar zcvf - * |hexdump 
StephenSun@debian-1:~/programming/bash/tar$ tar zcvf - *
1/
1/x
1/2/
1/2/y
1/2/3/
1/2/3/4/
hexdump.sh
tar.man
zcvf.sh
ztvf.sh
zxvf.sh
gzip: compressed data not written to a terminal. Use -f to force compression.
For help, type: gzip -h
tar: Child returned status 1
tar: Error is not recoverable: exiting now
