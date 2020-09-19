(defun my/json-point (filename)
  "docstring"
  (interactive)
  (require 'loop)
  (require 'dash)
  (let* (
	 ;; function for appending to 'sets' arrays
	 (my/exercise-sets-list (lambda ()
				  (let* (
					 (tmplist '())
					 (input nil)
					 )
				    
				    (while(and
					   (setq input (read-string
							(concat "sets: ["
								(mapconcat 'number-to-string tmplist ",")
								"] enter another one or press ENTER to quit: ")
							))
					   (not(string= input ""))
					   )
				      (setq tmplist (append tmplist (list (string-to-number input))))
				      )
				    tmplist
				    )
				  ) )
	 
	 redefine-record
	 (date
	  (let* (
		 tmpdate
		 (options  (list "выбрать другую дату" "перезаписать запись")  )
		 chosen-option
		 )
	    (loop-while t
			(setq tmpdate (read-string "date:" (format-time-string "%Y-%m-%d") ))
			(if (not(eq(my/search-for-date tmpdate filename) nil))
			    (progn
			      (setq chosen-option (ivy-read "запись уже есть. Изменить запись или выбрать другую дату?" options :require-match t))
			      (cond
			       ;; выбрать другую дату
			       ((string= chosen-option (nth 0 options) ) (loop-continue)) 

			       ;; перезаписать запись
			       ((string= chosen-option (nth 1 options) ) 
				(setq redefine-record t)
				(loop-break)
				)
			       )
			      )
			  (loop-break)
			  )

			)
	    tmpdate
	    )
	  )
	 (mins '(15 30 45 60))
	 (one-or-zero (list "0" "1"))
	 (exercised-p (string-to-number (ivy-read "exercised?" one-or-zero :require-match t)))
	 (planned-to-exercise-p (string-to-number (ivy-read "planned-to-exercise?" one-or-zero :require-match t)))

	 (ride-a-bike-p (string-to-number (ivy-read "ride-a-bike?" one-or-zero :require-match t)))
	 (bike-time (if (eq ride-a-bike-p 0) "0000" (ivy-read "when?" '("0000"))))
	 (bike-duration (if (eq ride-a-bike-p 0) 0 (string-to-number(ivy-read "duration(mins):" mins))))

	 (run-p (string-to-number (ivy-read "run?" one-or-zero :require-match t)))
	 (run-time (if (eq run-p 0) "0000" (ivy-read "when?" '("0000"))))
	 (run-duration (if (eq run-p 0) 0 (string-to-number(ivy-read "duration(mins):" mins))))

	 (default-sets '())
	 (squats-p (string-to-number (ivy-read "do squats?" one-or-zero :require-match t)))
	 (squats-sets (if (eq squats-p 0) default-sets (funcall my/exercise-sets-list)))

	 (pushups-p (string-to-number (ivy-read "do pushups?" one-or-zero :require-match t)))
	 (pushups-sets (if (eq pushups-p 0) default-sets (funcall my/exercise-sets-list)))

	 (press-p (string-to-number (ivy-read "do press?" one-or-zero :require-match t)))
	 (press-sets (if (eq press-p 0) default-sets (funcall my/exercise-sets-list)))

	 (notes (read-string "notes:" ""))
	 
	 (json-object (list date
			    exercised-p
			    planned-to-exercise-p
			    (list ride-a-bike-p bike-time bike-duration)
			    (list run-p run-time run-duration)
			    (list squats-p squats-sets)
			    (list pushups-p pushups-sets)
			    (list press-p press-sets)
			    notes
			    ))
	 )
    ;; appending to "data" array
    (save-excursion
      (find-file filename)
      (widen)
      (goto-char (point-min))
      (if (search-forward-regexp "\"data\"[ ]*:[ ]*\\[")
	  (let*
	      (
	       (data-array-beg (progn (forward-char -1)(point))) ;; array's 1st square bracket
	       (data-array-end (nth 3 (show-paren--default))) ;; array's 2nd square bracket
	       (data-array-elisp (json-read-array))
	       (iter 0)
	       data-array-json-string
	       )
	    (narrow-to-region data-array-beg data-array-end) ;; narrowing to "data" array
	    
	    (if (eq redefine-record t)
		;; redefine existing data record
		(progn
		  (loop-while (/= iter (length data-array-elisp))
		    (if (string= (car(nth iter data-array-elisp)) date)
			(progn
			  ;; debug 1
			  (message "DEBUG entered date: %s" date)
			  (message "car nth: %s" (car(nth iter data-array-elisp)))
			  ;; /debug 1
			  (loop-break)
			  )
		      )
		    (setq iter (+ iter 1))
		    )
		  (delete-region (point-min) (point-max))
		  (setq data-array-elisp (-replace-at iter json-object data-array-elisp))
		  (setq data-array-json-string (json-encode-array data-array-elisp) )
		  (message "==DEB===")
		  (message "data array: %s" data-array-json-string)
		  (message "=====")
		  (insert data-array-json-string)
		  )

	      ;; append to data array via (insert)
	      (progn
		(goto-char data-array-end)
		(forward-char -1)
		(while (not (eq (char-before) ?\] ) )
		  (forward-char -1)
		  )
		(insert ",\n")
		(insert (json-encode-array json-object))
		(indent-for-tab-command)
		)
	      
	      )
	    ;; converting to human-readable format
	    (goto-char (point-min))
	    (forward-char 1)
	    (loop-while (/= (point) (point-max))
	      (while (not (eq (char-after) ?\[ ) )
		(forward-char 1)
		)
	      (if (/= (char-before) ?\C-j)
		  (insert "\n")
		  )
	      (goto-char (nth 3 (show-paren--default)))
	      (loop-while (and
		      (not (eq (char-after) ?, ) )
		      (not (eq (char-after) ?\] ) )
		      )
		(forward-char 1)
		)
	      (if (eq(char-after) ?\])
		  (progn
		    (if (/= (char-before) ?\C-j)
			(insert "\n")
		      )
		    (loop-break)
		    )
		  )
	      (forward-char 1)
	      (if (/= (char-before) ?\C-j)
		  (insert "\n")
		)
	      )
	    ;; /converting to human-readable format
	    (save-buffer)
	    (kill-buffer)
	    )
	)
      )
    ;; /appending to "data" array
    "" ;;returning an empty string as a template string for orgmode
    )
  )
