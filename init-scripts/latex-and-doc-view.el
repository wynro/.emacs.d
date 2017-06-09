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
(setq pdf-latex-command "/usr/texbin/xelatex")

;; Select mode for each TeX file
;;(add-hook 'latex-mode-hook 'latex-preview-pane-mode)
(add-to-list 'auto-mode-alist '("\\.sty\\'" . latex-mode))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; for AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; for Emacs latex mode

(require 'reftex)
(setq reftex-plug-into-AUCTeX t)

(eval-after-load "latex"
  '(progn
     (add-to-list
      'reftex-ref-style-alist
      '("Default" t
    (("LABEL ONLY" ?\s))))

     ;; Advice reftex-format-special-labely-only to substitute the
     ;; insertion of ~{<label>} to <label> only
     (defadvice reftex-format-special (around reftex-format-special-labely-only activate)
       "Advice `reftex-format-special' such that if
REFSTYLE is \"LABEL ONLY\" it will insert
only the reference's label."
       (if (string= (ad-get-arg 2) "LABEL ONLY")
       (setq ad-return-value (format "%s" (ad-get-arg 0)))
     ad-do-it))))

;; Prevent reftex query (Only label insertion)
(setq reftex-ref-macro-prompt nil)

(provide 'latex-and-doc-view)
;;; latex-and-doc-view.el ends here
