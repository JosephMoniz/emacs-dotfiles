;; whitespace-mode
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46])
   (newline-mark 10 [182 10])
   (tab-mark 9 [9655 9] [92 9])
))

;; custom face
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-newline ((((class color) (background dark)) (:background "#181a26" :foreground "gray20")) (((class color) (background light)) (:background "black" :foreground "gray20")) (t (:inverse-video t))))

 '(whitespace-space ((((class color) (background dark)) (:background "#181a26" :foreground "gray20")) (((class color) (background light)) (:background "black" :foreground "gray20")) (t (:inverse-video t))))

 '(whitespace-hspace ((((class color) (background dark)) (:background "#181a26" :foreground "gray20")) (((class color) (background light)) (:background "black" :foreground "gray20")) (t (:inverse-video t))))

 '(whitespace-tab ((((class color) (background dark)) (:background "#181a26" :foreground "gray20")) (((class color) (background light)) (:background "black" :foreground "gray20")) (t (:inverse-video t)))))
