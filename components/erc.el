;; Pool of colors to use when coloring IRC nicks.
(setq erc-colors-list '("green" "blue" "red"
			"dark gray" "dark orange"
			"dark magenta" "maroon"
			"indian red" "black" "forest green"
			"midnight blue" "dark violet"))
;; special colors for some people
(setq erc-nick-color-alist '(("place_holder_here" . "blue")))

(defun erc-get-color-for-nick (nick)
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
	     (substring (md5 (downcase nick)) 0 6) 16)
	    (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
	(let ((nick (match-string 1)))
	  (put-text-property (match-beginning 1) (match-end 1) 'face
			     (cons 'foreground-color
				   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)
