(add-to-list 'load-path (concat init-scripts "ipcalc/"))
(load "ipcalc.el")
(require 'cl-lib)

(defun ipcalc-from-cidr-to-ipmask (ip/cidr)
  "Converts from IP/CIDR notation to IP/MASK"
  (let
      ((ip (car (split-string ip/cidr "/")))
       (cidr (string-to-number (car (cdr (split-string ip/cidr "/")))))
       (mask (ipcalc-binary-to-ip (ipcalc-ones-and-pad cidr)))
       )
    (concat ip "/" mask)
    )
  )

(defun ipcalc-from-ipmask-to-cidr (ip/mask)
  "Converts from IP/MASK notation to IP/CIDR"
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
