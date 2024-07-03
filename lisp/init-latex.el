;;; init-latex.el -*- lexical-binding: t -*-
(use-package auctex
  :ensure t
  ;; :defer t
  :hook (LaTeX-mode-hook . LaTeX-math-mode)
  :init
  (setq LaTeX-electric-left-right-brace t
	TeX-auto-save t
	TeX-parse-self t)
  (add-to-list 'auto-mode-alist '("\\.tex" . LaTeX-mode)))
(use-package cdlatex
  :ensure t
  ;; :defer t
  :after (auctex))

(provide 'init-latex)
