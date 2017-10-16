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

static const char MESSAGE[] = "Hello, World!\n";

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
#ifdef _WIN32
	WSADATA wsa_data;
	WSAStartup(0x0201, &wsa_data);
#endif

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

	// For help debugging your program (or debugging Libevent!) you might sometimes want a complete list of all events added in the event_base and their status. Calling event_base_dump_events() writes this list to the stdio file provided.
	event_base_dump_events(base, stdout);
	// 用strace看到信号加入要占用一个文件描述符
	// Inserted events:
	//   0xf38e58 [fd  4] Read Persist Internal
	//   0xf392b8 [fd  6] Read Persist
	//   0xf39470 [sig 2] Signal Persist
	// Active events:


	event_base_dispatch(base);
	//event_base_loop(base, EVLOOP_ONCE);
	//event_base_loop(base, 0);

	if(event_base_got_exit(base))
	{
		fprintf(stderr, "event_base_got_exit\n");
	}
	if(event_base_got_break(base))
	{
		fprintf(stderr, "event_base_got_break\n");
	}

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

	bev = bufferevent_socket_new(base, fd, BEV_OPT_CLOSE_ON_FREE);
	if (!bev) {
		fprintf(stderr, "Error constructing bufferevent!");
		event_base_loopbreak(base);
		return;
	}
	// 这个程序的作用是  当有链接进来的时候 直接写一行 然后关闭连接
	// 打开写操作 关闭读操作
	
	// void bufferevent_setcb(struct bufferevent *bufev,
	//     bufferevent_data_cb readcb, bufferevent_data_cb writecb,
	//     bufferevent_event_cb eventcb, void *cbarg);
	bufferevent_setcb(bev, NULL, conn_writecb, conn_eventcb, NULL);

	bufferevent_enable(bev, EV_WRITE);
	bufferevent_disable(bev, EV_READ);

	//getchar();
	// 调用这个函数  把数据加入应用层缓冲区
	// epoll_wait 返回的时候就会把 要写的数据写到套接口
	// 这个是同定义的回调
	// 1580            (evcb_callback)(evcb_fd, evcb_res, evcb_arg);
	// (gdb) p evcb_callback
	// $2 = (void (*)(int, short, void *)) 0x40d2e0 <bufferevent_writecb>
	// res = evbuffer_write_atmost(bufev->output, fd, atmost);

	// 这个是用户定义的回调类型 
	// (gdb) p conn_writecb
	// $2 = {void (struct bufferevent *, void *)} 0x401268 <conn_writecb>

	bufferevent_write(bev, MESSAGE, strlen(MESSAGE));
	fprintf(stderr, "write data to socket\n");
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
	struct timeval delay = { 1, 0 };

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





// Inserted events:
//   0x1af6c68 [fd  4] Read Persist Internal
//   0x1af70e8 [fd  6] Read Persist
//   0x1af72a0 [sig 2] Signal Persist
// Active events:
// write data to socket
// flushed answer
// ^CCaught an interrupt signal; exiting cleanly in two seconds.
// event_base_got_exit
// done
