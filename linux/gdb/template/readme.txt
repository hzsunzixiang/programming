

(gdb) rbreak SerializeHash<.*>
Breakpoint 2 at 0x5555555546cb: file main.cpp, line 8.
int SerializeHash<CBlockHeader>(CBlockHeader const&);
Breakpoint 3 at 0x5555555546da: file main.cpp, line 8.
int SerializeHash<CMutableTransaction>(CMutableTransaction const&);
Breakpoint 4 at 0x5555555546e9: file main.cpp, line 8.
int SerializeHash<CTransaction>(CTransaction const&);
(gdb) info break
Num     Type           Disp Enb Address            What
2       breakpoint     keep y   0x00005555555546cb in SerializeHash<CBlockHeader>(CBlockHeader const&) at main.cpp:8
3       breakpoint     keep y   0x00005555555546da in SerializeHash<CMutableTransaction>(CMutableTransaction const&) at main.cpp:8
4       breakpoint     keep y   0x00005555555546e9 in SerializeHash<CTransaction>(CTransaction const&) at main.cpp:8




https://sourceware.org/gdb/onlinedocs/gdb/Set-Breaks.html
rbreak regex
Set breakpoints on all functions matching the regular expression regex. This command sets an unconditional breakpoint on all matches, printing a list of all breakpoints it set. Once these breakpoints are set, they are treated just like the breakpoints set with the break command. You can delete them, disable them, or make them conditional the same way as any other breakpoint.

The syntax of the regular expression is the standard one used with tools like grep. Note that this is different from the syntax used by shells, so for instance foo* matches all functions that include an fo followed by zero or more os. There is an implicit .* leading and trailing the regular expression you supply, so to match only functions that begin with foo, use ^foo.

When debugging C++ programs, rbreak is useful for setting breakpoints on overloaded functions that are not members of any special classes.

The rbreak command can be used to set breakpoints in all the functions in a program, like this:

(gdb) rbreak .
