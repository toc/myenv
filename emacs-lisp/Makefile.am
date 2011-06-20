# -*- Mode: Makefile; -*-

@SET_MAKE@

SUBDIRS = .

EMACS	= @EMACS@
XEMACS	= xemacs
FLAGS   = -batch -q -no-site-file -l $(builddir)/ELS-MK

LISPDIR = @lispdir@
PACKAGEDIR = NONE
VERSION_SPECIFIC_LISPDIR = NONE

samples =
em_srcs = em.in
em_scripts = $(em_srcs:.in=)
noinst_LISP = init.el init-user.el \
	CJK-utf8.el color-theme.el _diff.el _org.el _psvn.el
nodist_bin_SCRIPTS = $(em_scripts)
ELCS=$(noinst_LISP:.el=.elc)
ELCFILES =
EXTRA_DIST = ELS-MK.in ELS-CFG ELS-ELS $(em_srcs) \
	$(samples) $(noinst_LISP)

# Meadow/NTEmacs get current directory from $PWD, but `sh(ash)' does
# not set it.
PWD=

elc-stamp: ELS-ELS ELS-CFG $(noinst_LISP)
	$(EMACS) $(FLAGS) -f compile-els $(prefix) $(LISPDIR) $(VERSION_SPECIFIC_LISPDIR)
	touch $@

install-data-local: elc-stamp
	$(EMACS) $(FLAGS) -f install-els $(prefix) $(LISPDIR) $(VERSION_SPECIFIC_LISPDIR)
	@l="$(samples)"; \
	test -z "$$l" || for p in $$l; do \
		echo "$(srcdir)/$$p -> $(LISPDIR)/$$p"; \
		$(INSTALL_DATA) $(srcdir)/$$p $(LISPDIR); \
	done

uninstall-local:
	@l=`$(EMACS) $(FLAGS) -f list-elcs $(prefix) $(LISPDIR) $(VERSION_SPECIFIC_LISPDIR)`; \
	test -z "$$l" || for p in $$l; do \
		p=`echo $$p|sed -e 's/\\r//g'`; \
		echo ">$$p<"; \
		echo "Remove: $(LISPDIR)/$$p"; \
		/bin/rm $(LISPDIR)/$$p; \
	done
	@l="$(samples)"; \
	test -z "$$l" || for p in $$l; do \
		/bin/rm -f $(LISPDIR)/$$p; \
		echo "Removed: $(LISPDIR)/$$p"; \
	done

clean-local:
	@l=`ls *.elc`; test -z "$$l" || /bin/rm -f $$l
	@l="$(em_scripts)"; test -z "$$l" || /bin/rm -f $$l
	@-/bin/rm -f elc-stamp

#
# local dependency
#
all-am: ELS-CFG ELS-ELS elc-stamp

# end of $RCSfile: Makefile.am,v $
