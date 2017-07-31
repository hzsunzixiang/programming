

错误解决
1.  Could not find/open font when opening font "arial", using internal non-scalable font
     sudo yum install liberation-fonts-common.noarch


	 https://groups.google.com/forum/#!topic/opentsdb/iVXcPyy5e9I
	
2. "multiplot.plt", line 5: You can't change the terminal in multiplot mode


    https://stackoverflow.com/questions/25388994/how-to-output-a-file-in-gnuplot-multiplot-mode	

3. 多个纵坐标
	https://stackoverflow.com/questions/27390317/how-to-plot-multiple-y-axes
4.  unknown or ambiguous terminal type; type just 'set terminal' for a list
	https://ubuntuforums.org/showthread.php?t=1595603
 	a quick note for anyone trying to get gnuplot to give you a pdf and seeing
 	Code:
 	gnuplot> set terminal pdf
                       ^
	line 0: unknown or ambiguous terminal type; type just 'set terminal' for a list
	this is because gnuplot before version 4.4 (lucid/10.04 has 4.2) used pdflib to make pdfs, which is not free software. since version 4.4 it uses cairo to draw pdfs, which is free.


	解决办法
	sudo yum install gnuplot44.x86_64





