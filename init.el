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

(defvar init-emacs.d (concat (expand-file-name "~") "/.emacs.d/"))

;; Add customs file
(setq custom-file (concat init-emacs.d "custom.el"))
(load custom-file)


;; use-package bootstrapping
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Repositories
;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
(require 'package)

;; The desired packages are listed in custom.el, in the variable package-selected-packages

; list the repositories containing them
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.milkbox.net/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)
; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; Temporal fix for wrong ELPA signature
(setq package-check-signature nil)

;; Expanding the load-path
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
(electric-pair-mode 1)

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote ()))

;; Use the correct mode in every filetype (If this goes bigger than 3
;; or 4, move to his own file)
(add-to-list 'auto-mode-alist '("\\.plx\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

;; Changes
(add-hook 'prog-mode-hook 'linum-mode) ;; Show line numbers at the left of the file
(column-number-mode) ;; Show column number in the footer
(show-paren-mode)    ;; Show line number in the footer

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

(setq save-interprogram-paste-before-kill t)

(setq-default indent-tabs-mode nil)

;; Enable some buff commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(when window-system
  (require 'hl-line)
  (global-hl-line-mode)                   ; Activate hl-line everywhere
  (set-face-background 'highlight "#444") ; Add a light grey as background
  (set-face-foreground 'highlight nil)    ; No foreground
  )

;; Testing stuff
(print "Config loaded")
(provide 'init)
;;; init.el ends here
