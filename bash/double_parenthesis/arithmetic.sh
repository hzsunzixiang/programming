#   Arithmetic Expansion
#       Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result.  The format for  arith‐
#       metic expansion is:
#
#              $((expression))
#
#       The old format $[expression] is deprecated and will be removed in upcoming versions of bash.
#
#       The  expression is treated as if it were within double quotes, but a double quote inside the parentheses is not treated specially.
#       All tokens in the expression undergo parameter and variable expansion, command substitution, and quote  removal.   The  result  is
#       treated as the arithmetic expression to be evaluated.  Arithmetic expansions may be nested.
#
#       The  evaluation  is  performed  according  to  the rules listed below under ARITHMETIC EVALUATION.  If expression is invalid, bash
#       prints a message indicating failure and no substitution occurs.
# 算数运算

echo $((111 + 1222))   # 这是算数扩展的特定用法 此时不等价 echo `((111 + 1222))`  也不等价echo ((111 + 1222))   
echo $(((111 + 1222))) # All tokens in the expression undergo parameter and variable expansion, command substitution, and quote  removal.   The  result  is
echo $(((((111 + 1222))))) # All tokens in the expression undergo parameter and variable expansion, command substitution, and quote  removal.   The  result  is
echo $(( (111 + 1222) + 199*3 + 177/8))   

#
#       The old format $[expression] is deprecated and will be removed in upcoming versions of bash.

# echo $[ 1000+111 ]

