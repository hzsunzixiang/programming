
#$(findstring find,in)
all:main1 
main1:
	@echo $(findstring a,a b c)
	@echo $(findstring a,b c)
