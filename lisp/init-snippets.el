;;; init-snippets.el -*- lexical-binding: t -*-
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
  (with-eval-after-load 'cdlatex
    (add-hook 'cdlatex-tab-hook #'yas-expand))
  :init
  (add-hook 'elpaca-after-init-hook #'yas-global-mode))

(use-package doom-snippets
  :after yasnippet
  :ensure (doom-snippets :host github :repo "doomemacs/snippets" :files (:defaults "*.el" "*")))

(provide 'init-snippets)
