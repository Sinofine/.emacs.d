;;;init-apps.el -*- lexical-binding: t; -*-
(use-package telega :ensure t
  :bind ("C-c a t" . telega))
(use-package magit :ensure t
  :bind ("C-c a m" . magit))
(use-package pdf-tools :ensure t)
(provide 'init-apps)
