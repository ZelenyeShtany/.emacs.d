(let* ((str "[|Mon|][|Mon|] | asdasd | asd"))
  (while (progn
	   ;;(setq str (replace-regexp-in-string "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" "\vert" str nil t 2))
	   (string-match "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" str 0)
	   (setq str (replace-match "HUY" nil t str 2))
	   (string-match "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" str 0)
	   (message "DVA: %s" (match-string 2 str))
	   (not (eq (match-string 2 str) nil)))
    )
  str
  )


(let* ((str "[|Mon|][|Mon|] | asdasd | asd"))
  ;;(setq str (replace-regexp-in-string "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" "\vert" str nil t 2))
  (string-match "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" str)
  (setq str (replace-match "HUY" nil t str 2))
  (message "DVA: %s" (match-string 2 str))
  ;;(not (eq (match-string 2 str) nil))
  )

(setq str "[|Mon|][|Mon|] | asdasd | asd")
(string-match "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" str 0)
(setq str (replace-match "HUY" nil t str 2))

(while
    (progn
      (setq str (replace-regexp-in-string "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" "PIZDA" str nil t 2))
      (not (eq (string-match "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)" str 0) nil))
      )
    )
(message "%s" str)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

| [[|MON|][|MON|]] |  asdasd a Sd|  asd\as d|

(let*
    (
       (m1 (make-marker))
       (m2 (make-marker))
     )
  (save-excursion
    (save-restriction
      (switch-to-buffer "test")
      (set-marker m1 (point-min))
      (set-marker m2 (point-max))
      (narrow-to-region m1 m2)
      (re-search-forward "\\(\\[\\[.*?\\]\\]\\)" nil t)
      (narrow-to-region (match-beginning 0) (match-end 0))
      (goto-char (point-min))
      (while (re-search-forward "\\(|\\)" nil t)
	(replace-match "#" nil nil nil 1)
	)
  )
    ))


;; "\\(\\[.*?\\)\\(|\\)\\(.*?\\]\\)"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(replace-regexp-in-string "\\(^ +\\| +$\\)" "" (replace-regexp-in-string "[[:space:]
]+" " " "  TEST      
ssl      
") )





|TEST    | |TEST   | |       | |
|        | |ANME   | |  ANME | |


