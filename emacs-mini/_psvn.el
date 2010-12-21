;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;; Based on:
;;    meadow-develop: 5083

(eval-when-compile
  (require 'cl)
  (require 'psvn))


(autoload 'svn-status "psvn" nil t)

;; $BL$JQ99$N%U%!%$%k$rHsI=<((B
(setq svn-status-hide-unmodified t)

;; svn-diff$B$G6uGr$rL5;k$9$k(B
(setq svn-status-default-diff-arguments "-x -w")

;; commit log $B$r(B ChangeLog $B$+$i:n@.(B
;; (add-hook
;;  'svn-log-edit-mode-hook
;;  (lambda ()
;;    (require 'log-edit)
;;    (let ((log-edit-listfun 'svn-status-marked-file-names))
;;      (log-edit-insert-changelog))))

;; commit $B=*N;;~$NDI2C=hM}(B
(defadvice svn-log-edit-done
  (after clear-user-marks activate)
  ;; commit log $BMQ$N%P%C%U%!$r:o=|(B
  (kill-buffer (get-buffer-create "*svn-log-edit*"))
  ;; mark $B$r$9$Y$F%/%j%"(B
  (svn-status-unset-all-usermarks))

;; end
