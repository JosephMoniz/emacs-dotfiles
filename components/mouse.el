;; Enable mouse in terminal
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;; Cusom mouse scrolling
(global-set-key [(mouse-5)]
                '(lambda () (interactive) (scroll-up 1))
)
(global-set-key [(mouse-4)]
                '(lambda() (interactive) (scroll-up -1))
)
