

# 用户自定义函数存储在变量或者宏当中

A user-defined function is stored in a variable or macro and expects one or more parameters to be passed by the caller.


# 函数和宏没有任何区别

There is no "difference": a macro can be considered to be just a nullary-function (a function that takes no arguments).
宏就是不带任何参数的函数
而宏就是可以换行的变量, 最终会被替换成一个不换行的变量


https://stackoverflow.com/questions/75939070/how-to-differentiate-macro-and-function-in-makefile?noredirect=1#comment133942881_75939070
https://make.mad-scientist.net/the-eval-function/

# 函数就是特殊形式的宏展开
rather it performs a special kind of macro expansion.

call is a built-in make function that expands its first argument and replaces occurrences
of $1, $2, etc., with the remaining arguments it is given. (In fact, it doesn’t
really “call” its macro argument at all in the sense of transfer of control, rather it performs
a special kind of macro expansion.) The macro-name is the name of any macro
or variable (remember that macros are just variables where embedded newlines are
allowed). The macro or variable value doesn’t even have to contain a $n reference,
but then there isn’t much point in using call at all. Arguments to the macro following
macro-name are separated by commas.



