;;;init-org.el -*- lexical-binding: t -*-
(use-package org
  :defer t
  :ensure `(org
	    :remotes ("fork" :host nil
			 :repo "https://git.tecosaur.net/tec/org-mode.git"
			 :branch "dev"
			 :remote "tecosaur")
	    :files (:defaults "etc")
	    :build t
	    :pre-build
	    (with-temp-file "org-version.el"
               (require 'lisp-mnt)
               (let ((version
                     (with-temp-buffer
                       (insert-file-contents "lisp/org.el")
                       (lm-header "version")))
                     (git-version
                     (string-trim
                      (with-temp-buffer
                        (call-process "git" nil t nil "rev-parse" "--short" "HEAD")
                        (buffer-string)))))
                 (insert
                  (format "(defun org-release () \"The release version of Org.\" %S)\n" version)
                  (format "(defun org-git-version () \"The truncate git commit hash of Org mode.\" %S)\n" git-version)
                  "(provide 'org-version)\n")))
	    :pin nil))
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
(use-package org-roam
  :ensure t
  :defer t
  :custom (org-roam-directory (file-truename "~/org/roam/"))
  ;; (org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  :init (org-roam-db-autosync-mode)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)))
(use-package org-roam-ui
  :ensure t
  :after org-roam
  :defer t
  ;; :bind (("C-c r u" . org-roam-ui-mode))
  )
(provide 'init-org)
