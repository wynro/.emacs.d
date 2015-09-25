;; Repos
;; Timestamp: <2015-09-24 - 12:49>

(require 'package)
;; Melpa
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)

;; Marmalade
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )

;; Package archive
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

