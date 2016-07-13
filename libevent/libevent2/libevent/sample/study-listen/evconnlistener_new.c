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
	evutil_socket_t listenerfd;
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




	listenerfd = socket(AF_INET, SOCK_STREAM, 0);
	evutil_make_socket_nonblocking(listenerfd);

#ifndef WIN32
	{
		int one = 1;
		setsockopt(listenerfd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
	}
#endif

	if (bind(listenerfd, (struct sockaddr*)&sin, sizeof(sin)) < 0) {
		perror("bind");
		return -1;
	}

// The functions differ in how they set up their listener socket. The evconnlistener_new() function assumes that you have already bound a socket to the port you want to listen on, and that you’re passing the socket in as fd. If you want Libevent to allocate and bind to a socket on its own, call evconnlistener_new_bind(), and pass in the sockaddr you want to bind to, and its length.
	listener = evconnlistener_new(base, accept_conn_cb, NULL,
			LEV_OPT_CLOSE_ON_FREE|LEV_OPT_REUSEABLE, -1, listenerfd);
	if (!listener) {
		perror("Couldn't create listener");
		return 1;
	}
	evconnlistener_set_error_cb(listener, accept_error_cb);
	pause();

	//event_base_dispatch(base);
	return 0;
}



// evconnlistener_new所调用的系统函数 
//  stephensun@debian:~/programming/libevent/libevent2/libevent/sample/study-bufferevent$ strace ./evconnlistener_new
//  execve("./evconnlistener_new", ["./evconnlistener_new"], [/* 40 vars */]) = 0
//  uname({sys="Linux", node="debian", ...}) = 0
//  brk(0)                                  = 0x1e2a000
//  brk(0x1e2b1c0)                          = 0x1e2b1c0
//  arch_prctl(ARCH_SET_FS, 0x1e2a880)      = 0
//  readlink("/proc/self/exe", "/home/stephensun/programming/lib"..., 4096) = 100
//  brk(0x1e4c1c0)                          = 0x1e4c1c0
//  brk(0x1e4d000)                          = 0x1e4d000
//  access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)

//  clock_gettime(CLOCK_MONOTONIC_COARSE, {167050, 807313980}) = 0
//  clock_gettime(CLOCK_MONOTONIC_COARSE, {167050, 807313980}) = 0
//  gettimeofday({1468375064, 617337}, NULL) = 0

//  epoll_create1(EPOLL_CLOEXEC)            = 3

//  pipe2([4, 5], O_NONBLOCK|O_CLOEXEC)     = 0

//  socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 6
//  fcntl(6, F_GETFL)                       = 0x2 (flags O_RDWR)
//  fcntl(6, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
//  setsockopt(6, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
//  bind(6, {sa_family=AF_INET, sin_port=htons(9876), sin_addr=inet_addr("0.0.0.0")}, 16) = 0


// 后面两个是evconnlistener_new 所调用的两个系统函数
//  listen(6, 128)                          = 0
//  epoll_ctl(3, EPOLL_CTL_ADD, 6, {EPOLLIN, {u32=6, u64=6}}) = 0
//  
