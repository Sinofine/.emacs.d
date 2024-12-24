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
(use-package magit :ensure nil
  :bind ("C-x a m" . magit))
(use-package pdf-tools
  :ensure t
  :defer t)
(use-package rime
  :config
  (setq default-input-method "rime")
  (setq rime-user-data-dir "~/.config/rime"
        rime-share-data-dir "/etc/profiles/per-user/sinofine/share/rime-data"
        rime-show-candidate 'posframe
        rime-posframe-style 'simple
        rime-inline-ascii-trigger 'shift-l
        rime-show-preedit 'inline
        rime-commit1-forall t
        rime-disable-predicates '(rime-predicate-evil-mode-p
                                  rime-predicate-prog-in-code-p
                                  rime-predicate-punctuation-after-space-cc-p
				  ;; rime-predicate-after-alphabet-char-p
				  ;; rime-predicate-space-after-cc-p
				  meow-normal-mode-p
				  meow-motion-mode-p
				  meow-keypad-mode-p
                                  rime-predicate-tex-math-or-command-p)
        rime-inline-predicates '(rime-predicate-after-alphabet-char-p
                                 rime-predicate-space-after-cc-p
                                 )
	)
  (define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)
  (define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
  )
(provide 'init-apps)
