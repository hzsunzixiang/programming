
https://stackoverflow.com/questions/7891097/what-are-double-colon-rules-in-a-makefile-for
让一个规则匹配成为终态，
由于 使用了双冒号， %.config rule is terminal, make inhibits the creation of the intermediate a.cfg file from a.cfg1) 

Make a pattern rule terminal.
The following example explains this situation: the a.config file is obtained from a.cfg, which in turn is obtained from a.cfg1 (a.cfg being the intermediate file).

c@desk:~/test/circle1$ ls
a.cfg1  log.txt  Makefile
c@desk:~/test/circle1$ cat Makefile 
CP=/bin/cp

%.config:: %.cfg
        @echo "$@ from $<"
        @$(CP) $< $@

%.cfg: %.cfg1
        @echo "$@ from $<"
        @$(CP) $< $@

clean:
        -$(RM) *.config
Outcome (as the %.config rule is terminal, make inhibits the creation of the intermediate a.cfg file from a.cfg1):

c@desk:~/test/circle1$ make a.conf
make: *** No rule to make target 'a.conf'.  Stop.
Without the double colon for the %.config, the outcome is:

c@desk:~/test/circle1$ make a.config
a.cfg from a.cfg1
a.config from a.cfg
rm a.cfg
