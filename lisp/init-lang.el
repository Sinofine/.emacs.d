;;;init-lang.el -*- lexical-binding: t -*-
(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))
(when (not is-android)
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
  )
;;; typst
(use-package typst-ts-mode
  :ensure (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
  :custom
  (typst-ts-mode-watch-options "--open"))

(with-eval-after-load 'eglot
  (with-eval-after-load 'typst-ts-mode
    (add-to-list 'eglot-server-programs
                 `((typst-ts-mode) .
                   ,(eglot-alternatives `(,typst-ts-lsp-download-path
                                          "tinymist"
                                          "typst-lsp"))))))
(use-package websocket
  :ensure t)
(use-package typst-preview
  :ensure (:type git
		 :host github
		 :repo "sinofine/typst-preview.el"))
(provide 'init-lang)
