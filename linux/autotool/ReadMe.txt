f876e0946c730fbd7848cf185fc0dcc712e13e69

The upstream Gnulib project doesn’t do releases but rather simply incorporates changes and bug fixes directly into the master branch. The programming examples in this chapter were written to use Gnulib source code from commit f876e0946c730fbd7848cf185fc0dcc712e13e69 in the Savannah Gnulib git repository. If you’re having trouble getting the code in this chapter to build correctly, it could be because something has changed in the Gnulib source since this book was written. Try backing off to this commit of Gnulib.


gnulib-tool --import base64


## 一下4个都可以在windows下 做 Makefile 
但是 mgw-builds 这个最新版本gnulib不能使用 autoreconf

mgw-builds   :  只能Makefile 不能使用 autoreconf
MinGW      : 很简单的程序 不适用gnulib
MinGW2     :  使用gnulib 可以编译过， 而且可以在 MinGW 环境下 做 ./configure
MinGW3     : 保存了tar 包的形式

