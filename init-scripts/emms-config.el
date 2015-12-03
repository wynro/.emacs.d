;; File that loads all the files in the directory
;; Timestamp: <2015-11-24 - 22:29>

(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "/media/guillermo/WD_wynro/Music/")

;; (define-prefix-command 'emms-map)
(global-set-key (kbd "C-M-;") 'emms-playlist-mode-go)
(global-set-key (kbd "C-M-,") 'emms-add-directory)
