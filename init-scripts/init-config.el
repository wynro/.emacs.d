;; defuns to work with the init file

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

