;; Calc configuration file

;; Changes to calc
(setq calc-window-height 14)
(setq calc-internal-prec 20)
(setq calc-complex-format 'i)
(setq calc-prefer-frac nil)
;;; End of mode settings

(defun calc-open()
  (interactive)
  (calc-keypad)
  (other-window 2)
  (kill-buffer)
  (delete-window)
  (other-window -1)
  )

(global-set-key (kbd "C-x ç") 'calc-open)
