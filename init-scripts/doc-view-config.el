;; DocView configurations
;; (define-key doc-view-mode-map "g" (doc-view-revert-buffer 1 1))

(defun doc-view-my-keys()
  "Modify keymaps used by `doc-view-mode'."
  (local-set-key (kbd "C-g") (doc-view-revert-buffer 1 1))
  )

;; Load my keybindings
(add-hook 'doc-view-mode-hook 'doc-view-my-keys)
