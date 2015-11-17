;; Repos
;; Timestamp: <2015-11-16 - 15:55>

(require 'package)

;; ;; Marmalade
;; (push '("marmalade" . "http://marmalade-repo.org/packages/")
;;       package-archives )

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Package archive
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;;(package-initialize)
