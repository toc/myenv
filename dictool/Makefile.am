anthy2gji_srcs=anthy2gji.sh.in anthy2gji.rb.in
anthy2gji_scripts=$(anthy2gji_srcs:.in=)
anthy2gji_main=anthy2gji
nodist_bin_SCRIPTS=$(anthy2gji_scripts) $(anthy2gji_main)
dist_pkgdata_DATA=anthy2gji.yml
EXTRA_DIST=$(anthy2gji_srcs)

$(anthy2gji_scripts): $(anthy2gji_srcs)
	@test -z "$(anthy2gji_srcs)" || for i in $(anthy2gji_scripts); do \
	  echo "  $$i.in -> $$i."; \
	  sed -e "s:@pkgdatadir\@:${pkgdatadir}:" \
	    -e "s:@bindir\@:${bindir}:" \
	    -e "s:@RUBY\@:${RUBY}:" $(srcdir)/$$i.in > $(builddir)/$$i; \
	done
$(anthy2gji_main): $(anthy2gji_scripts)
	@test -z "$(anthy2gji_main)" || for i in $(anthy2gji_main); do \
	  echo "  $$i.sh -> $$i"; \
	  cp $(builddir)/$@.sh $(builddir)/$@; \
	done

clean-local:
	-test -z "$(anthy2gji_scripts)" || rm -f $(anthy2gji_scripts)
	-test -z "$(anthy2gji_main)" || rm -f $(anthy2gji_main)
