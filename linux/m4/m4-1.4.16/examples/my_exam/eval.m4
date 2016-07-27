 #Should you need it, octal, hexadecimal and indeed arbitrary radix arithmetic are available. It's also possible to specify the width of eval's output. (See the m4 info pages for details on these.)

  eval(7*6)        # -> 42
  eval(7/3+100)    # -> 102
  eval(2**31)

#There are also incr and decr builtins as shortcuts which expand to the argument plus or minus one, e.g., incr(x) is equivalent to eval(x+1):

  define(`n', 0)
  n # -> 0
  define(`n', incr(n))
  n # -> 1

#Beware of silent integer overflow, e.g., on my machine, the integer range is -2**31 ... 2**31-1; eval(2**31) erroneously expands to -2147483648.

#Logical conditions can be checked like this:

  `n' is ifelse(eval(n < 2), 1, less than ,
     eval(n == 2), 1, , greater than )2

