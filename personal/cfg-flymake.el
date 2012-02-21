(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)
             )


(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "/home/arjan/bin/eflymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.erl\\'" flymake-erlang-init))

;;; Fix broken flymake xml init
(defun flymake-xml-init ()
  (list "xmllint" (list "--valid" (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))))

;;; tex
(defun flymake-get-tex-args (file-name)
  (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'find-file-hook 'flymake-find-file-hook)


(add-hook 'python-mode-hook
          (lambda ()
            (when (and buffer-file-name
                       (file-writable-p
                        (file-name-directory buffer-file-name))
                       (file-writable-p buffer-file-name)
                       (not (subsetp
                             (list (current-buffer))
                             (tramp-list-remote-buffers))))
              (flymake-mode t))))



(defconst flymake-allowed-php-file-name-masks '(
                                                    (".php3'" flymake-php-init)
                                                    (".php'" flymake-php-init))
  "Filename extensions that switch on flymake-php mode syntax checks")


(defconst flymake-php-err-line-pattern-re '("(Parse|Fatal) error: (.*) in (.*) on line ([0-9]+)" 3 4 nil 2)
  "Regexp matching PHP error messages")

    (defun flymake-php-init ()
      (let* ((temp-file       (flymake-init-create-temp-buffer-copy
                               'flymake-create-temp-inplace))
             (local-file  (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
        (list "php" (list "-f" local-file "-l"))))

    (defun flymake-php-load ()
      (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-php-file-name-masks))
      (setq flymake-err-line-patterns (cons flymake-php-err-line-pattern-re flymake-err-line-patterns))
      (flymake-mode t)
      (local-set-key "C-cd" 'flymake-display-err-menu-for-current-line))

    (provide 'flymake-php)


(load-library "flymake-cursor")
