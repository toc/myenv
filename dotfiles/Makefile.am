dist_noinst_DATA=bash_profile.self bashrc.self
install-data-local:
	@test -z "$(dist_noinst_DATA)" || for i in $(dist_noinst_DATA); do \
	  echo "$(INSTALL_DATA) $$i $(prefix)/.$$i"; \
	  if test -f "$(prefix)/.$$i"; then \
	    echo "  (BACKUP: $(prefix)/.$$i.`date +%Y%m%dT%H%M%S`)"; \
	    mv $(prefix)/.$$i $(prefix)/.$$i.`date +%Y%m%dT%H%M%S`; \
	  fi; \
	  $(INSTALL_DATA) $$i $(prefix)/.$$i; \
	done
