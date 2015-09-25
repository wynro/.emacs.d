;; Adjusting the web IDE
;; Timestamp: <2015-08-14 - 21:54>

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '(
		  (php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script>" "</script>")
                  (css-mode "<style>" "</style>" )
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")
		  )
      )
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)
