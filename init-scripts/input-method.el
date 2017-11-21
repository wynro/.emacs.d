;;; input-method.el --- Keybindings to change input method
;;; Commentary:
;;; Currently supported:
;;;  latin-1-prefix:  C-c i l
;;;  japanese:        C-c i j
;;; Code:

(set-input-method 'latin-1-prefix)

(global-set-key (kbd "C-c i j")
                (lambda ()
                  (interactive)
                  (set-input-method 'japanese)))

(global-set-key (kbd "C-c i l")
                (lambda ()
                  (interactive)
                  (set-input-method 'latin-1-prefix)))

(provide 'input-method)
;;; input-method.el ends here
