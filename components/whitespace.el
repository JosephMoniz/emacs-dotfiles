;; whitespace-mode
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46])
   (newline-mark 10 [182 10])
   (tab-mark 9 [9655 9] [92 9])
))
