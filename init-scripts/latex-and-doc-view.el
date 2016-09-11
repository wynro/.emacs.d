;; Configuration combined for LaTeX (AUCTeX) and DocView

;; LaTeX
;; FIXME
;; (defun latex-my-keys()
;;   "Modify keymaps used by `latex-mode'."
;;   (local-set-key (kbd "C-c c") 'my-bold-word)
;;   
(add-to-list 'load-path (concat init-scripts "latex-preview-pane/"))
(load "latex-preview-pane.el")

;; DocView

;; (define-key doc-view-mode-map "g" (doc-view-revert-buffer 1 1))

;; Personalized command, not standard
(setq pdf-latex-command "fullbibtex-x")

;; Change compiler for compatibility reasons
(defun latex-compiler-pdflatex ()
  (interactive)
  (setq pdf-latex-command "fullbibtex-p")
)

(defun latex-compiler-xelatex ()
  (interactive)
  (setq pdf-latex-command "fullbibtex-x")
)

(defun doc-view-my-keys()
  "Modify keymaps used by `doc-view-mode'."
  (local-set-key (kbd "C-g") (doc-view-revert-buffer 1 1))
  )

(defun buffer-mode (&optional buffer-or-name)
  "Returns the major mode associated with a buffer.
If buffer-or-name is nil return current buffer's mode."
  (buffer-local-value 'major-mode
                      (if buffer-or-name
                          (get-buffer buffer-or-name) (current-buffer)
                          )
                      )
  )

(defun latex-quita-acentos()
  (interactive)
  (if (eq (buffer-mode) 'latex-mode)
      (save-excursion
        (beginning-of-buffer)
        (replace-string "á" "\\'a")
        (beginning-of-buffer)
        (replace-string "é" "\\'e")
        (beginning-of-buffer)
        (replace-string "í" "\\'i")
        (beginning-of-buffer)
        (replace-string "ó" "\\'o")
        (beginning-of-buffer)
        (replace-string "ú" "\\'u")
        (beginning-of-buffer)
        (replace-string "ñ" "\\~n")
        )
    )
  )

(defun latex-pon-acentos()
  (interactive)
  (if (eq (buffer-mode) 'latex-mode)
      (save-excursion
        (beginning-of-buffer)
        (replace-string "\\'a" "á")
        (beginning-of-buffer)
        (replace-string "\\'e" "é")
        (beginning-of-buffer)
        (replace-string "\\'i" "í")
        (beginning-of-buffer)
        (replace-string "\\'o" "ó")
        (beginning-of-buffer)
        (replace-string "\\'u" "ú")
        (beginning-of-buffer)
        (replace-string "\\~n" "ñ")
        )
    )
  )

(defun latex-preview()
  (latex-mode)
  (latex-preview-pane-mode)
  )

(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-preview))
(add-to-list 'auto-mode-alist '("\\.sty\\'" . latex-mode))
;; (add-hook 'latex-mode-hook 'latex-preview-pane-mode)
(add-hook 'doc-view-mode-hook 'doc-view-my-keys)
;; (add-hook 'before-save-hook 'latex-quita-acentos)
;; (add-hook 'after-save-hook 'latex-pon-acentos)
