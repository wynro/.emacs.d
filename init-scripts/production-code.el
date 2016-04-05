;; Functions to translate from development code to production code

(defun delete-production-code ()
  "Delete all lines containing the string \"<!PROD\""
  (interactive)
  (flush-lines "<!PROD")
)

;; (global-set-key (kbd "C-x e") 'delete-production-code)
