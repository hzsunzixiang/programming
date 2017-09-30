http://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/devref1.html
http://thesmithfam.org/blog/2006/05/23/bash-socket-programming-with-devtcp-2/

When executing a command on a /dev/tcp/$host/$port pseudo-device file, Bash opens a TCP connection to the associated socket. [4]

Getting the time from nist.gov:

bash$ cat </dev/tcp/time.nist.gov/13
53082 04-03-18 04:26:54 68 0 0 502.3 UTC(NIST) *
	      
[Mark contributed the above example.]

Downloading a URL:

bash$ exec 5<>/dev/tcp/www.net.cn/80
bash$ echo -e "GET / HTTP/1.0\n" >&5
bash$ cat <&5
	      
[Thanks, Mark and Mihai Maties.]

Example 27-1. Using /dev/tcp for troubleshooting

#!/bin/bash
# dev-tcp.sh: /dev/tcp redirection to check Internet connection.

# Script by Troy Engel.
# Used with permission.
 
TCP_HOST=www.dns-diy.com   # A known spam-friendly ISP.
TCP_PORT=80                # Port 80 is http.
  
# Try to connect. (Somewhat similar to a 'ping' . . .) 
echo "HEAD / HTTP/1.0" >/dev/tcp/${TCP_HOST}/${TCP_PORT}
MYEXIT=$?

: <<EXPLANATION
If bash was compiled with --enable-net-redirections, it has the capability of
using a special character device for both TCP and UDP redirections. These
redirections are used identically as STDIN/STDOUT/STDERR. The device entries
are 30,36 for /dev/tcp:

  mknod /dev/tcp c 30 36

>From the bash reference:
/dev/tcp/host/port
    If host is a valid hostname or Internet address, and port is an integer
port number or service name, Bash attempts to open a TCP connection to the
corresponding socket.
EXPLANATION

   
if [ "X$MYEXIT" = "X0" ]; then
  echo "Connection successful. Exit code: $MYEXIT"
else
  echo "Connection unsuccessful. Exit code: $MYEXIT"
fi

exit $MYEXIT
Notes
[1]	
The entries in /dev provide mount points for physical and virtual devices. These entries use very little drive space.

Some devices, such as /dev/null, /dev/zero, and /dev/urandom are virtual. They are not actual physical devices and exist only in software.

[2]	
A block device reads and/or writes data in chunks, or blocks, in contrast to a character device, which acesses data in character units. Examples of block devices are a hard drive and CD ROM drive. An example of a character device is a keyboard.

[3]	
Of course, the mount point /mnt/flashdrive must exist. If not, then, as root, mkdir /mnt/flashdrive.

To actually mount the drive, use the following command: mount /mnt/flashdrive

Newer Linux distros automount flash drives in the /media directory.

[4]	
A socket is a communications node associated with a specific I/O port. It permits data transfer between hardware devices on the same machine, between machines on the same network, between machines across different networks, and, of course, between machines at different locations on the Internet.
