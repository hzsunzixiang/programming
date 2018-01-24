#include <stdio.h>
#include <unistd.h>
int main(void) {
	printf("Content-Type: text/plain;charset=us-ascii\n\n");
	printf("Hello world\n\n");
	printf("the pid: %d\n\n", getpid());
	//sleep(60);
	return 0;
}



// 通过 sleep(60) 看到庐山真面目
// 不停的运行 就能看到 每个都是一个进程在执行
// apache   26314  0.0  0.0   3920   428 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
// apache   26315  0.0  0.0   3920   432 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
// apache   26324  0.0  0.0   3920   432 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
// apache   26325  0.0  0.0   3920   428 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
// apache   26328  0.0  0.0   3920   432 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
// apache   26353  0.0  0.0   3920   432 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
// apache   26355  0.0  0.0   3920   432 ?        S    15:41   0:00 /home/stephensun/programming/web/cgi-bin/helloworld
//




// 通过抓包看响应头 注意Content-Type 就是main函数中返回的
// 由于没有设置Connection 默认是close
//Connection:close
//Content-Type:text/*;charset=us-ascii
//Date:Tue, 23 Jan 2018 09:37:23 GMT
//Server:Apache/2.2.15 (CentOS)
//Transfer-Encoding:chunked
