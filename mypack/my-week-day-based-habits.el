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
  "Insert STRING at the beginning of LOGBOOK drawer.
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

    (setq org-read-date-prefer-future org-read-date-prefer-future-default)
    
    )
  )
(add-hook 'org-after-todo-state-change-hook 'my/set-next-week-day)


(provide 'my-week-day-based-habits)
