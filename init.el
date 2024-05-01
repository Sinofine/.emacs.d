;;; init.el -*- lexical-binding: t; -*-
(elpaca elpaca-use-package
  (elpaca-use-package-mode))
(setopt inhibit-startup-screen t)
(use-package emacs :ensure nil :config
  (setq ring-bell-function #'ignore)
  (tool-bar-mode -1)
  (set-face-attribute 'fringe nil :background "white"))
(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode-hook . LaTeX-math-mode)
  :init (setq LaTeX-electric-left-right-brace t))
(use-package cdlatex
  :ensure t
  :defer t
  :after (auctex))
(use-package telega :ensure t
  :bind ("C-c a t" . telega))
(use-package magit :ensure t
  :bind ("C-c a m" . magit))
(use-package yasnippet :ensure t
  :defer t
  :config
  (add-to-list 'yas-snippet-dirs (concat user-emacs-directory "/snippets"))
  (defun my-yas-try-expanding-auto-snippets ()
    (when (and (boundp 'yas-minor-mode) yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
	(yas-expand))))
  (add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change))
  :init
  (add-hook 'elpaca-after-init-hook #'yas-global-mode))
(use-package doom-snippets
  :after yasnippet
  :ensure (doom-snippets :host github :repo "doomemacs/snippets" :files (:defaults "*.el" "*")))
(use-package dashboard :ensure t
  :config
  (setopt dashboard-startup-banner (concat user-emacs-directory "/logo/hfut.svg")
	  dashboard-banner-logo-title "I like vanilla style."
	  dashboard-center-content t
	  dashboard-vertically-center-content t
	  dashboard-items '((recents . 5)
			    ))
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook))
(when (display-graphic-p)
  (add-hook
   'elpaca-after-init-hook
   (lambda ()
     (dolist (charset '(kana han cjk-misc bopomofo))
       (set-fontset-font "fontset-default"
                         charset
			 (font-spec :family "等距更纱宋体 Slab SC" :weight 'medium ))))))
