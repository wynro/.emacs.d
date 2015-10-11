;; File that loads all the files in the directory
;; Timestamp: <2015-10-03 - 20:54>

(load "backup.el")
(load "buffer-defuns.el")
(load "calc-config.el")
(load "c-config.el")
(load "eval-and-replace.el")
(load "evil-config.el")
(load "google-translate-config.el")
(load "init-config.el")
(load "isearch.el")
(load "latex-and-doc-view.el")
;; (load "main.el") ;; Unnecesary
(load "make-config.el")
;; (load "multi-web-mode.el") ;; Loaded by mweb-config.el
(load "mweb-config.el")
(load "org-config.el")
(load "packages.el")
(load "production-code.el")
(load "spellchecking.el")
(load "tetris-config.el")
(load "timestamp.el")
(load "typing-practice.el")
(load "web-ide.el")
(defvar init-yasnipet (concat init-scripts "yasnippet/"))
(add-to-list 'load-path init-yasnipet)
(require 'yasnippet)
(yas-global-mode 1)
