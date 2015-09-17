/*
 * Copyright 2000 Niels Provos <provos@citi.umich.edu>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *      This product includes software developed by Niels Provos.
 * 4. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include <sys/types.h>
#include <sys/time.h>
#include <sys/queue.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>

#ifdef USE_LOG
#include "log.h"
#else
#define LOG_DBG(x)
#define log_error(x)	perror(x)
#endif

#include "event.h"

#ifndef howmany
#define        howmany(x, y)   (((x)+((y)-1))/(y))
#endif

/* Prototypes */
void event_add_post(struct event *);

TAILQ_HEAD (timeout_list, event) timequeue;
TAILQ_HEAD (event_wlist, event) writequeue;
TAILQ_HEAD (event_rlist, event) readqueue;
TAILQ_HEAD (event_ilist, event) addqueue;

int event_inloop = 0;
int event_fds;		/* Highest fd in fd set */
int event_fdsz;  // 能容纳的文件描述符个数
fd_set *event_readset;
fd_set *event_writeset;

void
event_init(void)
{
	TAILQ_INIT(&timequeue);
	TAILQ_INIT(&writequeue);
	TAILQ_INIT(&readqueue);
	TAILQ_INIT(&addqueue);
}

/*
 * Called with the highest fd that we know about.  If it is 0, completely
 * recalculate everything.
 */

int
events_recalc(int max)
{
	fd_set *readset, *writeset;
	struct event *ev;
	int fdsz;

	event_fds = max;

	if (!event_fds) {
		TAILQ_FOREACH(ev, &writequeue, ev_write_next)
			if (ev->ev_fd > event_fds)
				event_fds = ev->ev_fd;

		TAILQ_FOREACH(ev, &readqueue, ev_read_next)
			if (ev->ev_fd > event_fds)
				event_fds = ev->ev_fd;
	}

	//#define        howmany(x, y)   (((x)+((y)-1))/(y))
	// 1 + (event_fds + 1) / NFDBITS

	// 根据计算得知，howmany 计算的结果至少为1， fdsz 至少为 4个字节, 在32位下. 64位下8个字节
	fdsz = howmany(event_fds + 1, NFDBITS) * sizeof(fd_mask);
	if (fdsz > event_fdsz) {
		if ((readset = realloc(event_readset, fdsz)) == NULL) {
			log_error("malloc");
			return (-1);
		}

		if ((writeset = realloc(event_writeset, fdsz)) == NULL) {
			log_error("malloc");
			free(readset);
			return (-1);
		}

		memset(readset + event_fdsz, 0, fdsz - event_fdsz);
		memset(writeset + event_fdsz, 0, fdsz - event_fdsz);

		event_readset = readset;
		event_writeset = writeset;
		event_fdsz = fdsz;
	}

	return (0);
}

