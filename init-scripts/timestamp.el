;; Adding timestamp to files easily
;; Timestamp: <2015-08-14 - 20:33>

;; A timestamp must follow the following regex, and be situated in the
;; first 8 lines of a file

;; Hook to update the timestamp in the files which have it
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-pattern "8/Time[-]?stamp[ \t]*:[ \t]*\\\\?[\"<]+%:y-%02m-%02d - %02H:%02M\\\\?[\">]")

