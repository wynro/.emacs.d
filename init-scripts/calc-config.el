;;; calc-config.el --- Calc configuration
;;; Commentary:
;;;
;;; Code:

(defvar calc-window-height 14)
(defvar calc-internal-prec 20)
(defvar calc-complex-format 'i)
(defvar calc-prefer-frac nil)

(defun calc-open()
  (interactive)
  (calc-keypad)
  (other-window 2)
  (delete-window)
  (other-window -1)
  )

(global-set-key (kbd "C-x %") 'calc-open)

(provide 'calc-config)
;;; calc-config.el ends here
