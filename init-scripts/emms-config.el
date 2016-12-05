;;; emms-config.el --- Emms configuration
;;; Commentary:
;;; 
;;; Code:

(emms-all)
(emms-default-players)
(defvar emms-source-file-default-directory)
(setq emms-source-file-default-directory "~/Music/")

(global-set-key (kbd "C-'") 'emms-playlist-mode-go)
(global-set-key (kbd "C-\"") 'emms-add-directory)

(provide 'emms-config)
;;; emms-config.el ends here
