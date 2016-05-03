;; Configuration for tetris

(require 'tetris)
(setq tetris-score-file
      "~/.emacs.d/games/tetris-scores")

(global-set-key (kbd "C-c C-t") 'tetris)
(define-key tetris-mode-map "n"     'tetris-start-game)
(define-key tetris-mode-map "q"     'tetris-end-game)
(define-key tetris-mode-map "p"     'tetris-pause-game)
(define-key tetris-mode-map "\r"    'tetris-move-bottom)
(define-key tetris-mode-map [left]  'tetris-move-left)
(define-key tetris-mode-map [right] 'tetris-move-right)
(define-key tetris-mode-map [up]    'tetris-rotate-prev)
(define-key tetris-mode-map [down]  'tetris-rotate-next)
