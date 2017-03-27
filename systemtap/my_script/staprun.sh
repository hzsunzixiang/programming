stap -v -e 'probe vfs.read {printf("read performed\n"); exit()}' -m simple
staprun simple.ko

