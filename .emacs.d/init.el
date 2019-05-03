;; C-h as Backspace
(global-set-key (kbd "C-h") 'delete-backward-char)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'magit)

;; http://www.clear-code.com/blog/2012/4/3.html
;; 文字単位での変更箇所は色を反転して強調
(set-face-attribute 'diff-refine-changed nil
                    :foreground nil :background nil
                    :weight 'bold :inverse-video t)

;; diffを表示したらすぐに文字単位での強調表示も行う
(defun diff-mode-refine-automatically ()
  (diff-auto-refine-mode t))
(add-hook 'diff-mode-hook 'diff-mode-refine-automatically)

;; diffを表示しているときに文字単位での変更箇所も強調表示する
;; 'allではなくtにすると現在選択中のhunkのみ強調表示する
(setq magit-diff-refine-hunk 'all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Migemo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; sudo apt install cmigemo
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\g"))
  ;; (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  ;; (setq migemo-options '("-q" "--emacs"))

  ;; migemo-dict のパスを指定
  (setq migemo-dictionary (expand-file-name "/usr/share/cmigemo/utf-8/migemo-dict"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  
  ;; 辞書の文字コードを指定．
  (setq migemo-coding-system 'utf-8-unix)
  ;; (setq migemo-coding-system 'euc-jp-unix)
  
  ;; キャッシュ機能を利用する
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1024)

  (load-library "migemo")

  ;; 起動時に初期化も行う
  (migemo-init))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'skk-auto)
(global-set-key (kbd "C-x C-j") 'skk-mode)

;; skk hokan
(setq skk-dcomp-activate t)

;; skk-jisho
(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;; skk function key
(setq skk-j-mode-function-key-usage 'conversion)

;; skk annotation
(setq skk-show-annotation t)

;; auto close brackets
(setq-default skk-auto-insert-paren t)
