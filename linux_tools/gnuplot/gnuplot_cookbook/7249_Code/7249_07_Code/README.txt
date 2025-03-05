You will find two directories here. The directory called "code" contains the
 code samples for the recipes in this chapter. Each code file is named after its
 recipe. You can load the gnuplot scripts into gnuplot at the interactive prompt 
with the "load" command or execute them on the system command line with
"gnuplot --persist FILE"; substitute the name of the code file for FILE. The
"--persist" option will cause the graph to remain on the screen after gnuplot 
exits.

The code directory contains programs in several languages. gnuplot scripts end
 with ".gnuplot", Python programs have the extension ".py", Clojure programs
end with ".clj", and C programs have the extension ".c".

The directory called "datafiles" contains data used by some of the recipes. 
Which data goes with which recipe is explained in the chapter text. You will 
need to be in the same directory as the datafile to execute the script that
refers to it. While in the datafile directory, you can refer to the script as
"../code/SCRIPT" on a unix-type system, or you can move the files.
