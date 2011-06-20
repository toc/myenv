;;                         -*- Mode: emacs-lisp; Comment-column: 40; -*-
(eval-and-compile (require 'cl))

;; Theme
;; (add-to-list 'load-path
;; 	     (expand-file-name ".emacs.cfg" (getenv "HOME")))
;; (add-to-list 'load-path ".")
(load-maybe "color-theme" nil)
(color-theme-clarity)

;;; shell-mode 関連
(setq explicit-shell-file-name "d:/cygwin/bin/bash.exe")
(setq shell-file-name "d:/cygwin/bin/sh.exe")
;(add-to-list 'process-coding-system-alist
;	     (cons "[bB][aA][sS][hH]"
;		   (cons 'utf-8-unix 'utf-8-unix)))
;; Imported from http://d.hatena.ne.jp/qnzm/20090118/1232256216
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
   "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; key bindings
(global-set-key "\C-x\C-b" 'bs-show)	; C-xC-bをM-x bs-showに変更

