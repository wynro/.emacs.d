;;; init.el --- Init loader
;; Copyright (C) 2016 Guillermo Robles
;; Author: Guillermo Robles
;;; Commentary:
;; Initial file of my configuration
;;; Code:
 
;; (defvar gnus-local-organization "CPS Universidad de Zaragoza")
(defvar gnus-local-organization "Rank")
;; (setq news-inews-program "/usr/local/etc/inews")

;; Enable automatic signature inclusion
(setq mail-signature t)

;; Specify the signature file for inclusion
(setq mail-signature-file (expand-file-name "~/.signature"))

;; Display change to european code
(set-language-environment "Latin-1")

;; Aditions, if something start to fail, look here

;; Repositories
;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
(require 'package)
; list the packages you want
(defvar package-list '(go-guru go-autocomplete go-mode powershell systemd org minimap forth-mode tf2-conf-mode csgo-conf-mode package-lint achievements flycheck auctex auto-yasnippet bash-completion clips-mode color-theme-modern common-lisp-snippets company csv-mode dockerfile-mode elnode emms erlang gnuplot haskell-mode iedit js2-mode lua-mode magit markdown-mode mc-extras multi-web-mode multiple-cursors nodejs-repl nyan-mode page-break-lines paredit php-mode projectile puppet-mode scala-mode smooth-scroll undo-tree web-server yaml-mode))

; list the repositories containing them
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)
; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Temporal fix for wrong ELPA signature
(setq package-check-signature nil)

;; Expanding the load-path
(defvar init-emacs.d (concat (expand-file-name "~") "/.emacs.d/"))
(defvar init-scripts (concat init-emacs.d "init-scripts/"))
(add-to-list 'load-path  init-scripts)

;; Codifications
(prefer-coding-system 'utf-8)
;;(setq coding-system-for-read 'utf-8)
;;(setq coding-system-for-write 'utf-8)

;; The damn tabs
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method 'hungry)

(print (concat "Loading from " init-scripts))
;; Loading the main configuration file
(load "main-config.el")

;; Disable electric-indentation
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote ()))

;; Pay respects to our God
(defun press-f ()
  "Pay respects."
  (interactive)
  (print "You payed respects")
  )

;; Shell (Ideally Bash) binded to F5
;; Apparently, term is far better. We'll see
(global-set-key [f5] 'shell)

;; Use the correct mode in every filetype (If this goes bigger than 3
;; or 4, move to his own file)
(add-to-list 'auto-mode-alist '("\\.plx\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

;; Changes
(add-hook 'prog-mode-hook 'linum-mode) ;; Show line numbers at the left of the file
(column-number-mode) ;; Show column number in the footer
(show-paren-mode)    ;; Show line number in the footer

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq save-interprogram-paste-before-kill t)

(setq custom-file (concat init-emacs.d "custom.el"))
(load custom-file)

(setq-default indent-tabs-mode nil)

;; Enable some buff commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

;; Testing stuff
(print "Config loaded")
(provide 'init)
;;; init.el ends here
