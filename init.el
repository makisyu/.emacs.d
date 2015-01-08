(add-to-list 'load-path "~/.emacs.d/lisp")

(set-face-attribute 'default nil
;                    :family "Source Code Pro"
                    :family "Inconsolata"
                    :height 100)

(custom-set-faces '(which-func ((t nil))))

(if (eq window-system 'x)
    (progn (set-scroll-bar-mode 'right)
           (tool-bar-mode 0)))

(show-paren-mode t)
(setq scroll-step 1)
(setq make-backup-files nil)
(setq completion-ignore-case t)
(icomplete-mode t)
(which-function-mode t)
(column-number-mode t)
(setq x-select-enable-clipboard t)
(recentf-mode t)
(global-auto-revert-mode 1)


;; bs-show
(global-set-key "\C-x\C-b" 'bs-show)


;; ispell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en")


;; color-theme
(if (> emacs-major-version 23)
    (if (or (eq window-system 'x) (eq window-system 'w32))
        (progn (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
               (load-theme 'solarized-dark t))))


;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/popup-el")
(when (require 'auto-complete-config nil t)
      (progn (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
             (ac-config-default)
             (setq ac-ignore-case nil)
             (setq ac-use-menu-map t)
             (define-key ac-menu-map "\C-n" 'ac-next)
             (define-key ac-menu-map "\C-p" 'ac-previous)))


;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 4)
(setq cperl-highlight-variables-indiscriminately t)
;; perltidy-mode
(require 'perltidy-mode)
(setq perltidy-bin "perltidy -pbp -q")
;; perl-completion-mode
(add-hook 'cperl-mode-hook (lambda () (setq ac-sources '(ac-source-perl-completion))))
;; flymake for perl
(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))
;; Makes perltidy-mode automatic for cperl-mode
(add-hook 'cperl-mode-hook (lambda () (perltidy-mode t)))
;; flyspell for cperl-mode
(add-hook 'cperl-mode-hook 'flyspell-prog-mode)


;; for C and C++
(add-hook 'c-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'c++-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'c-mode-hook (lambda () (setq c-tab-always-indent t)))
(add-hook 'c++-mode-hook (lambda () (setq c-tab-always-indent t)))
;; flyspell for C and C++ mode
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
;; hideshow
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
;; hide-if-def
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(add-hook 'c++-mode-hook 'hide-ifdef-mode)
;; cedet
(when (require 'cedet nil t)
      (global-ede-mode t)
      (semantic-mode t)
      (semantic-gcc-setup))
(setq ac-sources (append ac-sources '(ac-source-semantic)))
(add-hook 'c-mode-hook (lambda () (local-set-key (kbd "C-c .") 'ac-complete-semantic)))
(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "C-c .") 'ac-complete-semantic)))


;; flyspell for git commit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . flyspell-mode))


;; for auto-complete with flyspell
(ac-flyspell-workaround)


;; mozc
(when (require 'mozc nil t)
      (setq default-input-method "japanese-mozc"))


;; ecb
(setq stack-trace-on-error t)
(custom-set-variables '(ecb-options-version "2.40"))


;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(when (require 'markdown-mode nil t)
      (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode)))


;; yaml-mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(when (require 'yaml-mode nil t)
      (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))


;; Rinari for Ruby on Rails
(add-to-list 'load-path "~/.emacs.d/rinari")
(when (require 'rinari nil t)
      (global-rinari-mode))


;; show diff by git-gutter
(add-to-list 'load-path "~/.emacs.d/emacs-git-gutter")
(require 'git-gutter)
(global-git-gutter-mode +1)


;; smart-parens
(add-to-list 'load-path "~/.emacs.d/smartparens")
(add-to-list 'load-path "~/.emacs.d/dash.el")
(require 'smartparens-config)
(require 'smartparens-html)
(require 'smartparens-ruby)
(smartparens-global-mode t)

;; flycheck
(add-to-list 'load-path "~/.emacs.d/flycheck")
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; cscope
(require 'xcscope)
