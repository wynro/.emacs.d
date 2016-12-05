;; File that loads emms configuration

(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "/media/guillermo/WD_wynro/Music/")

;; (define-prefix-command 'emms-map)
(global-set-key (kbd "C-'") 'emms-playlist-mode-go)
(global-set-key (kbd "C-\"") 'emms-add-directory)
