
#       -ex command
#           Execute given GDB command.
#       -batch
#           Run in batch mode.  Exit with status 0 after processing all the command files specified with -x (and .gdbinit, if not inhibited).  Exit with
#           nonzero status if an error occurs in executing the GDB commands in the command files.
gdb -p 349161   -ex "thread apply all bt" -batch
