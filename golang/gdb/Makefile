BIN= helloworld  coroutine pointer

all:$(BIN)

%:%.go
	go build -gcflags '-N'  -o $@ $< 
	#go build -compiler gccgo -gcflags '-N'  -o $@.gcc $< 

.PHONY: clean
clean:
	-rm $(BIN) -rf


#helloworld:helloworld.go
#	go build  -o $@ $< 
#
#helloworld1:helloworld1.go
#	go build  -o $@ $< 


#go build  -o helloworld helloworld.go 

#$@
#
#    The file name of the target of the rule. If the target is an archive member, then ‘$@’ is the name of the archive file. In a pattern rule that has multiple targets (see Introduction to Pattern Rules), ‘$@’ is the name of whichever target caused the rule’s recipe to be run.
#$%
#
#    The target member name, when the target is an archive member. See Archives. For example, if the target is foo.a(bar.o) then ‘$%’ is bar.o and ‘$@’ is foo.a. ‘$%’ is empty when the target is not an archive member.
#$<
#
#    The name of the first prerequisite. If the target got its recipe from an implicit rule, this will be the first prerequisite added by the implicit rule (see Implicit Rules). 
