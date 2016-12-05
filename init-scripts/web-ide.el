;;; web-ide.el --- PHP and JS configuration
;;; Commentary:
;;;
;;; Code:

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defvar js-indent-level 2)                ; Adjust js indentation level

(add-hook 'php-mode-hook 'my-php-mode-stuff)

(defun my-php-mode-stuff ()
  "My php mode configuration."
  (local-set-key (kbd "<f1>") 'my-php-function-lookup)
  (local-set-key (kbd "C-<f1>") 'my-php-symbol-lookup)
  (defvar c-basic-offset 2))

(defun my-php-symbol-lookup ()
  "Lookup a php symbol in php.net."
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")
      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))

(defun my-php-function-lookup ()
  "Lookup a php function in php.net."
  (interactive)
  (let* ((function (symbol-name (or (symbol-at-point)
                                    (error "No function at point"))))
         (buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
    (with-current-buffer buf
      (goto-char (point-min))
      (let (desc)
        (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
          (setq desc
                (replace-regexp-in-string
                 " +" " "
                 (replace-regexp-in-string
                  "\n" ""
                  (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))
          (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
            (setq desc
                  (concat desc "\n\n"
                          (replace-regexp-in-string
                           " +" " "
                           (replace-regexp-in-string
                            "\n" ""
                            (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))
        (if desc
            (message desc)
          (message "Could not extract function info. Press C-F1 to go the description."))))
    (kill-buffer buf)))

(provide 'web-ide)
;;; web-ide.el ends here
