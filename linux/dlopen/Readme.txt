 



gcc -fPIC -shared calculate.c -o libcalculate.so 




ericksun@debian:~/program_git$ lsof  -p 8619
COMMAND  PID     USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME
main    8619 ericksun  cwd    DIR    8,1     4096 1849306 /home/ericksun/programming/linux/dlopen
main    8619 ericksun  rtd    DIR    8,1     4096       2 /
main    8619 ericksun  txt    REG    8,1    15888 1849316 /home/ericksun/programming/linux/dlopen/main
main    8619 ericksun  mem    REG    8,1     7952 1849308 /home/ericksun/programming/linux/dlopen/libcalculate.so
main    8619 ericksun  mem    REG    8,1  1689360 2752520 /lib/x86_64-linux-gnu/libc-2.24.so
main    8619 ericksun  mem    REG    8,1    14640 2752523 /lib/x86_64-linux-gnu/libdl-2.24.so
main    8619 ericksun  mem    REG    8,1   153288 2752515 /lib/x86_64-linux-gnu/ld-2.24.so
main    8619 ericksun    0u   CHR  136,4      0t0       7 /dev/pts/4
main    8619 ericksun    1u   CHR  136,4      0t0       7 /dev/pts/4
main    8619 ericksun    2u   CHR  136,4      0t0       7 /dev/pts/4



