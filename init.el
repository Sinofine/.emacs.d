;;; init.el -*- lexical-binding: t; -*-
(let ((file-name-handler-alist nil))
(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))
;; (add-to-list 'load-path (expand-file-name "tempel-collection/" user-emacs-directory))
(require 'init-meow)
(require 'init-ui)
(require 'init-latex)
(require 'init-apps)
(require 'init-snippets)
;; (require 'init-tempel)
(require 'init-vertico)
(require 'init-utils)
(require 'init-lang)
(require 'init-org)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("602c523efed33ab7bc708c31ed9d641abe123e2bfbbe124e46faf68c95e67d8d"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "Blue1" :family "CMU Concrete"))))
 '(font-lock-string-face ((t (:foreground "VioletRed4" :family "CMU Concrete")))))
