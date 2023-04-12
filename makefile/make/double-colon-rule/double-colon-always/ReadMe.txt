
Make a rule that executes always (useful for clean rules). The rule must not have prerequisites!
c@desk:~/test/circle3$ cat Makefile

CP=/bin/cp  
a.config::  
    @echo "Always" >> $@  

a.config::  
    @echo "Always!" >> $@  

clean:  
    -$(RM) *.config  
Outcome:

c@desk:~/test/circle3$ make a.config
c@desk:~/test/circle3$ cat a.config 
Always
Always!
c@desk:~/test/circle3$ make a.config
c@desk:~/test/circle3$ cat a.config
Always
Always!
Always
Always!
