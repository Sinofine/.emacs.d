;;;init-apps.el -*- lexical-binding: t; -*-
(use-package telega :ensure t
  :bind ("C-x a t" . telega)
  :custom
  ;; (telega-use-docker t)
  ;; (telega-debug t)
  (telega-avatar-workaround-gaps-for '(return t))
  ;; :init
  ;; (setf (alist-get 2 telega-avatar-factors-alist ) '(0.5 . 0.1))
  :config
  ;; (when (display-graphic-p)
  ;; (add-hook 'telega-load-hook
            ;; (lambda ()
              (set-face-attribute 'telega-msg-heading nil
                                  :background nil
                                  :underline 't
                                  :height 1.2
                                  )
              (set-face-attribute 'telega-msg-inline-forward nil
                                  ;; :background "light gray"
                                  :underline nil
                                  :height 0.84
                                  )
              (set-face-attribute 'telega-msg-inline-reply nil
                                  ;; :background "light gray"
                                  :underline nil
                                  :height 0.84
                                  )
              ;; ))
    ;; )
  )
(use-package magit :ensure t
  :bind ("C-x a m" . magit))
(use-package pdf-tools
  :ensure t
  :defer t)
(provide 'init-apps)
