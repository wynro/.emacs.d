;; ^False, copied from the college original file, will grow as needed
;; Time-stamp: <2015-10-28 - 16:15>

;; (defvar gnus-local-organization "CPS Universidad de Zaragoza")
(setq gnus-local-organization "Rank")
;; (setq news-inews-program "/usr/local/etc/inews")

;; Enable automatic signature inclusion
(setq mail-signature t)

;; Specify the signature file for inclusion
(setq mail-signature-file (expand-file-name "~/.signature"))

;; Display change to european code
(set-language-environment "Latin-1")

;; Aditions, if something start to fail, look here

;; Expanding the load-path
(defvar init-emacs.d (concat (expand-file-name "~") "/.emacs.d/"))
(defvar init-scripts (concat init-emacs.d "init-scripts/"))

(add-to-list 'load-path init-scripts)

;; Loading the main configuration file
(load "main.el")

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote ()))

;; Pay respects to our God
(defun press-f () (interactive) (print "You payed respects"))

;; Shell (Ideally Bash) binded to F2
(global-set-key [f2] 'shell)

;; Use the correct mode in every filetype (If this goes bigger than 3
;; or 4, move to his own file)
(add-to-list 'auto-mode-alist '("\\.plx\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-preview-pane-mode))

;; Changes
(column-number-mode)   ;; para que aparezca el numero de columna
(show-paren-mode)      ;; Para que tenga emparejado de parentesis

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(inhibit-startup-screen t)
 ;; '(initial-buffer-choice (concat emacs.d "init-buffer.org"))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
