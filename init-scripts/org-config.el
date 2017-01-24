;;; org-config.el --- org-mode configuration
;;; Commentary:
;;;
;;; Code:

(require 'org)
;; Experiments with org-mode, mainly keybindings
;; C-c a for agenda
(global-set-key (kbd "C-c a") 'org-agenda)
;; C-e c for capture
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'org-config)
;;; org-config.el ends here
