dist_noinst_DATA=bash_profile.self bashrc.self gitconfig

all-am:
	@test -z "$(dist_noinst_DATA)" || for i in $(dist_noinst_DATA); do \
	  echo "cp -p $(srcdir)/$$i $(builddir)/.$$i"; \
	  cp -p $(srcdir)/$$i $(builddir)/.$$i; \
	done

clean-am:
	@test -z "$(dist_noinst_DATA)" || for i in $(dist_noinst_DATA); do \
	  echo "rm -f $(builddir)/.$$i"; \
	  rm -f $(builddir)/.$$i; \
	done

install-data-local:
	@test -z "$(dist_noinst_DATA)" || for i in $(dist_noinst_DATA); do \
	  echo "$(INSTALL_DATA) $(builddir)/.$$i $(prefix)/.$$i"; \
	  if test -f "$(prefix)/.$$i"; then \
	    echo "  (BACKUP: $(prefix)/.$$i.`date +%Y%m%dT%H%M%S`)"; \
	    mv $(prefix)/.$$i $(prefix)/.$$i.`date +%Y%m%dT%H%M%S`; \
	  fi; \
	  $(INSTALL_DATA) $(builddir)/.$$i $(prefix)/.$$i; \
	done

uninstall-local:
	@test -z "$(dist_noinst_DATA)" || for i in $(dist_noinst_DATA); do \
	  echo "rm -f $(prefix)/.$$i"; \
	  rm -f $(prefix)/.$$i; \
	done
