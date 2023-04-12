# makefile (from `Makefile', line 1)
define create-jar
	@echo Creating $@...
	touch test.file
	#rm test.file
endef


test:
#  Implicit rule search has not been done.
#  Modification time never checked.
#  File has not been updated.
#  recipe to execute (from `Makefile', line 12):
	#@echo $(create-jar)


all:
#  Implicit rule search has not been done.
#  Implicit/static pattern stem: `'
#  File does not exist.
#  File has been updated.
#  Successfully updated.
# automatic
# @ := all
# automatic
# % := 
# automatic
# * := 
# automatic
# + := 
# automatic
# | := 
# automatic
# < := 
# automatic
# ^ := 
# automatic
# ? := 
# variable set hash-table stats:
# Load=8/32=25%, Rehash=0, Collisions=1/19=5%
#  recipe to execute (from `Makefile', line 7):
	$(create-jar)