int
event_dispatch(void)
{
	struct timeval tv;
	struct event *ev, *old;
	int res, maxfd;

	/* Calculate the initial events that we are waiting for */
	if (events_recalc(0) == -1)
		return (-1);

	while (1) {
		memset(event_readset, 0, event_fdsz);
		memset(event_writeset, 0, event_fdsz);


		// 把每个相应的描述子加到 fd_set中，  后面通过 FD_ISSET 来判断
		// 如果相应的时间来了之后，就调用call_back回调函数
		// fd 被包装在了 struct event中了

		// select 期间是允许add的， add之后的fd 等下次循环的时候就会加入select中 
		TAILQ_FOREACH(ev, &writequeue, ev_write_next)
				FD_SET(ev->ev_fd, event_writeset);

		TAILQ_FOREACH(ev, &readqueue, ev_read_next)
				FD_SET(ev->ev_fd, event_readset);

		timeout_next(&tv);

		if ((res = select(event_fds + 1, event_readset, 
				  event_writeset, NULL, &tv)) == -1) {
			if (errno != EINTR) {
				log_error("select");
				return (-1);
			}
			continue;
		}

		LOG_DBG((LOG_MISC, 80, __FUNCTION__": select reports %d",
			 res));

		maxfd = 0;
		event_inloop = 1;
		// 保护读写队列
	    // 已经从select返回了，不再阻塞于select了
	    // 所以正在处理事件的时候，是有可能执行event_add 的，当客户端是多线程请求注册事件时
		// 进程切换的时候
		// event_inloop = 1 时， 不能对其操作

		//   if (event_inloop) {
		//   	/* We are in the event loop right now, we have to
		//   	 * postpone the change until later.
		//   	 */
		//   	if (ev->ev_flags & EVLIST_ADD)
		//   		return;
		//   	// event_inloop 为1时， 把时间添加到addqueue中

		//   	TAILQ_INSERT_TAIL(&addqueue, ev, ev_add_next);
		//   	ev->ev_flags |= EVLIST_ADD;
		//   } else
		//   	event_add_post(ev);


		for (ev = TAILQ_FIRST(&readqueue); ev;) {
			old = TAILQ_NEXT(ev, ev_read_next);
			if (FD_ISSET(ev->ev_fd, event_readset)) {
				// 从队列中删除，下次不不再遍历了
				//  需要重新添加
				event_del(ev);
				(*ev->ev_callback)(ev->ev_fd, EV_READ,
						ev->ev_arg);
			} else if (ev->ev_fd > maxfd)
				maxfd = ev->ev_fd;

			ev = old;
		}

		for (ev = TAILQ_FIRST(&writequeue); ev;) {
			old = TAILQ_NEXT(ev, ev_read_next);
			if (FD_ISSET(ev->ev_fd, event_writeset)) {
				// 从队列中删除，下次不不再遍历了
				//  需要重新添加
				event_del(ev);
				// 如果调的callback中有可能造成DOS，那么一样会阻塞在这里
				// 比如调用了readline，而客户端一直不发送换行符
				(*ev->ev_callback)(ev->ev_fd, EV_WRITE,
						ev->ev_arg);
			} else if (ev->ev_fd > maxfd)
				maxfd = ev->ev_fd;

			ev = old;
		}
		// 这里有个标志变量  event_inloop = 1 的过程不能处理
		event_inloop = 0;

		// 开始处理addqueue 队列，这个是在处理的过程中添加的
		// 把标记置为 EVLIST_ADD
		for (ev = TAILQ_FIRST(&addqueue); ev; 
				ev = TAILQ_FIRST(&addqueue)) {
			fprintf(stderr, "Begin to deal with addqueue");
			// 先从addqueue中移除, 后面加到对应的队列中
			TAILQ_REMOVE(&addqueue, ev, ev_add_next);

			// 处理完之后，把EVLIST_ADD 标记去掉, 这个标记是在加到addqueue中添加的
			ev->ev_flags &= ~EVLIST_ADD;

			// 然后看下是否需要重新添加 到对应的读或者写队列中 
			event_add_post(ev);

			// 如果描述符过大，调整一下
			if (ev->ev_fd > maxfd)
				maxfd = ev->ev_fd;
		}

		// 重新计算描述符，动态分配的，不使用系统的
		if (events_recalc(maxfd) == -1)
			return (-1);

		timeout_process();
	}

	return (0);
}

//  struct event evfifo;
//  /* Initalize one event */
//  event_set(&evfifo, socket, EV_READ, fifo_read, &evfifo);

// 注意看callback的原型 
	void
event_set(struct event *ev, int fd, short events,
		void (*callback)(int, short, void *), void *arg)
{
	ev->ev_callback = callback;
	ev->ev_arg = arg;
	ev->ev_fd = fd;
	ev->ev_events = events;
	ev->ev_flags = EVLIST_INIT;
}

/*
 * Checks if a specific event is pending or scheduled.
 */

	int
event_pending(struct event *ev, short event, struct timeval *tv)
{
	int flags = ev->ev_flags;

	/*
	 * We might not have been able to add it to the actual queue yet,
	 * check if we will enqueue later.
	 */
	if (ev->ev_flags & EVLIST_ADD)
		flags |= (ev->ev_events & (EV_READ|EV_WRITE));

	event &= (EV_TIMEOUT|EV_READ|EV_WRITE);

	/* See if there is a timeout that we should report */
	if (tv != NULL && (flags & event & EV_TIMEOUT))
		*tv = ev->ev_timeout;

	return (flags & event);
}

	void
