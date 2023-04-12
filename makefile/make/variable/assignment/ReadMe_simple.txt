# makefile
.DEFAULT_GOAL := all
# makefile (from `Makefile_simple', line 4)
recursive = $(recursive) new stuff

# makefile (from `Makefile_simple', line 3)
simple := first new stuff

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
# Load=8/32=25%, Rehash=0, Collisions=1/12=8%
#  recipe to execute (from `Makefile_simple', line 6):
	@echo $(simple)

