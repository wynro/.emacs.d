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

(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (shell . t)
                               (ruby . t)
                               (python . t)
                               )
                             )
(setq org-src-tab-acts-natively t)      ;; Activate tabs in BEGIN_SRC blocks

(provide 'org-config)
;;; org-config.el ends here
