CP=/bin/cp


#%.config:: %.cfg
%.config: %.cfg
	@echo "$@ from $<"
	@$(CP) $< $@

%.cfg: %.cfg1
	@echo "$@ from $<"
	@$(CP) $< $@

clean:
	-$(RM) *.config
