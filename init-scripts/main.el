;; File that loads all the necessary files in the directory
;; Timestamp: <2015-11-28 - 12:33>

(load "backup.el")			; (find-file "backup.el")
(load "buffer-defuns.el")		; (find-file "buffer-defuns.el")
(load "calc-config.el")			; (find-file "calc-config.el")
(load "c-config.el")			; (find-file "c-config.el")
(add-to-list 'load-path (concat init-scripts "haskell-mode/"))
(load "haskell-config.el")		; 
(add-to-list 'load-path (concat init-scripts "emms/lisp/"))
(load "emms-config.el")			; (find-file "emms-config.el")
(load "eval-and-replace.el")		; (find-file "eval-and-replace.el")
(load "evil-config.el")			; (find-file "evil-config.el")
(load "google-translate-config.el")	; (find-file "google-translate-config.el")
(load "graphviz-dot-mode.el")		; (find-file "graphviz-dot-mode")
(load "init-config.el")			; (find-file "init-config.el")
(load "isearch.el")			; (find-file "isearch.el")
(add-to-list 'load-path (concat init-scripts "jdee/"))
(load "jdee-config.el")			; (find-file "jdee-config.el")
(load "latex-and-doc-view.el")		; (find-file "latex-and-doc-view.el")
(load "magit-config.el")  		; (find-file "magit-config.el")
;; (load "main.el")                     ; Unnecesary/ infinite loop
(load "make-config.el")			; (find-file "make-config.el")
;; (load "multi-web-mode.el")           ; Loaded by mweb-config.el
(load "mweb-config.el")			; (find-file "mweb-config.el")
(load "org-config.el")			; (find-file "org-config.el")
(load "packages.el")			; (find-file "packages.el")
(load "production-code.el")		; (find-file "production-code.el")
(load "spellchecking.el")		; (find-file "spellchecking.el")
(load "tetris-config.el")		; (find-file "tetris-config.el")
(load "timestamp.el")			; (find-file "timestamp.el")
(load "typing-practice.el")		; (find-file "typing-practice.el")
(load "web-ide.el")			; (find-file "web-ide.el")
;; (java-snippets :fetcher github :repo "nekop/yasnippet-java-mode"
;;                :files ("*.el" "snippets"))
(add-to-list 'load-path (concat init-scripts "yasnippet/"))
(require 'yasnippet)
(yas-global-mode 1)
