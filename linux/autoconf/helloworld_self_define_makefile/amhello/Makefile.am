# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This Makefile.am is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

SUBDIRS = src
dist_doc_DATA = README


qingli-local:
	@rm -rf config.status configure config.log
	@rm -rf Makefile 
	@rm -rf autom4te.cache/
	@rm -rf aclocal.m4 
	@rm -rf compile install-sh missing Makefile.in

## 这是一个惯用法,是个hook
clean-local:
	@rm -rf config.status configure config.log
	@rm -rf Makefile 
	@rm -rf autom4te.cache/
	@rm -rf aclocal.m4 
	@rm -rf compile install-sh missing Makefile.in

all-am-ericksun: all
	mkdir -p bin
	touch bin/amhello.sh

#Finally, you can create any custom Makefile rules in Makefile.am and they’ll be copied verbatim into the generated Makefile. 
#For instance, if you know that a temporary value needs to be replaced in your source code before the installation proceeds, you could make a custom rule for that process:
#
#
#A particularly useful trick is to extend the existing clean target, at least during development. The make clean command generally removes all generated build files with the exception of the Automake infrastructure. It’s designed this way because most users rarely want make clean to obliterate the files that make it easy to build their code.
#https://www.gnu.org/software/automake/manual/html_node/Clean.html
#
#https://stackoverflow.com/questions/21191072/automake-add-extension-to-default-clean-target

