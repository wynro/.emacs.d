;; Configuration for tetris
;; Timestamp: <2015-08-14 - 21:22>

(require 'tetris)
(setq tetris-score-file
      "~/.emacs.d/tetris-scores")
(define-key tetris-mode-map "n"     'tetris-start-game)
(define-key tetris-mode-map "q"     'tetris-end-game)
(define-key tetris-mode-map "p"     'tetris-pause-game)
(define-key tetris-mode-map "\r"    'tetris-move-bottom)
(define-key tetris-mode-map [left]  'tetris-move-left)
(define-key tetris-mode-map [right] 'tetris-move-right)
(define-key tetris-mode-map [up]    'tetris-rotate-prev)
(define-key tetris-mode-map [down]  'tetris-rotate-next)
