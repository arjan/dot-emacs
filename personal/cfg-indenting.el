(setq tab-width 4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)

(add-hook 'c-mode-hook '(lambda ()
                          (c-set-style "stroustrup")))
