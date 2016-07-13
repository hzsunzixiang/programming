#include <event2/dns.h>
#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <event2/util.h>
#include <event2/event.h>


#include <stdio.h>
#include <unistd.h>
#include <string.h>

void eventcb(struct bufferevent *bev, short events, void *ptr)
{
	if (events & BEV_EVENT_CONNECTED) {
		/* We're connected to 127.0.0.1:8080.   Ordinarily we'd do
		   something here, like start reading or writing. */
		fprintf(stderr, "Connect okay, %s.\n", (char*)ptr);
	} else if (events & BEV_EVENT_ERROR) {
		/* An error occured while connecting. */
		fprintf(stderr, "Connect error.\n");
	}
}

int main(void)
{
	struct event_base *base;
	struct bufferevent *bev;
	struct sockaddr_in sin;

	// epoll_create1
	base = event_base_new();

	memset(&sin, 0, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_addr.s_addr = htonl(0x7f000001); /* 127.0.0.1 */
	sin.sin_port = htons(9876); /* Port 9876*/

	// struct bufferevent *bufferevent_socket_new(
	// 		struct event_base *base,
	// 		evutil_socket_t fd,
	// 		enum bufferevent_options options);
	// The base is an event_base, and options is a bitmask of bufferevent options (BEV_OPT_CLOSE_ON_FREE, etc). The fd argument is an optional file descriptor for a socket. You can set fd to -1 if you want to set the file descriptor later.
	// bufferevent_socket_new 只是分配内存 没有系统调用
	bev = bufferevent_socket_new(base, -1, BEV_OPT_CLOSE_ON_FREE);

	//void bufferevent_setcb(struct bufferevent *bufev,
	//		bufferevent_data_cb readcb, bufferevent_data_cb writecb,
	//		bufferevent_event_cb eventcb, void *cbarg);

	//bufferevent_setcb(bev, NULL, NULL, eventcb, NULL);
	bufferevent_setcb(bev, NULL, NULL, eventcb, "hello");


	if (bufferevent_socket_connect(bev,
				(struct sockaddr *)&sin, sizeof(sin)) < 0) {
		/* Error starting connection */
		// 连接不能马上建立的时候 应该添加到写事件中
		fprintf(stderr, "Connect failed.\n");
		bufferevent_free(bev);
		return -1;
	}

	// epoll_wait 
	event_base_dispatch(base);
	pause();

	return 0;
}


// stephensun@debian:~/programming/libevent/libevent2/libevent/sample/study-buffevent$ strace ./bufferevent_socket_new
// execve("./bufferevent_socket_new", ["./bufferevent_socket_new"], [/* 40 vars */]) = 0
// uname({sys="Linux", node="debian", ...}) = 0
// brk(0)                                  = 0xfff000
// brk(0x10001c0)                          = 0x10001c0
// arch_prctl(ARCH_SET_FS, 0xfff880)       = 0
// readlink("/proc/self/exe", "/home/stephensun/programming/lib"..., 4096) = 102
// brk(0x10211c0)                          = 0x10211c0
// brk(0x1022000)                          = 0x1022000
// access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)

// clock_gettime(CLOCK_MONOTONIC_COARSE, {171712, 867161580}) = 0
// clock_gettime(CLOCK_MONOTONIC_COARSE, {171712, 871161580}) = 0
// gettimeofday({1468379726, 679563}, NULL) = 0

// epoll_create1(EPOLL_CLOEXEC)            = 3

// pipe2([4, 5], O_NONBLOCK|O_CLOEXEC)     = 0


// bufferevent_socket_connect 调用 如下几个系统调用
// connect 不成功的时候 会把描述字放入 监听集合中 事件为 EPOLLOUT 读事件
// socket(PF_INET, SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_IP) = 6
// connect(6, {sa_family=AF_INET, sin_port=htons(9876), sin_addr=inet_addr("127.0.0.1")}, 16) = -1 EINPROGRESS (Operation now in progress)
// epoll_ctl(3, EPOLL_CTL_ADD, 6, {EPOLLOUT, {u32=6, u64=6}}) = 0


//	event_base_dispatch(base); 调用时 等待写事件发生， 可写时 判断是否发生错误
//  没有错误时 调用回调函数  然后删除描述符

//  epoll_wait(3, {{EPOLLOUT, {u32=6, u64=6}}}, 32, -1) = 1
//  clock_gettime(CLOCK_MONOTONIC_COARSE, {172023, 715151418}) = 0
//  getsockopt(6, SOL_SOCKET, SO_ERROR, [0], [4]) = 0
//  epoll_ctl(3, EPOLL_CTL_DEL, 6, 7ffe28ee25d0) = 0



// 连接错误时 的错误码

// getsockopt(6, SOL_SOCKET, SO_ERROR, [111], [4]) = 0




// You can enable or disable the events EV_READ, EV_WRITE, or EV_READ|EV_WRITE on a bufferevent. When reading or writing is not enabled, the bufferevent will not try to read or write data.
// 
// There is no need to disable writing when the output buffer is empty: the bufferevent automatically stops writing, and restarts again when there is data to write.
// 
// Similarly, there is no need to disable reading when the input buffer is up to its high-water mark: the bufferevent automatically stops reading, and restarts again when there is space to read.
// 
// By default, a newly created bufferevent has writing enabled, but not reading.
