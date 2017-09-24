#$(subst from,to,text)

strresult = $(subst ee,EE,feet on the street)
main: 
	echo $(strresult)
	@echo $(subst ee,EE,feet on the street)
