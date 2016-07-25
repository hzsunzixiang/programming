
#if defined(__APPLE__) && defined(__clang__)
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#endif

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#ifdef _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/socket.h>
#include <netinet/in.h>
#endif

#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <event2/listener.h>
#include <event2/util.h>


static struct event_base *base;
static struct sockaddr_storage listen_on_addr;
static struct sockaddr_storage connect_to_addr;
static int connect_to_addrlen;

#define MAX_OUTPUT_C2P (500)
#define MAX_OUTPUT_P2S (10)

static void drained_writecbin(struct bufferevent *bev, void *ctx);
static void drained_writecbout(struct bufferevent *bev, void *ctx);
static void eventcbin(struct bufferevent *bev, short what, void *ctx);
static void eventcbout(struct bufferevent *bev, short what, void *ctx);
static void readcbin(struct bufferevent *bev, void *ctx);
static void readcbout(struct bufferevent *bev, void *ctx);
static void close_on_finished_writecbin(struct bufferevent *bev, void *ctx);
static void close_on_finished_writecbout(struct bufferevent *bev, void *ctx);


	static void
readcbin(struct bufferevent *bev_in, void *ctx_out)
{
	struct bufferevent *partner_out = ctx_out;
	struct evbuffer *src, *dst;
	size_t len;
	src = bufferevent_get_input(bev_in);
	len = evbuffer_get_length(src);
	if (!partner_out) {
		fprintf(stderr, "partner_out == NULL");
		evbuffer_drain(src, len);
		return;
	}
	dst = bufferevent_get_output(partner_out);
	evbuffer_add_buffer(dst, src);

	if (evbuffer_get_length(dst) >= MAX_OUTPUT_P2S) {
		/* We're giving the other side data faster than it can
		 * pass it on.  Stop reading here until we have drained the
		 * other side to MAX_OUTPUT_P2S/2 bytes. */
		fprintf(stderr, "adjust the wartermark of <proxy->server>\n");
		bufferevent_setcb(partner_out, readcbout, drained_writecbout,
				eventcbout, bev_in);
		// 低于这个水位MAX_OUTPUT_P2S/2的时候 就调用 drained_writecbout
		bufferevent_setwatermark(partner_out, EV_WRITE, MAX_OUTPUT_P2S/2,
				MAX_OUTPUT_P2S);
		bufferevent_disable(bev_in, EV_READ);
	}
}

	static void
readcbout(struct bufferevent *bev_out, void *ctx_in)
{
	struct bufferevent *partner_in = ctx_in;
	struct evbuffer *src, *dst;
	size_t len;
	src = bufferevent_get_input(bev_out);
	len = evbuffer_get_length(src);
	if (!partner_in) {
		evbuffer_drain(src, len);
		return;
	}
	dst = bufferevent_get_output(partner_in);
	evbuffer_add_buffer(dst, src);

	if (evbuffer_get_length(dst) >= MAX_OUTPUT_C2P) {
		/* We're giving the other side data faster than it can
		 * pass it on.  Stop reading here until we have drained the
		 * other side to MAX_OUTPUT_C2P/2 bytes. */
		fprintf(stderr, "adjust the wartermark of <client-proxy>\n");
		bufferevent_setcb(partner_in, readcbin, drained_writecbin,
				eventcbin, bev_out);
		bufferevent_setwatermark(partner_in, EV_WRITE, MAX_OUTPUT_C2P/2,
				MAX_OUTPUT_C2P);
		bufferevent_disable(bev_out, EV_READ);
	}
}

	static void
drained_writecbin(struct bufferevent *bev_in, void *ctx_out)
{
	fprintf(stderr, "drained_writecbin adjust the wartermark of <client-proxy>\n");
	struct bufferevent *partner_out= ctx_out;

	/* We were choking the other side until we drained our outbuf a bit.
	 * Now it seems drained. */
	bufferevent_setcb(bev_in, readcbin, NULL, eventcbin, partner_out);
	bufferevent_setwatermark(bev_in, EV_WRITE, 0, 0);
	if (partner_out)
		bufferevent_enable(partner_out, EV_READ);
}
	static void
