
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
	rec-string)
    
    (save-excursion
      (goto-char cur-head-point)
      (setq head-string (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
      (save-match-data
	(and (string-match "\\(^\\*+\\) +\\(\\(MISSED\\)\\|\\(DONE\\)\\) +.*?|\\(.*?\\)|\\(.*\\)" head-string)
	     (if (not (zerop (length (match-data))))
		 (setq rec-string (match-string 5 head-string))))))
    rec-string))


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
      ((org-read-date-prefer-future-default org-read-date-prefer-future)
       (rec-string (my-org-recur-get-current-heading-recurrence-string))
       (general-time nil))
    (if rec-string
	(let* ((weekdays-alist
		'(("Mon" . 1)("Tue" . 2)("Wed" . 3)("Thu" . 4)("Fri" . 5)("Sat" . 6)("Sun" . 7)))
	       (scheduled-prop (if (not (org-entry-get nil "SCHEDULED" nil))
				   (org-schedule nil "");; set today date if schedule date is not set
				 (org-entry-get nil "SCHEDULED" nil)))
	       (parsed-scheduled-time (parse-time-string scheduled-prop))
	       (rec-list
		(let*
		    ((tmplist (reverse (split-string rec-string  ",")))
		     (general-time-search-result (string-match "[[:space:]]*\\[\\([[:digit:]:-]+\\)\\]" (car tmplist))))
		  (when general-time-search-result
		    (setq general-time (substring (car tmplist) (match-beginning 1) (match-end 1)))
		    (setcar tmplist (substring (car tmplist) 0 (match-beginning 0))))
		  (reverse tmplist)))

	       ;; as some days might be appended by org time period, we get rid of them
	       (rec-list-days-only
		(let* ((tmplist (list)))
		  (dolist (curelem rec-list)
		    (let* (
			   ;;(search-result (string-match-p (regexp-quote "\\(\\(Mon\\)\\|\\(Tue\\)\\)") curelem))
			   (search-result (string-match "\\(\\(Mon\\)\\|\\(Tue\\)\\|\\(Wed\\)\\|\\(Thu\\)\\|\\(Fri\\)\\|\\(Sat\\)\\|\\(Sun\\)\\)" curelem)))
		      (if search-result
			  (push (substring curelem search-result (+ search-result 3)) tmplist))))
		  (reverse tmplist))) 
	       ;;(cur-week-day (format-time-string "%a"))
	       (cur-heading-scheduled-week-day
		(nth 6 parsed-scheduled-time))
	       (y-m-y-date
		(org-format-time-string "%Y-%m-%d" (org-get-scheduled-time (point))))
	       
	       (nextoccurence nil)
	       (nextoccurence-weekday nil)
	       (nextoccurence-time nil)
	       )
	  (setq org-read-date-prefer-future nil)
	  (catch 'weekdayfound
	    (dolist (curelem rec-list-days-only)
	      (when (> (cdr (assoc curelem weekdays-alist)) cur-heading-scheduled-week-day )
		(setq nextoccurence-weekday curelem)
		(throw 'weekdayfound 1))))
	  (if (not nextoccurence-weekday)
	      (setq nextoccurence-weekday (car rec-list-days-only)))

	  (catch 'occurfound
	    (dolist (curelem rec-list)
	      (when (string-match nextoccurence-weekday curelem)
		(setq nextoccurence curelem)
		(throw 'occurfound 1))))
	  (if (string-match "[[:digit:]:-]+" nextoccurence)
	      (setq nextoccurence-time
		    (substring nextoccurence (match-beginning 0) (match-end 0))))

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
	    (when (re-search-forward "SCHEDULED:[ ]*<[[:digit:]]" (save-excursion
								(outline-next-heading)
								(point))
				 t)
	      (goto-char (match-end 0))
	      (while (not (eq (cdr (assoc nextoccurence-weekday weekdays-alist))
			      ;; week day in scheduled timestamp in number notation
			      (nth 6 (parse-time-string (org-entry-get nil "SCHEDULED" nil)))))
		(org-timestamp-up-day))))

	  (if nextoccurence-time
	      (org-schedule
	       nil
	       (concat
		(org-format-time-string "%Y-%m-%d %a" (org-get-scheduled-time (point))) " " nextoccurence-time))
	    (if general-time
		(org-schedule
		 nil
		 (org-schedule
		  nil
		  (concat
		   (org-format-time-string "%Y-%m-%d %a" (org-get-scheduled-time (point))) " " general-time)))))
	  
	  ;; /rescheduling to next week day
	  ))
    (message (concat "Scheduled to " (org-entry-get nil "SCHEDULED" nil) ))
    (setq org-read-date-prefer-future org-read-date-prefer-future-default)))
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
       (headings-titles+id+priority (list)))
    (save-excursion
      (save-window-excursion
	(find-file (concat my-org-directory orgfile))
	(widen)
	(goto-char (point-min))
	(while (re-search-forward "^\\*+ +.*?|.*?|" nil t)
	  (my/copy-id-to-clipboard)
	  (push (list (org-element-property :title (org-element-at-point))
		      (org-element-property :ID (org-element-at-point))
		      (org-element-property :priority (org-element-at-point))
		      )
		headings-titles+id+priority))
	(goto-char (point-min))

	;; searching for recurring tasks with +1d frequency
	(while (re-search-forward "SCHEDULED.*?\\(\\+1d\\)>" nil t)
	  (let* ((scheduled-time-for+1d-task))
	  (save-match-data(outline-previous-heading))
	    (my/copy-id-to-clipboard)
	    ;;prepending |...| string to +1d task
	    (unless (eq (org-element-property :hour-start (org-element-property :scheduled (org-element-at-point))) nil)
	      (let*((sch (org-element-property :raw-value
					       (org-element-property :scheduled (org-element-at-point)))))
		(save-match-data(string-match "\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\(-\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\)?" sch)
		(setq scheduled-time-for+1d-task
		      (concat " [" (match-string 0 sch) "]")))))
	    (push (list
		   (concat
		    
		    "|Mon,Tue,Wed,Thu,Fri,Sat,Sun "
			   scheduled-time-for+1d-task
			   "| "
			   (org-element-property :title (org-element-at-point)))
		   (org-element-property :ID (org-element-at-point))
		   (org-element-property :priority (org-element-at-point))
		   )
		  headings-titles+id+priority)
	  (goto-char (match-end 0))))))
    headings-titles+id+priority))


(defun my-org-table/check-for-matches(day task id priority)
  ;;"|Mon,Tue 15:00,Wed 15:15-16:30 [17:00]| name"
  "Return list that contains string and task duration(integer) or nil if there's no matches."
  (require 'ts)
  (let*
      (
       (regexp (concat "|.*?" day " *\\(\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\(-\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\)?\\)?,?.*?\\(\\[\\(\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\(-\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)\\)?\\)\\]\\)?[. ]*?| *\\(.+\\)"))
       (time-range-match)
       (start)
       (end)
       (diff-in-minutes)
       (hours)
       (minutes)
       (task-name)
       (real-work-p)
       ;;(result-string)
       )
    (when
	(string-match regexp task)
      ;; choose general time range match if day-specific equals to nil
      (setq time-range-match
	    (cond
	     ( (match-string 1 task) 1)
	     ( (match-string 6 task) 6)
	     ( t nil)
	     ))
      (setq real-work-p (eq priority 49)) ;; if priority equals to 1
      (when
	  (and time-range-match
	       (match-end (+ 2 time-range-match)))
	(setq start (ts-parse (match-string (1+ time-range-match) task))
	      end (ts-parse(match-string (+ time-range-match 3) task))
	      diff-in-minutes (/ (round(ts-difference end start)) 60)
	      hours (format "%1$02d" (floor (/ diff-in-minutes 60)))
	      minutes (format "%1$02d"(% diff-in-minutes 60))))
      (setq task-name  
	    (replace-regexp-in-string org-bracket-link-regexp "\\2"
				      (match-string 10 task)))
      (list (concat
	     (when real-work-p "⚠ ")
	     (when time-range-match
	       (concat
		"["
		(match-string time-range-match task)
		"] "))
	     (concat "[[id:" id "]["task-name "]]");;task-name
	     ;;task-duration
	     (when (and time-range-match
	       (match-end (+ 2 time-range-match))) (concat " (" hours ":" minutes ")")))
	    diff-in-minutes real-work-p))))


(defun org-dblock-write:org-table-test222 (params)
  (require 'org-table)
  (require 'cl-lib)
  (require 'ts)
  (let ((all-recurring-tasks (my-org-habits/find-recur-tasks "regular.org")) ;; get all tasks
	(show-free-time-p (or (plist-get params :free-time) nil))
	(sort-p (or (plist-get params :sort) nil))
	(fmt (or (plist-get params :format) "%d. %m. %Y"))
	(access-to-vector-indices(list (cons "Mon" 0)(cons "Tue" 1)(cons "Wed" 2)(cons "Thu" 3)(cons "Fri" 4)(cons "Sat" 5)(cons "Sun" 6)))
	(summary (make-vector 7 0))
	(real-work (make-vector 7 0))
	)
    (insert "|mon|tue|wed|thu|fri|sat|sun|")
    (org-table-insert-row t)
    (dolist (day (list "Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun"))
      (let* ((tasks-to-insert-into-current-day-column (list)))
	(dolist (task all-recurring-tasks)
	  (let ((processed-task nil))
	    (setq processed-task (my-org-table/check-for-matches day (car task) (nth 1 task) (nth 2 task)))
	    (when processed-task
	      (push (car processed-task) tasks-to-insert-into-current-day-column))
	    (when (nth 1 processed-task)
	      (aset summary (cdr(assoc day access-to-vector-indices))
		(+ (nth 1 processed-task) (aref summary (cdr(assoc day access-to-vector-indices)))))
	      )
	    (when (and (nth 1 processed-task) (nth 2 processed-task))
	      (aset real-work (cdr(assoc day access-to-vector-indices))
		    (+ (nth 1 processed-task) (aref real-work (cdr(assoc day access-to-vector-indices))))))))
	(when sort-p (setq tasks-to-insert-into-current-day-column (sort tasks-to-insert-into-current-day-column 'my-org-table/sort-fields)))
	
	(let ((iter 0))
	  (while (< iter (length tasks-to-insert-into-current-day-column))
	    (let*((task-1-name (nth iter tasks-to-insert-into-current-day-column))
		  (task-2-name (and (< (1+ iter) (length tasks-to-insert-into-current-day-column))(nth (1+ iter) tasks-to-insert-into-current-day-column))))
	     (insert (nth iter tasks-to-insert-into-current-day-column))
	     (org-table-next-row)
	     
	    (when (and show-free-time-p task-2-name)
	      (let*
		  (
		   (task-1-end-time (and
				     (string-match "\\[[0-9]\\{2\\}:[0-9]\\{2\\}-\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\]" task-1-name)
				     (match-string 1 task-1-name)))
		   (task-2-start-time (and
				       (string-match "\\[\\([0-9]\\{2\\}:[0-9]\\{2\\}\\)\\(-[0-9]\\{2\\}:[0-9]\\{2\\}\\)?\\]" task-2-name)
				       (match-string 1 task-2-name)))
		   (diff)(hours)(minutes)
		   )
		
		(when (and
		       task-1-end-time
		       task-2-start-time
		       (> (setq diff (round(/ (ts-difference (ts-parse task-2-start-time) (ts-parse task-1-end-time)) 60))) 0))
		 ;; (hours (format "%1$02d" (floor (/ diff-in-minutes 60))))
		 ;; 	     (minutes (format "%1$02d"(% diff-in-minutes 60)))
			     
		  (setq hours (format "%1$02d" (floor (/ diff 60))))
		  (setq minutes (format "%1$02d"(% diff 60)))
		  (insert
		   (concat "=free time: (" hours ":" minutes ")="))
		  (org-table-next-row)))))
	    (setq iter (1+ iter))))
	;; (dolist (task tasks-to-insert-into-current-day-column)
	;;   (insert task)
	;;   (org-table-next-row))
	(my-org-table/goto-first-row)
	(org-table-next-field)))
    (org-table-insert-column)
    (org-table-move-column-left)
    (my-org-table/goto-last-row)
    (insert "summary:")
    (mapcar (lambda(diff-in-minutes) (org-table-next-field)
	      (insert (let* (
			     (hours (format "%1$02d" (floor (/ diff-in-minutes 60))))
			     (minutes (format "%1$02d"(% diff-in-minutes 60)))
			     )
			(concat hours ":" minutes))))
	    summary)
    (org-table-align)
    (my-org-table/goto-first-column)
    (my-org-table/goto-last-row)
    (org-table-insert-row)
    (insert "real work:")
    (mapcar (lambda(diff-in-minutes) (org-table-next-field)
	      (insert
	       (let* (
		      (hours (format "%1$02d" (floor (/ diff-in-minutes 60))))
		      (minutes (format "%1$02d"(% diff-in-minutes 60))))
		 (concat hours ":" minutes))))
	    real-work)))


(defun org-dblock-write:org-table-test (params)
  (require 'org-table)
  (require 'cl-lib)
  (require 'ts)
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
	(org-table-next-field)))
    ;; sorting
    (my-org-table/sort)
    ;; /sorting
    (org-table-insert-column)
    (org-table-move-column-left)
    (my-org-table/goto-last-row)
    (insert "summary:")
    (mapcar (lambda(diff-in-minutes) (org-table-next-field)
	      (insert (let* (
			     (hours (format "%1$02d" (floor (/ diff-in-minutes 60))))
			     (minutes (format "%1$02d"(% diff-in-minutes 60)))
			     )
			(concat hours ":" minutes)
			)))
	    summary)
    (org-table-align)))

(defun my-org-table/goto-last-row()
  ;; NOTE dumb code
  (let* (
	 (prev)
	 )
    (while (org-at-table-p)
      (setq prev (point))
      (my/forward-line 1)
      )
    (goto-char prev)
    )
  ;; point is at first row of table (second if we count column names)
  )

(defun my-org-table/goto-first-row ()
  ;; NOTE dumb code
  (let* (
	 (prev)
	 )
    (while (org-at-table-p)
      (setq prev (point))
      (my/forward-line -1)
      )
    (goto-char prev)
    )
  ;; point is at first row of table (second if we count column names)
  (my/forward-line 1)
  )

(defun my-org-table/goto-first-column ()
  (ignore-errors (while t (org-table-previous-field)))
  )

(defun my-org-table/sort ()
  ;;(org-table-get-field)
  ;;(org-table-move-cell-down)?
  ;;(my-org-table/goto-first-column)
  (let((current-column 1))
    (while (<= current-column (my-org-table-width)) 
      (let* (
	     (fields (list))
	     (current-row 1)
	     )

	(my-org-table/goto-first-row)

	;; filling fields list
	(while (<= current-row (- (my-org-table-height) 2) )
	  (let (
		(field (replace-regexp-in-string " +" " " (org-table-blank-field))))
	    (unless (string= field " ")
	      (push field fields)))
	  (my/forward-line 1)
	  (setq current-row (1+ current-row))
	  )

	;; sorting fields list
	(setq fields (sort fields 'my-org-table/sort-fields))
	(my-org-table/goto-first-row)
	(setq current-row 1)
	(while (and
		(<= current-row (length fields))
		(<= current-row (- (my-org-table-height) 2) ))
	  (insert (nth (1- current-row) fields))
	  (org-table-align)
	  (my/forward-line 1)
	  (setq current-row (1+ current-row)))
	(org-table-next-field)
	(setq current-column (1+ current-column)))
      )))


(defun my-org-table/sort-fields (field1 field2)
  (require 'ts)
  (let* (
	 (regex "\\[\\([[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\).*?\\]")
	 (field1-start-time (save-match-data
			      (and (string-match regex field1)
				   (match-string 1)
				   (ts-parse (match-string 1 field1)))
			      ))
	 (field2-start-time (save-match-data
			      (and (string-match regex field2)
				   (match-string 1)
				   (ts-parse (match-string 1 field2))))))
    (save-match-data(cond
		     ((not (or field1-start-time field2-start-time)) t)
		     ((not field1-start-time) t)
		     ((not field2-start-time) nil)
		     (t (ts<= field1-start-time field2-start-time))))))

(defun my-org-table-height()
  "Return number of rows in org-table."
  (let* ((count 0))
    (save-excursion(while (org-at-table-p)(forward-line -1))
		   (while (progn
			    (forward-line 1)
			    (org-at-table-p))
		     (setq count (1+ count))))
    count))

(defun my-org-table-width()
  "Return number of columns in org-table."
  (save-excursion(my-org-table/goto-first-column)
		 (let* (
			(count 0)
			(line-number (line-number-at-pos))
			)
		   (while
		       (eq line-number (line-number-at-pos))
		     (org-table-next-field)
		     (setq count (1+ count)))
    count)))

(provide 'my-week-day-based-habits)
