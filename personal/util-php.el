(require 'php-mode)
(add-to-list 'auto-mode-alist
             '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

(global-set-key "\C-c?" 'php-search-documentation)
