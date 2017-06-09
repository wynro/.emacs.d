;;; main-config.el --- Main configuration file
;;; Commentary:
;; File that loads all the necessary files in the directory

;;; Code:
;; (require 'achievements-config)         ; (find-file "achievements-config.el")
(require 'backup)                      ; (find-file "backup.el")
(require 'buffer-defuns)               ; (find-file "buffer-defuns.el")
(require 'calc-config)                 ; (find-file "calc-config.el")
(require 'c-config)                    ; (find-file "c-config.el")
(require 'cobol-mode-config)           ; (find-file "cobol-mode-config.el")
(require 'company-mode-config)         ; (find-file "company-mode-config.el")
(require 'column-marker-config)        ; (find-file "column-marker-config.el")
;; (require 'dashboard-config)            ; (find-file "emacs-dashboard-config.el")
(require 'flycheck-config)             ; (find-file "flycheck-config.el")
(require 'go-config)		               ; (find-file "go-config.el")
(require 'haskell-config)              ; (find-file "haskell-config.el")
(require 'emms-config)                 ; (find-file "emms-config.el")
(require 'eval-and-replace)            ; (find-file "eval-and-replace.el")
(require 'evil-config)                 ; (find-file "evil-config.el")
;; (require 'google-translate-config)     ; (find-file "google-translate-config.el")
(require 'functions)                   ; (find-file "functions.el")
(require 'highlight-chars-config)      ; (find-file "highlight-chars-config.el")
(require 'init-config)                 ; (find-file "init-config.el")
(require 'isearch)                     ; (find-file "isearch.el")
(require 'ipcalc-config)               ; (find-file "ipcalc-config.el")
(require 'jdee-config)                 ; (find-file "jdee-config.el")
(require 'latex-and-doc-view)          ; (find-file "latex-and-doc-view.el")
(require 'magit-config)                ; (find-file "magit-config.el")
;; (require 'main)                     ; Unnecesary/infinite loop
(require 'make-config)                 ; (find-file "make-config.el")
(require 'mc-config)                   ; (find-file "mc-config.el")
;; (require 'multi-web-mode)           ; Loaded by mweb-config.el
(require 'mweb-config)                 ; (find-file "mweb-config.el")
(require 'org-config)                  ; (find-file "org-config.el")
(require 'shell-config)                ; (find-file "shell-config.el")
(require 'smooth-scrolling)            ; (find-file "smooth-scrolling.el")
(require 'spellchecking)               ; (find-file "spellchecking.el")
(require 'tetris-config)               ; (find-file "tetris-config.el")
(require 'theme-config)                ; (find-file "tetris-config.el")
(require 'timestamp)                   ; (find-file "timestamp.el")
(require 'typing-practice)             ; (find-file "typing-practice.el")
(require 'undo-config)                 ; (find-file "undo-config.el")
(require 'web-ide)                     ; (find-file "web-ide.el")
(require 'yasnippet-config)            ; (find-file "yasnippet-config.el")

(provide 'main-config)
;;; main-config.el ends here
