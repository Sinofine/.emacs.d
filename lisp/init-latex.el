;;; init-latex.el -*- lexical-binding: t -*-
(use-package auctex
  :ensure t
  ;; :defer t
  :hook
  ((LaTeX-mode . LaTeX-math-mode)
   (ConTeXt-mode . LaTeX-math-mode)
   (ConTeXt-mode . turn-on-reftex)
   (ConTeXt-mode . prettify-symbols-mode)
   ;; (ConTeXt-mode . variable-pitch-mode)
   )
  :custom
  (ConTeXt-Mark-version "IV")
  (LaTeX-electric-left-right-brace t)
  (prettify-symbols-unprettify-at-point t)
  (texmathp-tex-commands '(("\\startformula" sw-on) ("\\stopformula" sw-off)))

  (TeX-view-program-selection '((output-pdf "Zathura")))
  (TeX-save-query nil)
  (TeX-auto-save t)
  (TeX-debug-bad-boxes t)
  (TeX-debug-warnings t)
  (TeX-electric-math '("$" . "$"))
  (TeX-electric-sub-and-superscript t)
  (reftex-plug-into-AUCTeX t)
  :init
  (setq LaTeX-electric-left-right-brace t
	TeX-auto-save t
	TeX-parse-self t)
  (add-to-list 'auto-mode-alist '("\\.tex\\'" LaTeX-mode t))
  (add-hook 'ConTeXt-mode-hook
	    (lambda ()
	      (keymap-set ConTeXt-mode-map "("
			  'LaTeX-insert-left-brace)
	      (keymap-set ConTeXt-mode-map "["
			  'LaTeX-insert-left-brace)
	      (keymap-set ConTeXt-mode-map "{"
			  'LaTeX-insert-left-brace)
	      )))
(use-package cdlatex
  :ensure t
  :hook
  (LaTeX-mode-hook . cdlatex-mode)
  (LaTeX-mode-hook . eglot)
  ;; :defer t
  :after (auctex))

(provide 'init-latex)
