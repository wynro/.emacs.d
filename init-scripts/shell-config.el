;;; shell-config.el --- Shell configuration
;;; Commentary:
;;; Nothing more
;;; Code:

(global-set-key [f5] 'ansi-term)

(setq explicit-shell-file-name "/bin/bash")

(add-hook 'term-mode-hook
          (lambda ()
            (interactive)
            (if (bound-and-true-p hc-highlight-trailing-whitespace-p)
                (hc-toggle-highlight-trailing-whitespace)
              )
            )
          )

(provide 'shell-config)
;;; shell-config.el ends here
