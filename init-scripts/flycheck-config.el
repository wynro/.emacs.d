;;; flycheck-config.el --- Flycheck configuration
;;; Commentary:
;;;
;;; Code:

(require 'flycheck)
(add-hook 'prog-mode-hook #'global-flycheck-mode)

(provide 'flycheck-config)
;;; flycheck-config.el ends here
