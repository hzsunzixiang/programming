#include "socket_server.h"

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>


int
main() {

	struct socket_server * ss = socket_server_create();
	int listen_fd = socket_server_listen(ss, 100, "", 8888, 32);
	socket_server_start(ss, 200, listen_fd);  // listen_fd 加入到epoll 来管理

	struct socket_message result;
	for (;;) {
		int type = socket_server_poll(ss, &result, NULL);
		// DO NOT use any ctrl command (socket_server_close , etc. ) in this thread.
		switch (type) {
		case SOCKET_EXIT:
			goto EXIT_LOOP;
		case SOCKET_DATA:
			// 非监听套接口 有数据到来
			printf("message(%lu) [id=%d] size=%d\n",result.opaque,result.id, result.ud);
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
			printf("open(%lu) [id=%d] %s\n",result.opaque,result.id,result.data);
			break;
		case SOCKET_ERROR:
			printf("error(%lu) [id=%d]\n",result.opaque,result.id);
			break;
		case SOCKET_ACCEPT:
			printf("accept(%lu) [id=%d %s] from [%d]\n",result.opaque, result.ud, result.data, result.id);
			// result.id 在这里是监听套接口描述字
			socket_server_start(ss, 300, result.ud);
			break;
		}
	}

EXIT_LOOP:
	socket_server_release(ss);
	return 0;
}
