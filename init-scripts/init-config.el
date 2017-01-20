;;; init-config.el --- Defuns to work with the init file
;;; Commentary:
;;; Just a bunch of random functions
;;; Code:

;; Open init file
(defun init-file()
  (interactive)
  (find-file (concat init-emacs.d "init.el"))
  )

;; Recompile init file
(defun init-file-c()
  (interactive)
  (byte-compile-file (concat init-emacs.d "init.el"))
  )

;; Recompile init file
(defun init-main()
  (interactive)
  (find-file (concat init-emacs.d "init-scripts/main.el"))
  )

(provide 'init-config)
;;; init-config.el ends here
