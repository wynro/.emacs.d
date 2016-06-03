;; (require 'haskell-mode-autoloads)

(add-to-list 'load-path (concat init-scripts "haskell-mode/"))
(require 'haskell-mode)
(require 'haskell-font-lock)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
