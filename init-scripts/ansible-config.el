;;; ansible-config.el --- Ansible configuration
;;; Commentary:
;;;
;;; Code:

(use-package ansible
  :ensure t
  :config
  (add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
  )

(use-package ansible-doc
  :ensure t
  )

(use-package ansible-vault
  :ensure t
  )

(use-package company-ansible
  :ensure t
  :config
  (add-to-list 'company-backends 'company-ansible)
  )

(provide 'ansible-config)
;;; ansible-config.el ends here
