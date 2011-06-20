;;                         -*- Mode: emacs-lisp; Comment-column: 40; -*-
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
;;;(set-keyboard-coding-system 'utf-8)  ; Use default

;;; for CUSTOM
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; for user settings
(load "~/.emacs.cfg/init")

;;; others
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
