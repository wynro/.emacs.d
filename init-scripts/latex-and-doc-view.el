;; Configuration combined for LaTeX (AUCTeX) and DocView
;; Timestamp: <2015-10-03 - 20:57>

;; LaTeX
;; FIXME
;; (defun latex-my-keys()
;;   "Modify keymaps used by `latex-mode'."
;;   (local-set-key (kbd "C-c C-c") 'my-bold-word)
;;   )

;; DocView

;; (define-key doc-view-mode-map "g" (doc-view-revert-buffer 1 1))
(defun doc-view-my-keys()
  "Modify keymaps used by `doc-view-mode'."
  (local-set-key (kbd "C-g") (doc-view-revert-buffer 1 1))
  )
(add-hook 'doc-view-mode-hook 'doc-view-my-keys)
