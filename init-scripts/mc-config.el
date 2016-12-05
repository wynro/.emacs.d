;;; mc-config.el --- mc configuration
;;; Commentary:
;;;
;;; Code:

(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m a") 'mc/mark-all-dwim)
(global-set-key (kbd "C-c m A") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-c m m") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m M") 'mc/mark-all-like-this)

(provide 'mc-config)
;;; mc-config.el ends here
