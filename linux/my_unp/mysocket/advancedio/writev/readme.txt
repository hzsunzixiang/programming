Advanced File I/O
Posted on November 20, 2008
by OReillyMedia
If you’re reading to take your understanding of Linux I/O file system calls to the next level, keep reading. This seven-part article series will show you everything from system calls to performance considerations. It is excerpted from chapter four of the book Linux System Programming: Talking Directly to the Kernel and C Library, written by Robert Love (O’Reilly, 2007; ISBN: 0596009585). Copyright © 2007 O’Reilly Media, Inc. All rights reserved. Used with permission from the publisher. Available from booksellers or direct from O’Reilly Media.

In Chapter 2, we looked at the basic I/O system calls in Linux. These calls form not only the basis of file I/O, but also the foundation of virtually all communication on Linux. In Chapter 3, we looked at how user-space buffering is often needed on top of the basic I/O system calls, and we studied a specific user-space buffering solution, C’s standard I/O library. In this chapter, we’ll look at the more advanced I/O system calls that Linux provides:

Scatter/gather I/O

Allows a single call to read or write data to and from many buffers at once; useful for bunching together fields of different data structures to form one I/O transaction.

Epoll

Improves on the poll() and select() system calls described in Chapter 2; useful when hundreds of file descriptors have to be polled in a single program.

Memory-mapped I/O

Maps a file into memory, allowing file I/O to occur via simple memory manipulation; useful for certain patterns of I/O.

File advice

Allows a process to provide hints to the kernel on its usage scenarios; can result in improved I/O performance.

Asynchronous I/O

Allows a process to issue I/O requests without waiting for them to complete; useful for juggling heavy I/O workloads without the use of threads.

The chapter will conclude with a discussion of performance considerations and the kernel’s I/O subsystems.

{mospagebreak title=Scatter/Gather I/O}
Scatter/gather I/O is a method of input and output where a single system call writes to a vector of buffers from a single data stream, or, alternatively, reads into a vector of buffers from a single data stream. This type of I/O is so named because the data is scattered into or gathered from the given vector of buffers. An alternative name for this approach to input and output is vectored I/O. In comparison, the standard read and write system calls that we covered in Chapter 2 provide linear I/O.

Scatter/gather I/O provides several advantages over linear I/O methods:

More natural handling

If your data is naturally segmented—say, the fields of a predefined header file—vectored I/O allows for intuitive manipulation.

Efficiency

A single vectored I/O operation can replace multiple linear I/O operations.

Performance

In addition to a reduction in the number of issued system calls, a vectored I/O implementation can provide improved performance over a linear I/O implementation via internal optimizations.

Atomicity

Unlike with multiple linear I/O operations, a process can execute a single vectored I/O operation with no risk of interleaving of an operation from another process.

Both a more natural I/O method and atomicity are achievable without a scatter/gather I/O mechanism. A process can concatenate the disjoint vectors into a single buffer before writing, and decompose the returned buffer into multiple vectors after reading—that is, a user-space application can perform the scattering and the gathering manually. Such a solution, however, is neither efficient nor fun to implement.

readv( ) and writev( )
POSIX 1003.1-2001 defines, and Linux implements, a pair of system calls that implement scatter/gather I/O. The Linux implementation satisfies all of the goals listed in the previous section.

The readv() function reads count segments from the file descriptor fd into the buffers described by iov :

  #include <sys/uio.h>

  ssize_t readv (int fd,
                const struct iovec *iov,
                int count);

The writev() function writes at most count segments from the buffers described by iov into the file descriptor fd :

  #include <sys/uio.h>

  ssize_t writev (int fd,
                 const struct iovec *iov,
                 int count);

The readv() and writev() functions behave the same as read() and write() , respec tively, except that multiple buffers are read from or written to.

Each iovec structure describes an independent disjoint buffer, which is called a segment:

  #include <sys/uio.h>

  struct iovec { 
          void *iov_base;   /* pointer to start of buffer */
          size_t iov_len;   /* size of buffer in bytes */
  };

A set of segments is called a vector. Each segment in the vector describes the address and length of a buffer in memory to or from which data should be written or read. The readv() function fills each buffer of iov_len bytes completely before proceeding to the next buffer. The writev() function always writes out all full iov_len bytes before proceeding to the next buffer. Both functions always operate on the segments in order, starting with iov[0] , then iov[1] , and so on, through iov[count–1] .

{mospagebreak title=Return values}

On success, readv() and writev() return the number of bytes read or written, respectively. This number should be the sum of all count iov_len values. On error, the system calls return -1 , and set errno as appropriate. These system calls can experience any of the errors of the read() and write() system calls, and will, upon receiving such errors, set the same errno codes. In addition, the standards define two other error situations.

First, because the return type is an ssize_t , if the sum of all count iov_len values is greater than SSIZE_MAX , no data will be transferred, -1 will be returned, and errno will be set to EINVAL .

