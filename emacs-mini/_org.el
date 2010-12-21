;;; _org.el --- _org of emacs-lisp

;;; Commentary:

;;; Code:
(eval-when-compile
  (require 'cl)
  (require 'org))
;;  (require 'selfhack))

(when (load-library "org")
  (setq org-agenda-files '("~/org"))	; Dir for my org files.
  (setq org-agenda-file-regexp "[^.#]\\.\\(org\\|txt\\)$")

  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-c\C-o" 'org-open-at-point)
  (define-key global-map "\C-c\C-l" 'org-insert-link)

  (setq org-email-link-description-format "%.60s")

  (setq org-log-done t)
)

(defun my-org-insert-list-item ()
  "空行だったら新規にリストアイテム追加
TODO: 記述有りならリスト化"
  (interactive)
  (beginning-of-line)
;;  (
  (insert "- [ ] ")
;;   )
;;  (org-indent-item 1)			; Indent current level
  )

(add-hook 'org-mode-hook
	  (lambda ()
	    (setq tab-width 4)
	    (local-set-key "\C-c\C-a" 'show-all)
	    (local-set-key "\C-ci" 'my-org-insert-list-item)))

(add-hook 'mhc-draft-mode-hook 'turn-on-orgstruct)

;; (defadvice toggle-input-method (after toggle-input-method-in-org-buffer activate)
;;   (when (eq major-mode 'org-mode)
;;     (defvar toggle-input-method-in-org-buffer)
;;     (make-local-variable 'toggle-input-method-in-org-buffer)
;;     (cond
;;      ((and (not current-input-method)
;; 	   (boundp toggle-input-method-in-org-buffer))
;;       (font-lock-mode toggle-input-method-in-org-buffer))
;;      ((and current-input-method
;; 	   (string-match "-egg-" current-input-method))
;;       (setq toggle-input-method-in-org-buffer font-lock-mode)
;;       (font-lock-mode 0)))))

;; @ End of

;;; _org.el ends here

;; Local Variables: ;;
;; mode: emacs-lisp ;;
;; End: ;;
