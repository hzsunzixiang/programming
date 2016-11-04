#include <event2/listener.h>
#include <event2/bufferevent.h>
#include <event2/buffer.h>

#include <arpa/inet.h>

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>

void eventcb(struct bufferevent *bev, short events, void *ptr)
{
	if (events & BEV_EVENT_CONNECTED) {
		/* We're connected to 127.0.0.1:8080.   Ordinarily we'd do
		   something here, like start reading or writing. */
		fprintf(stderr, "Connect okay,-------------------------- %s.\n", (char*)ptr);
	} else if (events & BEV_EVENT_ERROR) {
		/* An error occured while connecting. */
		fprintf(stderr, "Connect error--------------------------.\n");
	} else if (events & BEV_EVENT_EOF) {
		fprintf(stderr, "disConnect --------------------------.\n");
	}
}


	static void
echo_read_cb(struct bufferevent *bev, void *ctx)
{
	printf("echo_read_cb ctx:%p\n", ctx);
	/* This callback is invoked when there is data to read on bev. */
	struct evbuffer *input = bufferevent_get_input(bev);

	/* Copy all the data from the input buffer to the output buffer. */
	// evbuffer_add_buffer(output, input);
	// 能读到数据的时候 去连接其他server 而且是以阻塞的方式

	printf("echo_read_cb1 \n");
    struct sockaddr_in servaddr;
	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htonl(0x7f000001); /* 127.0.0.1 */
	servaddr.sin_port = htons(5188); /* Port 9876*/

    int sockconn;
    if ((sockconn = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        perror("socket failure");
        exit(EXIT_FAILURE);
    }

	// bufferevent_socket_new 只是分配内存 没有系统调用
	bev = bufferevent_socket_new(ctx, sockconn, BEV_OPT_CLOSE_ON_FREE);
	//bev = bufferevent_socket_new(ctx, -1, BEV_OPT_CLOSE_ON_FREE);
	bufferevent_setcb(bev, NULL, NULL, eventcb, "hello");
	bufferevent_enable(bev, EV_READ|EV_WRITE);

//	if (bufferevent_socket_connect(bev,
//				(struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
//		/* Error starting connection */
//		// 连接不能马上建立的时候 应该添加到写事件中
//		fprintf(stderr, "Connect failed.\n");
//		bufferevent_free(bev);
//		return -1;
//	}
//

	if (connect(sockconn, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
	{
		perror("connnect error");
		exit(EXIT_FAILURE);
	}
	else
	{
		printf("connect success\n");
	}
	char recvbuf[1024] = {0};
	memset(recvbuf, 0, sizeof(recvbuf));
	read(sockconn, recvbuf, sizeof(recvbuf)); // 从客户端收取数据



}

	static void
echo_event_cb(struct bufferevent *bev, short events, void *ctx)
{
	if (events & BEV_EVENT_ERROR)
		perror("Error from bufferevent");
	if (events & (BEV_EVENT_EOF | BEV_EVENT_ERROR)) {
		bufferevent_free(bev);
	}
}

	static void
accept_conn_cb(struct evconnlistener *listener,
		evutil_socket_t fd, struct sockaddr *address, int socklen,
		void *ctx)
{
	/* We got a new connection! Set up a bufferevent for it. */
	struct event_base *base = evconnlistener_get_base(listener);
	struct bufferevent *bev = bufferevent_socket_new(
			base, fd, BEV_OPT_CLOSE_ON_FREE);

	bufferevent_setcb(bev, echo_read_cb, NULL, echo_event_cb, ctx);

	bufferevent_enable(bev, EV_READ|EV_WRITE);
}

	static void
accept_error_cb(struct evconnlistener *listener, void *ctx)
{
	struct event_base *base = evconnlistener_get_base(listener);
	int err = EVUTIL_SOCKET_ERROR();
	fprintf(stderr, "Got an error %d (%s) on the listener. "
			"Shutting down.\n", err, evutil_socket_error_to_string(err));

	event_base_loopexit(base, NULL);
}

	int
main(int argc, char **argv)
{
	struct event_base *base;
	struct evconnlistener *listener;
	struct sockaddr_in sin;

	int port = 9876;

	if (argc > 1) {
		port = atoi(argv[1]);
	}
	if (port<=0 || port>65535) {
		puts("Invalid port");
		return 1;
	}

	base = event_base_new();
	if (!base) {
		puts("Couldn't open event base");
		return 1;
	}

	/* Clear the sockaddr before using it, in case there are extra
	 * platform-specific fields that can mess us up. */
	memset(&sin, 0, sizeof(sin));
	/* This is an INET address */
	sin.sin_family = AF_INET;
	/* Listen on 0.0.0.0 */
	sin.sin_addr.s_addr = htonl(0);
	/* Listen on the given port. */
	sin.sin_port = htons(port);

	listener = evconnlistener_new_bind(base, accept_conn_cb, base,
			LEV_OPT_CLOSE_ON_FREE|LEV_OPT_REUSEABLE|LEV_OPT_DEFERRED_ACCEPT, -1,
			(struct sockaddr*)&sin, sizeof(sin));
	if (!listener) {
		perror("Couldn't create listener");
		return 1;
	}
	else
	{
		printf("create listener success, base:%p\n", base);
	}
	evconnlistener_set_error_cb(listener, accept_error_cb);

	event_base_dispatch(base);
	return 0;
}


