;;; cobol-mode-config.el --- Cobol configuration
;;; Commentary:
;;;
;;; Code:

(use-package cobol-mode
  :ensure t
  :init
  (use-package column-marker
    :ensure t
    )                                   ;
  (add-hook 'cobol-mode-hook
            '(lambda ()
               (whitespace-mode)
               (column-marker-1 6)
               (column-marker-2 72)
               )
            )
  :mode (("\\.cob$" . cobol-mode)
         ("\\.cbl$" . cobol-mode)
         ("\\.cpy$" . cobol-mode)
         )
  )

(provide 'cobol-mode-config)
;;; cobol-mode-config.el ends here
