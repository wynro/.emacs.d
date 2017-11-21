;;; highlight-chars-config.el --- Highlight configuration
;;; Commentary:
;;;
;;; Code:

(defvar init-scripts)
(add-to-list 'load-path (concat init-scripts "highlight-chars/"))
(load "highlight-chars.el")

(add-hook 'prog-mode-hook 'hc-toggle-highlight-trailing-whitespace)

(provide 'highlight-chars-config)
;;; highlight-chars-config.el ends here
