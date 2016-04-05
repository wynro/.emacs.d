;; JDEE initializer

;; (defun jde-mode ()
;;   jdee-mode
;;   )
(autoload 'jdee-mode "jdee.el" "JDE mode" t)
;; (load "jdee.el")
(add-to-list 'auto-mode-alist
	     '("\\.java\\'" . jdee-mode))