drained_writecbout(struct bufferevent *bev_out, void *ctx_in)
{
	fprintf(stderr, "drained_writecbout adjust the wartermark of <proxy->server>\n");
	struct bufferevent *partner_in = ctx_in;

	/* We were choking the other side until we drained our outbuf a bit.
	 * Now it seems drained. */
	bufferevent_setcb(bev_out, readcbout, NULL, eventcbout, partner_in);
	bufferevent_setwatermark(bev_out, EV_WRITE, 0, 0);
	if (partner_in)
		bufferevent_enable(partner_in, EV_READ);
}

	static void
close_on_finished_writecbin(struct bufferevent *bev, void *ctx)
{
	fprintf(stderr, "close the connection client->proxy");
	struct evbuffer *b = bufferevent_get_output(bev);

	if (evbuffer_get_length(b) == 0) {
		bufferevent_free(bev);
	}
}
	static void
close_on_finished_writecbout(struct bufferevent *bev, void *ctx)
{
	fprintf(stderr, "close the connection proxy->server");
	struct evbuffer *b = bufferevent_get_output(bev);

	if (evbuffer_get_length(b) == 0) {
		bufferevent_free(bev);
	}
}


	static void
eventcbin(struct bufferevent *bev_in, short what, void *ctx_out)
{
	fprintf(stderr, "evetcbin from client .......\n");
	struct bufferevent *partner_out = ctx_out; // proxy->server

	if (what & BEV_EVENT_CONNECTED) { // never come this branch
		fprintf(stderr, "Connect from client to proxy okay.\n");
	}
	else if (what & (BEV_EVENT_EOF|BEV_EVENT_ERROR)) {

		if (what &  BEV_EVENT_EOF) {
			fprintf(stderr, "normal closing from client to proxy.......\n");
		}
		else if (what & BEV_EVENT_ERROR ) {
			fprintf(stderr, "abnormal closing from client to proxy.......\n");
			if (errno)
				perror("connection<client->proxy> error");
		}

		// 下面是先断开对端 然后再断开本端的
		if (partner_out) { //  <proxy->server>
			/* Flush all pending data */
			readcbin(bev_in, ctx_out); 

			if (evbuffer_get_length(
						bufferevent_get_output(partner_out))) {
				/* We still have to flush data from the other
				 * side, but when that's done, close the other
				 * side. */
				bufferevent_setcb(partner_out,
						NULL, close_on_finished_writecbout,
						eventcbout, NULL);
				bufferevent_disable(partner_out, EV_READ);
			} else {
				/* We have nothing left to say to the other
				 * side; close it. */
				printf("Closing proxy-server \n");
				bufferevent_free(partner_out);
			}
		}
		printf("Closing client-proxy \n");
		bufferevent_free(bev_in);
	}
}
	static void
eventcbout(struct bufferevent *bev_out, short what, void *ctx_in)
{
	fprintf(stderr, "eventcbout from server.......\n");
	struct bufferevent *partner_in = ctx_in;

	if (what & BEV_EVENT_CONNECTED) {
		fprintf(stderr, "Connect to server okay.\n");
	}
	else if (what & (BEV_EVENT_EOF|BEV_EVENT_ERROR)) {

		if (what &  BEV_EVENT_EOF) {
			fprintf(stderr, "normal closing from server.......\n");
		}
		else if (what & BEV_EVENT_ERROR ) {
			fprintf(stderr, "abnormal closing from server.......\n");
			if (errno)
				perror("connection <porxy--server> error");
		}

		// 下面是先断开对端 然后在断开本端的
		if (partner_in) {
			/* Flush all pending data */
			readcbout(bev_out, ctx_in);

			if (evbuffer_get_length(
						bufferevent_get_output(partner_in))) {
				/* We still have to flush data from the other
				 * side, but when that's done, close the other
				 * side. */
				bufferevent_setcb(partner_in,
						NULL, close_on_finished_writecbin,
						eventcbin, NULL);
				bufferevent_disable(partner_in, EV_READ);
			} else {
				/* We have nothing left to say to the other
				 * side; close it. */
				printf("Closing client->proxy\n");
				bufferevent_free(partner_in);
			}
		}
		printf("Closing from proxy to server\n");
		bufferevent_free(bev_out);
	}
}


	static void
syntax(void)
{
	fputs("Syntax:\n", stderr);
	fputs("   proxy <listen-on-addr> <connect-to-addr>\n", stderr);
	fputs("Example:\n", stderr);
	fputs("   proxy 127.0.0.1:8888 1.2.3.4:80\n", stderr);

	exit(1);
}

	static void
