#include "socket_server.h"

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>

static void *
_poll(void * ud) {
	struct socket_server *ss = ud;
	struct socket_message result;
	for (;;) {
		int type = socket_server_poll(ss, &result, NULL);
		// DO NOT use any ctrl command (socket_server_close , etc. ) in this thread.
		switch (type) {
		case SOCKET_EXIT:
			return NULL;
		case SOCKET_DATA:
			printf("message(%lu) [id=%d] size=%d\n",result.opaque,result.id, result.ud);
			free(result.data);  // 释放的data 就是malloc 的数据 打印地址看下
			break;
		case SOCKET_CLOSE:
			printf("close(%lu) [id=%d]\n",result.opaque,result.id);
			break;
		case SOCKET_OPEN:
			printf("open(%lu) [id=%d] %s\n",result.opaque,result.id,result.data);
			break;
		case SOCKET_ERROR:
			printf("error(%lu) [id=%d]\n",result.opaque,result.id);
			break;
		case SOCKET_ACCEPT:
			printf("accept(%lu) [id=%d %s] from [%d]\n",result.opaque, result.ud, result.data, result.id);
			break;
		}
	}
}

int
main() {

	struct socket_server * ss = socket_server_create();
	int conn_id = socket_server_connect(ss, 100, "127.0.0.1", 8888);

	pthread_t pid;
	pthread_create(&pid, NULL, _poll, (void*)ss);

	char buf[1024] = {0};  // 
	while(fgets(buf, sizeof(buf), stdin) != NULL)
	{
		if (strncmp(buf, "quit", 4) == 0)
		{
			break;
		}

		buf[strlen(buf)-1] = '\n';
		char *sendbuf = (char*)malloc(sizeof(buf) + 1);  // 注意必须发送动态内存 不然内存错误
		memcpy(sendbuf, buf, strlen(buf)+1);  
		socket_server_send(ss, conn_id, sendbuf, strlen(sendbuf));
	}
	socket_server_exit(ss);  // 让处理socket的线程退出
	pthread_join(pid, NULL);
	socket_server_release(ss);
	return 0;

}
