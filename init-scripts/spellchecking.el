;; Spellchecking in multiple languages
;; Timestamp: <2015-08-26 - 13:35>

;; Keybindings
;; - C-c s e: activate spellchecking in english
;; - C-c s s: activate spellchecking in spanish

;; Spellchecking (in spanish) on the fly
(defun flyspell-mode-es ()
  "Activate Spanish spell checking using flyspell"
  (interactive)
  (flyspell-mode)
  (ispell-change-dictionary "castellano")
  )

;; Key bindings
(global-set-key "\C-c s e" 'flyspell-mode)
(global-set-key "\C-c s s" 'flyspell-es-mode)
