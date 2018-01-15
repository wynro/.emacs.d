;;; org-config.el --- org-mode configuration
;;; Commentary:
;;;
;;; Code:

(use-package org
  :ensure t
  :bind (("C-c a" . org-agenda)
	 ("C-c c" . org-capture))
  :defines (org-src-tab-acts-natively)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (ruby . t)
     (python . t)
     ))
  (setq org-src-tab-acts-natively t)
  )

(provide 'org-config)
;;; org-config.el ends here
