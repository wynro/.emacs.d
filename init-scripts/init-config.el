;; defuns to work with the init file
;; Timestamp: <2015-08-14 - 21:21>

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

