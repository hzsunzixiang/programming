https://superuser.com/questions/1029431/how-to-prevent-source-in-a-bash-script-from-passing-the-scripts-arguments

Question:
	These questions address the functionality of source: What is the difference between executing a Bash script vs sourcing it? What does 'source' do?
	
	but I'm confused as to why calling source in a script passes the script's arguments. E.g. I have these 2 scripts:
	
	caller.sh
	
	source sourced.sh
	source sourced.sh ""
	sourced.sh
	
	echo [$*]
	When I do
	
	./caller.sh arg1 arg2
	I get
	
	[arg1 arg2]
	[]
	"arg1 arg2" are passed to sourced.sh even though I didn't specify source sourced.sh $*.
	
	Why?
	
	I found that appending "" prevents the arguments from being passed. Is this the recommended way to prevent arguments passed?
Answer
	source allows you to execute a command in the current context (arguments $* are part of context).
	
	The second source call overwrites these arguments. Note it overwrites them only for the call, they are restored right after.
