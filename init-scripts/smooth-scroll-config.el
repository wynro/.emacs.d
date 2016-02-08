;; Timestamp: <2016-02-08 - 13:40>
;; Configuration for smooth-scroll package

(require 'smooth-scroll)
(smooth-scroll-mode 1)
(setq smooth-scroll/vscroll-step-size 5)

;; (defun window-half-height ()
;;  (max 1 (/ (1- (window-height (selected-window))) 2)))

;;  (defun own-scroll-down-half ()
;;   interactive)
;;   (previous-line (window-half-height))
;;   (scroll-down (window-half-height)))
