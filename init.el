(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(set-face-attribute 'default nil
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


;; flyspell for git commit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . flyspell-mode))


;; color-theme
(if (> emacs-major-version 23)
    (if (or (eq window-system 'x) (eq window-system 'w32))
        (progn (add-to-list 'custom-theme-load-path
			    "~/.emacs.d/emacs-color-theme-solarized")
               (load-theme 'solarized t)
               (set-frame-parameter nil 'background-mode 'dark)
               (enable-theme 'solarized))))


;; for C and C++
;; flyspell for C and C++ mode
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
;; cedet
(require 'cedet nil t)
(global-ede-mode t)
(semantic-mode t)
(semantic-gcc-setup)
;; ecb
(setq stack-trace-on-error t)
(custom-set-variables '(ecb-options-version "2.40"))
;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(when (require 'auto-complete-config nil t)
      (progn (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
             (ac-config-default)
	     (ac-flyspell-workaround)
             (setq ac-ignore-case nil)
             (setq ac-use-menu-map t)
	     (setq ac-sources (append ac-sources '(ac-source-semantic)))))


;; mozc
(when (require 'mozc nil t)
      (setq default-input-method "japanese-mozc"))


;; markdown-mode
(when (require 'markdown-mode nil t)
      (add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode)))


;; yaml-mode
(when (require 'yaml-mode nil t)
      (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))


;; Rinari for Ruby on Rails
(add-to-list 'load-path "~/.emacs.d/rinari")
(when (require 'rinari nil t)
      (global-rinari-mode))


;; show diff by git-gutter
(add-to-list 'load-path "~/.emacs.d/emacs-git-gutter")
(when (require 'git-gutter nil t)
      (global-git-gutter-mode +1))


;; flycheck
(add-to-list 'load-path "~/.emacs.d/flycheck")
(when (require 'flycheck nil t)
      (add-hook 'after-init-hook #'global-flycheck-mode))


;; cscope
(require 'xcscope)
