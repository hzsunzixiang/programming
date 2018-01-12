




package main
import "fmt"


func main() {
	var x float64
	_ = x

	x = 20.0
	fmt.Println(x)
	fmt.Printf("x is of type:%T\n", x)
	fmt.Scanln()
}

// 竟然有4个线程
// StephenSun@debian:~/programming/c/sizeof$ ps -efL |grep 23154
// Stephen+ 23154 18841 23154  0    4 17:10 pts/1    00:00:00 ./variables
// Stephen+ 23154 18841 23155  0    4 17:10 pts/1    00:00:00 ./variables
// Stephen+ 23154 18841 23156  0    4 17:10 pts/1    00:00:00 ./variables
// Stephen+ 23154 18841 23157  0    4 17:10 pts/1    00:00:00 ./variables



// 定义的变量必须使用否则报错
// 导入的包必须使用 不然报错

// go build  -o variables variables.go
// # command-line-arguments
// ./variables.go:7: imported and not used: "fmt"
// Makefile:6: recipe for target 'variables' failed
// make: *** [variables] Error 2



// go 语言每运行一个进程都会 单独起一个线程  跟c语言不一样的地方
// clone(child_stack=0x7f0499f07fa8, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD) = 22609
// rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
// mmap(NULL, 1048576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f0499de8000
// write(1, "20\n", 320
// 	 )                     = 3
// exit_group(0)                           = ?

