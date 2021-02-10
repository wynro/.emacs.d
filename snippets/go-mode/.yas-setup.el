;;; .yas-setup.el --- Utility functions
;;; Commentary:
;;; Utility functions
;;; Code:


(defun convert-go-type-to-acronym (type)
  "Convert a particular Go TYPE to an acronym.

For that, the format will be the first character, followed by all uppercase characters, all this in lowercase."
  (let
      ((first-character (substring type 0 1))
       (all-uppercase-character-except-first-character (remove-if
                                                        (lambda (char) (<= ?a char))
                                                        (substring type 1))))
    (concat (downcase first-character)
            (downcase all-uppercase-character-except-first-character)))
  )

(provide '.yas-setup)
;;; .yas-setup.el ends here
