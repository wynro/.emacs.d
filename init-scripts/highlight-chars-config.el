(add-to-list 'load-path (concat init-scripts "highlight-chars/"))
(load "highlight-chars.el")

(add-hook 'prog-mode-hook 'hc-toggle-highlight-trailing-whitespace)
