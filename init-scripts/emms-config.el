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

(global-set-key [C-XF86AudioPlay] 'emms-pause)
(global-set-key [C-XF86AudioStop] 'emms-stop)
(global-set-key [C-XF86AudioNext] 'emms-next)
(global-set-key [C-XF86AudioPrev] 'emms-previous)

(defun nop ()
  "Does nothing."
  (interactive)
  )
;; This is a terrible hack, but apparently Emacs interprets Control+Fn
;; as [C-XF86WakeUp], so I add this to silence the messages of not
;; bounded
(global-set-key [C-XF86WakeUp] 'nop)

(provide 'emms-config)
;;; emms-config.el ends here
