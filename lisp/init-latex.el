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
  (cdlatex-math-modify-alist '((98 "\\mathbb" "\\textbf" t nil nil)))

  (TeX-view-program-selection '((output-pdf "Zathura")))
  (TeX-save-query nil)
  (TeX-auto-save t)
  (TeX-debug-bad-boxes t)
  (TeX-debug-warnings t)
  (TeX-electric-math '("$" . "$"))
  (TeX-electric-sub-and-superscript t)
  (reftex-plug-into-AUCTeX t)
  :init
  (setq TeX-parse-self t)
  (add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))
  (add-to-list 'auto-mode-alist '("\\.mkiv\\'" . ConTeXt-mode))
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
(when (not is-android)
  (use-package texpresso))
(provide 'init-latex)
