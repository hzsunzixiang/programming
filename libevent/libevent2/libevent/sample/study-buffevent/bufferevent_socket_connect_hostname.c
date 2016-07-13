/* Don't actually copy this code: it is a poor way to implement an
   HTTP client.  Have a look at evhttp instead.
 */
#include <event2/dns.h>
#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <event2/util.h>
#include <event2/event.h>

#include <stdio.h>
#include <unistd.h>
#include <string.h>

void readcb(struct bufferevent *bev, void *ptr)
{
	char buf[1024];
	int n;
	struct evbuffer *input = bufferevent_get_input(bev);
	fprintf(stderr, "readcb.......\n");
	while ((n = evbuffer_remove(input, buf, sizeof(buf))) > 0) {
		fwrite(buf, 1, n, stdout);
	}
}

void eventcb(struct bufferevent *bev, short events, void *ptr)
{
	if (events & BEV_EVENT_CONNECTED) {
		printf("Connect okay.\n");
	} else if (events & (BEV_EVENT_ERROR|BEV_EVENT_EOF)) {
		struct event_base *base = ptr;
		if (events & BEV_EVENT_ERROR) {
			int err = bufferevent_socket_get_dns_error(bev);
			if (err)
				printf("DNS error: %s\n", evutil_gai_strerror(err));
		}
		printf("Closing\n");
		bufferevent_free(bev);
		event_base_loopexit(base, NULL);
	}
}

int main(int argc, char **argv)
{
	struct event_base *base;
	struct evdns_base *dns_base;
	struct bufferevent *bev;

	if (argc != 3) {
		printf("Trivial HTTP 0.x client\n"
				"Syntax: %s [hostname] [resource]\n"
				"Example: %s www.baidu.com /\n",argv[0],argv[0]);
		return 1;
	}

	base = event_base_new();
	dns_base = evdns_base_new(base, 1);
	// pause();
	// socket(PF_INET, SOCK_DGRAM|SOCK_CLOEXEC|SOCK_NONBLOCK, IPPROTO_IP) = 6
	// epoll_ctl(3, EPOLL_CTL_ADD, 6, {EPOLLIN, {u32=6, u64=6}}) = 0


	bev = bufferevent_socket_new(base, -1, BEV_OPT_CLOSE_ON_FREE);
	bufferevent_setcb(bev, readcb, NULL, eventcb, base);



// void bufferevent_enable(struct bufferevent *bufev, short events);
// void bufferevent_disable(struct bufferevent *bufev, short events);
// short bufferevent_get_enabled(struct bufferevent *bufev);
// You can enable or disable the events EV_READ, EV_WRITE, or EV_READ|EV_WRITE on a bufferevent. When reading or writing is not enabled, the bufferevent will not try to read or write data.
// There is no need to disable writing when the output buffer is empty: the bufferevent automatically stops writing, and restarts again when there is data to write.
// Similarly, there is no need to disable reading when the input buffer is up to its high-water mark: the bufferevent automatically stops reading, and restarts again when there is space to read.
// By default, a newly created bufferevent has writing enabled, but not reading.
	bufferevent_enable(bev, EV_READ|EV_WRITE);


// int evbuffer_add_printf(struct evbuffer *buf, const char *fmt, ...)
// int evbuffer_add_vprintf(struct evbuffer *buf, const char *fmt, va_list ap);
// 
// These functions append formatted data to the end of buf. The format argument and other remaining arguments are handled as if by the C library functions "printf" and "vprintf" respectively. The functions return the number of bytes appended.
	evbuffer_add_printf(bufferevent_get_output(bev), "GET %s\r\n", argv[2]);
	bufferevent_socket_connect_hostname(
			bev, dns_base, AF_UNSPEC, argv[1], 80);
	//getchar();  // 通过暂停可以查看其行为
	event_base_dispatch(base);
	return 0;
}


