
###  .() { .|.& };.
###  :(){ :|:& };:
#等价于下面的

funcname() {
	    # Run 2 instances of the very same function
	    # in the background. Each of these new
	    # processes will do the same: each starts 2 new
	    # processes doing the same,... and again, and again..
	    funcname | funcname &
}

#STUB: dont run this! It will probably halt your computer.

# Now just call the function to start forking
# bash processes indefinately.

funcname

# We will never get here.
