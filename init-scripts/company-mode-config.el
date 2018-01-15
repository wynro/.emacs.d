;;; company-mode-config.el --- Company mode configuration
;;; Commentary:
;;;
;;; Code:

(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0)
  )

(use-package company-statistics
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-statistics-mode)
  )

(provide 'company-mode-config)
;;; company-mode-config.el ends here