accept_cb(struct evconnlistener *listener, evutil_socket_t fd,
		struct sockaddr *a, int slen, void *p)
{
	/* Extract and display the address we're connect. */
	struct sockaddr_storage ss;
	ev_socklen_t socklen = sizeof(ss);
	char addrbuf[128];
	void *inaddr;
	const char *addr;
	int got_port = -1;
	memset(&ss, 0, sizeof(ss));
	if (getpeername(fd, (struct sockaddr *)&ss, &socklen)) {
		perror("getpeerkname() failed");
		return ;
	}
	if (ss.ss_family == AF_INET) {
		got_port = ntohs(((struct sockaddr_in*)&ss)->sin_port);
		inaddr = &((struct sockaddr_in*)&ss)->sin_addr;
	} else if (ss.ss_family == AF_INET6) {
		got_port = ntohs(((struct sockaddr_in6*)&ss)->sin6_port);
		inaddr = &((struct sockaddr_in6*)&ss)->sin6_addr;
	} else {
		fprintf(stderr, "Weird address family %d\n",
				ss.ss_family);
		return;
	}
	addr = evutil_inet_ntop(ss.ss_family, inaddr, addrbuf, sizeof(addrbuf));
	if (addr) {
		printf("connection from address %s:%d\n", addr, got_port);
	} else {
		fprintf(stderr, "evutil_inet_ntop failed\n");
		return ;
	}
	struct bufferevent *b_out, *b_in;
	/* Create two linked bufferevent objects: one to connect, one for the
	 * new connection */
	b_in = bufferevent_socket_new(base, fd,
			BEV_OPT_CLOSE_ON_FREE|BEV_OPT_DEFER_CALLBACKS);

	b_out = bufferevent_socket_new(base, -1,
			BEV_OPT_CLOSE_ON_FREE|BEV_OPT_DEFER_CALLBACKS);


	assert(b_in && b_out);

	if (bufferevent_socket_connect(b_out,
				(struct sockaddr*)&connect_to_addr, connect_to_addrlen)<0) {
		perror("bufferevent_socket_connect");
		bufferevent_free(b_out);
		bufferevent_free(b_in);
		return;
	}

	bufferevent_setcb(b_in, readcbin, NULL, eventcbin, b_out);
	bufferevent_setcb(b_out, readcbout, NULL, eventcbout, b_in);

	bufferevent_enable(b_in, EV_READ|EV_WRITE);
	bufferevent_enable(b_out, EV_READ|EV_WRITE);
}

	int
main(int argc, char **argv)
{
	int socklen;

	struct evconnlistener *listener;

	if (argc < 3)
		syntax();
	memset(&listen_on_addr, 0, sizeof(listen_on_addr));
	socklen = sizeof(listen_on_addr);
	if (evutil_parse_sockaddr_port(argv[1],
				(struct sockaddr*)&listen_on_addr, &socklen)<0) {
		int p = atoi(argv[1]);
		struct sockaddr_in *sin = (struct sockaddr_in*)&listen_on_addr;
		if (p < 1 || p > 65535)
			syntax();
		sin->sin_port = htons(p);
		sin->sin_addr.s_addr = htonl(0x7f000001);
		sin->sin_family = AF_INET;
		socklen = sizeof(struct sockaddr_in);
	}

	memset(&connect_to_addr, 0, sizeof(connect_to_addr));
	connect_to_addrlen = sizeof(connect_to_addr);
	if (evutil_parse_sockaddr_port(argv[2],
				(struct sockaddr*)&connect_to_addr, &connect_to_addrlen)<0)
		syntax();

	base = event_base_new();
	if (!base) {
		perror("event_base_new()");
		return 1;
	}


	listener = evconnlistener_new_bind(base, accept_cb, NULL,
			LEV_OPT_CLOSE_ON_FREE|LEV_OPT_CLOSE_ON_EXEC|LEV_OPT_REUSEABLE,
			-1, (struct sockaddr*)&listen_on_addr, socklen);

	if (! listener) {
		fprintf(stderr, "Couldn't open listener.\n");
		event_base_free(base);
		return 1;
	}
	event_base_dispatch(base);

	evconnlistener_free(listener);
	event_base_free(base);

	return 0;
}
