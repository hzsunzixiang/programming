ericksun@centos7-mq1:~/programming/makefile/examples-my/ch06/ch06-cross-dep-1 (master)$ make clean --print-directory
make: Entering directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1'
make TARGET=clean
make[1]: Entering directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1'
make --directory=lib/db clean
make[2]: Entering directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/lib/db'
rm -f scanner.o playlist.o  libdb.a scanner.d playlist.d scanner.c playlist.c playlist.h
make[2]: Leaving directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/lib/db'
make --directory=lib/codec clean
make[2]: Entering directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/lib/codec'
rm -f codec.o  libcodec.a codec.d
make[2]: Leaving directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/lib/codec'
make --directory=lib/ui clean
make[2]: Entering directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/lib/ui'
rm -f ui.o  libui.a ui.d
make[2]: Leaving directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/lib/ui'
make --directory=app/player clean
make[2]: Entering directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/app/player'
rm -f play_mp3.o play_mp3  play_mp3.d
make[2]: Leaving directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1/app/player'
make[1]: Leaving directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1'
make: Leaving directory `/home/ericksun/programming/makefile/examples-my/ch06/ch06-cross-dep-1'

