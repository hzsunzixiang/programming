https://stackoverflow.com/questions/2670121/using-cmake-with-gnu-make-how-can-i-see-the-exact-commands


When you run make, add VERBOSE=1 to see the full command output. For example:

cmake .
make VERBOSE=1

Or you can add -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON to the cmake command for permanent verbose command output from the generated Makefiles.

cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON .
make

To reduce some possibly less-interesting output you might like to use the following options. The option CMAKE_RULE_MESSAGES=OFF removes lines like [ 33%] Building C object..., while --no-print-directory tells make to not print out the current directory filtering out lines like make[1]: Entering directory and make[1]: Leaving directory.

cmake -DCMAKE_RULE_MESSAGES:BOOL=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON .
make --no-print-directory





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

