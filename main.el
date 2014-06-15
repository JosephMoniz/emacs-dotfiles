(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; The packages to install and compile
(setq packages '(clojure-mode
                 haskell-mode
                 go-mode
                 dart-mode
                 rust-mode
                 coffee-mode
                 lua-mode
                 php-mode
                 scala-mode2
                 js2-mode
                 sws-mode
                 jade-mode
                 markdown-mode
                 yaml-mode
                 rainbow-delimiters
                 magit
                 magithub
                 sublime-themes))

;; Predicate function for testing if any packages aren't installed
(defun packages-are-installed-p ()
  (loop for p in packages
   when (not (package-installed-p p)) do (return nil)
   finally (return t)))

;; If any package aren't installed, update the package repository
;; and install any missing or new packages
(unless (packages-are-installed-p)
  (message "%s" "Updating package repository...")
  (package-refresh-contents)
  (message "%s" "Package repository up to date.")

  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p)))
  (message "%s" "Finished installing packages."))

;; load the ensime lisp code...
(add-to-list 'load-path "/Users/josephmoniz/.emacs.d/ensime-dev/dist/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spolsky)))
 '(custom-safe-themes (quote ("e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "29a4267a4ae1e8b06934fec2ee49472daebd45e1ee6a10d8ff747853f9a3e622" default)))
 '(rainbow-delimiters-highlight-braces-p t)
 '(rainbow-delimiters-highlight-brackets-p nil)
 '(rainbow-delimiters-highlight-parens-p t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "gray55"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "orange1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "SpringGreen1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "cornsilk1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "purple1"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "dark red"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "maroon1"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "orchid1"))))
)

;; load all the individual component configs
(setq component-dir "~/.emacs.d/dotfiles/components")
(setq components (cddr (directory-files component-dir)))
(dolist (component components)
  (load-file (concat component-dir "/" component)))
