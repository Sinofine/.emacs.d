;;;init-lang.el -*- lexical-binding: t -*-
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))
;;; nix
(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")
(provide 'init-lang)
