;;; yasnippet-config.el --- Yasnippet configuration
;;; Commentary:
;;;
;;; Code:

;; (java-snippets :fetcher github :repo "nekop/yasnippet-java-mode"
;;                :files ("*.el" "snippets"))
(require 'yasnippet)
(yas-global-mode 1)

(defun check-expansion ()
  "."
  (interactive)
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  "."
  (interactive)
  (let ((yas-fallback-behavior 'return-nil))
    (yas-expand)))

(defun tab-indent-or-complete ()
  "."
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (if (and
         (not (eq major-mode 'nroff-mode))
         (not (eq major-mode 'markdown-mode))
         (not (eq major-mode 'bibtex-mode))
         (not (eq major-mode 'puppet-mode))
         )
                                        ;TODO: Add more weird modes
        (indent-for-tab-command)
      )

    (if (or (not (yas-minor-mode))
            (null (do-yas-expand)))
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field ()
  "."
  (interactive)
  (if (or (not yas-minor-mode)
          (null (do-yas-expand)))
      (if company-candidates
          (company-complete-selection)
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (yas-next-field))))
          (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  "."
  (interactive)
  (if (or (not yas-minor-mode)
          (null (do-yas-expand))
          (company-abort))
      (company-complete-selection)))

(defun abort-company-or-yas ()
  "."
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))

(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)

(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

(add-hook 'magit-status-mode-hook
          (lambda() (local-set-key [tab] #'magit-section-toggle)))

(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

(provide 'yasnippet-config)
;;; yasnippet-config.el ends here
