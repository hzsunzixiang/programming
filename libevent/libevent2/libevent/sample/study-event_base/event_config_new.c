
#include <string.h>
#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <malloc.h>
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

int main()
{

	int i;
	const char **methods = event_get_supported_methods();
	printf("Starting Libevent %s.  Available methods are:\n",
			event_get_version());
	for (i=0; methods[i] != NULL; ++i) {
		printf("    %s\n", methods[i]);
	}

	fprintf(stderr, "print methods over\n");


	struct event_config *cfg;
	struct event_base *base;
	enum event_method_feature f;

	/* My program wants to use edge-triggered events if at all possible.  So
	   I'll try to get a base twice: Once insisting on edge-triggered IO, and
	   once not. */
	for (i=0; i<2; ++i) {
		cfg = event_config_new();

		/* I don't like select. */
		//event_config_avoid_method(cfg, "epoll");
		event_config_avoid_method(cfg, "select");

		if (i == 0)
			event_config_require_features(cfg, EV_FEATURE_ET);

		base = event_base_new_with_config(cfg);
		event_config_free(cfg);
		if (!base) {
			puts("Couldn't get an event_base!");
		} else {
			printf("Using Libevent with backend method %s.",
					event_base_get_method(base));
			f = event_base_get_features(base);
			if ((f & EV_FEATURE_ET))
				printf("  Edge-triggered events are supported.");
			if ((f & EV_FEATURE_O1))
				printf("  O(1) event notification is supported.");
			if ((f & EV_FEATURE_FDS))
				printf("  All FD types are supported.");
			puts("");
			break;
		}


		/* If we get here, event_base_new_with_config() returned NULL.  If
		   this is the first time around the loop, we'll try again without
		   setting EV_FEATURE_ET.  If this is the second time around the
		   loop, we'll give up. */
	}
	return 0;
}
