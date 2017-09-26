/*
  This is an example of how to use http client

  It just GETs an http URL given on the command-line and prints the response
  body to stdout.

  Loosely based on le-proxy.c.
 */

// ./http-client  http://127.0.0.1:80

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include <sys/socket.h>
#include <netinet/in.h>

#include <event2/bufferevent.h>
#include <event2/buffer.h>
#include <event2/listener.h>
#include <event2/util.h>
#include <event2/http.h>


static struct event_base *base;

static void
http_request_done(struct evhttp_request *req, void *ctx)
{
	char buffer[256];
	int nread;

	if (req == NULL) {
		/* If req is NULL, it means an error occurred, but
		 * sadly we are mostly left guessing what the error
		 * might have been.  We'll do our best... */
		//struct bufferevent *bev = (struct bufferevent *) ctx;
		fprintf(stderr, "some request failed - no idea which one though!\n");
		return;
	}

	fprintf(stderr, "Response line: %d %s\n",
	    evhttp_request_get_response_code(req),
	    evhttp_request_get_response_code_line(req));

	while ((nread = evbuffer_remove(evhttp_request_get_input_buffer(req),
		    buffer, sizeof(buffer)))
	       > 0) {
		/* These are just arbitrary chunks of 256 bytes.
		 * They are not lines, so we can't treat them as such. */
		fwrite(buffer, nread, 1, stdout);
	}
}

static void
syntax(void)
{
	//./https-client  http://127.0.0.1:80
	fputs("Syntax:\n", stderr);
	fputs("   https-client <http-url> \n", stderr);
	fputs("Example:\n", stderr);
	fputs("   http-client http://127.0.0.1:80/\n", stderr);
}

static void
err(const char *msg)
{
	fputs(msg, stderr);
}



int
main(int argc, char **argv)
{
	int r;

	struct evhttp_uri *http_uri = NULL;
	const char *url = NULL;
	const char *host, *path, *query;
	char uri[256];
	int port;

	struct bufferevent *bev;
	struct evhttp_connection *evcon = NULL;
	struct evhttp_request *req;
	struct evkeyvalq *output_headers;

	int i;
	int ret = 0;

	for (i = 1; i < argc; i++) {
		url = argv[1];
	} 

	if (!url) {
		syntax();
		goto error;
	}

	http_uri = evhttp_uri_parse(url);
	if (http_uri == NULL) {
		err("malformed url");
		goto error;
	}

	host = evhttp_uri_get_host(http_uri);
	if (host == NULL) {
		err("url must have a host");
		goto error;
	}

	port = evhttp_uri_get_port(http_uri);
	if (port == -1) {
		port = 80;
	}

	path = evhttp_uri_get_path(http_uri);
	if (strlen(path) == 0) {
		path = "/";
	}

	query = evhttp_uri_get_query(http_uri);
	if (query == NULL) {
		snprintf(uri, sizeof(uri) - 1, "%s", path);
	} else {
		snprintf(uri, sizeof(uri) - 1, "%s?%s", path, query);
	}
	uri[sizeof(uri) - 1] = '\0';

	// Create event base
	base = event_base_new();
	if (!base) {
		perror("event_base_new()");
		goto error;
	}

	bev = bufferevent_socket_new(base, -1, BEV_OPT_CLOSE_ON_FREE);

	if (bev == NULL) {
		fprintf(stderr, "bufferevent_openssl_socket_new() failed\n");
		goto error;
	}


	// For simplicity, we let DNS resolution block. Everything else should be
	// asynchronous though.
	evcon = evhttp_connection_base_bufferevent_new(base, NULL, bev,
			host, port);
	if (evcon == NULL) {
		fprintf(stderr, "evhttp_connection_base_bufferevent_new() failed\n");
		goto error;
	}


	// Fire off the request
	req = evhttp_request_new(http_request_done, bev);
	if (req == NULL) {
		fprintf(stderr, "evhttp_request_new() failed\n");
		goto error;
	}

	output_headers = evhttp_request_get_output_headers(req);
	evhttp_add_header(output_headers, "Host", host);
	evhttp_add_header(output_headers, "Connection", "close");

	r = evhttp_make_request(evcon, req, EVHTTP_REQ_GET, uri);
	if (r != 0) {
		fprintf(stderr, "evhttp_make_request() failed\n");
		goto error;
	}

	event_base_dispatch(base);
	goto cleanup;

error:
	ret = 1;
cleanup:
	if (evcon)
		evhttp_connection_free(evcon);
	if (http_uri)
		evhttp_uri_free(http_uri);
	if(base)
	{
		event_base_free(base);
	}

	return ret;
}
