;;; init.el --- Init loader
;; Copyright (C) 2016 Guillermo Robles
;; Author: Guillermo Robles
;;; Commentary:
;; Initial file of my configuration
;;; Code:

;; Repositories
;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

;; The desired packages are listed in custom.el, in the variable package-selected-packages

;; ;; activate all the packages (in particular autoloads)
;; ;; (package-initialize)
;; ;; fetch the list of packages available
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ;; install the missing packages
;; (dolist (package package-selected-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; ;; Temporal fix for wrong ELPA signature
;; (setq package-check-signature nil)

;; Expanding the load-path

;;{{{ Basics

;;{{{ Directories and files definitions
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defvar user-emacs-init-directory
  (expand-file-name "init-scripts" user-emacs-directory))
(defvar user-emacs-extra-lisp
  (expand-file-name "lisp" user-emacs-directory))
;;}}}

;;{{{ Expand load-path
(add-to-list 'load-path user-emacs-extra-lisp)
(add-to-list 'load-path user-emacs-init-directory)

(dolist (dir (directory-files user-emacs-extra-lisp t "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)"))
  (if (file-directory-p dir)
      (add-to-list 'load-path dir)))
;;}}}

;;{{{ use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (xdg-open "https://github.com/jwiegley/use-package")
;; A little old: https://www.reddit.com/r/emacs/comments/76iyam/how_do_you_use_usepackage_for_configuration/
(require 'use-package)
(setq use-package-compute-statistics t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; (use-package use-package-ensure-system-package)
;; Ask on new repos
(defvar network-security-level 'high)
;;}}}

;;{{{ repositories
(setq package-archives
      '(
        ("org" . "http://orgmode.org/elpa/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ))
;;}}}

;;{{{ Custom file
(load custom-file)
;;}}}

;;{{{ Mail config
(setq gnus-local-organization "rank")
(setq mail-signature t)
(setq mail-signature-file (expand-file-name "~/.signature"))
;;}}}

;;{{{ Tabs and deletion
;; Remove all whitespace on deletion
(setq backward-delete-char-untabify-method 'hungry)
(setq-default indent-tabs-mode nil) ;; Don't insert tabs for indentation
;;}}}

;;{{{ No littering
(use-package no-littering
  :defines (no-littering-etc-directory
            no-littering-var-directory)
  :init
  (setq
   no-littering-etc-directory (expand-file-name "config/" user-emacs-directory)
   no-littering-var-directory (expand-file-name "data/" user-emacs-directory))
  )
;;}}}

;;{{{ Backups
;; Obtaining the backup path
(defvar backup-directory (concat user-emacs-directory "backups"))

;; If the directory does not exist, we create it
(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))
;; We select the new directory as backup directory
(setq backup-directory-alist `(("." . ,backup-directory)))

;; Adjusting various variables about saving backups
(setq
 delete-by-moving-to-trash t ;; move the file to trash on deletion
 auto-save-interval 200 ;; number of keystrokes between auto-saves (default: 300)
 kept-old-versions 6 ;; oldest versions to keep when a new numbered backup is made (default: 2)
 kept-new-versions 9 ;; newest versions to keep when a new numbered backup is made (default: 2)
 auto-save-default t ; auto-save every buffer that visits a file
 make-backup-files t   ;; backup of a file the first time it is saved.
 backup-by-copying t   ;; don't clobber symlinks
 version-control t     ;; version numbers for backup files
 delete-old-versions t ;; delete excess backup files silently
 auto-save-timeout 30  ;; number of seconds idle time before auto-save (default: 30)
 )
;;}}}

;;{{{ Language and codification
(set-language-environment "Latin-1")

(prefer-coding-system 'utf-8)
;;(setq coding-system-for-read 'utf-8)
;;(setq coding-system-for-write 'utf-8)
;;}}}

;;{{{ Input method
(defun set-input-method-japanese ()
  "Set japanese as input-method."
  (interactive)
  (set-input-method 'japanese))

(defun set-input-method-latin-1-prefix ()
  "Set latin-1-prefix as input-method."
  (interactive)
  (set-input-method 'latin-1-prefix))

(setq default-input-method 'latin-1-prefix)

(defvar input-method-map (make-sparse-keymap)
  "Keymap with all the input methods.")

(global-set-key (kbd "C-c i") input-method-map)
(define-key input-method-map (kbd "j") 'set-input-method-japanese)
(define-key input-method-map (kbd "l") 'set-input-method-latin-1-prefix)
;;}}}

;;{{{ Multiple cursors
(use-package multiple-cursors
  :bind (("C-c m l" . mc/edit-lines)
         ("C-c m a" . mc/mark-all-dwim)
         ("C-c m A" . mc/mark-all-like-this-dwim)
         ("C-c m m" . mc/mark-all-like-this)
         ("C-c m n" . mc/mark-next-like-this))
  )

(use-package mc-extras
  :after (multiple-cursors)
  )
;;}}}

;;{{{ iedit
(use-package iedit
  )
;;}}}

;;{{{ Timestamp
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-pattern "8/[Tt][Ii][Mm][Ee][-]?[Ss][Tt][Aa][Mm][Pp][ \t]*:[ \t]*\\\\?[\"<]+%:y-%02m-%02d - %02H:%02M\\\\?[\">]+")
;; Example of timestamp in a file (will expand on save)
;; Timestamp: <>
;;}}}

;;{{{ Undo
(use-package undo-tree
  :config
  (global-set-key (kbd "M-u") 'undo-tree-visualize)
  (global-undo-tree-mode)
  )
;;}}}

;;{{{ Spellchecking
(defun flyspell-mode-es ()
  "Activate Spanish spell checking using flyspell."
  (interactive)
  (flyspell-mode)
  (ispell-change-dictionary "castellano"))

(defun ispell-next-word ()
  "Go to the next error."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

;; Key bindings
(defvar spellchecking-map)
(define-prefix-command 'spellchecking-map)
(global-set-key (kbd "C-c s") 'spellchecking-map)
(define-key spellchecking-map (kbd "e") 'flyspell-mode)
(define-key spellchecking-map (kbd "s") 'flyspell-mode-es)
(define-key spellchecking-map (kbd "b") 'flyspell-buffer)
(define-key spellchecking-map (kbd "z") 'ispell-next-word)
(define-key spellchecking-map (kbd "a") 'ispell-word)
;;}}}

;;{{{ Theme
(use-package color-theme-modern
  ;; :defer t
  :ensure t
  :config
  (defun load-current-theme (&optional alternative-theme)
    "Load the current theme defined in `current-theme' or use ALTERNATIVE-THEME as fallback."
    (interactive)
    (if alternative-theme
        (load-theme alternative-theme t)
      (load-theme current-theme t)))
  :init
  (defvar current-theme 'hober)
  :config
  (load-theme current-theme t)
  )

;; Workaround for
;; https://lists.gnu.org/r/emacs-devel/2019-01/msg00361.html
;; (https://lists.gnu.org/r/emacs-devel/2019-01/msg00377.html)
(add-hook 'server-after-make-frame-hook 'load-current-theme)
(add-hook 'org-mode-hook 'load-current-theme)
(add-hook 'fundamental-mode 'load-current-theme)
;;}}}

;;{{{ Show lines and columns
(global-display-line-numbers-mode) ;; Show line numbers at the left of the file
(column-number-mode) ;; Show column number in the footer
(line-number-mode)   ;; Show line number in the footer
(show-paren-mode)    ;; Show parenthesis pairs
;;}}}

;;{{{ Smooth scrolling
(use-package smooth-scrolling
  :init
  (setq scroll-conservatively 10)
  (setq scroll-margin 5)
  )
;;}}}

;;{{{ GUI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
;;}}}

;;{{{ Configure PATH
(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize)
  )
;;}}}

;;}}}

;;{{{ Random Stuff

;;{{{ Better defaults
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Interactive search configuration
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;;}}}

;;{{{ Org mode
(use-package org
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :defines (org-pretty-entities
            org-src-tab-acts-natively
            org-support-shift-select
            org-startup-indented
            org-startup-align-all-tables
            org-todo-keywords
            org-todo-keyword-faces
            org-odt-preferred-output-format
            org-use-sub-superscripts
            org-html-postamble
            )
  :mode ("\\.org\\'" . org-mode)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (ruby . t)
     (python . t)))
  (setq org-pretty-entities t
        org-src-tab-acts-natively t
        org-support-shift-select t
        org-startup-indented t
        org-startup-align-all-tables t
        org-odt-preferred-output-format "pdf"
        ;; "|": Separates the states that require action from the
        ;; ones that do not
        org-todo-keywords '((sequence "TODO" "NEXT" "|" "DONE"))
        ;; Default faces for TODO and DONE
        org-todo-keyword-faces '(("NEXT" . "yellow"))
        org-use-sub-superscripts nil
        org-html-postamble nil
        )
  (add-to-list 'org-emphasis-alist
               ;; Add = as highlighting emphasis
               ;; Goes well with default and hober themes
               '("=" (:foreground "black" :background "yellow")))
  ;; Enable literal links
  (defun turn-on-literal-links ()
    "Enable literal links."
    (interactive)
    (org-remove-from-invisibility-spec '(org-link))
    (org-restart-font-lock))
  (add-hook 'org-mode-hook 'turn-on-literal-links)
  )

;; http://ehneilsen.net/notebook/orgExamples/org-examples.html

(use-package htmlize
  :after (org)
  )
;;}}}

;;{{{ Open buffer in file explorer
(defun nd ()
  "Open the current buffer's directory in the file manager."
  (interactive)
  (let* ((path (buffer-file-name))
         (dir (if path (file-name-directory path)))
         ;; (file-managers '("nautilus" "caja"))
         (file-manager "nautilus"))
    (if dir
        (start-process "" nil file-manager dir)
      (princ "The current buffer doesn't have an assigned file")
      )
    )
  )

(defun xdg-open (file &optional debug)
  "Open the given FILE with xdg-open.

If DEBUG is not nil, the output of xdg-open will be redirected to
the buffer `*xdg-open-output*'."
  (interactive "fFile: \nP")
  (let ((output-buffer (if debug (get-buffer-create "*xdg-open-output*") nil)))
    (start-process ""
                   output-buffer
                   "xdg-open"
                   (expand-file-name file))
    )
  )

(defun terminal-open (directory &optional debug)
  "Open the given DIRECTORY with gnome-terminal.

If DEBUG is not nil, the output of gnome-terminal will be
redirected to the buffer `*gnome-terminal-output*'."
  (interactive "DDirectory: \nP")
  (let ((output-buffer (if debug (get-buffer-create "*gnome-terminal-output*") nil)))
    (start-process ""
                   output-buffer
                   "gnome-terminal"
                   "--working-directory"
                   (expand-file-name directory))
    )
  )

(defvar explorer-open-map (make-sparse-keymap)
  "Keymap with all the functions to open files/dirs.")

(global-set-key (kbd "C-c n") explorer-open-map)
(define-key explorer-open-map (kbd "d") 'nd)
(define-key explorer-open-map (kbd "o") 'xdg-open)
(define-key explorer-open-map (kbd "t") 'terminal-open)
;;}}}

;;{{{ Achievements
;; (use-package achievements
;;   :config (achievements-mode +1)
;;   )
;;}}}

;;{{{ calc
(setq calc-window-height 14)
(setq calc-internal-prec 20)
(setq calc-complex-format 'i)
(setq calc-prefer-frac nil)

(defun calc-open()
  "Open calc in a small window at right."
  (interactive)
  (calc-keypad)
  (other-window 2)
  (delete-window)
  (other-window -1))

(global-set-key (kbd "C-c %") 'calc-open)
;;}}}

;;{{{ ipcalc

(use-package ipcalc
  :requires cl-lib
  :init
  (defun ipcalc-from-cidr-to-ipmask (ip/cidr)
    "Convert from IP/CIDR notation to IP/MASK."
    (interactive "sIP/CIDR")
    (let* ((ip (car (split-string ip/cidr "/")))
           (cidr (string-to-number (car (cdr (split-string ip/cidr "/")))))
           (mask (ipcalc-binary-to-ip (ipcalc-ones-and-pad cidr))))
      (concat ip "/" mask)
      )
    )

  (defun ipcalc-from-ipmask-to-cidr (ip/mask)
    "Convert from IP/MASK notation to IP/CIDR."
    (let* ((ip (car (split-string ip/mask "/")))
           (mask-binary
            (ipcalc-octets-as-binary (ipcalc-ip-to-octets
                                      (car (cdr (split-string ip/mask "/"))))))
           (ip-cidr
            (- (cl-reduce '+ mask-binary)
               (* (cl-reduce '+ "0") (length mask-binary)))))
      (concat ip "/" (number-to-string ip-cidr))
      )
    )
  )
;;}}}

;;{{{ Font
;; Use Pragmata Pro, only if available
(ignore-errors
  (add-to-list 'default-frame-alist '(font . "Pragmata Pro"))
  (set-face-attribute 'default t :font "Pragmata Pro"))
;;}}}

;;{{{ folding-config
(use-package folding
  :config
  (global-set-key (kbd "C-c @") 'folding-mode)
  (global-set-key (kbd "C-c TAB") 'folding-toggle-show-hide)

  (folding-kbd "\C-c" 'folding-whole-buffer)
  (folding-kbd "@" 'folding-mode)
  (folding-kbd "o" 'folding-open-buffer)
  (folding-kbd "c" 'folding-whole-buffer)
  (folding-kbd "s" 'folding-show-current-entry)
  (folding-kbd "x" 'folding-hide-current-entry)
  )
;;}}}

;;{{{ Random functions
(defun asciify-text (&optional *begin *end)
  "Change European language characters into equivalent ASCII ones.
In current buffer (from BEGIN to END)

When called interactively, work on current line or text selection.

URL `http://ergoemacs.org/emacs/emacs_zap_gremlins.html'
Version 2016-07-12"
  (interactive)
  (let ((-charMap
         [
          ["á\\|à\\|â\\|ä\\|ā\\|ǎ\\|ã\\|å\\|ą" "a"]
          ["é\\|è\\|ê\\|ë\\|ē\\|ě\\|ę" "e"]
          ["í\\|ì\\|î\\|ï\\|ī\\|ǐ" "i"]
          ["ó\\|ò\\|ô\\|ö\\|õ\\|ǒ\\|ø\\|ō" "o"]
          ["ú\\|ù\\|û\\|ü\\|ū"     "u"]
          ["Ý\\|ý\\|ÿ"     "y"]
          ["ç\\|č\\|ć" "c"]
          ["ď\\|ð" "d"]
          ["ľ\\|ĺ\\|ł" "l"]
          ["ñ\\|ň\\|ń" "n"]
          ["þ" "th"]
          ["ß" "ss"]
          ["æ" "ae"]
          ["š\\|ś" "s"]
          ["ť" "t"]
          ["ř\\|ŕ" "r"]
          ["ž\\|ź\\|ż" "z"]
          ])
        -begin -end
        )
    (if (null *begin)
        (if (use-region-p)
            (progn
              (setq -begin (region-beginning))
              (setq -end (region-end)))
          (progn
            (setq -begin (line-beginning-position))
            (setq -end (line-end-position))))
      (progn
        (setq -begin *begin)
        (setq -end *end)))
    (let ((case-fold-search t))
      (save-restriction
        (narrow-to-region -begin -end)
        (mapc
         (lambda (-pair)
           (goto-char (point-min))
           (while (search-forward-regexp (elt -pair 0) (point-max) t)
             (replace-match (elt -pair 1))))
         -charMap)))))

(defun asciify-string (*string)
  "Change European language chars to ASCII in STRING.
See `asciify-text'"
  (with-temp-buffer
    (insert *string)
    (asciify-text (point-min) (point-max))
    (buffer-string)))

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))
;;}}}

;;{{{ evil
;; (use-package evil
;;   :config (evil-mode 0)
;;   )
;;}}}

;;{{{ Highlight
(defun hc-off-highlight-trailing-whitespace ()
  "Turn off trailing whitespace highlighting."
  (interactive "")
  (if (bound-and-true-p hc-highlight-trailing-whitespace-p)
      (hc-toggle-highlight-trailing-whitespace)
    ))

(defun hc-on-highlight-trailing-whitespace ()
  "Turn on trailing whitespace highlighting."
  (interactive "")
  (unless hc-highlight-trailing-whitespace-p
    (hc-toggle-highlight-trailing-whitespace)
    ))

(use-package highlight-chars
  :config
  (add-hook 'prog-mode-hook 'hc-on-highlight-trailing-whitespace)

  (add-hook 'gud-mode-hook 'hc-off-highlight-trailing-whitespace)
  (add-hook 'eshell-mode-hook 'hc-off-highlight-trailing-whitespace)
  (add-hook 'ibuffer-mode-hook 'hc-off-highlight-trailing-whitespace)
  (add-hook 'term-mode-hook 'hc-off-highlight-trailing-whitespace)
  )
;;}}}

;;{{{ cleanup
(defvar cleanup-cleanup-modes
  '(arduino-mode latex-mode)
  "Modes not derived from `prog-mode' that have to be cleaned on save.")

(defvar cleanup-no-cleanup-modes
  '(
    dockerfile-mode snippet-mode robot-mode

    makefile-makepp-mode makefile-bsdmake-mode makefile-imake-mode
    makefile-automake-mode makefile-mode makefile-gmake-mode
    asm-mode
    )
  "Modes derived from `prog-mode' that don't have to be cleaned on save.")

(defun untabify-buffer ()
  "Remove all tabs in the current buffer, and substitute it by spaces."
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "Indent the current buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer-before-save ()
  "My own cleanup function."
  (whitespace-cleanup)
  (if (and (or (derived-mode-p 'prog-mode)
               (member major-mode cleanup-cleanup-modes))
           (not (member major-mode cleanup-no-cleanup-modes)))
      (indent-buffer)))

(add-hook 'before-save-hook 'cleanup-buffer-before-save)

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called
automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer)
  )

(global-set-key (kbd "C-c n n") 'cleanup-buffer)
;;}}}

;;{{{ scratch and splitting
(defun create-scratch-buffer nil
  "Create a new scratch buffer to work in.
\(could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)
    )
  )

(defun split-window-right-and-move-there ()
  "Split the window to the right and move to the new window."
  (interactive)
  (split-window-right)
  (windmove-right))
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there)

(defun split-window-down-and-move-there ()
  "Split the window down and move to the new window."
  (interactive)
  (split-window-below)
  (windmove-down))

(global-set-key (kbd "C-x 2") 'split-window-down-and-move-there)
;;}}}

;;{{{ Eval and replace
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1
       (eval (read (current-kill 0)))
       (current-buffer)
       )
    (error (message "Invalid expression")
           (insert (current-kill 0))
           )
    )
  )

;; This doesn't follow the convention that C-c is the prefix of all
;; the user commands, but is created with the knowledge that C-x C-e
;; is the eval-last-sexp command
(global-set-key (kbd "C-x e") 'eval-and-replace)
;;}}}

;;{{{ electric-pairs and electric-indent
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
(when (fboundp 'electric-pair-mode) (electric-pair-mode +1))

(add-to-list
 'electric-pair-pairs
 (cons ?¿ ??))
(add-to-list
 'electric-pair-pairs
 (cons ?¡ ?!))
(add-to-list
 'electric-pair-pairs
 (cons ?{ ?}))

(setq-local electric-pair-text-pairs electric-pair-pairs)

(use-package electric-operator
  )
;;}}}

;;{{{ hl-line
(when (fboundp 'hl-line-mode) (hl-line-mode +1))
(set-face-background 'highlight "#222") ; Add a light grey as background
(set-face-foreground 'highlight nil)    ; No foreground
;;}}}

;;{{{ ace-jump
(use-package ace-jump-mode
  :bind (("C-c C-SPC" . ace-jump-mode)
         ("C-c SPC"   . ace-jump-mode-pop-mark))
  )
;;}}}

;;{{{ discover
(use-package discover
  :init
  (global-discover-mode)
  )
;;}}}

;;{{{ shell
(global-set-key [f5] 'ansi-term)
(defvar explicit-shell-file-name "/bin/bash")
(use-package bash-completion
  )
;;}}}

;;{{{ diminish
(use-package diminish
  )
;;}}}

;;{{{ TF2 conf
(use-package tf2-conf-mode
  )
;;}}}

;;{{{ CSGO conf
(use-package csgo-conf-mode
  )
;;}}}

;;{{{ web-server
(use-package web-server
  )
;;}}}

;;{{{ page-break-lines
(use-package page-break-lines
  :config
  (global-page-break-lines-mode)
  )
;;}}}

;;{{{ Make config
(defmacro global-set-key-fn (keybind function)
  "Create a KEYBIND for a FUNCTION."
  `(global-set-key ,keybind
                   (lambda ()
                     "Wrapper to allow the function to be executed as a keybinding."
                     (interactive)
                     ,function)))

(defmacro make-target (target)
  "Execute make with the specified TARGET."
  `(shell-command (concat "make " ,target)))

(global-set-key-fn (kbd "C-c b b") (make-target "build"))
(global-set-key-fn (kbd "C-c b c") (make-target "clean"))
(global-set-key-fn (kbd "C-c b i") (make-target "install"))
(global-set-key-fn (kbd "C-c b t") (make-target "test"))
;;}}}

;;}}}

;;{{{ Games and entertaining

;;{{{ Tetris

(use-package tetris
  :ensure nil
  :defines (tetris-score-file
            tetris-mode-map)
  :config
  (setq tetris-score-file (expand-file-name "games/tetris-scores" user-emacs-directory))
  ;; (defun tetris() "DONT PLAY." (interactive) (message "DONT PLAY"))
  :bind (("C-c t" . tetris))
  :bind (:map tetris-mode-map
              ("n"     . tetris-start-game)
              ("q"     . tetris-end-game)
              ("p"     . tetris-pause-game)
              ("\r"    . tetris-move-bottom)
              ([left]  . tetris-move-left)
              ([right] . tetris-move-right)
              ([up]    . tetris-rotate-prev)
              ([down]  . tetris-rotate-next)
              ;; ([prior]  . tetris-move-left)
              ;; ([next]  . tetris-move-right)
              ;; ("b"  . tetris-rotate-next)
              )
  )
;;}}}

;;{{{ emms
(use-package emms
  :defines
  (emms-source-file-default-directory)
  :config
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/")
  :bind (("C-'" . emms-playlist-mode-go)
         ("C-\"" . emms-add-directory)
         ("C-M-\"" . emms-add-file)
         ([C-XF86AudioPlay] . emms-pause)
         ([C-XF86AudioStop] . emms-stop)
         ([C-XF86AudioNext] . emms-next)
         ([C-XF86AudioPrev] . emms-previous)
         ;; This is a terrible hack, but apparently Emacs interprets
         ;; Control+Fn as [C-XF86WakeUp], so I've added this to
         ;; silence the messages of not bounded
         ([C-XF86WakeUp] . nil))
  )
;;}}}

;;}}}

;;{{{ Programming languages

;;{{{ Common

;;{{{ LSP
;; (use-package lsp-mode
;;   :ensure t
;;   :commands (lsp lsp-deferred)
;;   :hook (go-mode . lsp-deferred))

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)

;; (defun lsp-go-install-save-hooks ()
;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;;}}}

;;{{{ Magit config
(use-package magit
  :bind (("C-c g" . magit-status))
  )
;;}}}

;;{{{ Company config
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  )

(use-package company-statistics
  :config
  (add-hook 'after-init-hook 'company-statistics-mode)
  )
;;}}}

;;{{{ Yasnippet config
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind (("C-c <C-tab>" . yas-expand))
  :config
  (yas-global-mode)
  (setq yas-wrap-around-region t)
  :init
  (add-to-list 'yas-snippet-dirs (expand-file-name "~/.emacs.d/snippets"))
  :hook (go-mode . yas-minor-mode)
  )

(use-package yasnippet-snippets
  :after yasnippet
  :config (yasnippet-snippets-initialize))

(use-package auto-yasnippet
  :after yasnippet
  )

;; (defun company-yasnippet-or-completion ()
;;   (interactive)
;;   (let ((yas-fallback-behavior nil))
;;     (unless (yas-expand)
;;       (call-interactively #'company-complete-common))))


;; (add-hook 'company-mode-hook
;;           (lambda ()
;;             (substitute-key-definition 'company-complete-common
;;                                        'company-yasnippet-or-completion
;;                                        company-active-map)))

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
         (not (eq major-mode 'snippet-mode))
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

;; (define-key yas-minor-mode-map [tab] nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)

;; (define-key yas-keymap [tab] 'tab-complete-or-next-field)
;; (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
;; (define-key yas-keymap [(control tab)] 'yas-next-field)
;; (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

;; https://github.com/joaotavora/yasnippet/issues/557
(add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))
;;}}}

;;{{{ Flycheck
(use-package flycheck
  :hook (prog-mode-hook . global-flycheck-mode)
  )
;;}}}

;;{{{ Projectile
(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  ("M-p" . projectile-command-map)
  :config
  (projectile-mode +1)
  ;; https://github.com/bbatsov/projectile
  )
;;}}}

;;{{{ compile
(global-set-key [f6] 'compile)
;;}}}

;;}}}

;;{{{ Go
(use-package go-mode
  :config
  (setq gofmt-command "goimports")
  ;; Prevent the use of modula-2-mode for go.mod files
  (add-to-list 'auto-mode-alist '("\\go.mod\\'" . text-mode))
  ;; Add HTML mode to Go templates
  (add-to-list 'auto-mode-alist '("\\.gohtml\\'" . mhtml-mode))
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(use-package company-go
  :after (company go-mode)
  :config
  (add-to-list 'company-backends 'company-go)
  )

(use-package go-guru
  :after (go-mode)
  )

;; (use-package go-autocomplete
;;   :after (go-mode)
;;   )

(use-package go-dlv
  :after (go-mode)
  )

;; These variables are defined in my login shells, but not in the
;; shell that launches Emacs
(setenv "GOPATH" (expand-file-name "~/.gocode"))
(setenv "GOROOT" "/usr/local/go")

(add-to-list 'exec-path (expand-file-name "bin" (getenv "GOROOT")))
(add-to-list 'exec-path (expand-file-name "bin" (getenv "GOPATH")))
;;}}}

;;{{{ Python
(use-package python
  :config
  (setq python-shell-interpreter "python3")
  (setq flycheck-python-pycompile-executable "python3")
  (setq flycheck-python-flake8-executable "flake8")
  (setq flycheck-python-pylint-executable "pylint")
  :hook (python-mode . eldoc-mode)
  )

(use-package elpy
  :init
  (elpy-enable)
  :defines
  (elpy-rpc-python-command)
  :config
  (setq elpy-rpc-python-command "python3")
  )

(use-package python-black
  :after (python)
  :hook (python-mode . python-black-on-save-mode)
  )
;;}}}

;;{{{ Emacs Lisp
;; (use-package smartparens
;;   :config
;;   (smartparens-global-mode t)
;;   )

(use-package package-lint
  )
;;}}}

;;{{{ C#
;; (use-package csharp-mode
;;   )

;; (use-package omnisharp
;;   :after csharp-mode
;;   )
;;}}}

;;{{{ COBOL
(use-package column-marker
  :config
  (defun cobol-column-coloring ()
    "Configures column coloring for Cobol."
    (whitespace-mode)
    (column-marker-1 6)
    (column-marker-2 72)
    )
  )

(use-package cobol-mode
  :after column-marker
  :hook (cobol-mode . cobol-column-coloring)
  :mode (("\\.cob$" . cobol-mode)
         ("\\.cbl$" . cobol-mode)
         ("\\.cpy$" . cobol-mode))
  )
;;}}}

;;{{{ Haskell
(use-package haskell-mode
  :hook
  (haskell-mode-hook . turn-on-haskell-indent)
  (haskell-mode-hook . turn-on-haskell-doc-mode)
  )
;;}}}

;;{{{ LÖVE/love
;; (use-package love-minor-mode
;;   )
;;}}}

;;{{{ LaTeX/TeX
;; (use-package auctex
;;   )

(defvar TeX-auto-save t) ;; Activate autosaving

(defvar TeX-parse-self t) ;; Use document parsing (in order to get
;; support for different packages)

(setq-default TeX-master nil) ;; Useful for multifile documents

(setq-default TeX-engine 'xetex) ;; Configure TeX engine
(setq-default TeX-PDF-mode t)    ;; Output to PDF by default

;; latex-preview-pane
;; Manually load latex-preview-pane
(defvar user-emacs-init-directory)
(add-to-list 'load-path
             (concat user-emacs-init-directory "latex-preview-pane/"))
(load "latex-preview-pane.el")

;; Compile command for latex-preview-pane
(defvar pdf-latex-command "/usr/texbin/xelatex")

(defvar shell-escape-mode "-shell-escape")

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
;;}}}

;;{{{ SQL
;; (use-package sql
;;   )

(use-package sql-indent
  :after sql
  )
;;}}}

;;{{{ Groovy
(use-package groovy-mode
  )

(use-package groovy-imports
  :after (groovy-mode)
  )
;;}}}

;;{{{ vimrc
(use-package vimrc-mode
  :mode "\\.vim\\(rc\\)?\\'"
  :interpreter "vimrc"
  )
;;}}}

;;{{{ Java
(autoload 'jdee-mode "jdee.el" "JDE mode" t)
;; (load "jdee.el")
(add-to-list 'auto-mode-alist
             '("\\.java\\'" . jdee-mode))
;;}}}

;;{{{ FORTH
(use-package forth-mode
  )
;;}}}

;;{{{ C
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (defvar c-basic-offset 8))

(defun my-c-mode-common-hook ()
  (interactive)
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here

  (setq c++-tab-always-indent nil)
  (setq c-basic-offset 8)                  ;; Default is 2
  (setq c-indent-level 8)                  ;; Default is 2

  (setq tab-stop-list '(8 16 24 32 40 48 56 64))
  (setq tab-width 8)
  (setq indent-tabs-mode nil)  ; use spaces only if nil
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;}}}

;;{{{ JS
(use-package js2-mode
  :mode (("\\.js$" . js2-mode)
         ("\\.json$" . js2-mode))
  :config
  (defvar js-indent-level 2)
  )
;;}}}

;;{{{ PHP
(use-package php-mode
  :init
  (defun php-symbol-lookup ()
    "Lookup a php symbol in php.net."
    (interactive)
    (let ((symbol (symbol-at-point)))
      (if (not symbol)
          (message "No symbol at point.")
        (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                            (symbol-name symbol))))))

  (defun php-function-lookup ()
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
  :config
  (setq-local c-basic-offset 2)
  :bind (("<f1>" . php-function-lookup)
         ("C-<f1>" . php-symbol-lookup)
         )
  )
;;}}}

;;{{{ HTML
(use-package multi-web-mode
  )
;;}}}

;;{{{ Arduino
(use-package arduino-mode
  :mode ("\\.\\(pde\\|ino\\)$" . arduino-mode)
  :config
  (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
  (defvar arduino-executable "/home/guillermo/opt/arduino/arduino")
  (add-hook 'arduino-mode-hook 'linum-mode) ;Because it doesn't derive from prog-mode
  )
;;}}}

;;{{{ Powershell
(use-package powershell
  )
;;}}}

;;{{{ CLIPS
(use-package clips-mode
  )
;;}}}

;;{{{ Erlang
(use-package erlang
  )
;;}}}

;;{{{ Lua
;; (use-package lua-mode
;;   )
;;}}}

;;{{{ Scala
(use-package scala-mode
  :mode ("\\.scala\\'" . scala-mode)
  )
;;}}}

;;}}}

;;{{{ Languages

;;{{{ YAML
(use-package yaml-mode
  )
;;}}}

;;{{{ systemd
(use-package systemd
  )
;;}}}

;;{{{ Nginx
(use-package nginx-mode
  )
;;}}}

;;{{{ Graphviz
(use-package graphviz-dot-mode
  )
;;}}}

;;{{{ CSV
(use-package csv-mode
  )
;;}}}

;;{{{ Markdown
(use-package markdown-mode
  )
;;}}}

;;}}}

;;{{{ Tools

;;{{{ Ansible
(use-package ansible
  :init
  (defun ansible-check-managed ()
    "Check if the file contain \"Ansible managed\" and notify user."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (when (search-forward "Ansible managed"
                            (point-at-bol 10) t)
        (notify-managed-file "This file is under Ansible management"))))

  (defun notify-managed-file (&optional msg)
    "Change the buffer to read-only and alert the user.
    MSG change default message."
    (interactive)
    (read-only-mode)
    (if msg
        (message-box msg)
      (message-box "Alert")))

  (defun ansible-open-documentation (module)
    (interactive (let '(value (string-replace " " "" (car (split-string (thing-at-point 'line) ":"))))
                   (list
                    (read-string (format "Documentation for (%s): " value)
                                 nil nil value))))
    (let '(url (string-join (list
                             "https://docs.ansible.com/ansible/latest/collections/"
                             (string-join
                              (split-string (string-replace ":" "" module) "\\.") "/")
                             "_module.html")))
      (xdg-open url)))

  ;; :config
  ;; (add-hook 'yaml-mode-hook '(lambda ()
  ;;                              (ansible)
  ;;                              (bind-key "C-c h" 'ansible-open-documentation)))
  :hook ((yaml-mode . (lambda ()
                        (ansible)
                        (bind-key "C-c h" 'ansible-open-documentation))))
  (add-hook 'find-file-hook #'ansible-check-managed)
  )

(use-package ansible-doc
  :after (ansible)
  )

(use-package ansible-vault
  :after (ansible)
  )

(use-package company-ansible
  :after (ansible company)
  :config
  (add-to-list 'company-backends 'company-ansible)
  )
;;}}}

;;{{{ Puppet
(use-package puppet-mode
  :init
  (defun puppet-check-managed ()
    "Check if the file contain \"This file is managed by Puppet\" and notify user."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (when (search-forward "This file is managed by Puppet"
                            (point-at-bol 10) t)
        (notify-managed-file "This file is under Puppet management"))))
  :mode  ("\\.pp\\'" . puppet-mode)
  :config
  (add-hook 'find-file-hook #'puppet-check-managed)
  )
;;}}}

;;{{{ Docker
(use-package docker
  :diminish
  :bind ("C-c d" . docker)
  :init
  (use-package docker-image
    :ensure nil
    :commands docker-images)
  (use-package docker-container
    :ensure nil
    :commands docker-containers)
  (use-package docker-volume
    :ensure nil
    :commands docker-volumes)
  (use-package docker-network
    :ensure nil
    :commands docker-containers)
  (use-package docker-machine
    :ensure nil
    :commands docker-machines)
  )

(use-package docker-compose-mode
  :mode "docker-compose.*\.yml\\'"
  )

(use-package docker-tramp
  :after tramp
  :defer 5
  )

(use-package dockerfile-mode
  :mode "Dockerfile[a-zA-Z.-]*\\'"
  )
;;}}}

;;{{{ Kubernetes/k8s
(use-package kubernetes
  )

(use-package timonier
  :config
  (setq timonier-k8s-proxy "https://192.168.99.100:8443")
  )
;;}}}

;;{{{ Terraform
(use-package terraform-mode
  )

(use-package company-terraform
  :after (company terraform-mode)
  :config
  (add-to-list 'company-backends 'company-terraform)
  )

(use-package terraform-doc
  :after (terraform-mode)
  )
;;}}}

;;{{{ Robot
(load "robot-mode")
;;}}}

;;{{{ Docker
(use-package docker
  :diminish
  :bind ("C-c d" . docker)
  :init
  (use-package docker-image
    :ensure nil
    :commands docker-images)
  (use-package docker-container
    :ensure nil
    :commands docker-containers)
  (use-package docker-volume
    :ensure nil
    :commands docker-volumes)
  (use-package docker-network
    :ensure nil
    :commands docker-containers)
  (use-package docker-machine
    :ensure nil
    :commands docker-machines)
  )

(use-package docker-compose-mode
  :mode "docker-compose.*\.yml\\'"
  )

;; (use-package docker-tramp
;;   :atfer tramp
;;   :defer 5
;;   )

(use-package dockerfile-mode
  :mode "Dockerfile[a-zA-Z.-]*\\'"
  )
;;}}}

;;{{{ Puppet
(use-package puppet-mode
  :init
  (defun puppet-check-managed ()
    "Check if the file contain \"This file is managed by Puppet\" and notify user."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (when (search-forward "This file is managed by Puppet"
                            (point-at-bol 10) t)
        (notify-managed-file "This file is under Puppet management"))))
  :mode  ("\\.pp\\'" . puppet-mode)
  :config
  (add-hook 'find-file-hook #'puppet-check-managed)
  )
;;}}}

;;{{{ GNUPlot
(use-package gnuplot
  )
;;}}}

;;}}}

;; Disable git backend to speed up sshfs file load among other things
(setq vc-handled-backends (quote ()))

;; Use the correct mode in every filetype (If this goes bigger than 3
;; or 4, move to his own file)
(add-to-list 'auto-mode-alist '("\\.plx\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

(setq save-interprogram-paste-before-kill t)

;; Enable some buff commands
(mapc (lambda (f) (put f 'disabled nil))
      '(upcase-region downcase-region narrow-to-region scroll-left))

;; Testing stuff
(print "Config loaded")
(provide 'init)
;;; init.el ends here
