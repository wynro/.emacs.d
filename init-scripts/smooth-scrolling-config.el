;;; smooth-scrolling-config.el --- Smooth scrolling configuration
;;; Commentary:
;;;
;;; Code:

(use-package smooth-scrolling
  :ensure t
  :config
  (setq scroll-conservatively 10)
  (setq scroll-margin 5)
)

(provide 'smooth-scrolling-config)
;;; smooth-scrolling.el ends here
