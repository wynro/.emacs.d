;;; ipcalc-config.el --- IPcalc configuration
;;; Commentary:
;;;
;;; Code:

(defvar init-scripts)

(add-to-list 'load-path (concat init-scripts "ipcalc/"))
(require 'ipcalc)
(require 'cl-lib)

(defun ipcalc-from-cidr-to-ipmask (ip/cidr)
  "Convert from IP/CIDR notation to IP/MASK."
  (let
      ((ip (car (split-string ip/cidr "/")))
       (cidr (string-to-number (car (cdr (split-string ip/cidr "/")))))
       (mask (ipcalc-binary-to-ip (ipcalc-ones-and-pad cidr)))
       )
    (concat ip "/" mask)
    )
  )

(defun ipcalc-from-ipmask-to-cidr (ip/mask)
  "Convert from IP/MASK notation to IP/CIDR."
  (let
      ((ip (car (split-string ip/mask "/")))
       (mask-binary
        (ipcalc-octets-as-binary (ipcalc-ip-to-octets
                                  (car (cdr (split-string ip/mask "/")))))
        )
       (ip-cidr
        (- (cl-reduce '+ mask-binary)
           (* (cl-reduce '+ "0") (length mask-binary)))))
    (concat ip "/" (number-to-string ip-cidr))
    )
  )

(fset 'route-edit
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([105 112 32 45 52 32 114 111 117 116 101 32 97 100 100 32 49 57 50 46 49 54 56 46 51 48 46 C-right right backspace 47 C-right right 118 105 97 32 49 57 50 46 49 54 56 46 51 48 46 C-right 32 109 101 114 backspace 116 114 105 99 C-right 32 100 101 118 5 right] 0 "%d")) arg)))

(provide 'ipcalc-config)
;;; ipcalc-config.el ends here
