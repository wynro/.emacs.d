;; Adition of a new command to replace a elisp expression
;; Timestamp: <2015-08-14 - 20:42>

;; Inclusion of a new combination (C-x e), which evaluates and
;; replaces the previous expression (in LISP type)
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1
       (eval (read (current-kill 0)))
       (current-buffer)
       )
    (error (message "Invalid expression")
           (insert (current-kill 0))
           )
    )
  )

;; This doesn't follow the convention that C-c is the prefix of all
;; the user commands, but is created with the knowledge that C-x C-e
;; is the eval-last-sexp command
(global-set-key (kbd "C-x e") 'eval-and-replace)

