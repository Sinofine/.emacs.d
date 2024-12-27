;;;init-org.el -*- lexical-binding: t -*-
(use-package sage-shell-mode
  :ensure t)
(use-package htmlize
  :ensure t)
(when (not is-android)
  (use-package ob-sagemath
    :after sage-shell-mode
    :ensure t
    :custom (org-babel-default-header-args:sage '((:session . t)
						  (:results . "output")))
    (org-confirm-babel-evaluate nil)
    (org-export-babel-evaluate nil)
    (org-startup-with-inline-images t)
    :init
    (with-eval-after-load "org"
      (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
    (setq python-indent-offset 2)
    ))
(use-package org-modern
  :ensure t
  :init (with-eval-after-load 'org (global-org-modern-mode)))
(use-package org-journal
  :ensure t
  :defer t)
(use-package ekg
  :ensure t
  :bind (("C-c a c" . ekg-capture))
  :init
  (advice-add 'ekg-edit-finalize
	      :after
	      (lambda (&rest r) (delete-window))
	      '((name . "delwin1")))
  (advice-add 'ekg-capture-finalize
	      :after
	      (lambda (&rest r) (delete-window))
	      '((name . "delwin0")))
  )
(provide 'init-org)