// 流程为 event_base_dispatch
// DNS解析的过程也是非阻塞的，如果数据不可用 就epoll_wait
// 等DNS解析成功之后 这时才会去connect 解析出来的地地址
// clock_gettime(CLOCK_MONOTONIC_COARSE, {179937, 478892722}) = 0
// epoll_wait(3, {{EPOLLIN, {u32=6, u64=6}}}, 32, 2096) = 1
// clock_gettime(CLOCK_MONOTONIC_COARSE, {179937, 478892722}) = 0
// recvfrom(6, "\262\304\201\200\0\1\0\3\0\0\0\0\3Www\5BAIdu\3COM\0\0\1\0\1\300"..., 1500, 0, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("192.168.100.2")}, [16]) = 90
// recvfrom(6, "@.\201\200\0\1\0\1\0\1\0\0\3Www\5BAidu\3COM\0\0\34\0\1\300"..., 1500, 0, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("192.168.100.2")}, [16]) = 115
// sendto(6, "\213\24\1\0\0\1\0\0\0\0\0\0\3WwW\5bAiDu\3COM\vLOcaL"..., 43, 0, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("192.168.100.2")}, 16) = 43
// recvfrom(6, 0x7fffc7cd99c0, 1500, 0, 0x7fffc7cd9530, 0x7fffc7cd94e4) = -1 EAGAIN (Resource temporarily unavailable)
// epoll_wait(3, {{EPOLLIN, {u32=6, u64=6}}}, 32, 3000) = 1
// clock_gettime(CLOCK_MONOTONIC_COARSE, {179937, 482892722}) = 0
// recvfrom(6, "\213\24\201\203\0\1\0\0\0\1\0\0\3WwW\5bAiDu\3COM\vLOcaL"..., 1500, 0, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("192.168.100.2")}, [16]) = 118
// recvfrom(6, 0x7fffc7cd99c0, 1500, 0, 0x7fffc7cd9530, 0x7fffc7cd94e4) = -1 EAGAIN (Resource temporarily unavailable)

// 解析出来之后发起连接
// socket(PF_INET, SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_IP) = 7
// connect(7, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("14.215.177.38")}, 16) = -1 EINPROGRESS (Operation now in progress)
// epoll_ctl(3, EPOLL_CTL_ADD, 7, {EPOLLIN, {u32=7, u64=7}}) = 0
// epoll_ctl(3, EPOLL_CTL_MOD, 7, {EPOLLIN|EPOLLOUT, {u32=7, u64=7}}) = 0   //  ****   这一行的作用bufferevent_enable(bev, EV_READ|EV_WRITE);
// epoll_wait(3, {{EPOLLOUT, {u32=7, u64=7}}}, 32, -1) = 1
// clock_gettime(CLOCK_MONOTONIC_COARSE, {179937, 490892722}) = 0
// getsockopt(7, SOL_SOCKET, SO_ERROR, [0], [4]) = 0
// getpeername(7, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("14.215.177.38")}, [16]) = 0
// fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 1), ...}) = 0
// mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f84e274a000
// write(1, "Connect okay.\n", 14Connect okay.
// 	 )         = 14
// writev(7, [{"GET /\r\n", 7}], 1)        = 7
// epoll_ctl(3, EPOLL_CTL_MOD, 7, {EPOLLIN, {u32=7, u64=7}}) = 0
// epoll_wait(3, {{EPOLLIN, {u32=7, u64=7}}}, 32, -1) = 1
// clock_gettime(CLOCK_MONOTONIC_COARSE, {179952, 498892231}) = 0
// gettimeofday({1468387966, 306679}, NULL) = 0
// ioctl(7, FIONREAD, [0])                 = 0
// readv(7, [{"\2\0\0P\16\327\261&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\241\354\1\0\0\0\0\0"..., 4096}], 1) = 0
// epoll_ctl(3, EPOLL_CTL_DEL, 7, 7fffc7cd9eb0) = 0

// You can enable or disable the events EV_READ, EV_WRITE, or EV_READ|EV_WRITE on a bufferevent. When reading or writing is not enabled, the bufferevent will not try to read or write data.
// 
// There is no need to disable writing when the output buffer is empty: the bufferevent automatically stops writing, and restarts again when there is data to write.
// 
// Similarly, there is no need to disable reading when the input buffer is up to its high-water mark: the bufferevent automatically stops reading, and restarts again when there is space to read.
// 
// By default, a newly created bufferevent has writing enabled, but not reading.


// stephensun@debian:~/programming/libevent/libevent2/libevent/sample/study-buffevent$ ./bufferevent_socket_connect_hostname www.baiduxxxx.com /
// DNS error: nodename nor servname provided, or not known
// Closing

