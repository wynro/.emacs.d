;;; flycheck-config.el --- Flycheck configuration
;;; Commentary:
;;;
;;; Code:

(use-package flycheck
  :ensure t
  :init (add-hook 'prog-mode-hook #'global-flycheck-mode)
)

(provide 'flycheck-config)
;;; flycheck-config.el ends here
