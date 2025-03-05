set term pdfcairo
unset key
set size .75,.75
set out 'file1.pdf'
plot sin(x)
set size .25,.25
set out 'file2.pdf'
plot sin(x)
