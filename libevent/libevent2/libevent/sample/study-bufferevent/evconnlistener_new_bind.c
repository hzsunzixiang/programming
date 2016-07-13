#include <event2/listener.h>
#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <unistd.h>

#include <arpa/inet.h>

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

	static void
echo_read_cb(struct bufferevent *bev, void *ctx)
{
	/* This callback is invoked when there is data to read on bev. */
	struct evbuffer *input = bufferevent_get_input(bev);
	struct evbuffer *output = bufferevent_get_output(bev);

	/* Copy all the data from the input buffer to the output buffer. */
	evbuffer_add_buffer(output, input);
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

	bufferevent_setcb(bev, echo_read_cb, NULL, echo_event_cb, NULL);

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

//	struct evconnlistener *evconnlistener_new(struct event_base *base,
//			    evconnlistener_cb cb, void *ptr, unsigned flags, int backlog,
//				    evutil_socket_t fd);
//	struct evconnlistener *evconnlistener_new_bind(struct event_base *base,
//			    evconnlistener_cb cb, void *ptr, unsigned flags, int backlog,
//				    const struct sockaddr *sa, int socklen);
//	void evconnlistener_free(struct evconnlistener *lev);
	listener = evconnlistener_new_bind(base, accept_conn_cb, NULL,
			LEV_OPT_CLOSE_ON_FREE|LEV_OPT_REUSEABLE, -1,
			(struct sockaddr*)&sin, sizeof(sin));
	if (!listener) {
		perror("Couldn't create listener");
		return 1;
	}
	evconnlistener_set_error_cb(listener, accept_error_cb);
	pause();

	//event_base_dispatch(base);
	return 0;
}



// evconnlistener_new_bind 所调用的系统函数 
// 在调用//event_base_dispatch之前不会调用回调函数 但是内核会接受连接

//      此时还没有应用进程接受
//      stephensun@debian:~/programming/libevent/libevent2/libevent/sample/study$ sudo netstat  -anpt  |grep 9876
//      tcp        0      0 0.0.0.0:9876            0.0.0.0:*               LISTEN      8956/evconnlistener
//      tcp        0      0 127.0.0.1:9876          127.0.0.1:51261         ESTABLISHED -
//      tcp        0      0 127.0.0.1:51261         127.0.0.1:9876          ESTABLISHED 8968/telnet

// buffevent 的相关只是在另外的代码中详解





// stephensun@debian:~/programming/libevent/libevent2/libevent/sample/study-bufferevent$ strace ./evconnlistener_new_bind
// execve("./evconnlistener_new_bind", ["./evconnlistener_new_bind"], [/* 40 vars */]) = 0
// uname({sys="Linux", node="debian", ...}) = 0
// brk(0)                                  = 0x26c8000
// brk(0x26c91c0)                          = 0x26c91c0
// arch_prctl(ARCH_SET_FS, 0x26c8880)      = 0
// readlink("/proc/self/exe", "/home/stephensun/programming/lib"..., 4096) = 105
// brk(0x26ea1c0)                          = 0x26ea1c0
// brk(0x26eb000)                          = 0x26eb000
// .....
// epoll_create1(EPOLL_CLOEXEC)            = 3                       ************** 
// ....
// pipe2([4, 5], O_NONBLOCK|O_CLOEXEC)     = 0                       **************
// ....
// socket(PF_INET, SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_IP) = 6      ***************
// setsockopt(6, SOL_SOCKET, SO_KEEPALIVE, [1], 4) = 0   *******************************
// setsockopt(6, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0           ***********************
// bind(6, {sa_family=AF_INET, sin_port=htons(9876), sin_addr=inet_addr("0.0.0.0")}, 16) = 0    *********************
// listen(6, 128)                          = 0   *******************
// epoll_ctl(3, EPOLL_CTL_ADD, 6, {EPOLLIN, {u32=6, u64=6}}) = 0  *******************

