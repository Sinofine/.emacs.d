;;;init-lang.el -*- lexical-binding: t -*-
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))
;;; nix
(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")
;;; rust
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init
  (setopt rust-mode-treesitter-derive t)
  :config
  (add-hook 'rust-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode nil)))
  (add-hook 'rust-mode-hook 'eglot-ensure))
;;; lean
(use-package lean4-mode
  :ensure (lean4-mode
	     :type git
	     :host github
	     :repo "leanprover/lean4-mode"
	     :files ("*.el" "data"))
  :mode "\\.lean\\'")
;;; blueprint
(use-package blueprint-mode
  :ensure (blueprint-mode
	   :type git
	   :host github
	   :repo "DrBluefall/blueprint-mode")
  :mode "\\.blp\\'")

;;; direnv
(use-package direnv
  :ensure t
  :config (direnv-mode))
(provide 'init-lang)
