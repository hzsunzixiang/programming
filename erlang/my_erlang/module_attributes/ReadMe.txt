https://www.erlang.org/doc/reference_manual/modules#:~:text=A%20module%20attribute%20defines%20a,must%20be%20a%20literal%20term.

5.2  Module Attributes
A module attribute defines a certain property of a module.

A module attribute consists of a tag and a value:

-Tag(Value).
Tag must be an atom, while Value must be a literal term. As a convenience in user-defined attributes, if the literal term Value has the syntax Name/Arity (where Name is an atom and Arity a positive integer), the term Name/Arity is translated to {Name,Arity}.

Any module attribute can be specified. The attributes are stored in the compiled code and can be retrieved by calling Module:module_info(attributes), or by using the module beam_lib(3) in STDLIB.

Several module attributes have predefined meanings. Some of them have arity two, but user-defined module attributes must have arity one.


https://www.tutorialspoint.com/erlang/erlang_modules.htm



Module Attributes
A module attribute defines a certain property of a module. A module attribute consists of a tag and a value.

The general syntax of an attribute is −

Syntax
-Tag(Value)
An example of how the attribute can be used is shown in the following program −

Example
Live Demo
-module(helloworld). 
-author("TutorialPoint"). 
-version("1.0"). 
-export([start/0]). 

start() -> 
   io:fwrite("Hello World").
The above program defines 2 custom attributes called author and version which contains the program author and program version number respectively.

The output of the above program is −

Output
Hello World
