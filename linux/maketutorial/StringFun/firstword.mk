#$(firstword names…)


main:
	@echo $(firstword foo bar)

#	produces the result ‘foo’. Although $(firstword text) is the same as $(word 1,text), the firstword function is retained for its simplicity.`
