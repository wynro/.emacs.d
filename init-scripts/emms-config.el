;; File that loads emms configuration

(emms-all)
(emms-default-players)
(defvar emms-source-file-default-directory)
(setq emms-source-file-default-directory "~/Music/")

;; (define-prefix-command 'emms-map)
(global-set-key (kbd "C-'") 'emms-playlist-mode-go)
(global-set-key (kbd "C-\"") 'emms-add-directory)
