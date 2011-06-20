;;;						      -*- emacs-lisp -*-
;;; User-defined init file for emacs
;;;
(eval-when-compile (require 'cl))


;;; load-maybeを定義する
(defun load-maybe (file &optional ignore)
  (load (expand-file-name file "~/.emacs.cfg")))


;;; load user-defined settings.
(mapcar
 (lambda (x)
   (load-maybe (car x) (cdr x)))
 (list '("init-user" . nil)
       '("CJK-utf8" . t)
       ;; You can add your settings here.
       '("_diff" . t)
       '("_org"  . t)
       '("_psvn" . t)
       ))

