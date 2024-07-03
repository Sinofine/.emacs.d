;; init-ui.el -*- lexical-binding: t -*-
(setopt inhibit-startup-screen t)
(use-package emacs :ensure nil :config
  (setq
   ring-bell-function #'ignore
   make-backup-files nil)
  (pixel-scroll-precision-mode 1)
  (tool-bar-mode -1)
  (set-face-attribute 'mode-line nil
		      :background "white smoke"
		      :box '( :line-width -1
			      :color "light gray"
			      ;; :style 'flat-button
			      ))
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (set-face-attribute 'fringe nil :background "white")
  ;; (global-display-line-numbers-mode)
  ;; (fringe-mode 0)
  ;; (add-hook
  ;; 'after-init-hook
  ;; (lambda ()
  ;; (when (display-graphic-p)

  ;; )
  (delete-selection-mode 1)
  (setq indicate-buffer-boundaries nil
	indicate-empty-lines nil)
  ;; (set-fringe-mode 0)
  ;; ))
  )
;; (use-package mood-line
;; :ensure t
;; :config (add-hook 'elpaca-after-init-hook 'mood-line-mode)
;; :custom (mood-line-glyph-alist mood-line-glyphs-fira-code))
(use-package minions
  :ensure t)
;; (use-package doom-modeline
;;   :ensure t
;;   :custom (doom-modeline-height 28)
;;   ;; :hook (after-init . doom-modeline-mode)
;;   :config
;;   (add-hook 'elpaca-after-init-hook 'doom-modeline-mode)
;;   (setq-default mode-line-format nil)
;;   )
;; (use-package dashboard :ensure nil
;;   :config
;;   (setopt dashboard-startup-banner (expand-file-name "logo/ucas.svg" user-emacs-directory)
;; 	  dashboard-banner-logo-title "I like vanilla style."
;; 	  dashboard-center-content t
;; 	  dashboard-vertically-center-content t
;; 	  dashboard-items '((recents . 5))
;; 	  )
;;   (setq dashboard-footer-messages '("Sinofine Lotusie's Emacs Configuration."))
;;   (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
;;   (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
;;   (dashboard-setup-startup-hook))
;; (use-package splash-screen
;;   :ensure (splash-screen :host github :repo "rougier/emacs-splash"
;; 			 :files ("splash-screen.el"))
;;   :init (splash-screen))
;; (use-package modus-themes :ensure t
;;   :config (load-theme 'modus-operandi t))
;; (use-package tao-theme :ensure t
;;   :config
;;   (load-theme 'tao-yang t))
;; (use-package one-themes
;;   :ensure t
;;   :init
;;   (load-theme 'one-light t))
;; (use-package printed-theme
;;   :ensure (printed-theme :host github :repo "DogLooksGood/printed-theme"
;; 			 :files ("printed-theme.el"))
;;   :init
;;   (load-theme 'printed t))
(use-package writeroom-mode :ensure t
  :bind ("C-c u w" . writeroom-mode))
(use-package cn-zodiac-time
  :ensure (cn-zodiac-time :host github :repo "camdez/cn-zodiac-time.el"
			  :files ("cn-zodiac-time.el"))
  :config
  (add-hook 'elpaca-after-init-hook
	    (lambda () (setq display-time-string-forms '((cn-zodiac-time 'branches)))
	      (display-time-mode))))

(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font t ;;"fontset-default"
                    charset
		    (font-spec :family "等距更纱宋体 Slab SC" :weight 'medium )))
;; (setopt header-line-format nil)
(add-to-list 'default-frame-alist '(font . "CMU Typewriter Text-18"))
(set-frame-font (font-spec :family "CMU Typewriter Text" :size 18) nil t)
(add-to-list 'default-frame-alist '(width . 90))
(add-to-list 'default-frame-alist '(height . 27))
(defun display-startup-echo-area-message () nil)
(provide 'init-ui)
