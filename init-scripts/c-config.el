;; Modifications for C coding
;; Timestamp: <2015-08-14 - 20:31>

;; C coding standard as defined for Linux kernel
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8))
