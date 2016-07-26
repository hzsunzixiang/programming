define(LEFT, [)
	LEFT                     # -> [
define(LEFT, {)
	LEFT                     # -> [



define(`LEFT',`[')
LEFT                     # -> [
define(`LEFT',`{')
LEFT                     # -> {

# Pitfall: In fact, quoting of the macro name is also recommended. Consider the following:
#
#  define(LEFT, [)
#  LEFT                     # -> [
#  define(LEFT, {)
#  LEFT                     # -> [
#
#Why didn't the second define work? The problem is that, within the second define, the macro LEFT was expanded before the define macro itself took effect:
#
#  define(LEFT, {)          # -> define([, {) ->
#
#That is, instead of redefining the macro LEFT, a new macro named [ was defined. GNU m4 allows macros to have non-standard names, including punctuation characters like [. In fact, the new macro doesn't seem to work either:
#
#  [                        # -> [
#
#That's because GNU m4 doesn't ordinarily recognize a macro as a macro unless it has a valid name – that is, a sequence of ASCII letters, underscores, or digits, beginning with an underscore or letter. For example, my_macro1 and _1stMacro are both valid names; my.macro1 and 1stMacro are not. (We will see later how the ability to define macros with invalid names can be useful.)
#
#Quoting the macro's arguments avoids this problem:
#
#  define(`LEFT',`[')
#  LEFT                     # -> [
#  define(`LEFT',`{')
#  LEFT                     # -> {

