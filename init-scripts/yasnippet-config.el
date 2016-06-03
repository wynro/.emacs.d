;; Yasnippet configuration paramenters

;; (java-snippets :fetcher github :repo "nekop/yasnippet-java-mode"
;;                :files ("*.el" "snippets"))
(add-to-list 'load-path (concat init-scripts "yasnippet/"))
(require 'yasnippet)
(yas-global-mode 1)
