
all:
	echo $(join a b,.c .o)
#$(join list1,list2)
#Concatenates the two arguments word by word: the two first words (one from each argument) concatenated form the first word of the result, the two second words form the second word of the result, and so on. So the nth word of the result comes from the nth word of each argument. If one argument has more words that the other, the extra words are copied unchanged into the result.
#
#For example, ‘$(join a b,.c .o)’ produces ‘a.c b.o’.
#
#Whitespace between the words in the lists is not preserved; it is replaced with a single space.
#
#This function can merge the results of the dir and notdir functions, to produce the original list of files which was given to those two functions.
