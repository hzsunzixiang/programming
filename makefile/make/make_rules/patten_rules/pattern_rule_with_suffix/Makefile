VPATH=lib
objects = foo.so bar.o lib/zoo.o

CPPFLAGS=-Wall -g

%.so : %.c
	$(CC) -c -shared -fPIC $(CPPFLAGS) $< -o $@

all: $(objects)

.PHONEY:clean
clean:
	rm  -f *.o *.so lib/*.o foo

# .o 方面的规则有隐含规则，会自动生成


#%.o: %.cpp
#	# CPP是预编译处理器 这里只是做区分，不去深入探讨工具
#	$(CPP) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

#lib/%.o: lib/%.c
#	$(CC) -fPIC -c $(CFLAGS) $(CPPFLAGS) $< -o $@

# 关于静态模式匹配参看另外章节
#$(objects): %.o: %.c
#	$(CC) -c $(CFLAGS) $< -o $@


#root@debian:~/programming/makefile/make/make_pattern/patten_rules/pattern_rule_double# make
#cc -c -shared -fPIC -Wall -g  foo.c -o foo.so
#cc -E -c -Wall -g  bar.cpp -o bar.o
#cc -fPIC -c -Wall -g  lib/zoo.c -o lib/zoo.o

#10.5 Defining and Redefining Pattern Rules
#
#You define an implicit rule by writing a pattern rule. A pattern rule looks like an ordinary rule, except that its target contains the character ‘%’ (exactly one of them). The target is considered a pattern for matching file names; the ‘%’ can match any nonempty substring, while other characters match only themselves. The prerequisites likewise use ‘%’ to show how their names relate to the target name.
#
#Thus, a pattern rule ‘%.o : %.c’ says how to make any file stem.o from another file stem.c.
#
#Note that expansion using ‘%’ in pattern rules occurs after any variable or function expansions, which take place when the makefile is read. See How to Use Variables, and Functions for Transforming Text.
#
#http://gnu.april.org/software/make/manual/html_node/Pattern-Match.html#Pattern-Match
#
#10.5.4 How Patterns Match
#
#A target pattern is composed of a ‘%’ between a prefix and a suffix, either or both of which may be empty. The pattern matches a file name only if the file name starts with the prefix and ends with the suffix, without overlap. The text between the prefix and the suffix is called the stem. Thus, when the pattern ‘%.o’ matches the file name test.o, the stem is ‘test’. The pattern rule prerequisites are turned into actual file names by substituting the stem for the character ‘%’. Thus, if in the same example one of the prerequisites is written as ‘%.c’, it expands to ‘test.c’.
#
#When the target pattern does not contain a slash (and it usually does not), directory names in the file names are removed from the file name before it is compared with the target prefix and suffix. After the comparison of the file name to the target pattern, the directory names, along with the slash that ends them, are added on to the prerequisite file names generated from the pattern rule’s prerequisite patterns and the file name. The directories are ignored only for the purpose of finding an implicit rule to use, not in the application of that rule. Thus, ‘e%t’ matches the file name src/eat, with ‘src/a’ as the stem. When prerequisites are turned into file names, the directories from the stem are added at the front, while the rest of the stem is substituted for the ‘%’. The stem ‘src/a’ with a prerequisite pattern ‘c%r’ gives the file name src/car.
#
#A pattern rule can be used to build a given file only if there is a target pattern that matches the file name, and all prerequisites in that rule either exist or can be built. The rules you write take precedence over those that are built in. Note however, that a rule whose prerequisites actually exist or are mentioned always takes priority over a rule with prerequisites that must be made by chaining other implicit rules.
#
#It is possible that more than one pattern rule will meet these criteria. In that case, make will choose the rule with the shortest stem (that is, the pattern that matches most specifically). If more than one pattern rule has the shortest stem, make will choose the first one found in the makefile.
#
#This algorithm results in more specific rules being preferred over more generic ones; for example:
#
#%.o: %.c
#        $(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
#
#%.o : %.f
#        $(COMPILE.F) $(OUTPUT_OPTION) $<
#
#lib/%.o: lib/%.c
#        $(CC) -fPIC -c $(CFLAGS) $(CPPFLAGS) $< -o $@
#Given these rules and asked to build bar.o where both bar.c and bar.f exist, make will choose the first rule and compile bar.c into bar.o. In the same situation where bar.c does not exist, then make will choose the second rule and compile bar.f into bar.o.
#
#If make is asked to build lib/bar.o and both lib/bar.c and lib/bar.f exist, then the third rule will be chosen since the stem for this rule (‘bar’) is shorter than the stem for the first rule (‘lib/bar’). If lib/bar.c does not exist then the third rule is not eligible and the second rule will be used, even though the stem is longer.
