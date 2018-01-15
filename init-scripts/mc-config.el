;;; mc-config.el --- mc configuration
;;; Commentary:
;;;
;;; Code:

(use-package multiple-cursors
  :ensure t
  :bind (
         ("C-c m l" . mc/edit-lines)
         ("C-c m a" . mc/mark-all-dwim)
         ("C-c m A" . mc/mark-all-like-this-dwim)
         ("C-c m m" . mc/mark-all-like-this)
         ("C-c m n" . mc/mark-next-like-this)
         ))


(provide 'mc-config)
;;; mc-config.el ends here
