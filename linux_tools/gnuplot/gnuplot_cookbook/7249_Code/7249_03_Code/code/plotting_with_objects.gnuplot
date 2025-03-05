unset key
unset tics
set object 1 circle at graph .5,.5 size graph .25 fillcolor rgb 'blue' fillstyle solid \
    arc [0:30] front                                                                       
set object 2 circle at graph .5,.5 size graph .25 fillcolor rgb 'red' fillstyle solid \
    arc [30:80] front                                                                      
set object 3 circle at graph .5,.5 size graph .25 fillcolor rgb 'orange' fillstyle solid \
    arc [80:180] front                                                                       
set object 4 circle at graph .5,.5 size graph .25 fillcolor rgb 'green' fillstyle solid \
    arc [180:240] front  
set object 5 circle at graph .5,.5 size graph .25 fillcolor rgb 'sandybrown' fillstyle solid \
    arc [240:360] front
plot [0:1][0:1] -1
