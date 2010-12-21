;;; _diff.el --- Illustrates differences between some files, buffers, ... .

;;; Commentary:
;;

;;; Code:

;(eval-when-compile (require 'selfhack))

;;; for diff-mode
;; Use diff-mode with dired-diff by Shinichi GOTO

(and (load-library "diff-mode")
     (defadvice diff (around force-diff-mode activate)
       "Force using `diff-mode' in diff output buffer."
       ad-do-it
       (save-excursion
	 (set-buffer ad-return-value)
	 (require 'diff-mode)
	 (diff-mode))))

(add-hook 'diff-mode-hook
	  (lambda ()
	    (toggle-read-only 1)	; force READ ONLY.
	    (local-set-key [?q] 'bury-buffer)))

;; @ End of

;;; _diff.el ends here

;; Local Variables: ;;
;; mode: emacs-lisp ;;
;; End: ;;
