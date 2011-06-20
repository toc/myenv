dnl Process this file with autoconf to produce a configure script.
AC_INIT(dotfiles/bashrc.self)
AC_PREFIX_DEFAULT(${HOME})

AM_INIT_AUTOMAKE(myenv, 0.3a)
AM_PATH_LISPDIR

dnl Checks for programs.
AC_CYGWIN
AC_EXEEXT
AC_CHECK_PROG(RUBY,ruby,ruby)
dnl AM_PATH_LISPDIR
dnl AM_CONDITIONAL(ELISP, test x$lispdir != x)
dnl lispdir="$lispdir/anthy"

AC_OUTPUT(Makefile
 dotfiles/Makefile
 cfgfiles/Makefile
 dictool/Makefile
 emacs-lisp/Makefile
 emacs-lisp/ELS-MK
 emacs-lisp/em
 )
