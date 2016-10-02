(require 'cobol-mode)
(add-to-list 'auto-mode-alist '("\\.cob\\'" . cobol-mode))

(setq hc-other-chars '("."))

(add-hook 'cobol-mode-hook '(lambda ()
                              (whitespace-mode)
                              (hc-toggle-highlight-other-chars)
                              (column-marker-1 6)
                              (column-marker-2 72)
                              )
          )
