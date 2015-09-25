;; Functions about buffers
;; Timestamp: <2015-08-14 - 21:16>

;; Keybinding
;; - C-x 2: Open new frame at the right
;; - C-x 3: Open new frame at the bottom
;; - C-c n: Tabify, indent and cleanup buffer

(defun create-scratch-buffer nil
  "Create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)
    )
  )

(defun split-window-right-and-move-there-dammit ()
  (interactive)
  (split-window-right)
  (windmove-right))
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

(defun split-window-down-and-move-there-dammit ()
  (interactive)
  (split-window-below)
  (windmove-down))
(global-set-key (kbd "C-x 2") 'split-window-down-and-move-there-dammit)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a
buffer. Including indent-buffer, which should not be called
automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer)
  )

(global-set-key (kbd "C-c n") 'cleanup-buffer)
