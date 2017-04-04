#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hiredis.h"

// http://codingsteps.com/installing-using-hiredis-c-client-library-for-redis/

int main(int argc, char **argv) {


	unsigned int j;
	redisContext *c;
	redisReply *reply;
	// 192.168.202.200:19001

	const char *hostname = "192.168.202.200";
	int port = 19001;

	struct timeval timeout = { 1, 500000 }; // 1.5 seconds
	c = redisConnectWithTimeout(hostname, port, timeout);
	if (c == NULL || c->err) {
		if (c) {
			printf("Connection error: %s\n", c->errstr);
			redisFree(c);
		} else {
			printf("Connection error: can't allocate redis context\n");
		}
		exit(1);
	}

	/* PING server */
	//reply = redisCommand(c,"PING");
	
	reply = redisCommand(c, "%s", "PING");
	printf("PING: %s\n", reply->str);
	freeReplyObject(reply);


	/* Set a key */
	reply = redisCommand(c,"SET %s %s", "foo", "hello world");
	printf("SET: %s\n", reply->str);
	freeReplyObject(reply);

	/* Try a GET and two INCR */
	reply = redisCommand(c,"GET foo");
	printf("GET foo: %s\n", reply->str);
	freeReplyObject(reply);


	/* Set a key using binary safe API */
	reply = redisCommand(c,"SET %b %b", "bar", (size_t) 3, "hello", (size_t) 5);
	printf("SET (binary API): %s\n", reply->str);
	freeReplyObject(reply);

	/* Try a GET and two INCR */
	reply = redisCommand(c,"GET bar");
	printf("GET bar : %s\n", reply->str);
	freeReplyObject(reply);

	reply = redisCommand(c,"INCR counter");
	printf("INCR counter: %lld\n", reply->integer);
	freeReplyObject(reply);
	/* again ... */
	reply = redisCommand(c,"INCR counter");
	printf("INCR counter: %lld\n", reply->integer);
	freeReplyObject(reply);


	/* Create a list of numbers, from 0 to 9 */
	reply = redisCommand(c,"DEL mylist");
	freeReplyObject(reply);
	for (j = 0; j < 10; j++) {
		char buf[64];

		snprintf(buf,64,"%u",j);
		reply = redisCommand(c,"RPUSH mylist element-%s", buf);
		freeReplyObject(reply);
	}

	/* Let's check what we have inside the list */
	reply = redisCommand(c,"LRANGE mylist 0 -1");
	if (reply->type == REDIS_REPLY_ARRAY) {
		for (j = 0; j < reply->elements; j++) {
			printf("%u) %s\n", j, reply->element[j]->str);
		}
	}
	freeReplyObject(reply);

	/* Disconnects and frees the context */
	redisFree(c);

	return 0;
}
