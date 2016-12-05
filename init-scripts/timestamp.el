;;; timestamp.el --- timestamp adding to file
;;; Commentary:
;;; Add a timestam in the first lines of a file. The timestamp must
;;; follow the pattern "8/Time[-]?stamp[ \t]*:[\t]*\\\\?[\"<]+%:y-%02m-%02d - %02H:%02M\\\\?[\">]",
;;; and will update in each save
;;; Code:

(add-hook 'before-save-hook 'time-stamp) ;; Hook to update the
                                         ;; timestamp in the files
                                         ;; which have it
(defvar time-stamp-pattern "8/Time[-]?stamp[ \t]*:[ \t]*\\\\?[\"<]+%:y-%02m-%02d - %02H:%02M\\\\?[\">]")

(provide 'timestamp)
;;; timestamp.el ends here
