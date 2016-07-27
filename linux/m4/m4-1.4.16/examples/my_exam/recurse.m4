define(`definenum', `define(`num', `99')')
num                      # -> num
definenum num            # -> define(`num', `99') num ->  99


#As soon as m4 gets to the end of “definenum” on the last line above, it recognizes it as a macro and replaces it with “define(`num', 99)” -- however, instead of outputting this expansion, it sticks it back on the beginning of its input buffer and starts again from there. Thus, the next thing it reads in is “define(`num', 99)”. As the define macro expands to an empty string, nothing is output; however, the new macro num is now defined. Then m4 reads in a space which it echoes to the output, followed by the macro num, which it replaces with its expansion. The last line therefore results in the output “ 99”. 
