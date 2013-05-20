;; Go to line sugar
(global-set-key (kbd "C-l") 'goto-line)

;; Word skipping keys
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)

;; Shortcut to magit
(global-set-key (kbd "C-g") 'magit-status)

;; Window resizing keys
(global-set-key (kbd "C-,") 'shrink-window-horizontally)
(global-set-key (kbd "C-.") 'enlarge-window-horizontally)
(global-set-key (kbd "C-;") 'shrink-window)
(global-set-key (kbd "C-'") 'enlarge-window)
