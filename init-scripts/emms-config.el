;; File that loads emms configuration

(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "/media/guillermo/WD_wynro/Music/")

;; (define-prefix-command 'emms-map)
(global-set-key (kbd "C-M-,") 'emms-playlist-mode-go)
(global-set-key (kbd "C-M-;") 'emms-add-directory)
