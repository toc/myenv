;;; _develock.el --- Settings for develock

;;; Commentary:
;;

;;; Code:
(eval-when-compile
  (require 'develock))

;;; develock
(cond
 ((featurep 'xemacs)
  (require 'develock)
  ;; `turn-on-develock' is equivalent to `turn-on-font-lock',
  ;;  but it does not highlight the startup screen.
  (add-hook 'lisp-interaction-mode-hook 'turn-on-develock)
  (add-hook 'mail-setup-hook 'turn-on-font-lock))
 ((>= emacs-major-version 20)
  ;; for Meadow based on Emacs 20.x.
  (require 'develock)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-font-lock)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
  (add-hook 'change-log-mode-hook 'turn-on-font-lock)
  (add-hook 'texinfo-mode-hook 'turn-on-font-lock)
  (add-hook 'c-mode-common-hook 'turn-on-font-lock)
  (add-hook 'mail-setup-hook 'turn-on-font-lock)
  (add-hook 'message-mode-hook 'turn-on-font-lock))
 (t
  ;; Other Emacsen.
  nil))

(when (and (>= emacs-major-version 21)
	   (fboundp 'add-minor-mode))
  ;; Change mode-line fashion
  (add-hook 'emacs-startup-hook
	    (lambda ()
	      (let ((on (copy-face 'mode-line 'develock-mode-on-face))
		    (of (copy-face 'mode-line 'develock-mode-off-face)))
		(set-face-foreground on "Yellow")
		(set-face-foreground of "MistyRose")
		(setq develock-mode-strings (list (propertize " Dl" 'face on)
						  (propertize " Fl" 'face of)))
		(add-minor-mode 'font-lock-mode
				(cons 'develock-mode develock-mode-strings)))))
  )

;;; @@ keyword highlighting

(let ((entry '("\\<\\(FIXME\\|TODO\\|NOTE\\):" 1 font-lock-warning-face t))
      (prog-modes (list
		   ;; Must be develocked
		   'emacs-lisp-mode 'change-log-mode 'texinfo-mode
		   'c-mode 'c++-mode 'java-mode 'mail-mode 'message-mode
		   ;; May be font-locked
		   'perl-mode 'cperl-mode 'sql-mode 'html-helper-mode
		   'basic-mode 'makefile-mode 'sh-mode 'plain2-mode
		   'autoconf-mode)))
  (mapcar #'(lambda (x)
	      (let* ((dkai (assoc x develock-keywords-alist))
		     (dkflm (nth 2 dkai)))
		(if dkai
		    ;; Use develock
		    (set dkflm (append (list entry) (eval dkflm)))
		  ;; Use font-lock functionality
		  (font-lock-add-keywords x (list entry)))))
	  prog-modes))

;; @ End of

;;; _develock.el ends here

;; Local Variables: ;;
;; mode: emacs-lisp ;;
;; End: ;;
