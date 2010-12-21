;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;; Based on:
;;    meadow-develop: 5083

(eval-when-compile
  (require 'cl)
  (require 'psvn))


(autoload 'svn-status "psvn" nil t)

;; 未変更のファイルを非表示
(setq svn-status-hide-unmodified t)

;; svn-diffで空白を無視する
(setq svn-status-default-diff-arguments "-x -w")

;; commit log を ChangeLog から作成
;; (add-hook
;;  'svn-log-edit-mode-hook
;;  (lambda ()
;;    (require 'log-edit)
;;    (let ((log-edit-listfun 'svn-status-marked-file-names))
;;      (log-edit-insert-changelog))))

;; commit 終了時の追加処理
(defadvice svn-log-edit-done
  (after clear-user-marks activate)
  ;; commit log 用のバッファを削除
  (kill-buffer (get-buffer-create "*svn-log-edit*"))
  ;; mark をすべてクリア
  (svn-status-unset-all-usermarks))

;; end
