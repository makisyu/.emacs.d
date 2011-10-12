(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 140)
;; (set-fontset-font "fontset-default"
;;                   'japanese-jisx0208
;;                   '("IPAexゴシック" . "jisx0208.*"))
;; (set-fontset-font "fontset-default"
;;                   'katakana-jisx0201
;;                   '("IPAexゴシック" . "jisx0201.*"))
;; (set-fontset-font "fontset-default"
;;                   'japanese-jisx0208
;;                   '("モトヤLシータ゛3等幅" . "jisx0208.*"))
;; (set-fontset-font "fontset-default"
;;                   'katakana-jisx0201
;;                   '("モトヤLシータ゛3等幅" . "jisx0201.*"))
;; (set-fontset-font "fontset-default"
;;                   'japanese-jisx0208
;;                   '("モトヤLマルベリ3等幅" . "jisx0208.*"))
;; (set-fontset-font "fontset-default"
;;                   'katakana-jisx0201
;;                   '("モトヤLマルベリ3等幅" . "jisx0201.*"))

(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(set-scroll-bar-mode 'right)
(setq scroll-step 1)
(setq make-backup-files nil)
(setq completion-ignore-case t)
(icomplete-mode t)
(iswitchb-mode t)
(which-function-mode t)
(column-number-mode t)
(setq x-select-enable-clipboard t)
(recentf-mode t)
(tool-bar-mode 0)
(global-set-key "\C-m" 'newline-and-indent)

(set-frame-parameter nil 'fullscreen 'maximized)
(set-frame-parameter nil 'alpha 80)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elscreen")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/anthy")
(add-to-list 'load-path "~/.emacs.d/apel")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/cedet/common")
(add-to-list 'load-path "~/.emacs.d/cedet/cogre")
(add-to-list 'load-path "~/.emacs.d/cedet/contrib")
(add-to-list 'load-path "~/.emacs.d/cedet/ede")
(add-to-list 'load-path "~/.emacs.d/cedet/eieio")
(add-to-list 'load-path "~/.emacs.d/cedet/semantic")
(add-to-list 'load-path "~/.emacs.d/cedet/speedbar")
(add-to-list 'load-path "~/.emacs.d/cedet/srecode")
(add-to-list 'load-path "~/.emacs.d/perltidy-mode")
(add-to-list 'load-path "~/.emacs.d/auctex")
(add-to-list 'load-path "~/.emacs.d/auctex/preview")

(load "brackets.el")
(load "leim-list.el")
(load "cedet.el")
(load "auctex.el")
(load "preview-latex.el")

(require 'flymake)
(require 'auto-install)
(require 'eldoc)
(require 'eldoc-extension)
(require 'c-eldoc)
(require 'auto-complete-config)
(require 'elscreen)
(require 'elscreen-gf)
(require 'elscreen-dnd)
(require 'elscreen-dired)
(require 'elscreen-speedbar)
(require 'color-theme)
(require 'hideif)
(require 'hideshow)
(require 'dired)
(require 'perltidy-mode)
(require 'ispell)
(require 'flyspell)



;; ispell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en")



;; AUCTeX
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)



;; color-theme
(color-theme-initialize)
(color-theme-clarity)



;; dired
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map "a" 'dired-advertised-find-file)



;; auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)



;; anthy
(setq default-input-method "japanese-anthy")
(setq anthy-wide-space " ")



;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-highlight-variables-indiscriminately t)
 ;; perltidy-mode
(setq perltidy-bin "perltidy -pbp -q")
;; brackets for perl
(add-hook 'cperl-mode-hook
          '(lambda()
             (progn
               (define-key cperl-mode-map "{" 'insert-braces)
               (define-key cperl-mode-map "(" 'insert-parens)
               (define-key cperl-mode-map "\"" 'insert-double-quotation)
               (define-key cperl-mode-map "'" 'insert-single-quotation)
               (define-key cperl-mode-map "[" 'insert-brackets)
               (define-key cperl-mode-map "\C-c}" 'insert-braces-region)
               (define-key cperl-mode-map "\C-c)" 'insert-parens-region)
               (define-key cperl-mode-map "\C-c]" 'insert-brackets-region)
               (define-key cperl-mode-map "\C-c\""
                 'insert-double-quotation-region))))
;; flymake for perl
(defun flymake-perl-load () (flymake-mode t))
(add-hook 'cperl-mode-hook 'flymake-perl-load)
;; Makes perltidy-mode automatic for cperl-mode
(defun perltidy-perl-load () (perltidy-mode t))
(add-hook 'cperl-mode-hook 'perltidy-perl-load)
;; flyspell for cperl-mode
(add-hook 'cperl-mode-hook 'flyspell-prog-mode)



;; for C
(setq c-basic-offset 8)
;; flyspell for C and C++ mode
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
;; c-eldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
;; hideshow and hideif
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(add-hook 'c++-mode-hook 'hide-ifdef-mode)
;; cedet
(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-semantic-decoration-mode t nil (semantic-decorate-mode))
 '(global-semantic-highlight-edits-mode t nil (semantic-util-modes))
 '(global-semantic-highlight-func-mode t nil (semantic-util-modes))
 '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
 '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
 '(global-semantic-show-parser-state-mode t nil (semantic-util-modes))
 '(global-semantic-show-unmatched-syntax-mode nil nil (semantic-util-modes))
 '(global-semantic-stickyfunc-mode nil nil (semantic-util-modes))
 '(global-senator-minor-mode t nil (senator))
 '(which-function-mode t))



;; elscreen
(elscreen-set-prefix-key "\C-t")

(load "myconf.el")

