;; Keyboard customizations

(global-set-key [C-tab] 'ido-switch-buffer)
(global-set-key [C-S-iso-lefttab] 'ido-switch-buffer-other-frame)

(global-set-key [C-f11] 'color-theme-solarized-light)
(global-set-key [C-f12] 'color-theme-solarized-dark)

(global-set-key "\C-x>" 'copy-to-register)
(global-set-key "\C-x<" 'insert-register)

(global-set-key "\C-c;" 'comment-region)
(global-set-key "\C-z" 'undo)

(global-set-key [XF86Forward] 'switch-to-next-buffer)
(global-set-key [XF86Back] 'switch-to-prev-buffer)

(global-set-key [f8] 'kill-this-buffer)
(global-set-key [f9] 'compile)
(global-set-key [f10] 'calculator)
(global-set-key [f11] 'magit-status)
(global-set-key [f12] 'whitespace-mode)
(global-set-key [C-M-return] 'prelude-visit-term-buffer)

(global-set-key "\C-x\C-r" 'prelude-recentf-ido-find-file)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-i" 'tab-to-tab-stop)
(global-set-key "\C-\M-l" (lambda () (interactive) (switch-to-buffer (other-buffer))))

(global-set-key "\C-z" 'undo)
(global-set-key "\C-c\C-g" 'rgrep)

(global-set-key "\C-c<" 'insert-register)
(global-set-key "\C-c>" 'copy-to-register)

(global-set-key "\C-j" 'delete-indentation)

(global-set-key [(control shift j)] (lambda() (interactive) (delete-indentation t)))


(global-unset-key "\C-xp")

(setq sql-postgres-user "zotonic")  ;; name of most often used database
(setq sql-postgres-options '("-P" "pager=off" "-P" "title= ")) ;; don't use pager, empty title
(global-set-key "\C-xpq" 'sql-postgres)
(global-set-key "\C-xpw" 'sql-mysql)


(global-set-key "\C-xps" 'delete-trailing-whitespace)


;; To modify the keybindings, use the ido-setup-hook.  For example:
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map [C-tab] 'ido-next-match)
  (global-set-key [C-S-iso-lefttab] 'ido-prev-match)
  )
 


(defun arjan-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1))))

(global-set-key "\M-f" 'arjan-forward-word)
