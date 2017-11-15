StephenSun@debian:~/programming/linux/cmake/helloworld$ make VERBOSE=1
/usr/bin/cmake -H/home/StephenSun/programming/linux/cmake/helloworld -B/home/StephenSun/programming/linux/cmake/helloworld --check-build-system CMakeFiles/Makefile.cmake 0
/usr/bin/cmake -E cmake_progress_start /home/StephenSun/programming/linux/cmake/helloworld/CMakeFiles /home/StephenSun/programming/linux/cmake/helloworld/CMakeFiles/progress.marks
make -f CMakeFiles/Makefile2 all
make[1]: Entering directory '/home/StephenSun/programming/linux/cmake/helloworld'
make -f CMakeFiles/hello.dir/build.make CMakeFiles/hello.dir/depend
make[2]: Entering directory '/home/StephenSun/programming/linux/cmake/helloworld'
cd /home/StephenSun/programming/linux/cmake/helloworld && /usr/bin/cmake -E cmake_depends "Unix Makefiles" /home/StephenSun/programming/linux/cmake/helloworld /home/StephenSun/programming/linux/cmake/helloworld /home/StephenSun/programming/linux/cmake/helloworld /home/StephenSun/programming/linux/cmake/helloworld /home/StephenSun/programming/linux/cmake/helloworld/CMakeFiles/hello.dir/DependInfo.cmake --color=
make[2]: Leaving directory '/home/StephenSun/programming/linux/cmake/helloworld'
make -f CMakeFiles/hello.dir/build.make CMakeFiles/hello.dir/build
make[2]: Entering directory '/home/StephenSun/programming/linux/cmake/helloworld'
Linking C executable hello
/usr/bin/cmake -E cmake_link_script CMakeFiles/hello.dir/link.txt --verbose=1
/usr/bin/cc      CMakeFiles/hello.dir/helloworld.c.o  -o hello -rdynamic
make[2]: Leaving directory '/home/StephenSun/programming/linux/cmake/helloworld'
/usr/bin/cmake -E cmake_progress_report /home/StephenSun/programming/linux/cmake/helloworld/CMakeFiles  1
[100%] Built target hello
make[1]: Leaving directory '/home/StephenSun/programming/linux/cmake/helloworld'
/usr/bin/cmake -E cmake_progress_start /home/StephenSun/programming/linux/cmake/helloworld/CMakeFiles 0
StephenSun@debian:~/programming/linux/cmake/helloworld$ make clean
StephenSun@debian:~/programming/linux/cmake/helloworld$ make
[100%] Building C object CMakeFiles/hello.dir/helloworld.c.o
Linking C executable hello
[100%] Built target hello

