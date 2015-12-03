;; Configuración particular de magit
;; Timestamp:<2015-11-23 - 19:05>

(define-prefix-command 'magit-map)
(global-set-key (kbd "C-M-g") 'magit-map)
(define-key magit-map (kbd "s") 'magit-status)
;; (define-key spellchecking-map (kbd "s s") 'flyspell-mode-es)

