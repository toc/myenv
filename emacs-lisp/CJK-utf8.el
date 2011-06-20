;;; CJK-utf8.el --- Some additional settings to utf8 encoding for CJK users.

;;; Commentary:
;;
;; Imported from http://d.hatena.ne.jp/whitypig/20090308
;;

;;; Code:
(eval-when-compile (require 'cl))

;;; U+0080 - U+2E7F の文字を CJK にデコード
;; http://nijino.homelinux.net/emacs/utf-cjk.html
;; JIS拡張漢字(JIS X 0213)
;; http://www.asahi-net.or.jp/~ax2s-kmtn/ref/jisx0213/jisx0213-1.html
(utf-translate-cjk-set-unicode-range
 '((#x00a2 . #x00a3)                    ; ¢, £
   (#x00a7 . #x00a8)                    ; §, ¨
   (#x00ac . #x00ac)                    ; ¬
   (#x00b0 . #x00b1)                    ; °, ±
   (#x00b4 . #x00b4)                    ; ´
   (#x00b6 . #x00b6)                    ; ¶
   (#x00d7 . #x00d7)                    ; ×
   (#X00f7 . #x00f7)                    ; ÷
   (#x0370 . #x03ff)                    ; Greek and Coptic
   (#x0400 . #x04FF)                    ; Cyrillic
   (#x2000 . #x206F)                    ; General Punctuation
   (#x2100 . #x214F)                    ; Letterlike Symbols
   (#x2190 . #x21FF)                    ; Arrows
   (#x2200 . #x22FF)                    ; Mathematical Operators
   (#x2300 . #x23FF)                    ; Miscellaneous Technical
   (#x2500 . #x257F)                    ; Box Drawing
   (#x25A0 . #x25FF)                    ; Geometric Shapes
   (#x2600 . #x26FF)                    ; Miscellaneous Symbols
   (#x2e80 . #xd7a3)                    ; East Asian Scripts
   (#xff00 . #xffef)))

;;; UTF-8 において，半角カナをmule-unicode-e000-ffffに変換させないため
(setq-default translation-table-for-input nil)

;;; CJK-utf8.el ends here

;; Local Variables: ;;
;; mode: emacs-lisp ;;
;; End: ;;
