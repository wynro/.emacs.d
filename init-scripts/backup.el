;; Multiple adjustments about how Emacs do the backup of files
;; Timestamp: <2015-08-14 - 20:51>

;; Obtaining the backup path
(defvar --backup-directory (concat user-emacs-directory "backups"))

;; If the directory does not exist, we create it
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
;; We select the new directory as backup directory
(setq backup-directory-alist `(("." . ,--backup-directory)))

;; Adjusting various variables about saving backups
(setq
 make-backup-files t    ; backup of a file the first time it is saved.
 backup-by-copying t    ; don't clobber symlinks
 version-control t      ; version numbers for backup files
 delete-old-versions t  ; delete excess backup files silently
 delete-by-moving-to-trash t  ; move the file to trash on deletion
 kept-old-versions 6    ; oldest versions to keep when a new numbered backup is made (default: 2)
 kept-new-versions 9    ; newest versions to keep when a new numbered backup is made (default: 2)
 auto-save-default t    ; auto-save every buffer that visits a file
 auto-save-timeout 30   ; number of seconds idle time before auto-save (default: 30)
 auto-save-interval 200 ; number of keystrokes between auto-saves (default: 300)
 )
