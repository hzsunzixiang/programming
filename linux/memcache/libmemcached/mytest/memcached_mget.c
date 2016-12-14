#include<config.h>
#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <signal.h>
#include <unistd.h>
#include <time.h>

#include "libmemcached/common.h"
#include "libmemcached/memcached_util.h"
#include <stdio.h>
#include <unistd.h>
int main(int argc, char *argv[])
{
	memcached_server_st *servers = NULL;
	memcached_st *memc;
	memcached_return rc;
	char const * const keys[]= {"huey", "dewey", "louie"};
	size_t key_length[3];
	char *values[]= {"red", "blue", "green"};
	size_t value_length[3];
	unsigned int x;
	uint32_t flags;
	char return_key[MEMCACHED_MAX_KEY];
	size_t return_key_length;
	char *return_value;
	size_t return_value_length;
	memc= memcached_create(NULL);
	servers= memcached_server_list_append(servers, "localhost", 11211, &rc);
	rc= memcached_server_push(memc, servers);
	if (rc == MEMCACHED_SUCCESS)
		fprintf(stderr,"Added server successfully\n");
	else
		fprintf(stderr,"Couldn't add server: %s\n",memcached_strerror(memc, rc));
	for(x= 0; x < 3; x++)
	{
		key_length[x] = strlen(keys[x]);
		value_length[x] = strlen(values[x]);
		rc= memcached_set(memc, keys[x], key_length[x], values[x],
				value_length[x], (time_t)0, (uint32_t)0);
		if (rc == MEMCACHED_SUCCESS)
			fprintf(stderr,"Key %s stored successfully\n",keys[x]);
		else
			fprintf(stderr,"Couldn't store key: %s\n",memcached_strerror(memc, rc));
	}
	rc= memcached_mget(memc, keys, key_length, 3);
	if (rc == MEMCACHED_SUCCESS)
	{
		while ((return_value= memcached_fetch(memc, return_key, &return_key_length,
						&return_value_length, &flags, &rc)) != NULL)
		{
			if (rc == MEMCACHED_SUCCESS)
			{
				fprintf(stderr,"Key %s returned %s\n",return_key, return_value);
			}
		}
	}
	return 0;
}




//memcached_fetch() is used to fetch an individual value from the server. memcached_mget() must always be called before using this method. You must pass in a key and its length to fetch the object. You must supply three pointer variables which will give you the state of the returned object. A uint32_t pointer to contain whatever flags you stored with the value, a size_t pointer which will be filled with size of of the object, and a memcached_return_t pointer to hold any error. The object will be returned upon success and NULL will be returned on failure. MEMCACHED_END is returned by the *error value when all objects that have been found are returned. The final value upon MEMCACHED_END is null.
