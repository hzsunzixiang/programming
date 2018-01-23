#include <stdio.h>
int main(void) {
	printf("Content-Type: text/plain;charset=us-ascii\n\n");
	printf("Hello world\n\n");
	return 0;
}




// 通过抓包看响应头 注意Content-Type 就是main函数中返回的
// 由于没有设置Connection 默认是close
//Connection:close
//Content-Type:text/*;charset=us-ascii
//Date:Tue, 23 Jan 2018 09:37:23 GMT
//Server:Apache/2.2.15 (CentOS)
//Transfer-Encoding:chunked
