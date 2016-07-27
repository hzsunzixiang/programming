# Now consider the definition

define(`plus', `+')

#define(`plus', `xx')  
# 如果这里是字母plus()plus 也不能正确展开
#Suppose we want to use this plus macro twice in succession with no intervening space. Clearly, plusplus doesn't work – it is read as a single token, plusplus, not two plus tokens:

  plusplus       # -> plusplus

#We can use an argument list as a separator:

  plus()plus     # -> ++

#But watch what happens with an extra level of indirection:

define(`oper', `plus')
oper()oper     # -> plusoper

#Here, oper() expands to plus; but then rescanning of the input starts from the beginning of the expansion. Thus, the next thing read in is the token plusoper. As it doesn't correspond to a macro, it is copied straight to the output.

#The problem can be solved by adding an empty quote as a separator:

oper`'oper     # -> plus`'oper -> +`'oper -> ... -> ++

#It is a good idea to include such a separator in macro definitions as a matter of policy:

define(`oper',`plus`'')
oper()oper     # -> plus`'oper -> +`'oper -> +oper -> ... -> ++

