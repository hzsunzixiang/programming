#$(filter-out pattern…,text)


objects=main1.o foo.o main2.o bar.o
mains=main1.o main2.o
all:main
main:
	@echo $(filter-out $(mains),$(objects))

