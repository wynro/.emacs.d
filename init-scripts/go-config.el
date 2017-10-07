;;; go-config.el --- Go configuration
;;; Commentary:
;;; Some packages and variables
;;; Code:

(require 'go-mode)
(require 'go-guru)
;; (require 'exec-path-from-shell)

;; (defun set-exec-path-from-shell-PATH ()
;;   "Set the exec PATH as defined in the shell."
;;   (let ((path-from-shell (replace-regexp-in-string
;;                           "[ \t\n]*$"
;;                           ""
;;                           (shell-command-to-string "/bin/bash --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq eshell-path-env path-from-shell) ; for eshell users
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/home/guillermo/.gocode")
(setenv "PATH" "/home/guillermo/.cabal/bin:/home/guillermo/bin:/usr/lib/go/bin:/home/guillermo/.gocode/bin:/home/guillermo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin")

(add-to-list 'exec-path "/home/guillermo/.gocode/bin")
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'go-config)
;;; go-config.el ends here
