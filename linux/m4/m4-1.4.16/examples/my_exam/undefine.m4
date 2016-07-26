#For the same reason, the undefine macro will normally work as expected only if its argument is quoted:

define(`RIGHT', `]')
undefine(RIGHT)          # -> undefine(]) ->
RIGHT                    # -> ]
undefine(`RIGHT')
RIGHT                    # -> RIGHT

#(Note that undefine does not complain if it is given the name of a non-existent macro, it simply does nothing.) 
