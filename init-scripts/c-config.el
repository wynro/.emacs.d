;;; c-config.el --- My C configuration
;;; Commentary:
;;; Nothing in particular (except that I prefer the Kernighan and
;;; Ritchie style)
;;; Code:

;; C coding standard as defined for Linux kernel
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (defvar c-basic-offset)
  (setq c-basic-offset 8))

(provide 'c-config)
;;; c-config.el ends here
