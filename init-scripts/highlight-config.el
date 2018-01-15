;;; highlight-configm.el --- Highlight configuration
;;; Commentary:
;;;
;;; Code:

(use-package highlight-chars
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'hc-toggle-highlight-trailing-whitespace)
)

(provide 'highlight-config)
;;; mhighlight-configm.el ends here
