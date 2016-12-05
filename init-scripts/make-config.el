;;; make-config.el --- Make configuration
;;; Commentary:
;;;
;;; Code:

(defun make ()
  "Call the make command in the current directory."
  (interactive)
  (shell-command "make")
  )

(defun make-clean ()
  "Call the clear objective in the current directory."
  (interactive)
  (shell-command "make clean")
  )

(defun make-go ()
  "Call the go objective in the current directory."
  (interactive)
  (shell-command "make go")
  )

(defun make-doxy ()
  "Call the go objective in the current directory."
  (interactive)
  (shell-command "make doxy")
  )

(provide 'make-config)
;;; make-config.el ends here
