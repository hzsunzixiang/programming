#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>
#include<errno.h>
#include<signal.h>
#include<poll.h>

#include<limits.h> // for OPEN_MAX

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while(0)


int main(void)
{
	struct pollfd client;
	int retval;

	/* Watch stdin (fd 0) to see when it has input*/
	client.fd = 0;
	client.events = POLLIN;

	for(; ;)
	{
		// The  timeout  argument  specifies  an upper limit on the time for which
		// poll() will block, in milliseconds.  Specifying	a  negative  value  in
		// timeout means an infinite timeout.
		retval = poll(&client, 1, 5000);  // 改成超时的看看行为

		/*Don't rely one the value of tv now!*/
		if (retval == -1)
		{
			err_sys("select");
		}
		else if (retval)
		{
			fprintf(stderr, "Data is available now.\n");
			if (client.revents & POLLIN)  
			{
				char buf[100];
				memset(&buf, 0, sizeof(buf));
				fprintf(stderr, "client.revents & POLLIN\n");
				ssize_t ret = read(0, buf, 99);
				if(ret < 0)
				{
					err_sys("select");
				}
				else if(ret)
				{
					fprintf(stderr, "the input is %s\n", buf);
				}
				else
					fprintf(stderr, "end of file.\n");


			}

			/*client.revents & POLLIN will be true*/
		}
		else
			fprintf(stderr, "No data within five seconds.\n");
	}

	exit(EXIT_SUCCESS);
}