event_add(struct event *ev, struct timeval *tv)
{
	fprintf(stderr, "Begin to event_add\n");
	LOG_DBG((LOG_MISC, 55,
				"event_add: event: %p, %s%s%scall %p",
				ev,
				ev->ev_events & EV_READ ? "EV_READ " : " ",
				ev->ev_events & EV_WRITE ? "EV_WRITE " : " ",
				tv ? "EV_TIMEOUT " : " ",
				ev->ev_callback));
	if (tv != NULL) {
		struct timeval now;
		struct event *tmp;

		gettimeofday(&now, NULL);
		timeradd(&now, tv, &ev->ev_timeout);

		LOG_DBG((LOG_MISC, 55,
					"event_add: timeout in %d seconds, call %p",
					tv->tv_sec, ev->ev_callback));
		if (ev->ev_flags & EVLIST_TIMEOUT)
			TAILQ_REMOVE(&timequeue, ev, ev_timeout_next);

		/* Insert in right temporal order */
		for (tmp = TAILQ_FIRST(&timequeue); tmp;
				tmp = TAILQ_NEXT(tmp, ev_timeout_next)) {
			if (timercmp(&ev->ev_timeout, &tmp->ev_timeout, <=))
				break;
		}

		if (tmp)
			TAILQ_INSERT_BEFORE(tmp, ev, ev_timeout_next);
		else
			TAILQ_INSERT_TAIL(&timequeue, ev, ev_timeout_next);

		ev->ev_flags |= EVLIST_TIMEOUT;
	}

	// 已经从select返回了，不再阻塞与select了
	// 所以正在处理事件的时候，是有可能执行event_add 的，当客户端是多线程请求注册事件时
    //	这几个链表都是全局变量 ,所以是可能的，
	// TODO　模拟这种情形?
	// 让 callback 睡眠一段时间, 然后另一个进程去做event_add操作
	// 然后查看 addqueue队列中的内容
	// 或者是否走到这个分支
	if (event_inloop) {
		/* We are in the event loop right now, we have to
		 * postpone the change until later.
		 */
		if (ev->ev_flags & EVLIST_ADD)
			return;
		// event_inloop 为1时， 把时间添加到addqueue中

		TAILQ_INSERT_TAIL(&addqueue, ev, ev_add_next);
		ev->ev_flags |= EVLIST_ADD;
	} else
		event_add_post(ev);
}

	void
event_add_post(struct event *ev)
{
	//  判断是读或者写事件

	// 读事件，且不再队列中时，就加到队列中
	// 防止重复加入
	if ((ev->ev_events & EV_READ) && !(ev->ev_flags & EVLIST_READ)) {
		TAILQ_INSERT_TAIL(&readqueue, ev, ev_read_next);

		//  表示在队列中了，event_del 会删除掉
		// 放到队列中的时候，就加上这个标志 
		ev->ev_flags |= EVLIST_READ;
	}

	if ((ev->ev_events & EV_WRITE) && !(ev->ev_flags & EVLIST_WRITE)) {
		TAILQ_INSERT_TAIL(&writequeue, ev, ev_write_next);

		ev->ev_flags |= EVLIST_WRITE;
	}
}

	void
event_del(struct event *ev)
{
	LOG_DBG((LOG_MISC, 80, "event_del: %p, callback %p",
				ev, ev->ev_callback));

	if (ev->ev_flags & EVLIST_ADD) {
		TAILQ_REMOVE(&addqueue, ev, ev_add_next);

		ev->ev_flags &= ~EVLIST_ADD;
	}

	if (ev->ev_flags & EVLIST_TIMEOUT) {
		TAILQ_REMOVE(&timequeue, ev, ev_timeout_next);

		ev->ev_flags &= ~EVLIST_TIMEOUT;
	}

	if (ev->ev_flags & EVLIST_READ) {
		TAILQ_REMOVE(&readqueue, ev, ev_read_next);

		ev->ev_flags &= ~EVLIST_READ;
	}

	if (ev->ev_flags & EVLIST_WRITE) {
		TAILQ_REMOVE(&writequeue, ev, ev_write_next);

		ev->ev_flags &= ~EVLIST_WRITE;
	}
}

	int
timeout_next(struct timeval *tv)
{
	struct timeval now;
	struct event *ev;

	if ((ev = TAILQ_FIRST(&timequeue)) == NULL) {
		timerclear(tv);
		tv->tv_sec = TIMEOUT_DEFAULT;
		return (0);
	}

	if (gettimeofday(&now, NULL) == -1)
		return (-1);

	if (timercmp(&ev->ev_timeout, &now, <=)) {
		timerclear(tv);
		return (0);
	}

	timersub(&ev->ev_timeout, &now, tv);

	LOG_DBG((LOG_MISC, 60, "timeout_next: in %d seconds", tv->tv_sec));
	return (0);
}

	void
timeout_process(void)
{
	struct timeval now;
	struct event *ev;

	gettimeofday(&now, NULL);

	while ((ev = TAILQ_FIRST(&timequeue)) != NULL) {
		if (timercmp(&ev->ev_timeout, &now, >))
			break;

		TAILQ_REMOVE(&timequeue, ev, ev_timeout_next);
		ev->ev_flags &= ~EVLIST_TIMEOUT;

		LOG_DBG((LOG_MISC, 60, "timeout_process: call %p",
					ev->ev_callback));
		(*ev->ev_callback)(ev->ev_fd, EV_TIMEOUT, ev->ev_arg);
	}
}
