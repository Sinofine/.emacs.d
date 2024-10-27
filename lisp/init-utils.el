(defun sinofine-native-compile-packages ()
  "Native-compile all packages."
  (interactive)
  (native-compile-async elpaca-builds-directory 'recursively))
(defun sinofine-native-compile-config ()
  "Native-compile config"
  (interactive)
  (native-compile-async (mapcar (lambda (file)
				  (expand-file-name file user-emacs-directory)) '("init.el" "early-init.el")))
  (native-compile-async (expand-file-name "lisp/" user-emacs-directory) 'recursively))
(provide 'init-utils)
