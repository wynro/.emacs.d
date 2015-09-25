;; Commands related with MAKE system

(defun make ()
  "Calls the make command in the current directory"
  (interactive)
  (shell-command "make")
)

(defun make-clean ()
  "Calls the clear objective in the current dir make"
  (interactive)
  (shell-command "make clean")
)

(defun make-go ()
  "Calls the go objective in the current dir make"
  (interactive)
  (shell-command "make go")
)

(defun make-doxy ()
  "Calls the go objective in the current dir make"
  (interactive)
  (shell-command "make doxy")
)
