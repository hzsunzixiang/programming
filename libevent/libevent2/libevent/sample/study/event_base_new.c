/* For sockaddr_in */
#include <netinet/in.h>
/* For socket functions */
#include <sys/socket.h>
/* For fcntl */
#include <fcntl.h>

#include <event2/event.h>

#include <assert.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>


	void
run(void)
{
	evutil_socket_t listener;
	struct sockaddr_in sin;
	struct event_base *base;
	struct event *listener_event;

	base = event_base_new();
	if (!base)
		return; /*XXXerr*/

	pause();


}

	int
main(int c, char **v)
{
	setvbuf(stdout, NULL, _IONBF, 0);

	run();
	return 0;
}


// event_base_new 调用如下几个系统调用
// epoll_create1(EPOLL_CLOEXEC)            = 3
// 
// pipe2([4, 5], O_NONBLOCK|O_CLOEXEC)     = 0

