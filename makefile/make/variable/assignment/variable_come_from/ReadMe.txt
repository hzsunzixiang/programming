
-e, --environment-overrides
     Give variables taken from the environment precedence over variables from makefiles.



An assignment of a variable on the command line overrides any value from the
environment and any assignment in the makefile. Command-line assignments
can set either simple or recursive variables by using := or =, respectively. It is
possible using the override directive to allow a makefile assignment to be used
instead of a command-line assignment.
# Use big-endian objects or the program crashes!
override LDFLAGS = -EB

* 命令行的参数会覆盖掉 环境和makefile中的定义
* 使用 override 指令可以允许 makefile中的定义优先命令行选项
* makefile中的定义优先级此时比环境变量搞





Environment
All the variables from your environment are automatically defined as make variables
when make starts. These variables have very low precedence, so assignments
within the makefile or command-line arguments will override the value of
an environment variable. You can cause environment variables to override
makefile variables using the --environment-overrides (or -e) command-line
option.

* 来自环境变量的变量的优先级很低
* 所以会被命令行选项和makefile中的定义覆盖
* 使用 -e --environment-overrides 选项可以 高优先级使用环境变量的值
* 覆盖makefile中的变量值，但是不能覆盖命令行的，
* 命令行永远比环境变量的优先级高
