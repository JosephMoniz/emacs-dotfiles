(require 'cl)
(require 'package)

(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
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
                 scala-mode
                 sws-mode
                 jade-mode
                 markdown-mode
                 rainbow-delimiters
                 magit
                 magithub
                 twittering-mode))

;; TODO: add the following
;; js2 mode

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


;; load all the individual component configs
(setq component-dir "~/.emacs.d/dotfiles/components")
(setq components (cddr (directory-files component-dir)))
(dolist (component components)
  (load-file (concat component-dir "/" component)))
