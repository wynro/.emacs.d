;; Functions to translate from development code to production code
;; Timestamp: <2015-08-14 - 21:54>

(defun delete-production-code ()
  "Delete all lines containing the string \"<!PROD\""
  (interactive)
  (flush-lines "<!PROD")
)

;; (global-set-key (kbd "C-x e") 'delete-production-code)
