(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 110)
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
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Ricty" . "jisx0208.*"))
(set-fontset-font "fontset-default"
                  'katakana-jisx0201
                  '("Ricty" . "jisx0201.*"))

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
(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(add-to-list 'load-path "~/.emacs.d/elscreen")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/riece/lisp")
(add-to-list 'load-path "~/.emacs.d/anthy")
(add-to-list 'load-path "~/.emacs.d/apel")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/ecb")
(add-to-list 'load-path "~/.emacs.d/cedet/common")
(add-to-list 'load-path "~/.emacs.d/cedet/cogre")
(add-to-list 'load-path "~/.emacs.d/cedet/contrib")
(add-to-list 'load-path "~/.emacs.d/cedet/ede")
(add-to-list 'load-path "~/.emacs.d/cedet/eieio")
(add-to-list 'load-path "~/.emacs.d/cedet/semantic")
(add-to-list 'load-path "~/.emacs.d/cedet/speedbar")
(add-to-list 'load-path "~/.emacs.d/cedet/srecode")

(load "brackets.el")
(load "leim-list.el")
(load "cedet.el")

(require 'flymake)
(require 'auto-install)
(require 'twittering-mode)
(require 'riece)
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
(require 'ecb)
(require 'hideif)
(require 'hideshow)
(require 'dired)
(require 'semantic-gcc)

;; color-theme
(color-theme-initialize)
(color-theme-clarity)

;; dired
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map "a" 'dired-advertised-find-file)

;; cedet
(global-ede-mode 1)
;; (semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-code-helpers)


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

;;; perl-tidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun) (perltidy-region)))

;;; brackets for perl
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

;;; flymake for perl
(defun flymake-perl-load () (flymake-mode t))
(add-hook 'cperl-mode-hook 'flymake-perl-load)

;; twittering-mode
(setq twittering-icon-mode t)
(setq twittering-use-master-password t)
(setq twittering-retweet-format " RT @%s: %t")
(setq twittering-status-format
      "%i %S (%s), %@ from %f%L%r%R\n%FILL[  ]{%T}\n")
(setq twittering-number-of-tweets-on-retrieval 190)

;; elscreen
(elscreen-set-prefix-key "\C-t")

;; c-eldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

;; hideshow and hideif
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(add-hook 'c++-mode-hook hide-ifdef-mode)

;; for C
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
;; (defun my-c-mode-cedet-hook ()
;;   (local-set-key "." 'senator-completion-menu-popup)
;;   (local-set-key ">" 'senator-completion-menu-popup))

(setq c-basic-offset 8)
(add-hook 'c-mode-hook
          '(lambda()
             (progn
               (define-key c-mode-map "{" 'insert-braces)
               (define-key c-mode-map "(" 'insert-parens)
               (define-key c-mode-map "\"" 'insert-double-quotation)
               (define-key c-mode-map "'" 'insert-single-quotation)
               (define-key c-mode-map "[" 'insert-brackets)
               (define-key c-mode-map "\C-c}" 'insert-braces-region)
               (define-key c-mode-map "\C-c)" 'insert-parens-region)
               (define-key c-mode-map "\C-c]" 'insert-brackets-region)
               (define-key c-mode-map "\C-c\"" 'insert-double-quotation-region))))

(load "myconf.el")
