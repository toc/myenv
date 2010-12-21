(require 'cl)
(set-language-environment "Japanese")
(setq shell-file-name "sh")
(setq explicit-shell-file-name "sh")

(cd "~")

(setq tab-width 4)

(load "~/.emacs.d/_diff.el")
(load "~/.emacs.d/_org.el")
(load "~/.emacs.d/_psvn.el")
(when t
  (load "~/.emacs.d/font-setup.el")
  (font-setup "OsakaÅ|ìôïù" 1 nil "Osaka-fixed-16"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(smtp-default-server "xxx.xxx-xxx.xx")
 '(tool-bar-mode nil)
 '(wl-auto-save-drafts-interval nil)
 '(wl-draft-folder "%Drafts:user/clear@xxx.xxx-xxx.xx")
 '(wl-from "<user@xxx.xxx-xxx.xx>")
 '(wl-smtp-posting-server "mail.xxx.xxx-xxx.xx"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
