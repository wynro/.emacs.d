;;; latex-and-doc-view.el --- Latex, auctex and l-p-p configuration
;;; Commentary:
;;;
;;; Code:

;; AUCTeX
;;(add-to-list 'load-path (concat init-scripts "auctex/"))
;;(load "auctex.el")

(defvar TeX-auto-save t) ;; Activate autosaving

(defvar TeX-parse-self t) ;; Use document parsing (in order to get
                          ;; support for different packages)

(setq-default TeX-master nil) ;; Useful for multifile documents

(setq-default TeX-engine 'xetex) ;; Configure TeX engine
(setq-default TeX-PDF-mode t)    ;; Output to PDF by default

;; latex-preview-pane
;; Manually load latex-preview-pane
(defvar init-scripts)
(add-to-list 'load-path (concat init-scripts "latex-preview-pane/"))
(load "latex-preview-pane.el")

;; Compile command for latex-preview-pane
(defvar pdf-latex-command)
(setq pdf-latex-command "xelatex")

;; Select mode for each TeX file
;;(add-hook 'latex-mode-hook 'latex-preview-pane-mode)
(add-to-list 'auto-mode-alist '("\\.sty\\'" . latex-mode))

(provide 'latex-and-doc-view)
;;; latex-and-doc-view.el ends here
