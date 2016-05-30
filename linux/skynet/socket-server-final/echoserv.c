#include "socket_server.h"

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>


int
main() {

	struct socket_server * ss = socket_server_create();
	// 发送L 命令
	// L命令不加入epoll中 
	// socket_server_poll 收到这个命令之后 从ss中获取一个socket 并初始化它
	int listen_fd = socket_server_listen(ss, 100, "", 8888, 32);  
	// listen_fd 加入到epoll 来管理 
	// 这里还没有真正加入进去 只是发送消息到管道的写端
    // socket_server_poll 中从管道中读出消息并加入epoll中管理
	// socket_server_poll 收到这个命令之后 从ss中获取一个socket 并初始化它 且加入到epoll管理
	socket_server_start(ss, 200, listen_fd);  // 发送S 命令 申请加入epoll

	struct socket_message result;
	for (;;) {
		int type = socket_server_poll(ss, &result, NULL);  // 这里读到S命令时 会加入到epoll中
		printf("##############return type:%d\n", type);
		// DO NOT use any ctrl command (socket_server_close , etc. ) in this thread.
		switch (type) {
		case SOCKET_EXIT:
			goto EXIT_LOOP;
		case SOCKET_DATA:
			// 非监听套接口 有数据到来
			printf("message(%lu) [id=%d] size=%d data:%s\n",result.opaque,result.id, result.ud, result.data);
			// 发送数据的请求 真正发送数据是在调用 socket_server_poll 时 
		    // 写数据时 写不完保存在数组中
			socket_server_send(ss, result.id, result.data, result.ud);
			//free(result.data);
			break;
		case SOCKET_CLOSE:
			printf("close(%lu) [id=%d]\n",result.opaque,result.id);
			// 这里不要调用 这个 不然死循环
			// 查看套接字关闭时机
			//socket_server_close(ss, result.opaque, result.iss, result.opaque, result.idd);
			break;
		case SOCKET_OPEN:
			printf("open(%lu) [id=%d] data:%s\n",result.opaque,result.id,result.data);
			break;
		case SOCKET_ERROR:
			printf("error(%lu) [id=%d]\n",result.opaque,result.id);
			break;
		case SOCKET_ACCEPT:
			printf("accept(%lu) [id=%d %s] from [%d], data:%s\n",result.opaque, result.ud, result.data, result.id, result.data);
			// result.id 在这里是监听套接口描述字
			socket_server_start(ss, 300, result.ud);
			break;
		}
	}

EXIT_LOOP:
	socket_server_release(ss);
	return 0;
}
