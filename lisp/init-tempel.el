;;; init-tempel.el --- snippets                      -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Sinofine Lotusie

;; Author: Sinofine Lotusie <i@sinofine.me>
;; Keywords: tools

(use-package tempel
  :ensure t
  :after corfu
  :bind (("M-+" . tempel-complete)
	 ("M-*" . tempel-insert))
  :init
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
		(cons #'tempel-expand
		      completion-at-point-functions))
    )
  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  ;; (global-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
    )
(use-package tempel-collection
  :ensure nil
  :after tempel)
(provide 'init-tempel)
