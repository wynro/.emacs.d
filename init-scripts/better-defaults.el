;;; better-defaults.el --- Some of the options in better defaults
;;; Commentary:
;;;
;;; Code:


(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Interactive search configuration
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'better-defaults)
;;; better-defaults.el ends here
