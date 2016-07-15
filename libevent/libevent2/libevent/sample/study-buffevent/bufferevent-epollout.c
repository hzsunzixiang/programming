/*
  This example program provides a trivial server program that listens for TCP
  connections on port 9995.  When they arrive, it writes a short message to
  each client connection, and closes each connection once it is flushed.

  Where possible, it exits cleanly in response to a SIGINT (ctrl-c).
*/


#include <string.h>
#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <malloc.h>
#ifndef _WIN32
#include <netinet/in.h>
# ifdef _XOPEN_SOURCE_EXTENDED
#  include <arpa/inet.h>
# endif
#include <sys/socket.h>
#endif

#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <event2/listener.h>
#include <event2/util.h>
#include <event2/event.h>


static const int PORT = 9995;

static void listener_cb(struct evconnlistener *, evutil_socket_t,
    struct sockaddr *, int socklen, void *);
static void conn_writecb(struct bufferevent *, void *);
static void conn_eventcb(struct bufferevent *, short, void *);
static void signal_cb(evutil_socket_t, short, void *);

int
main(int argc, char **argv)
{
	struct event_base *base;
	struct evconnlistener *listener;
	struct event *signal_event;

	struct sockaddr_in sin;

	// 可以强制用 select 或者poll
	// struct event_config *cfg;
	// cfg = event_config_new();
	// /* I don't like select. */
	// event_config_avoid_method(cfg, "epoll");
	// event_config_avoid_method(cfg, "poll");

	// event_config_require_features(cfg, EV_FEATURE_ET);

	// base = event_base_new_with_config(cfg);

	base = event_base_new();
	if (!base) {
		fprintf(stderr, "Could not initialize libevent!\n");
		return 1;
	}

	memset(&sin, 0, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_port = htons(PORT);

	listener = evconnlistener_new_bind(base, listener_cb, (void *)base,
			LEV_OPT_REUSEABLE|LEV_OPT_CLOSE_ON_FREE, -1,
			(struct sockaddr*)&sin,
			sizeof(sin));

	if (!listener) {
		fprintf(stderr, "Could not create a listener!\n");
		return 1;
	}

	signal_event = evsignal_new(base, SIGINT, signal_cb, (void *)base);

	// rt_sigaction(SIGINT, {0x41ca50, ~[RTMIN RT_1], SA_RESTORER|SA_RESTART, 0x4221d0}, {SIG_DFL, [], 0}, 8) = 0
	// epoll_ctl(3, EPOLL_CTL_ADD, 4, {EPOLLIN, {u32=4, u64=4}}) = 0
	// 信号加入监听集合 也占用一个文件描述符

	if (!signal_event || event_add(signal_event, NULL)<0) {
		fprintf(stderr, "Could not create/add a signal event!\n");
		return 1;
	}

	event_base_dispatch(base);

	evconnlistener_free(listener);
	event_free(signal_event);
	event_base_free(base);

	printf("done\n");
	return 0;
}

	static void
listener_cb(struct evconnlistener *listener, evutil_socket_t fd,
		struct sockaddr *sa, int socklen, void *user_data)
{
	struct event_base *base = user_data;
	struct bufferevent *bev;

	//setsockopt(*netfd, SOL_SOCKET, SO_RCVBUF, (const int*)&nRcvBuf, sizeof(int));
	// 然后 把socket缓冲区调小 不知道为啥 这里没起作用 
	int nSndBuf = 256;
	setsockopt(fd, SOL_SOCKET, SO_SNDBUF, (const int*)&nSndBuf, sizeof(int));
	bev = bufferevent_socket_new(base, fd, BEV_OPT_CLOSE_ON_FREE);
	if (!bev) {
		fprintf(stderr, "Error constructing bufferevent!");
		event_base_loopbreak(base);
		return;
	}
	// 这个程序的作用是  当有链接进来的时候 直接写一行 然后关闭连接
	// 打开写操作 关闭读操作

	//bufferevent_setwatermark(bev, EV_WRITE, 128, 1024);
	// void bufferevent_setcb(struct bufferevent *bufev,
	//     bufferevent_data_cb readcb, bufferevent_data_cb writecb,
	//     bufferevent_event_cb eventcb, void *cbarg);
	bufferevent_setcb(bev, NULL, conn_writecb, conn_eventcb, NULL);

	bufferevent_enable(bev, EV_WRITE);
	bufferevent_disable(bev, EV_READ);

	// 调用这个函数  把数据加入应用层缓冲区
	// 写1M数据 缓冲区由bufferevent接管 
#define LENGTH 1024*1024
	char *MESSAGE =  (char*)malloc(LENGTH);
	memset (MESSAGE, 'a', LENGTH);
	bufferevent_write(bev, MESSAGE, LENGTH);
	fprintf(stderr, "write data to socket\n");

	// 当数据非常大的时候 写数据缓冲的事情由 bufferevent代理了
	// 我们应用层不再关心这个了
	// writev(7, [{"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 16384}], 1) = 16384
	// epoll_wait(3, {{EPOLLOUT, {u32=7, u64=7}}}, 32, -1) = 1
	// clock_gettime(CLOCK_MONOTONIC_COARSE, {190888, 586534737}) = 0
	// writev(7, [{"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 16384}], 1) = 16384
	// epoll_wait(3, {{EPOLLOUT, {u32=7, u64=7}}}, 32, -1) = 1
	// clock_gettime(CLOCK_MONOTONIC_COARSE, {190888, 586534737}) = 0
	// writev(7, [{"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 16384}], 1) = 16384
	// epoll_wait(3, {{EPOLLOUT, {u32=7, u64=7}}}, 32, -1) = 1


}

	static void
conn_writecb(struct bufferevent *bev, void *user_data)
{
	// 调用 回调可以清理状态等
	struct evbuffer *output = bufferevent_get_output(bev);
	if (evbuffer_get_length(output) == 0) {
		printf("flushed answer\n");
		bufferevent_free(bev);
	}
}

	static void
conn_eventcb(struct bufferevent *bev, short events, void *user_data)
{
	if (events & BEV_EVENT_EOF) {
		printf("Connection closed.\n");
	} else if (events & BEV_EVENT_ERROR) {
		printf("Got an error on the connection: %s\n",
				strerror(errno));/*XXX win32*/
	}
	/* None of the other events can happen here, since we haven't enabled
	 * timeouts */
	bufferevent_free(bev);
}

	static void
signal_cb(evutil_socket_t sig, short events, void *user_data)
{
	struct event_base *base = user_data;
	struct timeval delay = { 2, 0 };

	printf("Caught an interrupt signal; exiting cleanly in two seconds.\n");

	event_base_loopexit(base, &delay);
}


// 流程是这样的


// 接受之后 把描述字加入 并等待
// 此时已经把要写的数据 放入了缓冲区
// epoll_wait 返回的时候可写，这个时候 直接写入
// 写入之后再调用回调

// accept4(6, {sa_family=AF_INET, sin_port=htons(45656), sin_addr=inet_addr("127.0.0.1")}, [16], SOCK_NONBLOCK) = 7
// epoll_ctl(3, EPOLL_CTL_ADD, 7, {EPOLLOUT, {u32=7, u64=7}}) = 0
// write(2, "write data to socket\n", 21write data to socket )  = 21
// accept4(6, 0x7fff8c6efa10, [128], SOCK_NONBLOCK) = -1 EAGAIN (Resource temporarily unavailable)
// epoll_wait(3, {{EPOLLOUT, {u32=7, u64=7}}}, 32, -1) = 1
// clock_gettime(CLOCK_MONOTONIC_COARSE, {187632, 30641192}) = 0
// writev(7, [{"Hello, World!\n", 14}], 1) = 14
// epoll_ctl(3, EPOLL_CTL_DEL, 7, 7fff8c6ef9a0) = 0
// fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 1), ...}) = 0
// mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f70bcc74000
// write(1, "flushed answer\n", 15flushed answer  )        = 15

