;;; isearch.el --- Interactive search configuration
;;; Commentary:
;;;
;;; Code:

;; Change the default search system with one that uses regexp
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'isearch)
;;; isearch.el ends here
