

(setq split-width-threshold most-positive-fixnum)

(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

(add-to-list 'auto-mode-alist '("\\.tpl$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.config$" . erlang-mode))

(add-hook 'nxml-mode-hook (lambda () (rng-validate-mode)))

(server-start)

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
