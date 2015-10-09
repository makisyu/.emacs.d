(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 120)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-info ((t (:underline t))))
 '(flycheck-warning ((t (:underline t))))
 '(which-func ((t nil))))

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
(setq-default indent-tabs-mode nil) 


;; bs-show
(global-set-key "\C-x\C-b" 'bs-show)


;; ispell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en")
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)

;; flyspell for git commit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . flyspell-mode))


;; color-theme
(if (> emacs-major-version 23)
    (if (or (eq window-system 'x) (eq window-system 'w32))
        (progn (load-theme 'solarized t)
               (set-frame-parameter nil 'background-mode 'dark)
               (enable-theme 'solarized))))


;; for C and C++
;; cedet
(require 'cedet nil t)
(global-ede-mode t)
(semantic-mode t)
(semantic-gcc-setup)
;; ecb
(setq stack-trace-on-error t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(safe-local-variable-values (quote ((c-indent-level . 4)))))
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
(require 'mozc)
(setq default-input-method "japanese-mozc")
(require 'mozc-popup)
(setq mozc-candidate-style 'popup)


;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))


;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; Rinari for Ruby on Rails
;(when (require 'rinari nil t) (global-rinari-mode))


;; show diff by git-gutter
(add-to-list 'load-path "~/.emacs.d/emacs-git-gutter")
(require 'git-gutter)
(global-git-gutter-mode +1)


;; flycheck
(add-to-list 'load-path "~/.emacs.d/flycheck")
(when (require 'flycheck nil t)
      (progn (setq flycheck-gcc-include-path
                   (list "/usr/include"
                         "/usr/include/glib-2.0"
                         "/usr/lib64/glib-2.0/include"
                         "/usr/include/pixman-1"))))



;; cscope
(require 'xcscope nil t)
(cscope-setup)
(setq cscope-do-not-update-database t)
(add-hook 'c-mode-hook (function cscope-minor-mode))
(add-hook 'c++-mode-hook (function cscope-minor-mode))
(add-hook 'python-mode-hook (function cscope-minor-mode))
(add-hook 'erlang-mode (function cscope-minor-mode))


;; EDTS
;(require 'edts-start)
;(cusrom-set-variables '(edts-man-root "~/.emacs.d/edts/doc/R16B"))


;; highlight-symbol
(require 'highlight-symbol nil t)
(add-hook 'c-mode-hook 'highlight-symbol-mode)
(add-hook 'c++-mode-hook 'highlight-symbol-mode)
(add-hook 'python-mode-hook 'highlight-symbol-mode)
(add-hook 'erlang-mode 'highlight-symbol-mode)


;; smart-parens
(require 'smartparens nil t)
