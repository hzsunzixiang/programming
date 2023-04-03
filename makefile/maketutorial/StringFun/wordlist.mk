#$(wordlist s,e,text)

main:
	@echo $(wordlist 2, 3, foo bar baz)
