173   123   7B    {
175   125   7D    }


ericksun@debian:~/programming/python/struct$ hexdump  -C filename.bin
00000000  00 00 00 0a 00 00 00 00  7b 7d                    |........{}|
0000000a



ericksun@debian:~/programming/python/struct$ ./main.py
2
(10, 0, '{}')
<Struct object at 0x7f4229eb5ca8>



