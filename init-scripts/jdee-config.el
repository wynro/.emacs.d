;; JDEE initializer
;; Timestamp: <2015-10-20 - 23:07>


;; (defun jde-mode ()
;;   jdee-mode
;;   )
;; (autoload 'jde-mode "jdee.el" "JDE mode" t)
(load "jdee.el")
(add-to-list 'auto-mode-alist
	     '("\\.java\\'" . jdee-mode))
