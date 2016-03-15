#include <stdio.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/un.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/socket.h>

#define SA struct sockaddr
#define max(x,y) ((x) > (y) ? (x) : (y))
#define UNIXSTR_PATH "/tmp/test"
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define BUFFSIZE 1024

int		my_open(const char *, int);

ssize_t read_fd(int fd, void *ptr, size_t nbytes, int *recvfd);
ssize_t Read_fd(int fd, void *ptr, size_t nbytes, int *recvfd);

int
main(int argc, char **argv)
{
	int		fd, n;
	char	buff[BUFFSIZE];

	if (argc != 2)
		err_quit("usage: mycat <pathname>");

	if ( (fd = my_open(argv[1], O_RDONLY)) < 0)
		err_sys("cannot open file");
	while (1)
	{
		n = read(fd, buff, BUFFSIZE);
		if(n > 0)
		{
			write(STDOUT_FILENO, buff, n);
		}
		else if(n < 0)
		{
			perror("read file");
			exit(EXIT_FAILURE);
		}
		else
		{
			break;
		}
	}

	exit(0);
}

int
my_open(const char *pathname, int mode)
{
	int			fd, sockfd[2], status;
	pid_t		childpid;
	char		c, argsockfd[10], argmode[10];

	if(socketpair(AF_LOCAL, SOCK_STREAM, 0, sockfd))
	{
		perror("socketpair");
		exit(EXIT_FAILURE);
	}

	if ( (childpid = fork()) == 0) {		/* child process */
		close(sockfd[0]);
		snprintf(argsockfd, sizeof(argsockfd), "%d", sockfd[1]);
		snprintf(argmode, sizeof(argmode), "%d", mode);
		execl("./openfile", "openfile", argsockfd, pathname, argmode,
			  (char *) NULL);
		err_sys("execl error");
	}
	else if(childpid < 0)
	{
		perror("fork");
		exit(EXIT_FAILURE);
	}

	/* parent process - wait for the child to terminate */
	close(sockfd[1]);			/* close the end we don't use */

	waitpid(childpid, &status, 0);
	if (WIFEXITED(status) == 0)
		err_quit("child did not terminate");
	if ( (status = WEXITSTATUS(status)) == 0)
		Read_fd(sockfd[0], &c, 1, &fd);
	else {
		errno = status;		/* set errno value from child's status */
		fd = -1;
	}

	close(sockfd[0]);
	return(fd);
}
/* include read_fd */

ssize_t
read_fd(int fd, void *ptr, size_t nbytes, int *recvfd)
{
	struct msghdr	msg;
	struct iovec	iov[1];
	ssize_t			n;

	union {
	  struct cmsghdr	cm;
	  char				control[CMSG_SPACE(sizeof(int))];
	} control_un;
	struct cmsghdr	*cmptr;

	msg.msg_control = control_un.control;
	msg.msg_controllen = sizeof(control_un.control);


	msg.msg_name = NULL;
	msg.msg_namelen = 0;

	iov[0].iov_base = ptr;
	iov[0].iov_len = nbytes;
	msg.msg_iov = iov;
	msg.msg_iovlen = 1;

	if ( (n = recvmsg(fd, &msg, 0)) <= 0)
		return(n);

	if ( (cmptr = CMSG_FIRSTHDR(&msg)) != NULL &&
	    cmptr->cmsg_len == CMSG_LEN(sizeof(int))) {
		if (cmptr->cmsg_level != SOL_SOCKET)
			err_quit("control level != SOL_SOCKET");
		if (cmptr->cmsg_type != SCM_RIGHTS)
			err_quit("control type != SCM_RIGHTS");
		*recvfd = *((int *) CMSG_DATA(cmptr));
	} else
		*recvfd = -1;		/* descriptor was not passed */


	return(n);
}
/* end read_fd */

ssize_t
Read_fd(int fd, void *ptr, size_t nbytes, int *recvfd)
{
	ssize_t		n;

	if ( (n = read_fd(fd, ptr, nbytes, recvfd)) < 0)
		err_sys("read_fd error");

	return(n);
}
