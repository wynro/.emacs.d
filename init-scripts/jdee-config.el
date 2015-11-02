;; JDEE initializer
;; Timestamp: <2015-10-27 - 11:42>


;; (defun jde-mode ()
;;   jdee-mode
;;   )
(autoload 'jdee-mode "jdee.el" "JDE mode" t)
;; (load "jdee.el")
(add-to-list 'auto-mode-alist
	     '("\\.java\\'" . jdee-mode))
