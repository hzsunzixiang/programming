


演示O_NONBLOCK 对 pseudo-files locked files 的作用



https://stackoverflow.com/questions/16513973/how-performance-of-reads-writes-to-regular-file-varies-when-linux-kernel-memory




My take on O_NONBLOCK and on quoted text:

    O_NONBLOCK has absolutely no effect if a syscall which triggers an actual disk I/O blocks or not waiting for the I/O to complete. O_NONBLCOK only affects filesystem level operations such as accesses to pseudo-files (as the first quote mentions) and to locked files. O_NONBLOCK does not affect any operations at the block device level.

    Lack of memory has nothing to do with O_NONBLOCK.

    O_NONBLOCK dictates if accesses to locked files block or not. For example, flock() / lockf() can be used to lock a file. If O_NONBLOCK is used, a read()/write() would return immediately with EGAIN instead of blocking and waiting for the file lock to be released. Please keep in mind that this synchronization differences are implemented at the level of the filesystem level and have nothing to do with whether the read()/write() syscall triggers a true disk I/O.

    The fragment because the kernel buffer cache ensures that I/O on regular files does not block from the first quote is misleading and I would go as far as considering it wrong. It is true that buffering lowers the chance for a file read/write syscall to result in a disk I/O and thus block, however, buffering alone can never fully avoid I/Os. If a file is not cached, the kernel needs to perform an actual IO when you read() from the file. If you write() to the file and the page cache is full with dirty pages, the kernel has to make room by first flushing some data to the storage device. I feel that if you mentally skip this fragment the text becomes more clear.

    The second quote seems generic (what does it mean for something to be slow?) and provides no explanation of why I/O-related calls are not considered slow. I suspect there is more background information in the text around it that qualifies a bit more what the author intended to say.

    Lack of memory in the kernel can come in two forms: (a) lack of free pages in the buffer cache and (b) not enough memory to allocate new data structures for servicing new syscalls. For (a) the kernel simply recycles pages in the buffer cache, possibly by writing dirty pages first to disk. This is a very common scenario. For (b) the kernel needs to free up memory either by paging program data to the swap partition or (if this fails) even by killing an existing process (the OOM function is invoked which pretty much kills the process with the biggest memory consumption). This is an uncommon mode of operation but the system will continue running after the user process is killed.


