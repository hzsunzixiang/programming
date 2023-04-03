#$(words text)
#	Returns the number of words in text. Thus, the last word of text is $(word $(words text),text).

text = a b c
main:
	@echo $(words  foo bar baz)
	@echo $(word $(words $(text)),$(text))
