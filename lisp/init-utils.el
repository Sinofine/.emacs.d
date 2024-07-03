(defun sinofine-native-compile-packages ()
  "Native-compile all packages."
  (interactive)
  (native-compile-async elpaca-builds-directory 'recursively))

(provide 'init-utils)
