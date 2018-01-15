;;; emms-config.el --- Emms configuration
;;; Commentary:
;;; 
;;; Code:

(use-package emms
  :ensure t
  :defines
  emms-source-file-default-directory
  :config
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/")
  :bind (
         ("C-'" . emms-playlist-mode-go)
         ("C-\"" . emms-add-directory)
         ("C-M-\"" . emms-add-file)
         ([C-XF86AudioPlay] . emms-pause)
         ([C-XF86AudioStop] . emms-stop)
         ([C-XF86AudioNext] . emms-next)
         ([C-XF86AudioPrev] . emms-previous)
         ;; This is a terrible hack, but apparently Emacs interprets
         ;; Control+Fn as [C-XF86WakeUp], so I've added this to
         ;; silence the messages of not bounded
         ([C-XF86WakeUp] . nil)
         )
  )



(provide 'emms-config)
;;; emms-config.el ends here
