# Unless a nested macro is quoted, it is expanded immediately:

define(`definenum', define(`num', `99'))
num                      # -> 99
definenum                # ->

