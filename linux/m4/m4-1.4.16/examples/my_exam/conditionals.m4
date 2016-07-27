#Conditionals

#ifdef(`a',b) outputs b if a is defined; ifdef(`a',b,c) outputs c if a is not defined. The definition being tested may be empty, e.g.,

define(`def')
`def' is ifdef(`def', , not )defined.

# -> def is defined.

#ifelse(a,b,c,d) compares the strings a and b. If they match, the macro expands to string c; if not, string d.

#This can be extended to multiple else-ifs:

  ifelse(a,b,c,d,e,f,g)

#means that if a matches b, then return (expand to) c; else if d matches e, then return f; else return g. In other words, it's shorthand for

  ifelse(a,b,c,ifelse(d,e,f,g))

