;; AUCTeX configuration

;;(add-to-list 'load-path (concat init-scripts "auctex/"))
;;(load "auctex.el")

;; Activate autosaving
(setq TeX-auto-save t)

;; Use document parsing (in order to get support for different
;; packages)
(setq TeX-parse-self t)

;; Useful for multifile documents
(setq-default TeX-master nil)

