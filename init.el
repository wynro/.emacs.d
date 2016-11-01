;; ^False, copied from the college original file, will grow as needed

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

;; Repositories
;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
(require 'package)
; list the packages you want
(setq package-list '(company color-theme-modern yaml-mode dockerfile-mode projectile haskell-mode emms mc-extras undo-tree smooth-scroll scala-mode puppet-mode php-mode paredit nyan-mode nodejs-repl multiple-cursors multi-web-mode markdown-mode magit js2-mode iedit erlang common-lisp-snippets clips-mode circe bash-completion auto-yasnippet))

; list the repositories containing them
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
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
(if noninteractive
    (defvar init-scripts "./init-scripts/")
  (progn
    (defvar init-emacs.d (concat (expand-file-name "~") "/.emacs.d/"))
    (defvar init-scripts (concat init-emacs.d "init-scripts/"))
    )
  )
(add-to-list 'load-path  init-scripts)

;; Codifications
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; The damn tabs
(setq-default indent-tabs-mode nil)

(print (concat "Loading from " init-scripts))
;; Loading the main configuration file
(load "main.el")

;; Disable electric-indentation
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote ()))

;; Pay respects to our God
(defun press-f () (interactive) (print "You payed respects"))

;; Shell (Ideally Bash) binded to F5
;; Apparently, term is far better. We'll see
(global-set-key [f5] 'shell)

;; Use the correct mode in every filetype (If this goes bigger than 3
;; or 4, move to his own file)
(add-to-list 'auto-mode-alist '("\\.plx\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

;; Changes
(linum-mode)           ;; Show line numbers at the left of the file
(column-number-mode)   ;; Show column number in the footer
(show-paren-mode)      ;; Show line number in the footer

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indent)) t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (auto-yasnippet bash-completion circe clips-mode common-lisp-snippets erlang iedit js2-mode magit markdown-mode multi-web-mode nodejs-repl nyan-mode paredit php-mode puppet-mode scala-mode smooth-scroll undo-tree mc-extras emms haskell-mode projectile dockerfile-mode yaml-mode color-theme-modern company)))
 '(send-mail-function (quote mailclient-send-it))
 '(use-minimal-error-page (quote on))
 '(use-minimal-welcome-page (quote on)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable some buff commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Testing stuff
(print "Config loaded")
