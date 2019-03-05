/*
  This is an example of how to use http client

  It just GETs an http URL given on the command-line and prints the response
  body to stdout.

  Loosely based on le-proxy.c.
 */

// ./http-client  -url http://127.0.0.1:80

// Get rid of OSX 10.7 and greater deprecation warnings.

// 有时间实践 带body的请求

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

	//fprintf(stderr, "Response line: %d %s\n",
	//    evhttp_request_get_response_code(req),
	//    evhttp_request_get_response_code_line(req));

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
	//./https-client  -url http://127.0.0.1:80
	fputs("Syntax:\n", stderr);
	fputs("   https-client -url <https-url> [-data data-file.bin] [-ignore-cert] [-retries num] [-timeout sec] \n", stderr);
	fputs("Example:\n", stderr);
	fputs("   https-client -url https://ip.appspot.com/\n", stderr);
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
	const char *url = NULL, *data_file = NULL;
	const char *scheme, *host, *path, *query;
	char uri[256];
	int port;
	int retries = 0;
	int timeout = -1;

	struct bufferevent *bev;
	struct evhttp_connection *evcon = NULL;
	struct evhttp_request *req;
	struct evkeyvalq *output_headers;
	struct evbuffer *output_buffer;

	int i;
	int ret = 0;

	for (i = 1; i < argc; i++) {
		if (!strcmp("-url", argv[i])) {
			if (i < argc - 1) {
				url = argv[i + 1];
			} else {
				syntax();
				goto error;
			}
		} else if (!strcmp("-data", argv[i])) {
			if (i < argc - 1) {
				data_file = argv[i + 1];
			} else {
				syntax();
				goto error;
			}
		} else if (!strcmp("-retries", argv[i])) {
			if (i < argc - 1) {
				retries = atoi(argv[i + 1]);
			} else {
				syntax();
				goto error;
			}
		} else if (!strcmp("-timeout", argv[i])) {
			if (i < argc - 1) {
				timeout = atoi(argv[i + 1]);
			} else {
				syntax();
				goto error;
			}
		} else if (!strcmp("-help", argv[i])) {
			syntax();
			goto error;
		}
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

	scheme = evhttp_uri_get_scheme(http_uri);
	if (scheme == NULL || (strcasecmp(scheme, "https") != 0 &&
	                       strcasecmp(scheme, "http") != 0)) {
		err("url must be http or https");
		goto error;
	}

	host = evhttp_uri_get_host(http_uri);
	if (host == NULL) {
		err("url must have a host");
		goto error;
	}

	port = evhttp_uri_get_port(http_uri);
	if (port == -1) {
		port = (strcasecmp(scheme, "http") == 0) ? 80 : 443;
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

	if (strcasecmp(scheme, "http") == 0) {
		bev = bufferevent_socket_new(base, -1, BEV_OPT_CLOSE_ON_FREE);
	} 

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

	if (retries > 0) {
		evhttp_connection_set_retries(evcon, retries);
	}
	if (timeout >= 0) {
		evhttp_connection_set_timeout(evcon, timeout);
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

	if (data_file) {
		/* NOTE: In production code, you'd probably want to use
		 * evbuffer_add_file() or evbuffer_add_file_segment(), to
		 * avoid needless copying. */
		FILE * f = fopen(data_file, "rb");
		char buf[1024];
		size_t s;
		size_t bytes = 0;

		if (!f) {
			syntax();
			goto error;
		}

		output_buffer = evhttp_request_get_output_buffer(req);
		while ((s = fread(buf, 1, sizeof(buf), f)) > 0) {
			evbuffer_add(output_buffer, buf, s);
			bytes += s;
		}
		evutil_snprintf(buf, sizeof(buf)-1, "%lu", (unsigned long)bytes);
		evhttp_add_header(output_headers, "Content-Length", buf);
		fclose(f);
	}

	r = evhttp_make_request(evcon, req, data_file ? EVHTTP_REQ_POST : EVHTTP_REQ_GET, uri);
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
	event_base_free(base);
	return ret;
}
