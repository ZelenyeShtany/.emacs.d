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


(defun my-org-recur-get-current-heading-recurrence-string()
  "docstring"
  (let*(
	(cur-head-point (nth 1 (my-org-get-current-heading-level-and-point)))
	)
    (progn
      (goto-char cur-head-point)
      (setq head-string (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
      (save-match-data
	(and (string-match "\\(^[*]+\\)[ ]+\\(DONE\\)[ ]+|\\([^|]*\\)|\\(.*\\)" head-string)
	     (if (not (zerop (length (match-data))))
		 (setq rec-string (match-string 3 head-string))
	       )
	     )
	)
      )
   )
  )
