;;(defun my-org-recur-reschedule (&optional arg)
;;  (interactive)
;;  (call-interactively 'org-todo arg))
;;
;;(defadvice my-org-recur-reschedule (after do-something)
;;  (progn
;;    (message "sssyesty")
;;    )
;;  )
;;(ad-activate 'my-org-recur-reschedule)

;; (if (re-search-forward "SCHEDULED:[ ]*<[[:digit:]]" (save-excursion
;;                                            (outline-next-heading)
;;                                            (point))
;;                              t)
;;     (goto-char (match-end 0))
;;   )
;;;;;;;;;;;;;;;;

(setq statistics-property-name ":STATISTICS:")

(defun my/org-insert-to-logbook (string)
  "Insert STRING at the beginning of LOGBOOK drawer which belongs to org heading at point.
Create it if it doesnt exist"
  (save-excursion
	    (goto-char (org-log-beginning t)) ;; goto LOGBOOK drawer beginning; if it doesnt exist, create
	    (insert (concat string "\n"))
	    )
  )

;; (defun org-get-logbook-notes ()
;;   (save-excursion
;;     (unless (org-at-heading-p)
;;       (outline-previous-heading))
;;     (when (re-search-forward "SCHEDULED:[ ]*<[[:digit:]]" (save-excursion
;;                                            (outline-next-heading)
;;                                            (point))
;;                              t)
;;       (let* ((elt (org-element-property-drawer-parser nil))
;;              (beg (org-element-property :contents-begin elt))
;;              (end (org-element-property :contents-end elt)))
;;         (buffer-substring-no-properties beg end)))))

(defun my-org-recur-get-current-heading-recurrence-string()
  "docstring"
  (let*(
	(cur-head-point (nth 1 (my-org-get-current-heading-level-and-point)))
	rec-string
	)
    
    (save-excursion
      (goto-char cur-head-point)
      (setq head-string (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
      (save-match-data
	(and (string-match "\\(^[*]+\\)[ ]+\\(\\(MISSED\\)\\|\\(DONE\\)\\)[ ]+|\\([^|]*\\)|\\(.*\\)" head-string)
	     (if (not (zerop (length (match-data))))
		 (setq rec-string (match-string 5 head-string))
	       )
	     )
	)
      )
    rec-string
   )
  )


;; (defun my/kkk ()
;;   "docstring"
;;   (interactive)

;;     (let* (
;;        (rec-list (list "Mon huyna 20555" "Tue 22265L5-54a"))
;;        (rec-list-days-only
;; 	(let*
;; 	    (
;; 	     (tmplist '())
	     
;; 	     )
;; 	    (dolist (
;; 		curelem
;; 		rec-list
;; 		)
;; 	 (let* (
;; 		;;(search-result (string-match-p (regexp-quote "\\(\\(Mon\\)\\|\\(Tue\\)\\)") curelem))
;; 		(search-result (string-match "\\(\\(Mon\\)\\|\\(Tue\\)\\)" curelem))
;; 		)
;; 	     (if (not (eq search-result nil))
;; 		 (push (substring curelem search-result (+ search-result 3)) tmplist)
;; 		 )
;; 	     )
;; 	 )
;; 	    (reverse tmplist)
;; 	    )
;;        )
;;        )
;;   rec-list-days-only
;;   )
;;     )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my/set-next-week-day ()
  "docstring"
  (interactive)
  (let*
      (
       (org-read-date-prefer-future-default org-read-date-prefer-future)
       
       (rec-string (my-org-recur-get-current-heading-recurrence-string))
       (general-time nil)
       
       )
    (if (and
	 ;;(string= (org-entry-get nil "WEEK-DAY-BASED-HABIT" nil) "true")
	 (not (eq rec-string nil)))
	(let* (
	       (weekdays-alist
		'(
		  ("Mon" . 1)
		  ("Tue" . 2)
		  ("Wed" . 3)
		  ("Thu" . 4)
		  ("Fri" . 5)
		  ("Sat" . 6)
		  ("Sun" . 7)
		  )
		)
	       
	       (scheduled-prop (if (eq (org-entry-get nil "SCHEDULED" nil) nil)
				   (org-schedule nil "");; set today date if schedule date is not set
				 (org-entry-get nil "SCHEDULED" nil)
				 )
			       )
	       (parsed-scheduled-time (parse-time-string scheduled-prop))
	       (rec-list
		(let*
		    (
		     (tmplist (reverse (split-string rec-string  ",")))
		     (general-time-search-result (string-match "[[:space:]]*\\[\\([[:digit:]:-]+\\)\\]" (car tmplist)))
		     )
		  (if (not (eq general-time-search-result nil))
		      (progn
			(setq general-time (substring (car tmplist) (match-beginning 1) (match-end 1)))
			(setcar tmplist (substring (car tmplist) 0 (match-beginning 0)))
			)
		    )
		  (reverse tmplist)
		  )

		)

	       ;; as some days might be appended by time org time period, we get rid of them
	       (rec-list-days-only
		(let*
		    (
		     (tmplist '())
		     )
		  (dolist (
			   curelem
			   rec-list
			   )
		    (let* (
			   ;;(search-result (string-match-p (regexp-quote "\\(\\(Mon\\)\\|\\(Tue\\)\\)") curelem))
			   (search-result (string-match "\\(\\(Mon\\)\\|\\(Tue\\)\\|\\(Wed\\)\\|\\(Thu\\)\\|\\(Fri\\)\\|\\(Sat\\)\\|\\(Sun\\)\\)" curelem))
			   )
		      (if (not (eq search-result nil))
			  (push (substring curelem search-result (+ search-result 3)) tmplist)
			)
		      )
		    )
		  (reverse tmplist)
		  )
		) 
	       ;;(cur-week-day (format-time-string "%a"))
	       (cur-heading-scheduled-week-day
		(nth 6 parsed-scheduled-time)
		)
	       (y-m-y-date
		(org-format-time-string "%Y-%m-%d" (org-get-scheduled-time (point)))
		
		;; (concat
		;;  (number-to-string (nth 5 parsed-scheduled-time))
		;;  "-"
		;;  (number-to-string (nth 4 parsed-scheduled-time))
		;;  "-"
		;;  (number-to-string (nth 3 parsed-scheduled-time))
		;;  )
		)
	       
	       (nextoccurence nil)
	       (nextoccurence-weekday nil)
	       (nextoccurence-time nil)
	       )
	  (setq org-read-date-prefer-future nil)
	  (catch 'weekdayfound
	    (dolist (curelem rec-list-days-only)
	      (if (> (cdr (assoc curelem weekdays-alist)) cur-heading-scheduled-week-day )
		  (progn
		    (setq nextoccurence-weekday curelem)
		    (throw 'weekdayfound 1)
		    )
		)
	      )
	    )
	  (if (eq nextoccurence-weekday nil)
	      (setq nextoccurence-weekday (car rec-list-days-only))
	    )

	  (catch 'occurfound
	    (dolist (curelem rec-list)
	      (if (not (eq (string-match nextoccurence-weekday curelem) nil))
		  (progn
		    (setq nextoccurence curelem)
		    (throw 'occurfound 1)
		    )
		)
	      )
	    )

	  (if (not (eq (string-match "[[:digit:]:-]+" nextoccurence) nil))
	      (setq nextoccurence-time
		    (substring nextoccurence (match-beginning 0) (match-end 0)))
	      )

	  ;; inserting into LOGBOOK drawer
	  ;; - State "DONE"       from "TODO"       [2020-09-28 Mon 03:09]
	  (my/org-insert-to-logbook (concat "- State " "\"" (org-get-todo-state) "\" from \"" "TODO" "\" [" y-m-y-date "]"))
	  ;;(my/org-insert-to-logbook (concat statistics-property-name " " (org-get-todo-state) " [" y-m-y-date "]"))
	  
	  ;; setting todo state for current heading programmatically
	  (org-entry-put nil "TODO" "TODO")

	  ;; rescheduling to next week day
	  
	  ;; function (org-schedule nil nextoccurence) wont work properly,
	  ;; so do not use it for that particular purpose
	  (save-excursion
	    (if (re-search-forward "SCHEDULED:[ ]*<[[:digit:]]" (save-excursion
								(outline-next-heading)
								(point))
				 t)
		(progn
		  (goto-char (match-end 0))
		  (while (not (eq (cdr (assoc nextoccurence-weekday weekdays-alist))
				  ;; week day in scheduled timestamp in number notation
				  (nth 6 (parse-time-string (org-entry-get nil "SCHEDULED" nil))) 
				  ) )
		    (org-timestamp-up-day)
		    ))
	      )
	    )

	  (if (not (eq nextoccurence-time nil))
	      (org-schedule nil
			    (concat
			     (org-format-time-string "%Y-%m-%d %a"
						     (org-get-scheduled-time (point))) " " nextoccurence-time))
	    (if (not (eq general-time nil))
		(org-schedule nil
			      (org-schedule nil
					    (concat
					     (org-format-time-string "%Y-%m-%d %a" (org-get-scheduled-time (point))) " " general-time)))
	      )
	    )
	  
	  ;; /rescheduling to next week day
	  
	  )
      )
    (message (concat "Scheduled to " (org-entry-get nil "SCHEDULED" nil) ))
    (setq org-read-date-prefer-future org-read-date-prefer-future-default)
    
    )
  )
(add-hook 'org-after-todo-state-change-hook 'my/set-next-week-day)

(defun my-org-table/create-empty-schedule-table ()
  (interactive)
  (let*
      (
       ;;(table-start-time (ts-hour (ts-parse "08:00")))
       (table-start-time (ts-parse "08:30"))

       (table-end-time (ts-parse "23:00"))
       
       (ts-minute (ts-adjust 'hour +1 'minute +30 (ts-parse "08:00")))
       (headers
	(list
	 "TIME"
	 "Mon"
	 "Tue"
	 "Wed"
	 "Thu"
	 "Fri"
	 "Sat"
	 "Sun"))
       (time-unit-iterator table-start-time)
       (rows-number
	(+
	 3
	 (if (not (eq (ts-minute table-end-time) 0)) 1 0)
	 (if (not (eq (ts-minute table-start-time) 0)) -1 0)
	 (* 2 (- (ts-hour table-end-time)
		(ts-hour table-start-time)
		)))
	)
       )
    ;;(insert "|" (string-join headers "|") "|\n")
    ;;(insert "|" ())
    ;;(org-table-create-with-table.el ) ;; OR (table-insert)

    ;; create table
    (table-insert (length headers) rows-number)

    ;; fill up headers
    (dolist (header headers)
      (table--cell-insert-char header)
      (table-forward-cell)
      )

    ;; fill up time units
    (table--cell-insert-char
       "Unspecified time"
       )
    
    ;; move down by 1 cell
    (cl-dotimes (iter (length headers))
	(table-forward-cell)
	)
    
    (while (ts<= time-unit-iterator table-end-time)
      (table--cell-insert-char
       (concat ;;(format "%1$03d" 80)
	(format "%1$02d" (ts-hour time-unit-iterator))
	":"
	(format "%1$02d" (ts-minute time-unit-iterator))
	)
       )

      ;; move down by 1 cell
      (cl-dotimes (iter (length headers))
	(table-forward-cell)
	)
      ;; increment time-unit-iterator by 30 minutes
      (setq time-unit-iterator (ts-adjust 'minute +30 time-unit-iterator))
      )
    )
  )

;;(org-element-property :title (org-element-at-point))
(defun my-org-habits/find-recur-tasks-by-day(day)
  (let*
      (
       (tasks
	(let*
	    (
	     (headings-titles (list))
	     )
	  (save-excursion(save-window-excursion
	    (find-file (concat my-org-directory "regular.org"))
	    (widen)
	    (goto-char (point-min))
	    (while (re-search-forward (concat "^\\*+ +.*?|.*?" day ".*?|") nil t)
	      (push (org-element-property :title (org-element-at-point)) headings-titles)
	      )))
	    headings-titles)))
    tasks
    )
  )


(defun my-org-table/goto-cell (row-number column-number)
  (let*
      (
       (columns-in-table 8)
       (times (+ column-number -1
		 (* (1- row-number) columns-in-table)
		 ))
       )
    (table-goto-top-left-corner)
    (next-line)
    (right-char)
    (table-forward-cell times)
      )
    )

(defun my/forward-line(&optional arg)
(let ((column (current-column)))
  (forward-line arg)
  (move-to-column column))
  )

(defun my-org-table/get-cell-value (row column)
  ;; CAUTION dumb code
  (let*
      (
       (beg-of-cell-line)
       (end-of-cell-line)
       (cell-value "")
       )
    (save-excursion
      (my-org-table/goto-cell row column)
    (while (not (my-org-table/point-at-table-horizontal-border-p))
      (setq beg-of-cell-line (point))
      (while (not (eq (char-after) ?|))
	(forward-char)
	)
      (setq end-of-cell-line (point))
      (setq cell-value (concat cell-value (buffer-substring-no-properties beg-of-cell-line end-of-cell-line) "\n"))
      (my/forward-line)
      (while (and
	      (not (eq (char-before) ?|))
	      (not (eq (char-before) ?+))
	      )
	(forward-char -1)
	)
      ))
    (replace-regexp-in-string
     "\\(^ +\\| +$\\)" ""
     (replace-regexp-in-string "[[:space:]
]+" " " cell-value) )
    )
  )

(defun my-org-table/point-at-table-horizontal-border-p ()
  (let*
      (
       (current-line (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
       (res (string-match "\\(\\+-+\\)+\\+" current-line))
       )
    (and
     res
     (>= (point) (+ (match-beginning 0) (line-beginning-position)))
     (<  (point) (+ (match-end 0) (line-beginning-position)) )
     )
    )
  )

(defun my-org-table/table-columns-number ()
  (let*
      (
       (line-number)
       (count 0)
       )
    (save-excursion
     (my-org-table/goto-cell 1 1)
    (setq line-number (line-number-at-pos))
    (while (eq line-number (line-number-at-pos))
      (table-forward-cell) (setq count (1+ count))))
    count
      )
    )

(defun my-org-table/table-rows-number ()
  (let*
      (
       (line-number)
       (count 0)
       )
    (save-excursion
     (table-goto-top-left-corner)
    (while (org-at-table-p t)
      (next-line)
      (when (eq (char-after) ?+) (setq count (1+ count)))
      ))
    count
    )
  )


(defun my-org-table/get-column-number-by-header-value (header-value)
  (let*
      (
       (found nil)
       (header-number 0)
       (columns-amount (my-org-table/table-columns-number))
       )
    (while (and
	    (not found)
	    (setq header-number (1+ header-number))
	    (<= header-number columns-amount)
	    )

      (if (string= header-value (my-org-table/get-cell-value 1 header-number))
	  (setq found t)
	)
      
      )
    header-number
      )
    )

(defun my-org-table/get-row-number-by-column-value (column-name column-value)
  (let*
      (
       (column-number (my-org-table/get-column-number-by-header-value column-name))
       (rows-amount (my-org-table/table-rows-number))
       (row-iter 1)
       (found nil)
       )
    (while (and
	    (not found)
	    (setq row-iter (1+ row-iter))
	    (<= row-iter rows-amount)
	    )
      (if (string= column-value (my-org-table/get-cell-value row-iter column-number))
	  (setq found t)
	  )
      )
    row-iter
    )
  )

(defun my-org-table/append-to-unspec-time (day)
  (let*
      (
       ()
       ()
       )
    
      )
    )


(defun my-org-table/expand-cell-down (start-time end-time)

  (let*
      (
       (start-ts (ts-parse start-time))
       (end-ts (ts-parse end-time))
       (subtr-ts (/ (ts-difference end-ts start-ts) 60))
       (size-of-1-time-unit 30)
       (how-many-times-to-expand (1- (/ subtr-ts size-of-1-time-unit) ))
       )
    (cl-dotimes (iter how-many-times-to-expand)
	(table-span-cell 'below))
      )
    
    )

(defun my-org-table/fill-schedule-table ()
  (let*
      (
       (days (list "Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun"))
       (current-day-tasks-list)
       )
    (dolist (day days)
      (setq current-day-tasks-list
	    (my-org-habits/find-recur-tasks-by-day day))
      (dolist (task current-day-tasks-list)
	(cond
	 ;; check for time for specific day
	 ((string-match
	   (concat "|.*?" day " *\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\(-\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\)?.*?|") ;; * |Mon,Tue 99:99,Fri| -- time for specific day
	   task
	   )
	  
	  (save-match-data(my-org-table/goto-cell
	   (my-org-table/get-row-number-by-column-value "TIME" (match-string 3 task))
	   (my-org-table/get-column-number-by-header-value day)))
	  (if (not (eq (match-string 3 task) nil))
	      (my-org-table/expand-cell-down  (match-string 1 task) (match-string 3 task))
	      )
	  ;; insert task text into cell
	  (table--cell-insert-char
	   (replace-regexp-in-string org-bracket-link-regexp "\\2"
	    (replace-regexp-in-string "|.+?| +" "" task))
	   )
	  
	 )

	 ;;check for general time
	 ((string-match
	   "|.*?\\[\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\(-\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\)?\\].*?|" ;; * |Mon,Tue,Fri [99:99]| -- general time
	   task
	   )
	  
	  (save-match-data(my-org-table/goto-cell
	   (my-org-table/get-row-number-by-column-value "TIME" (match-string 1 task))
	   (my-org-table/get-column-number-by-header-value day)))
	  (if (not (eq (match-string 3 task) nil))
	      (my-org-table/expand-cell-down  (match-string 1 task) (match-string 3 task))
	      )
	  (table--cell-insert-char
	   (replace-regexp-in-string org-bracket-link-regexp "\\2"
	    (replace-regexp-in-string "|.+?| +" "" task))
	   )
	  
	 )
	 ;; no specified time in task
	 (t
	  ;; append to 'Unspecified time' row
	  (my-org-table/goto-cell
	   (my-org-table/get-row-number-by-column-value "TIME" "Unspecified time")
	   (my-org-table/get-column-number-by-header-value day))
	  (table--cell-insert-char
	   (replace-regexp-in-string org-bracket-link-regexp "\\2"
	    (replace-regexp-in-string "|.+?| +" "" task))
	   )))))))


(defun org-dblock-write:block-update-time (params)
  (let ((fmt (or (plist-get params :format) "%d. %m. %Y")))
    (insert "Last block update at: "
            (format-time-string fmt))))


(defun my-org-habits/find-recur-tasks(orgfile)
  (let
      (
       (headings-titles (list))
       )
    (save-excursion(save-window-excursion
      (find-file (concat my-org-directory orgfile))
      (widen)
      (goto-char (point-min))
      (while (re-search-forward (concat "^\\*+ +.*?|.*?|") nil t)
	(push (org-element-property :title (org-element-at-point)) headings-titles)
	)))
    headings-titles)
  )

(defun org-dblock-write:org-table-test (params)
  (require 'org-table)
  (require 'cl-lib)
  (let ((recurring-tasks (my-org-habits/find-recur-tasks "regular.org"))
	(fmt (or (plist-get params :format) "%d. %m. %Y"))
	(access-to-vector-indices
	 (list (cons "Mon" 0)
	       (cons "Tue" 1)
	       (cons "Wed" 2)
	       (cons "Thu" 3)
	       (cons "Fri" 4)
	       (cons "Sat" 5)
	       (cons "Sun" 6)
	       ))
	(summary (make-vector 7 0))
	
	)
    (insert "|mon|tue|wed|thu|fri|sat|sun|")
    (org-table-insert-row t)
    (dolist (task recurring-tasks)
      (dolist (day (list "Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun"))
	(let* (
	       (task-name)
	       (task-duration)
	       (task-start-time)
	       (task-end-time)
	       (task-time-range)
	       )
	  (cl-labels ((format-element
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
			       )
			 )
		       ))
	    (and
	     ;; if task string contains '|...'day'(00:00(-(00:00))?)?...([00:00(-(00:00))?]|)?...|'
	     (string-match (concat "|.*?" day " *\\(\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\(-\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\)?\\)?.*?\\(\\[\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\(-\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\)?\\]\\)?[. ]*?|") task)
	     ;; insert task name into table field (without |...| and org-links)
	     (setq task-name (replace-regexp-in-string
			      org-bracket-link-regexp "\\2"
			      (replace-regexp-in-string "|.+?| +" "" task)))
	     (cond
	      ;; if time range for this day exists
	      ((match-string 4 task)
	       ;; insert duration of this time in '[HH:MM]' format
	       (format-element 2 4)
	       )
	      ;; if general time range exists for this task  -- [HH:MM-HH:MM] format (within square brackets)
	      ((match-string 8 task)
	       ;; insert duration of this time in '[HH:MM]' format
	       (format-element 6 8)
	       ))
	     (insert (concat task-time-range task-name task-duration)))  
	    )
	  )
	(org-table-next-field)))
    (org-table-insert-column)
    (org-table-move-column-left)
    (insert "summary:")
    (mapcar (lambda(diff-in-minutes) (org-table-next-field)
	      (insert (let* (
			     (hours (format "%1$02d" (floor (/ diff-in-minutes 60))))
			     (minutes (format "%1$02d"(% diff-in-minutes 60)))
			     )
			(concat hours ":" minutes)
			))
	      )
	    summary)
    (org-table-align)))

;; (defun mytest ()
;;     (let (
;; 	  (ma (list (cons "Mon" 0)
;; 	       (cons "Tue" 0)
;; 	       (cons "Wed" 0)
;; 	       (cons "Thu" 0)
;; 	       (cons "Fri" 0)
;; 	       (cons "Sat" 0)
;; 	       (cons "Sun" 0)
;; 	       ))
;; 	  (sum (make-vector 5 0))
;; 	  )
;;       ;;(assoc "Mon" ma)
;;       (mapcar 'insert (mapcar 'number-to-string sum))
      
;;     )
;; )

(provide 'my-week-day-based-habits)
