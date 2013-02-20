(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(setq c-mode-hook
    (function (lambda ()
                ;; custom indentation rules for php
                (setq indent-tabs-mode nil)
                (setq c-basic-offset 4)
                ;; custom key bindings for php
                (define-key php-mode-map "\C-cd" 'php-search-documentation)
                )))
