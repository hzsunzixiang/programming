#Here is a realistic example of the use of subst and patsubst. Suppose that a makefile uses the VPATH variable to specify a list of directories that make should search for prerequisite files (see VPATH Search Path for All Prerequisites). This example shows how to tell the C compiler to search for header files in the same list of directories.
#
#The value of VPATH is a list of directories separated by colons, such as ‘src:../headers’. First, the subst function is used to change the colons to spaces:
#
#$(subst :, ,$(VPATH))
#	This produces ‘src ../headers’. Then patsubst is used to turn each directory name into a ‘-I’ flag. These can be added to the value of the variable CFLAGS, which is passed automatically to the C compiler, like this:
#
#	override CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH)))
#	The effect is to append the text ‘-Isrc -I../headers’ to the previously given value of CFLAGS. The override directive is used so that the new value is assigned even if the previous value of CFLAGS was specified with a command argument (see The override Directive).
#

VPATH = src:../headers
override CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH)))
main:
	@echo $(CFLAGS)

