;;; highlight-config.el --- Highlight configuration
;;; Commentary:
;;;
;;; Code:

(use-package highlight-chars
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'hc-toggle-highlight-trailing-whitespace)
)

(provide 'highlight-config)
;;; highlight-config.el ends here
