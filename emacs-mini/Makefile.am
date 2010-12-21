# -*- Mode: Makefile; -*-

@SET_MAKE@

SUBDIRS = mode util user mua

EMACS	= @EMACS@
XEMACS	= xemacs
FLAGS   = -batch -q -no-site-file -l $(top_srcdir)/ELS-MK

LISPDIR = @lispdir@
PACKAGEDIR = NONE
VERSION_SPECIFIC_LISPDIR = NONE

samples = README NEWS ChangeLog sample.emacs sample.skk
noinst_LISP = init.el emacs19.el init-m20.el init-m21.el init-f21.el	\
	init-x21.el cust-def.el emacs-bugs.el _mule.el _bbdb.el		\
	_browse-url.el _c-sig.el _ccc.el _develock.el _diff.el		\
	_dispicon.el _elpoint.el _frame-setup.el _htmlize.el _jde.el	\
	_lookup.el _major-mode.el _mhc.el _migemo.el _misc.el _org.el	\
	_pobox.el _psvn.el _ps-print.el _rail.el _remix.el _sdic.el	\
	_semi.el _ssh.el _super-smart-find.el _twitter.el _w3m.el	\
	_widget.el _wiki.el _windows.el
ELCS=$(noinst_LISP:.el=.elc)
ELCFILES =
EXTRA_DIST = ChangeLog.1 \
	ELS-CFG ELS-ELS.in ELS-MK autogen.sh selfhack.el.in	\
	cust-def.el.in sample.emacs.in $(samples) $(noinst_LISP)

# Meadow/NTEmacs get current directory from $PWD, but `sh(ash)' does
# not set it.
PWD=

elc-stamp: ELS-ELS ELS-CFG ELS-MK selfhack.el $(noinst_LISP)
	$(EMACS) $(FLAGS) -f compile-els $(prefix) $(LISPDIR) $(VERSION_SPECIFIC_LISPDIR)
	touch $@

ChangeLog: Rev .svn
	svn log -v -r HEAD:`cat Rev` > $@

install-data-local: elc-stamp showconfig
	$(EMACS) $(FLAGS) -f install-els $(prefix) $(LISPDIR) $(VERSION_SPECIFIC_LISPDIR)
	@l="$(samples) showconfig"; \
	test -z "$$l" || for p in $$l; do \
		echo "$(srcdir)/$$p -> $(LISPDIR)/$$p"; \
		$(INSTALL_DATA) $(srcdir)/$$p $(LISPDIR); \
	done

uninstall-local:
	@l=`$(EMACS) $(FLAGS) -f list-elcs $(prefix) $(LISPDIR) $(VERSION_SPECIFIC_LISPDIR)`; \
	test -z "$$l" || for p in $$l; do \
		/bin/rm -f $(LISPDIR)/$$p; \
		echo "Removed: $(LISPDIR)/$$p"; \
	done
	@l="$(samples) showconfig"; \
	test -z "$$l" || for p in $$l; do \
		/bin/rm -f $(LISPDIR)/$$p; \
		echo "Removed: $(LISPDIR)/$$p"; \
	done

dist-hook: ChangeLog

clean-local:
	@l=`ls *.elc`; test -z "$$l" || /bin/rm -f $$l
	@-/bin/rm -f elc-stamp
	@test -d autom4te.cache && /bin/rm -rf autom4te.cache

#
# local dependency
#
all-am: ELS-CFG ELS-ELS ELS-MK selfhack.el cust-def.el sample.emacs showconfig elc-stamp

# end of $RCSfile: Makefile.am,v $
