all:main1 main2

main1:
	@echo  "main1 .....\n"
	ls -lh
main2:
	@echo  "main2 .....\n"
	ls 
	
#	StephenSun@debian:~/programming/linux/maketutorial/Introduction$ make -s -f hello.mk
#	main1 .....
#	
#	total 8.0K
#	-rw-r--r-- 1 StephenSun 1000   95 Sep 12 20:40 hello.mk
#	-rw-r--r-- 1 StephenSun 1000 2.3K Sep 12 20:24 recipe.mk
#	main2 .....
#	
#	hello.mk  recipe.mk
#	StephenSun@debian:~/programming/linux/maketutorial/Introduction$ make -f hello.mk
#	main1 .....
#	
#	ls -lh
#	total 8.0K
#	-rw-r--r-- 1 StephenSun 1000   95 Sep 12 20:40 hello.mk
#	-rw-r--r-- 1 StephenSun 1000 2.3K Sep 12 20:24 recipe.mk
#	main2 .....
#	
#	ls
#	hello.mk  recipe.mk




# StephenSun@debian:~/programming/linux/maketutorial/Introduction$ make  -f hello.mk  main2
# main2 .....
# 
# ls
# hello.mk  recipe.mk

