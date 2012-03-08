(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/anthy")

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")

(load "brackets")
(load "leim-list")

(require 'dired)
(require 'auto-complete-config)
(require 'perltidy-mode)
(require 'perl-completion)
(require 'langtool)

(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 120)

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
(set-frame-parameter (selected-frame) 'alpha '(0.85))


;; bs-show
(global-set-key "\C-x\C-b" 'bs-show)


;; ispell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en")


;; LanguageTool
(setq langtool-language-tool-jar "~/LanguageTool/LanguageTool.jar")


;; LaTeX mode
(add-hook 'latex-mode-hook 'flyspell-prog-mode)


;; color-theme
(if (window-system)
    (load-theme 'solarized-dark t))


;; dired
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map "a" 'dired-advertised-find-file)



;; auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)
(setq ac-ignore-case t)
(setq ac-menu-height 20)



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
;; perl-completion-mode
(add-hook 'cperl-mode-hook
          (lambda ()
            (perl-completion-mode t)
            (setq ac-sources
                  '(ac-source-perl-completion))))
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
(global-ede-mode t)
(semantic-mode t)
(semantic-gcc-setup)
(setq ac-sources (append ac-sources '(ac-source-semantic)))



;; flyspell for git commit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . flyspell-mode))



;; for auto-complete with flyspell
(ac-flyspell-workaround)
