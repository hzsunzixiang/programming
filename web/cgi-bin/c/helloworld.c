


//  //www.cs.tut.fi/~jkorpela/forms/cgic.html#post
#include <stdio.h>
int main(void) {
	printf("Content-Type: text/plain;charset=us-ascii\n\n");  // ::: http协议规定  在头部和body之间  必须有两个换行符
	//printf("Content-Type: text/plain;charset=us-ascii\n");
	printf("Hello world\n\n");  // 这里的换行符有无都可以 都会原样返回
	printf("是中文哦\n\n");  // 中文识别不出来 专门研究
	//printf("Hello world");
	return 0;
}


//root@debian32-1:/usr/lib/cgi-bin/c# ./helloworld
//Content-Type: text/plain;charset=us-ascii
//
//Hello world

