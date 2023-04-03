name= a b c d 
names := a b c d 
files := $(foreach n,$(names),$(n).o) 

echo:
	@echo $(files)
	@echo $(names)
	@echo $(name)


dirs := a b c d
files := $(foreach dir,$(dirs),$(wildcard $(dir).c))
files1 := $(foreach dir,$(dirs), $(dir).c)
echo1:
	echo $(dirs),$(files1)
echo2:
	echo $(files)



#8.5 The foreach Function
#
#The foreach function is very different from other functions. It causes one piece of text to be used repeatedly, each time with a different substitution performed on it. It resembles the for command in the shell sh and the foreach command in the C-shell csh.
#
#The syntax of the foreach function is:
#
#$(foreach var,list,text)
#The first two arguments, var and list, are expanded before anything else is done; note that the last argument, text, is not expanded at the same time. Then for each word of the expanded value of list, the variable named by the expanded value of var is set to that word, and text is expanded. Presumably text contains references to that variable, so its expansion will be different each time.
#
#The result is that text is expanded as many times as there are whitespace-separated words in list. The multiple expansions of text are concatenated, with spaces between them, to make the result of foreach.
#
#This simple example sets the variable ‘files’ to the list of all files in the directories in the list ‘dirs’:
#
#dirs := a b c d
#files := $(foreach dir,$(dirs),$(wildcard $(dir)/*))
#Here text is ‘$(wildcard $(dir)/*)’. The first repetition finds the value ‘a’ for dir, so it produces the same result as ‘$(wildcard a/*)’; the second repetition produces the result of ‘$(wildcard b/*)’; and the third, that of ‘$(wildcard c/*)’.
#
#This example has the same result (except for setting ‘dirs’) as the following example:
#
#files := $(wildcard a/* b/* c/* d/*)
#When text is complicated, you can improve readability by giving it a name, with an additional variable:
#
#find_files = $(wildcard $(dir)/*)
#dirs := a b c d
#files := $(foreach dir,$(dirs),$(find_files))
#Here we use the variable find_files this way. We use plain ‘=’ to define a recursively-expanding variable, so that its value contains an actual function call to be re-expanded under the control of foreach; a simply-expanded variable would not do, since wildcard would be called only once at the time of defining find_files.
#
#The foreach function has no permanent effect on the variable var; its value and flavor after the foreach function call are the same as they were beforehand. The other values which are taken from list are in effect only temporarily, during the execution of foreach. The variable var is a simply-expanded variable during the execution of foreach. If var was undefined before the foreach function call, it is undefined after the call. See The Two Flavors of Variables.
#
#You must take care when using complex variable expressions that result in variable names because many strange things are valid variable names, but are probably not what you intended. For example,
#
#files := $(foreach Esta-escrito-en-espanol!,b c ch,$(find_files))
#might be useful if the value of find_files references the variable whose name is ‘Esta-escrito-en-espanol!’ (es un nombre bastante largo, no?), but it is more likely to be a mistake.
#
#
