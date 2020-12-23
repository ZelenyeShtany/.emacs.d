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

(let*
    (
     (yml (list 1 2))
     (yml2 (list 1 2))
     (myl (list))
     )
  (push yml myl)
  (push yml2 myl)
    )


(defun mytest()
  (let(myl (list))(save-excursion(save-window-excursion
		   (find-file (concat my-org-directory "regular.org"))
		   (widen)
		   (goto-char (point-min))
		   (while (re-search-forward "SCHEDULED.*?\\(\\+1d\\)>" nil t)
		     (outline-previous-heading)
		     (push (org-element-property :title (org-element-at-point)) myl)
		     (goto-char (match-end 0)))))
      (mapcar 'insert myl)))

digital minimalism(исполнение)
зубы вечером
зубы утром
aerobic execises
cold shower
встать не позже 8:00-9:00
лечь спать в 23:00-24:00
self-talk на аудиозапись
подготовить/купить (желательно) 5л бутылку с водой
NOFAP
утренний ритуал / morning ritual
вечерний ритуал / evening ritual



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(let*
    ((task-name)(task-duration)(task-start-time)(task-end-time)(task-time-range))
  (cl-labels
      ((format-element
	(match1 match2)
	(let* (
	       (start (ts-parse (match-string match1 task)))
	       (end (ts-parse(match-string match2 task)))
	       (diff-in-minutes (/ (round(ts-difference end start)) 60))
	       (hours (format "%1$02d" (floor (/ diff-in-minutes 60))))
	       (minutes (format "%1$02d"(% diff-in-minutes 60)))
	       )
	  ;; add diff-in-minutes to index of corresponding day in vector of summary time
	  (aset summary (cdr(assoc day access-to-vector-indices))
		(+ diff-in-minutes (aref summary (cdr(assoc day access-to-vector-indices)))))
	  (setq task-duration (concat  "[" hours ":" minutes "]")
		task-start-time (match-string match1 task)
		task-end-time (match-string match2 task)
		task-time-range (concat "[" task-start-time "-" task-end-time "]")
		))))
    (and
     ;; if task string contains '|...'day'(00:00(-(00:00))?)?...([00:00(-(00:00))?]|)?...|'
     (string-match (concat "|.*?" day " *\\(\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\(-\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\)?\\)?.*?\\(\\[\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\(-\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\)?\\]\\)?[. ]*?|") (car task))
     ;; insert task name into table field (without |...| and org-links)
     (setq task-name (replace-regexp-in-string
		      org-bracket-link-regexp "\\2"
		      (replace-regexp-in-string "|.+?| +" "" (car task))))
     (cond
      ;; if time range for this day exists
      ((match-string 4 (car task))
       ;; insert duration of this time in '[HH:MM]' format
       (format-element 2 4)
       )
      ;; if general time range exists for this task  -- [HH:MM-HH:MM] format (within square brackets)
      ((match-string 8 (car task))
       ;; insert duration of this time in '[HH:MM]' format
       (format-element 6 8)
       ))
     (insert (concat task-time-range task-name task-duration)))  
    )
  )


(progn(re-search-forward "222")
(outline-next-heading)
(match-string 0)
)

(progn(re-search-forward "222")
(save-match-data(outline-next-heading))
(match-string 0)
)
