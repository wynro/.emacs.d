;;; ace-jump-mode-config.el --- Configuration for ace-jump
;;; Commentary:
;;;
;;; Code:

(use-package ace-jump-mode
  :ensure t
  :bind (
         ("C-c C-SPC" . ace-jump-mode)
         ("C-c SPC"   . ace-jump-mode-pop-mark)
         )
  )

(provide 'ace-jump-mode-config)
;;; ace-jump-mode-config.el ends here
