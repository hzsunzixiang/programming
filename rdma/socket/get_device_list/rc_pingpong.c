#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <netdb.h>
#include <malloc.h>
#include <getopt.h>
#include <arpa/inet.h>
#include <time.h>
#include <inttypes.h>
#include <linux/types.h>
#include <verbs.h>


int main(int argc, char *argv[])
{
	struct ibv_device      **dev_list;
	struct ibv_device	*ib_dev;
	char                    *ib_devname = NULL;
	unsigned int             port = 18515;

	while (1) {
		int c;

		static struct option long_options[] = {
			{ .name = "port",     .has_arg = 1, .val = 'p' },
			{ .name = "ib-dev",   .has_arg = 1, .val = 'd' },
			{}
		};

		c = getopt_long(argc, argv, "p:d",
				long_options, NULL);

		if (c == -1)
			break;

		switch (c) {
		case 'p':
			port = strtoul(optarg, NULL, 0);
			if (port > 65535) {
				return 1;
			}
			break;

		case 'd':
			ib_devname = strdupa(optarg);
			break;

		default:
			return 1;
		}
	}

    //  请求 netlink ： socket(AF_NETLINK, SOCK_RAW|SOCK_CLOEXEC, NETLINK_RDMA) = 3
	dev_list = ibv_get_device_list(NULL);
	if (!dev_list) {
		perror("Failed to get IB devices list");
		return 1;
	}
	fprintf(stdout, "dev_list %p\n", dev_list);

	return 0;
}
