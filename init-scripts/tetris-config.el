;;; tetris-config.el --- tetris configuration
;;; Commentary:
;;;
;;; Code:

(use-package tetris
  :ensure t
  :config
  (setq tetris-score-file "~/.emacs.d/games/tetris-scores")
  ;; (defun tetris()"DONT PLAY."(interactive)(message "DONT PLAY"))
  :bind (("C-c t" . tetris))
  :bind (:map tetris-mode-map
              ("n"     . tetris-start-game)
              ("q"     . tetris-end-game)
              ("p"     . tetris-pause-game)
              ("\r"    . tetris-move-bottom)
              ([left]  . tetris-move-left)
              ([right] . tetris-move-right)
              ([up]    . tetris-rotate-prev)
              ([down]  . tetris-rotate-next)
              )
  )

(provide 'tetris-config)
;;; tetris-config.el ends here
