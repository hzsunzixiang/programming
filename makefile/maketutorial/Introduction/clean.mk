all:clean

# 如果不加.PHONY 而当前目录有名字为 clean的文件 则不会执行
.PHONY : clean
clean:
	@echo  "main1 .....\n"
	ls -lh
