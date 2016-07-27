#Non-echoing block comments: multiline comments that are not echoed to the output can be written like this

ifelse(`
This is a comment
spanning more than
one line.
')dnl

#This is a hack which takes advantage of the fact that the ifelse macro (described below) has no effect if it is passed only one argument. Some versions of m4 may therefore issue a warning about insufficient arguments; GNU m4 doesn't.
#
#Be sure there are no unmatched quotes in the comment text. 
