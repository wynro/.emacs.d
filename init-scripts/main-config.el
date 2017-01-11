;;; main-config.el --- Main configuration file
;;; Commentary:
;; File that loads all the necessary files in the directory

;;; Code:
(load "achievements-config.el")         ; (find-file "achievements-config.el")
(load "backup.el")                      ; (find-file "backup.el")
(load "buffer-defuns.el")               ; (find-file "buffer-defuns.el")
(load "calc-config.el")                 ; (find-file "calc-config.el")
(load "c-config.el")                    ; (find-file "c-config.el")
(load "cobol-mode-config.el")           ; (find-file "cobol-mode-config.el")
(load "company-mode-config.el")         ; (find-file "company-mode-config.el")
(load "column-marker-config.el")        ; (find-file "column-marker-config.el")
;; (load "dashboard-config.el")            ; (find-file "emacs-dashboard-config.el")
(load "flycheck-config.el")             ; (find-file "flycheck-config.el")
(load "haskell-config.el")              ; (find-file "haskell-config.el")
(load "emms-config.el")                 ; (find-file "emms-config.el")
(load "eval-and-replace.el")            ; (find-file "eval-and-replace.el")
(load "evil-config.el")                 ; (find-file "evil-config.el")
;; (load "google-translate-config.el")     ; (find-file "google-translate-config.el")
(load "functions.el")                   ; (find-file "functions.el")
(load "highlight-chars-config.el")      ; (find-file "highlight-chars-config.el")
(load "init-config.el")                 ; (find-file "init-config.el")
(load "isearch.el")                     ; (find-file "isearch.el")
(load "ipcalc-config.el")               ; (find-file "ipcalc-config.el")
(load "jdee-config.el")                 ; (find-file "jdee-config.el")
(load "latex-and-doc-view.el")          ; (find-file "latex-and-doc-view.el")
(load "magit-config.el")                ; (find-file "magit-config.el")
;; (load "main.el")                     ; Unnecesary/infinite loop
(load "make-config.el")                 ; (find-file "make-config.el")
(load "mc-config.el")                   ; (find-file "mc-config.el")
;; (load "multi-web-mode.el")           ; Loaded by mweb-config.el
(load "mweb-config.el")                 ; (find-file "mweb-config.el")
(load "org-config.el")                  ; (find-file "org-config.el")
(load "smooth-scrolling.el")            ; (find-file "smooth-scrolling.el")
(load "spellchecking.el")               ; (find-file "spellchecking.el")
(load "tetris-config.el")               ; (find-file "tetris-config.el")
(load "theme-config.el")                ; (find-file "tetris-config.el")
(load "timestamp.el")                   ; (find-file "timestamp.el")
(load "typing-practice.el")             ; (find-file "typing-practice.el")
(load "undo-config.el")                 ; (find-file "undo-config.el")
(load "web-ide.el")                     ; (find-file "web-ide.el")
(load "yasnippet-config.el")            ; (find-file "yasnippet-config.el")

(provide 'main-config)
;;; main-config.el ends here