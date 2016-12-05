;; Configuration combined for LaTeX (AUCTeX) and latex-preview-pane

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
(add-to-list 'load-path (concat init-scripts "latex-preview-pane/"))
(load "latex-preview-pane.el")

;; Compile command for latex-preview-pane
(setq pdf-latex-command "xelatex")

;; Activate both normal latex-mode and latex-preview-pane
(defun latex-preview-mode()
  (latex-mode)
  (latex-preview-pane-mode)
  )

;; Select mode for each TeX file
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-preview-mode))
(add-to-list 'auto-mode-alist '("\\.sty\\'" . latex-mode))
