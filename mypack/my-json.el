;; (defun func-tocopy ()
;;   "docstring"
;;   (interactive)
;;   (let* (
	 
;; 	 )
;;     (find-file "~/.emacs.d/init.el")
;;     (widen)
;;     (goto-char (point-min) )

;;     (while
;; 	(search-forward-regexp "(defun.*?json" nil t)
;; 	(let*(
;; 	      (beg (match-beginning 0))
;; 	      (end (progn (goto-char beg)(nth 3 (show-paren--default))))
;; 	      )
;; 	  (kill-region beg end)
;; 	  (find-file "~/.emacs.d/mypack/my-json.el")
;; 	  (goto-char (point-max))
;; 	  (insert "\n")
;; 	  (yank)
;; 	  (save-buffer)
;; 	  )
;; 	)
;;     )
;;   )

(defun my/json-sleep (filename evening-p)
  "if evening-p non-nil, create evening record.
If nil, create morning record"
  (interactive)
  (require 'loop)
  (let* 
      (
       (mins '("0" "15" "30" "45" "60"))
       (hours '("6" "6.5" "7" "7.5" "8" "8.5" "9" "9.5" "10"))
       (one-four '("1" "2" "3" "4"))
       (one-or-zero (list "0" "1"))
       redefine-record
       (record-exists nil)
       (date
	(let* (
	       tmpdate
	       (options  (list "выбрать другую дату" "перезаписать запись")  )
	       chosen-option
	       date-search-result
	       )
	  (loop-while t
	    (setq record-exists nil)
	    (setq tmpdate (read-string "date:" (format-time-string "%Y-%m-%d") ))
	    (setq date-search-result (my/search-for-date tmpdate filename))

	    ;; if date has been found
	    (if (not(eq date-search-result nil))
		(progn
		  (setq record-exists t)
		  (find-file filename)
		  (goto-char date-search-result)

		  ;; go to comma
		  (while (not (eq (char-after) ?\, ) )
		    (forward-char 1)
		    )

		  ;; skip all whitespaces
		  (while (eq(string-match "[[:space:]\n]" (char-to-string(char-after))) 0)
		    (forward-char 1)
		    )
		  
		  (forward-char 1) ;; set cursor to beginning of next element of array

		  (when evening-p
		    (progn
		      (json-read)
		      (forward-char 1)
		      )
		    )
		  ;; if morning(org evening) subarray has been found
		  (if (not (eq(json-read) nil))
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
		    ))
	      )
	    (loop-break)
	    )
	  tmpdate
	  )
	)
       ;; morning
       (2300-0000-0800-0900-p (if (eq evening-p nil) (string-to-number (ivy-read "лечь в 23:00-00:00, встать в 08:00-09:00" one-or-zero :require-match t)) nil))
       (when-go-to-bed (if (eq evening-p nil)(ivy-read "когда пошел спать вчера?" '("0000")) nil))
       (when-got-up (if (eq evening-p nil)(ivy-read "когда встал утром сегодня?" '("0000")) nil))

       (how-many-hours-of-sleep (if (eq evening-p nil) (string-to-number(ivy-read "сколько часов спал?:" hours)) nil))
       (mins-before-sleep (if (eq evening-p nil) (string-to-number(ivy-read "сколько минут засыпал? " mins)) nil))

       (medication (if (eq evening-p nil)(ivy-read "какие медикаменты принимал, чтобы уснуть?" '("-" "мелатонин 3мг" "мелатонин 6мг")) nil))
       (general-sostoyanie-after-wake-up (if (eq evening-p nil) (string-to-number(ivy-read "как себя чувствовал после пробуждения?:" one-four)) nil))

       ;; evening
       (coffee-p (if evening-p (string-to-number (ivy-read "пил кофе сегодня?" one-or-zero :require-match t)) nil))
       (mins-nap (if evening-p (string-to-number(ivy-read "сколько дремал сегодня? " mins)) nil))
       (when-nap (if evening-p (if (eq mins-nap 0) "0000" (ivy-read "во сколько дремал сегодня?" '("0000"))) nil))
       (general-sostoyanie-whole-day (if evening-p (string-to-number(ivy-read "как себя чувствовал в течение дня?:" one-four)) nil))
       
       (json-morning-or-evening-subarray 
	(if evening-p
	    (list
	     coffee-p
	     mins-nap
	     when-nap
	     general-sostoyanie-whole-day
	     )
	  (list 2300-0000-0800-0900-p
		when-go-to-bed
		when-got-up
		how-many-hours-of-sleep
		mins-before-sleep
		medication
		general-sostoyanie-after-wake-up
		)
	  )
	
	)
       )
	    
    ;; appending to "data" array
    (find-file filename)
    (widen)
    (goto-char (point-min))

    (if (search-forward-regexp "\"data\"[ ]*:[ ]*\\[")
	(let*
	    (
	     (data-array-beg (progn (forward-char -1)(point))) ;; array's 1st square bracket
	     (data-array-end (nth 3 (show-paren--default))) ;; array's 2nd square bracket
	     (data-array-elisp (json-read-array)) ;; get json array through elisp vector
	     (iter 0)
	     data-array-json-string
	     date-morning-evening-subarray-elisp
	     )
	  (narrow-to-region data-array-beg data-array-end) ;; narrowing to "data" array
	  
	  (if (eq record-exists t)
	      ;; redefine existing data record
	      (progn
		(loop-while (/= iter (length data-array-elisp))
		  (if (string= (aref (aref data-array-elisp iter) 0) date)
		      (loop-break)
		    )
		  (setq iter (+ iter 1))
		  )
		(delete-region (point-min) (point-max))

		;; get array data point
		(setq date-morning-evening-subarray-elisp (aref data-array-elisp iter))

		;; replace morning-subarray within date-morning-evening-subarray-elisp
		
		;; (setq date-morning-evening-subarray-elisp
		;;       (-replace-at (if evening-p 2 1)
		;; 		   json-morning-or-evening-subarray
		;; 		   date-morning-evening-subarray-elisp)
		;;       )
		(aset date-morning-evening-subarray-elisp (if evening-p 2 1) json-morning-or-evening-subarray)

	      ;; replace element within vector by index
	      (aset data-array-elisp iter date-morning-evening-subarray-elisp)
		
		(setq data-array-json-string
		      (json-encode-array data-array-elisp) )
		(insert data-array-json-string)
		)

	    ;; append to data array via (insert)
	    
	    
	    )
	  (if (eq record-exists nil)
	      (progn
	      (goto-char data-array-end)
	      (forward-char -1)
	      (while (not (eq (char-before) ?\] ) )
		(forward-char -1)
		)
	      (insert ",")
	      (insert (if evening-p (json-encode-array (list date nil json-morning-or-evening-subarray))
			(json-encode-array (list date json-morning-or-evening-subarray nil )) ) )
	      (indent-for-tab-command)
	      )


	      )
	  ;; converting to human-readable format
	  (goto-char (point-min))
	  (my-json/prettify-array-at-point)
	  ;; /converting to human-readable format
	  (save-buffer)
	  (kill-buffer)
	  )
      )
    
    ;;returning an empty string as a template string for orgmode
    "" 
    )
  )
(defun my/json-habits (filename)
  "docstring"
  (interactive)
  (require 'loop)
  (let* (
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
	 
	 (taking-charge-adhd-p (string-to-number (ivy-read "taking-charge-adhd?" one-or-zero :require-match t)))
	 (taking-charge-adhd-planned-p (string-to-number (ivy-read "taking-charge-adhd-planned?" one-or-zero :require-match t)))
	 
	 (soc-skills-p (string-to-number (ivy-read "soc-skills?" one-or-zero :require-match t)))
	 (soc-skills-planned-p (string-to-number (ivy-read "soc-skills-planned?" one-or-zero :require-match t)))
	 
	 (nstu-3h-p (string-to-number (ivy-read "nstu-3h?" one-or-zero :require-match t)))
	 (nstu-3h-planned-p (string-to-number (ivy-read "nstu-3h-planned?" one-or-zero :require-match t)))

	 (discr-2h-p (string-to-number (ivy-read "discr-2h?" one-or-zero :require-match t)))
	 (discr-2h-planned-p (string-to-number (ivy-read "discr-2h-planned?" one-or-zero :require-match t)))
	 
	 (nofap-p (string-to-number (ivy-read "nofap?" one-or-zero :require-match t)))

	 (meditation-p (string-to-number (ivy-read "meditation?" one-or-zero :require-match t)))
	 (meditation-planned-p (string-to-number (ivy-read "meditation-planned?" one-or-zero :require-match t)))
	 (meditation-duration (if (eq meditation-p 0) 0 (string-to-number(ivy-read "duration(mins):" mins))))
	 
	 (teeth-morning-p (string-to-number (ivy-read "teeth-morning?" one-or-zero :require-match t)))
	 (teeth-evening-p (string-to-number (ivy-read "teeth-evening?" one-or-zero :require-match t)))

	 (shower-p (string-to-number (ivy-read "shower?" one-or-zero :require-match t)))

	 (cold-shower-p (string-to-number (ivy-read "cold-shower?" one-or-zero :require-match t)))
	 (cold-shower-planned-p (string-to-number (ivy-read "cold-shower-planned?" one-or-zero :require-match t)))

	 (notes (read-string "notes:" ""))


	 (json-object (vector date
			    (vector taking-charge-adhd-p taking-charge-adhd-planned-p)
			    (vector soc-skills-p soc-skills-planned-p)
			    (vector nstu-3h-p nstu-3h-planned-p)
			    (vector discr-2h-p discr-2h-planned-p)
			    nofap-p
			    (vector meditation-p meditation-planned-p meditation-duration)
			    (vector teeth-morning-p teeth-evening-p)
			    shower-p
			    (vector cold-shower-p cold-shower-planned-p)
			    notes
			    ))
	 
	 )
    ;; appending to "data" array
    (my/json-insert filename date json-object redefine-record)

    ;;returning an empty string as a template string for orgmode
    "" 
    
    )
  
  )

(defun my/json-exercises (filename)
  "docstring"
  (interactive)
  (require 'loop)
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

	 (ride-a-bike-p (if (eq exercised-p 1) (string-to-number (ivy-read "ride-a-bike?" one-or-zero :require-match t)) 0))
	 (bike-time (if (eq ride-a-bike-p 0) "0000" (ivy-read "when?" '("0000"))))
	 (bike-duration (if (eq ride-a-bike-p 0) 0 (string-to-number(ivy-read "duration(mins):" mins))))

	 (run-p (if (eq exercised-p 1) (string-to-number (ivy-read "run?" one-or-zero :require-match t)) 0 ))
	 (run-time (if (eq run-p 0) "0000" (ivy-read "when?" '("0000"))))
	 (run-duration (if (eq run-p 0) 0 (string-to-number(ivy-read "duration(mins):" mins))))

	 (default-sets '())
	 (squats-p (if (eq exercised-p 1) (string-to-number (ivy-read "do squats?" one-or-zero :require-match t)) 0))
	 (squats-sets (if (eq squats-p 0) default-sets (funcall my/exercise-sets-list)))

	 (pushups-p (if (eq exercised-p 1) (string-to-number (ivy-read "do pushups?" one-or-zero :require-match t)) 0))
	 (pushups-sets (if (eq pushups-p 0) default-sets (funcall my/exercise-sets-list)))

	 (pullups-p (if (eq exercised-p 1) (string-to-number (ivy-read "do pullups?" one-or-zero :require-match t)) 0))
	 (pullups-sets (if (eq pullups-p 0) default-sets (funcall my/exercise-sets-list)))
	 
	 (press-p (if (eq exercised-p 1) (string-to-number (ivy-read "do press?" one-or-zero :require-match t)) 0))
	 (press-sets (if (eq press-p 0) default-sets (funcall my/exercise-sets-list)))

	 (notes (read-string "notes:" ""))
	 
	 (json-object (vector date
			    exercised-p
			    planned-to-exercise-p
			    (vector ride-a-bike-p bike-time bike-duration)
			    (vector run-p run-time run-duration)
			    (vector squats-p squats-sets)
			    (vector pushups-p pushups-sets)
			    (vector pullups-p pullups-sets)
			    (vector press-p press-sets)
			    notes
			    ))
	 )
    ;; appending to "data" array
    (my/json-insert filename date json-object redefine-record)

    ;;returning an empty string as a template string for orgmode
    "" 
    )
  )

(defun my-json/poor-man-CBT (filename)
  "docstring"
  (interactive)

(require 'loop)
  (let* (
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
	 (one-or-zero (list "0" "1"))

	 (question1 (string-to-number (ivy-read "Действительно ли вы следовали расписанию?" one-or-zero :require-match t)))
	 (question2 (if (eq question1 0) nil (read-string "Почему вы не следовали расписанию, над которым так долго дрочились? ")))
	 (question3 (read-string "Какие мысли вас преследовали? "))
	 (question4 (read-string "Что можно сделать, чтобы исправить ситуацию завтра?"))

	 (json-object (vector date
			    question1
			    question2
			    question3
			    question4
			    ))
	 
	 )

    (my/json-insert filename date json-object redefine-record)
    
    ;;returning an empty string as a template string for orgmode
    "" 
    )
  
  )

(defun my-json/migraines (filename)
  "docstring"
  (interactive)
  (require 'loop)
  (let* (
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
	 (one-four '("1" "2" "3" "4"))

	 (headache-possible-reason (read-string "как думаешь, что спровоцировало приступ? погода? какая-то еда? недосып/пересып?" ""))

	 (headache-extent (string-to-number (ivy-read "степень тяжести приступа (1-4) " one-four :require-match t)))

	 (notes (read-string "notes: " ""))

	 (json-object (vector date
			    headache-possible-reason
			    headache-extent
			    notes
			    ))
	 
	 )

    (my/json-insert filename date json-object redefine-record)
    
    ;;returning an empty string as a template string for orgmode
    "" 
    )

  )

(defun my/json-insert (filename date json-object redefine-record)
  "docstring"
  (interactive)
  (require 'loop)
  (save-excursion
    (find-file filename)
    (widen)
    (goto-char (point-min))
    (if (search-forward-regexp "\"data\"[ ]*:[ ]*\\[")
	(let*
	    (
	     (data-array-beg-bracket (progn (forward-char -1)(point))) ;; array's 1st square bracket
	     (data-array-end-bracket (nth 3 (show-paren--default))) ;; array's 2nd square bracket
	     (data-array-elisp (json-read-array))
	     (iter 0)
	     data-array-json-string
	     )
	  (narrow-to-region data-array-beg-bracket data-array-end-bracket) ;; narrowing to "data" array
	  
	  (if (eq redefine-record t)
	      ;; redefine existing data record
	      (progn
		(loop-while (/= iter (length data-array-elisp))
		  (if (string= (aref (aref data-array-elisp iter) 0) date)
		      (loop-break)
		    )
		  (setq iter (+ iter 1))
		  )
		(delete-region (point-min) (point-max))
		
		;; replace element within vector by index
		(aset data-array-elisp iter json-object)
		
		(setq data-array-json-string (json-encode-array data-array-elisp) )
		(insert data-array-json-string)
		)

	    ;; append to data array via (insert)
	    (progn
	      (goto-char data-array-end-bracket)
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
	  (my-json/prettify-array-at-point)
	  ;; /converting to human-readable format
	  (save-buffer)
	  (kill-buffer)
	  )
      )
    )
  
  )

(defun my-json/engl (filename)
  "docstring"
  (interactive)
  (require 'loop)
  (let*
      (
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
       (one-or-zero (list "0" "1"))
       ;;;;;;;;;;;;;
       
       (reading-done-p (string-to-number (ivy-read "reading-done?" one-or-zero :require-match t)))
       (reading-planned-p (string-to-number (ivy-read "reading-planned?" one-or-zero :require-match t)))

       (grammar-done-p (string-to-number (ivy-read "grammar-done?" one-or-zero :require-match t)))
       (grammar-planned-p (string-to-number (ivy-read "grammar-planned?" one-or-zero :require-match t)))

       (writing-done-p (string-to-number (ivy-read "writing-done?" one-or-zero :require-match t)))
       (writing-planned-p (string-to-number (ivy-read "writing-planned?" one-or-zero :require-match t)))

       (anki-new-words-done-p (string-to-number (ivy-read "anki-new-words-done?" one-or-zero :require-match t)))
       (anki-new-words-planned-p (string-to-number (ivy-read "anki-new-words-planned?" one-or-zero :require-match t)))
       (anki-revise-done-p (string-to-number (ivy-read "anki-revise-done?" one-or-zero :require-match t)))
       (anki-revise-planned-p (string-to-number (ivy-read "anki-revise-planned?" one-or-zero :require-match t)))
       
       ;;;;;;;;;;;;;
       
       ;; 3 level nested json arrays wont work when attempting to create from lists as opposed to vectors
       (json-object (vector date
			  (vector reading-done-p reading-planned-p)
			  (vector grammar-done-p grammar-planned-p)
			  (vector writing-done-p writing-planned-p)

			  (vector
			  (vector anki-new-words-done-p anki-new-words-planned-p)
			  (vector anki-revise-done-p anki-revise-planned-p)
			  )
			    ))
       )
    (my/json-insert filename date json-object redefine-record)
    
    ;;returning an empty string as a template string for orgmode
    "" 
    )
  )

(defun my-json/prettify-array-at-point ()
  "the function ill work correctly if cursor is on the first square
bracket of JSON array"
  (interactive)
  (require 'loop)
  (let* (
	 (array-start (point))
	 (end-of-array nil)
	 (array-is-valid
	  
	  (let* (
		 (array-elisp (save-excursion(json-read)))
		 (json-array-type-default json-array-type)
		 valid-check
		 )
	    (setq json-array-type 'vector)
	  (setq valid-check (vectorp array-elisp) )
	   ;; validation
	  (setq json-array-type json-array-type-default)
	  valid-check
	  )
	  
	  )
	 )
    
    (if array-is-valid
	(progn
	  
	  (goto-char (1+ array-start))

	  ;; if char-after is equal to whitespace, delete all consequent whitespaces
	  (if (whitespace-p)
	      (let* (
		     (beg (point))
		     )
		;; skip whitespaces
		(while (whitespace-p)
		  (forward-char 1)
		  )
		(delete-region beg (point))
		(insert "\n")
		)
	    (insert "\n")
	    )
	  
	  (loop-while (and
		  (eq end-of-array nil)
		  (not
		  (eq
		   (condition-case ;;handling errors
		       nil
		       (json-read)
		     ;; return 'error symbol if error occurs (because nil value is valid and
		     ;; corresponds to null value of json syntax)
		     (error 'error) 
		     ) 'error)
		  ))

	    ;; if char-after is equal to whitespace, delete all consequent whitespaces
	    (if (whitespace-p)
	      (let* (
		     (beg (point))
		     )
		;; skip whitespaces
		(while (whitespace-p)
		  (forward-char 1)
		  )
		(delete-region beg (point))
		
		)
	      )
	    
	    (if (eq (char-after) ?,)
		(progn
		  (forward-char 1) ;; cursor is on a comma, so make step forward
		  (if (not(whitespace-p)) ;; if char-after is not equal to whitespace
		      (insert "\n")
		    (let* (
			   (beg (point))
			   )
		      ;; skip whitespaces
		      (while (whitespace-p)
			(forward-char 1)
			)
		      (delete-region beg (point))
		      (insert "\n")
		      )
		    )
		  )
	      (progn
		(if (whitespace-p)
		    (let* (
			   (beg (point))
			   )
		      ;; skip whitespaces
		      (while (whitespace-p)
			(forward-char 1)
			)
		      (delete-region beg (point))
		      (insert "\n")
		      )
		  (insert "\n")
		  )
		(setq end-of-array t)
		)
	    )
	  )

	  )
    )
  
  )
  )

(defun my/search-for-date (tmpdate filename)
  "docstring"
  (save-excursion
    (find-file filename)
    (widen)
    (goto-char (point-min))
    (let* (
	   ;;(date (concat "\"" tmpdate "\""))
	   (date tmpdate)
	   (data-array-search-result (search-forward-regexp "\"data\"[ ]*:[ ]*\\[" nil t))
	   ;; going to array's 1st square bracket and saving it
	   (beg (progn (forward-char -1)(point)))
	   
	   (end (nth 3 (show-paren--default)))
	   date-search-result
	   )
      
      (if (not(eq data-array-search-result nil))
	  (let*
	      ( )
	    (narrow-to-region beg end) ;; narrowing to "data" array
	    (goto-char (point-min))
	    (setq date-search-result (search-forward date nil t))
	    )
	)
      ;;(kill-buffer)
      date-search-result
      )
    )
  )

(provide 'my-json)
