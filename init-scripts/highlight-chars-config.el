;;; highlight-chars-config.el --- Highlight configuration
;;; Commentary:
;;;
;;; Code:

(defvar init-scripts)
(add-to-list 'load-path (concat init-scripts "highlight-chars/"))
(load "highlight-chars.el")

(add-hook 'prog-mode-hook 'hc-toggle-highlight-trailing-whitespace)


(global-hl-line-mode)                   ; Activate hl-line everywhere

(set-face-background 'highlight "#222") ; Add a light grey as background
(set-face-foreground 'highlight nil)    ; No foreground
(set-face-underline  'highlight nil)    ; No underline

(provide 'highlight-chars-config)
;;; highlight-chars-config.el ends here