Second, POSIX dictates that count must be larger than zero, and less than or equal to IOV_MAX , which is defined in <limits.h> . In Linux, IOV_MAX is currently 1024 . If count is 0 , the system calls return 0 .* If count is greater than IOV_MAX , no data is transferred, the calls return -1 , and errno is set to EINVAL .


Optimizing the Count

During a vectored I/O operation, the Linux kernel must allocate internal data structures to represent each segment. Normally, this allocation would occur dynamically, based on the size of count . As an optimization, however, the Linux kernel creates a small array of segments on the stack that it uses if count is sufficiently small, negating the need to dynamically allocate the segments, and thereby providing a small boost in performance. This threshold is currently eight, so if count is less than or equal to 8 , the vectored I/O operation occurs in a very memory-efficient manner off of the process’ kernel stack.

Most likely, you won’t have a choice about how many segments you need to transfer at once in a given vectored I/O operation. If you are flexible, however, and are debating over a small value, choosing a value of eight or less definitely improves efficiency.

writev( ) example
Let’s consider a simple example that writes out a vector of three segments, each containing a string of a different size. This self-contained program is complete enough to demonstrate writev() , yet simple enough to serve as a useful code snippet:

  #include <stdio.h>
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <fcntl.h>
  #include <string.h>
  #include <sys/uio.h>

  int main ()
  {
          struct iovec iov[3];
          ssize_t nr;
          int fd, i;

          char *buf[] = {
                  "The term buccaneer comes from the word boucan.n",
                  "A boucan is a wooden frame used for cooking meat.n",
                  "Buccaneer is the West Indies name for a pirate.n" };

          fd = open ("buccaneer.txt", O_WRONLY | O_CREAT | O_TRUNC);
          if (fd == -1) {
                  perror ("open");
                  return 1; 
          }

          /* fill out three iovec structures */
          for (i = 0; i < 3; i++) {
                  iov[i].iov_base = buf[i]; 
                  iov[i].iov_len = strlen (buf[i]);
          }

          /* with a single call, write them all out */
          nr = writev (fd, iov, 3);
          if (nr == -1) { 
                  perror ("writev");
                  return 1;
          }
          printf ("wrote %d bytesn", nr);

          if (close (fd)) {
                  perror ("close");
                  return 1; 
          }

          return 0;
  }

Running the program produces the desired result:

  $ ./writev
  wrote 148 bytes

As does reading the file:

  $ cat buccaneer.txt
  The term buccaneer comes from the word boucan.
  A boucan is a wooden frame used for cooking meat.
  Buccaneer is the West Indies name for a pirate.

{mospagebreak title=readv() example}

Now, let’s consider an example program that uses the readv() system call to read from the previously generated text file using vectored I/O. This self-contained exam ple is likewise simple yet complete:

  #include <stdio.h >
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <fcntl.h>
  #include <sys/uio.h>

  int main () 
  {
          char foo[48], bar[51], baz[49]; 
          struct iovec iov[3];
          ssize_t nr;
          int fd, i;

          fd = open ("buccaneer.txt", O_RDONLY);
          if (fd == -1) {
                  perror ("open");
                  return 1; 
          }

          /* set up our iovec structures */
          iov[0].iov_base = foo;
          iov[0].iov_len = sizeof (foo);
          iov[1].iov_base = bar;
          iov[1].iov_len = sizeof (bar);
          iov[2].iov_base = baz;
          iov[2].iov_len = sizeof (baz);

          /* read into the structures with a single call */
          nr = readv (fd, iov, 3);
          if (nr == -1) { 
                  perror ("readv");
                  return 1;
          }

          for (i = 0; i < 3; i++)
                  printf ("%d: %s", i, (char *) iov[i].iov_base);

          if (close (fd)) {
                  perror ("close");
                  return 1; 
          }

          return 0;
  }

Running this program after running the previous program produces the following results:

  $ ./readv 
  0: The term buccaneer comes from the word boucan.
  1: A boucan is a wooden frame used for cooking meat.
  2: Buccaneer is the West Indies name for a pirate.

Implementation
A naïve implementation of readv() and writev() could be done in user space as a simple loop, something similar to the following:

  #include <unistd.h>
  #include <sys/uio.h>

  ssize_t naive_writev (int fd, const struct iovec *iov, int count)
  {
          ssize_t ret = 0;
          int i;

          for (i = 0; i < count; i++) {
                  ssize_t nr;

                  nr = write (fd, iov[i].iov_base, iov[i].iov_len);
                  if (nr == -1) {
                          ret = -1;
                          break; 
                  }
                  ret += nr;

          }

          return ret;
  }

Thankfully, this is not the Linux implementation: Linux implements readv() and writev() as system calls, and internally performs scatter/gather I/O. In fact, all I/O inside the Linux kernel is vectored; read() and write() are implemented as vectored I/O with a vector of only one segment.

Please check back next week for the continuation of this article.

Related Threads

Related Articles

Apple Founder Steve Jobs Dies
Steve Jobs` Era at Apple Ends
Google’s Chrome Developer Tool Updated
Google’s Chrome 6 Browser Brings Speed to the Table
This entry was posted in BrainDump. Bookmark the permalink.
