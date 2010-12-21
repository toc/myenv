;;; -*- syntax: elisp; coding: iso-2022-jp; -*-

;; Copyright (C) 2003, 2004 Yasutaka SHINDOH (新堂安孝) <ring-pub@fan.gr.jp>

;; Author: Yasutaka SHINDOH (新堂安孝) <ring-pub@fan.gr.jp>
;; URI: http://www.fan.gr.jp/~ring/doc/font-setup.html
;; Keywords: Meadow TrueType BDF Font

;;; Commentary:

;; 2003 年の春、GNU Emacs 21 をベースにした Meadow-1.99 Alpha6-dev が
;; ひっそりと公開されました。Alpha6-dev 以降では、Alpha5 以前と BDF フォ
;; ントを利用する際の設定方法が異なるため、新しくフォント設定のために
;; コードを書く必要が出てきてしまう人もいるかと思います。そんな人向け
;; に、16 ドットの BDF フォントと 12 ポイントの和文 TrueType フォント
;; を組み合わせて多言語を表示させるための elisp ファイルを公開しました。
;; 大したものではありませんが、もしよろしければ御利用下さい。

;;; Usage:

;; (when (require 'font-setup nil t)
;;   (setq font-setup-bdf-dir "international fonts の置き場所")
;;   (font-setup))

;; 詳しい使い方は以下に書いてあります。
;;
;; http://www.fan.gr.jp/~ring/doc/font-setup.html

;;; Code:

;; Default で使用する TrueType Fonts 名とその設定
(defvar font-setup-ttf-def "ＭＳ ゴシック")
(defvar font-setup-ttf-def-number 49)
(defvar font-setup-ttf-fix "ＭＳ ゴシック")
(defvar font-setup-ttf-fix-width 'normal)
(defvar font-setup-ttf-fix-height 1.0)
(defvar font-setup-ttf-var "ＭＳ Ｐゴシック")
(defvar font-setup-ttf-var-width 'normal)
(defvar font-setup-ttf-var-height 1.0)

;; Inernational Fonts の置き場所
(defvar font-setup-bdf-dir "/path/to/intlfonts-1.2.1")

;; ハングル文字は明朝体を使う (基本的に設定しなくて良い)
(defvar font-setup-bdf-hangul-mincho nil)

;; Font Set の作成と登録
(defun font-setup (&optional font num unuse set)
  (interactive)
  (let ((fn (or font font-setup-ttf-def))
	(n (or num font-setup-ttf-def-number))
	(dir (expand-file-name font-setup-bdf-dir))
	fs min)
    (setq fs (or set (concat fn "-16"))
	  min (or font-setup-bdf-hangul-mincho
		  (string-match "明朝\\|mincho" fn)))
    (w32-add-font
     fs
     `((spec
	;; **TrueType Fonts**
	;; ascii
	((:char-spec ascii :height any)
	 strict
	 (w32-logfont ,fn 0 -16 400 0 nil nil nil 0 1 3 ,n))
	((:char-spec ascii :height any :weight bold)
	 strict
	 (w32-logfont ,fn 0 -16 700 0 nil nil nil 0 1 3 ,n)
	 ((spacing . -1)))
	((:char-spec ascii :height any :weight normal :slant italic)
	 strict
	 (w32-logfont ,fn 0 -16 400 0 t nil nil 0 1 3 ,n))
	((:char-spec ascii :height any :weight bold :slant italic)
	 strict
	 (w32-logfont ,fn 0 -16 700 0 t nil nil 0 1 3 ,n)
	 ((spacing . -1)))
	;; katakana-jisx0201
	((:char-spec katakana-jisx0201 :height any)
	 strict
	 (w32-logfont ,fn 0 -16 400 0 nil nil nil 128 1 3 ,n)
	 ((encoding . 1-byte-set-msb)))
	((:char-spec katakana-jisx0201 :height any :weight bold)
	 strict
	 (w32-logfont ,fn 0 -16 700 0 nil nil nil 128 1 3 ,n)
	 ((encoding . 1-byte-set-msb) (spacing . -1)))
	((:char-spec katakana-jisx0201 :height any :weight normal :slant italic)
	 strict
	 (w32-logfont ,fn 0 -16 400 0 t nil nil 128 1 3 ,n)
	 ((encoding . 1-byte-set-msb)))
	((:char-spec katakana-jisx0201 :height any :weight bold :slant italic)
	 strict
	 (w32-logfont ,fn 0 -16 700 0 t nil nil 128 1 3 ,n)
	 ((encoding . 1-byte-set-msb) (spacing . -1)))
	;; japanese-jisx0208
	((:char-spec japanese-jisx0208 :height any)
	 strict
	 (w32-logfont ,fn 0 -16 400 0 nil nil nil 128 1 3 ,n))
	((:char-spec japanese-jisx0208 :height any :weight bold)
	 strict
	 (w32-logfont ,fn 0 -16 700 0 nil nil nil 128 1 3 ,n)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any :weight normal :slant italic)
	 strict
	 (w32-logfont ,fn 0 -16 400 0 t nil nil 128 1 3 ,n))
	((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
	 strict
	 (w32-logfont ,fn 0 -16 700 0 t nil nil 128 1 3 ,n)
	 ((spacing . -1)))
	;; **Inernational Fonts**
	;; latin-iso8859-1,...,9
	((:char-spec latin-iso8859-1 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/lt1-16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec latin-iso8859-2 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/lt2-16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec latin-iso8859-3 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/lt3-16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec latin-iso8859-4 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/lt4-16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec cyrillic-iso8859-5 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/cyr16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec arabic-iso8859-6 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Misc/arab16-0-etl.bdf" dir)))
	((:char-spec greek-iso8859-7 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/grk16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec hebrew-iso8859-8 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Misc/heb16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec latin-iso8859-9 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "European/lt5-16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	;; latin-jisx0201, japanese-jisx0208-1978, japanese-jisx0212
	((:char-spec latin-jisx0201 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Japanese.X/8x16rk.bdf" dir)))
	((:char-spec japanese-jisx0208-1978 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Japanese/j78-16.bdf" dir)))
	((:char-spec japanese-jisx0212 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Japanese/jksp16.bdf" dir)))
	;; japanese-jisx0213-X (JISX0213 用 bdf フォントが必要)
	((:char-spec japanese-jisx0213-1 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Japanese/jiskan16-2000-1.bdf" dir)))
	((:char-spec japanese-jisx0213-2 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Japanese/jiskan16-2000-2.bdf" dir)))
	;; chinese-cns11643-1,...,7
	((:char-spec chinese-cns11643-1 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns1-16.bdf" dir)))
	((:char-spec chinese-cns11643-2 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns2-16.bdf" dir)))
	((:char-spec chinese-cns11643-3 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns3-16.bdf" dir)))
	((:char-spec chinese-cns11643-4 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns4-16.bdf" dir)))
	((:char-spec chinese-cns11643-5 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns5-16.bdf" dir)))
	((:char-spec chinese-cns11643-6 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns6-16.bdf" dir)))
	((:char-spec chinese-cns11643-7 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/cns7-16.bdf" dir)))
	;; chinese-sisheng, chinese-gb2312, chinese-big5-X
	((:char-spec chinese-sisheng :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/sish16-etl.bdf" dir)))
	((:char-spec chinese-gb2312 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese.X/gb16fs.bdf" dir)))
;	 (bdf-font ,(expand-file-name "Chinese.X/gb16st.bdf" dir)))
	((:char-spec chinese-big5-1 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/taipei16.bdf" dir))
	 ((encoding . encode-big5-font)))
	((:char-spec chinese-big5-2 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Chinese/taipei16.bdf" dir))
	 ((encoding . encode-big5-font)))
	;; arabic
	((:char-spec arabic-digit :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Misc/arab16-0-etl.bdf" dir)))
	((:char-spec arabic-1-column :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Misc/arab16-1-etl.bdf" dir)))
	((:char-spec arabic-2-column :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Misc/arab16-2-etl.bdf" dir)))
	;; indian
	((:char-spec indian-is13194 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Asian/isci16-mule.bdf" dir)))
;;	((:char-spec indian-1-column :height any :weight any :slant any)
;;	 strict
;;	 (bdf-font ,(expand-file-name "Asian/ind1c16-mule.bdf" dir)))
;;	((:char-spec indian-2-column :height any :weight any :slant any)
;;	 strict
;;	 (bdf-font ,(expand-file-name "Asian/ind16-mule.bdf" dir)))
	;; vietnamese-viscii
;;	((:char-spec vietnamese-viscii-lower :height any :weight any :slant any)
;;	 strict
;;	 (bdf-font ,(expand-file-name "Asian/visc16-etl.bdf" dir))
;;	 ((encoding . encode-viscii-font)))
;;	((:char-spec vietnamese-viscii-upper :height any :weight any :slant any)
;;	 strict
;;	 (bdf-font ,(expand-file-name "Asian/visc16-etl.bdf" dir))
;;	 ((encoding . encode-viscii-font)))
	;; misc.
	((:char-spec korean-ksc5601 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name
		     (if min "Korean.X/hanglm16.bdf" "Korean.X/hanglg16.bdf")
		     dir)))
	((:char-spec lao :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Asian/lao16-mule.bdf" dir))
	 ((encoding . 1-byte-set-msb)))
	((:char-spec thai-tis620 :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Asian/thai16.bdf" dir))
	 ((encoding . 1-byte-set-msb) (relative-compose . -1)))
	((:char-spec tibetan :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Asian/tib16-mule.bdf" dir)))
	((:char-spec tibetan-1-column :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Asian/tib1c16-mule.bdf" dir)))
	((:char-spec ethiopic :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Ethiopic/ethio16f-uni.bdf" dir))
	 ((encoding . encode-ethio-font)))
	((:char-spec ipa :height any :weight any :slant any)
	 strict
	 (bdf-font ,(expand-file-name "Misc/ipa16-etl.bdf" dir))
	 ((encoding . 1-byte-set-msb))))))
    (unless unuse
      ;; Font Set を使う
      (add-to-list 'default-frame-alist (cons 'font fs))
      ;; IME の Font
      (add-to-list 'default-frame-alist
		   `(ime-font
		     w32-logfont ,fn 0 0 400 0 nil nil nil 128 1 3 ,n)))))

;; Scalable Fonts 等
(setq scalable-fonts-allowed t)
(set-face-attribute 'fixed-pitch nil
		    :family font-setup-ttf-fix
		    :width font-setup-ttf-fix-width
		    :height font-setup-ttf-fix-height)
(set-face-attribute 'variable-pitch nil
		    :family font-setup-ttf-var
		    :width font-setup-ttf-var-width
		    :height font-setup-ttf-var-height)

;; provide
(provide 'font-setup)

;;; end
