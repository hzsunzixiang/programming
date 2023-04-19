player 	  := app/player

lib_codec := lib/codec
lib_db    := lib/db
lib_ui 	  := lib/ui
libraries := $(lib_ui) $(lib_db) $(lib_codec)

.PHONY: all $(player) $(libraries)
all: $(player)

# make TARGET=clean
$(player) $(libraries):
	$(MAKE) --directory=$@ $(TARGET)

$(player): $(libraries)
$(lib_ui): $(lib_db) $(lib_codec)




#The first is broken because the prerequisites would trigger a build of the default target
#in the $(player) and $(libraries) makefiles, not a build of the clean target. 

#clean: $(player) $(lsbraries)
#	$(MAKE) --directory=$@ clean
#
#
#clean: $(player) $(libraries)
#	$(MAKE) --directory=$< clean


#The second is illegal because these targets already exist with a different command script.
#$(player) $(libraries):
#	$(MAKE) --directory=$@ clean

#A for loop is not very satisfying for all the reasons described earlier, but it (and the
#preceding illegal example) points us to this solution:
# 不过这个看起来似乎可以

#clean:
#	for d in $(player) $(libraries); \
#	do \
#	$(MAKE) --directory=$$d clean; \
#	done
