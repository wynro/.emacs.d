;; Spellchecking in multiple languages
;; Timestamp: <2016-02-03 - 20:51>

;; Keybindings
;; - C-M-z s e: activate spellchecking in english
;; - C-M-z s s: activate spellchecking in spanish

;; Spellchecking (in spanish) on the fly
(defun flyspell-mode-es ()
  "Activate Spanish spell checking using flyspell"
  (interactive)
  (flyspell-mode)
  (ispell-change-dictionary "castellano")
  )

;; (defun flyspell-mode-off ()
;;   (flyspell-mode)
;;   )

;; Key bindings
(define-prefix-command 'spellchecking-map)
(global-set-key (kbd "C-M-z") 'spellchecking-map)
(define-key spellchecking-map (kbd "s e") 'flyspell-mode)
(define-key spellchecking-map (kbd "s s") 'flyspell-mode-es)
(define-key spellchecking-map (kbd "b") 'flyspell-buffer)
(define-key spellchecking-map (kbd "n") 'flyspell-goto-next-error)
(define-key spellchecking-map (kbd "w") 'ispell-word)

;; (define-key spellchecking-map (kbd "x") 'flyspell-mode-es)
;; (global-set-key "C-M-x C-s C-e" 'flyspell-mode)
;; (global-set-key "C-M-x C-s C-s" 'flyspell-es-mode)

