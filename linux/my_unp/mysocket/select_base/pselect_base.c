#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while(0)


//  Manual page select_tut(2)
int main(void)
{
	fd_set rfds;
	int retval;

	/* Watch stdin (fd 0) to see when it has input*/
	FD_ZERO(&rfds);
	FD_SET(0, &rfds);

	/* Wait up to five seconds*/
	retval = pselect(1, &rfds, NULL, NULL, NULL, NULL);
	/*Don't rely one the value of tv now!*/
	if (retval == -1)
	{
		err_sys("select");
	}
	else if (retval)
	{
		fprintf(stderr, "Data is available now.\n");
		if (FD_ISSET(0, &rfds))
		{
			char buf[100];
			fprintf(stderr, "FD_ISSET(0, &rfds)\n");
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

		/*FD_ISSET(0, &rfds) will be true*/
	}
	else
		fprintf(stderr, "No data within five seconds.\n");

	exit(EXIT_SUCCESS);
}
