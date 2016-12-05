 ;;; spellchecking.el --- Spellchecking configuration
;;; Commentary:
;;;
;;; Code:

;; Spellchecking (in spanish)
(defun flyspell-mode-es ()
  "Activate Spanish spell checking using flyspell."
  (interactive)
  (flyspell-mode)
  (ispell-change-dictionary "castellano")
  )

(defun ispell-next-word ()
  "Go to the next error."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )

;; Key bindings
(defvar spellchecking-map)
(define-prefix-command 'spellchecking-map)
(global-set-key (kbd "C-c s") 'spellchecking-map)
(define-key spellchecking-map (kbd "e") 'flyspell-mode)
(define-key spellchecking-map (kbd "s") 'flyspell-mode-es)
(define-key spellchecking-map (kbd "b") 'flyspell-buffer)
(define-key spellchecking-map (kbd "z") 'flyspell-goto-next-error)
(define-key spellchecking-map (kbd "a") 'ispell-word)

(provide 'spellchecking)
;;; spellchecking.el ends here
