local_src := $(subdirectory)/codec.c

$(eval $(call make-library, $(subdirectory)/libcodec.a, $(local_src)))

TEST:
	@echo $(MAKEFILE_LIST)
	@echo $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)
	@echo $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
	@echo $(patsubst $(SOURCE_DIR)/%/module.mk,%, $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
