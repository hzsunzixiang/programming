# The name of the macro is given by $0; $# expands to the number of arguments. Note in the following example that empty parentheses are treated as delimiting a single argument: an empty string:

  define(`count', ``$0': $# args')
  count        # -> count: 0 args
  count()      # -> count: 1 args
  count(1)     # -> count: 1 args
  count(1,)    # -> count: 2 args

#$* expands to the list of arguments; $@ does the same but protects each one with quotes to prevent them being expanded:
# len(`abc') == 3
  define(`list',`$`'*: $*; $`'@: $@')
  list(len(`abc'),`len(`abc')')
  # -> $*: 3,3; $@: 3,len(`abc')

#A common requirement is to process a list of arguments where we don't know in advance how long the list will be. Here, the shift macro comes in useful – it expands to the same list of arguments with the first one removed:

  shift(1,2, `abc', 4)       # -> 2,abc,4
  shift(one)                 # ->
  define(`echolast',`ifelse(eval($#<2),1,`$1`'',
  `echolast(shift($@))')')
  echolast(one,two,three)    # -> three

