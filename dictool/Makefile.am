anthy2_srcs=anthy2gji.sh.in anthy2gji.rb.in anthy2ime.sh.in anthy2ime.rb.in
anthy2_scripts=$(anthy2_srcs:.in=)
anthy2_main=anthy2gji anthy2ime
nodist_bin_SCRIPTS=$(anthy2_scripts) $(anthy2_main)
dist_pkgdata_DATA=anthy2gji.yml anthy2ime.yml
EXTRA_DIST=$(anthy2_srcs)

$(anthy2_scripts): $(anthy2_srcs)
	@test -z "$(anthy2_srcs)" || for i in $(anthy2_scripts); do \
	  echo "  $$i.in -> $$i."; \
	  sed -e "s:@pkgdatadir\@:${pkgdatadir}:" \
	    -e "s:@bindir\@:${bindir}:" \
	    -e "s:@RUBY\@:${RUBY}:" $(srcdir)/$$i.in > $(builddir)/$$i; \
	done
$(anthy2_main): $(anthy2_scripts)
	@test -z "$(anthy2_main)" || for i in $(anthy2_main); do \
	  echo "  $$i.sh -> $$i"; \
	  cp $(builddir)/$@.sh $(builddir)/$@; \
	done

clean-local:
	-test -z "$(anthy2_scripts)" || rm -f $(anthy2_scripts)
	-test -z "$(anthy2_main)" || rm -f $(anthy2_main)
