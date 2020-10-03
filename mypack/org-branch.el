(require 'my-week-day-based-habits)

(defun my/count-last-todo-states-streak-within-logbook (todo-state &optional id)
  "counts last `TODO-STATE' streak within a logbook of a specified (via `ID') heading
if `ID' is not specified, takes heading at point
`TODO-STATE' is a `string'
"
  (require 'loop)
  (let*
      (
       (streak 0)
       logbook-beg
       )
      (save-excursion
    ;; goto heading with id specified in argument
	(if id (org-id-goto id))
	(setq logbook-beg (org-log-beginning t))
    
    ;;goto logbook of this heading
    (goto-char logbook-beg)

    (if (save-excursion (re-search-forward ":END:" (save-excursion
								(outline-next-heading)
								(point))
				 t))
	(let*
	    (
	     (logbook-end (match-beginning 0))
	     )
	  (narrow-to-region logbook-beg logbook-end)
	  (goto-char (point-min))
	  (loop-while
	      (and
	       (not (eq (point) (point-max) ))
	       ;; todo state
	       
	       )
	    ;; if line not start from :STATISTICS:, skip it (forward-line)
	      (let*
		  (
		   (current-line (buffer-substring (line-beginning-position) (line-end-position)))
		   )
		  (if
		  (eq (string-match
		       ;;(concat "^" statistics-property-name "[ ]+\\([a-zA-Z0-9:]+\\)[ ]+" org-ts-regexp-inactive)
		       (concat "^- State[ ]+\"\\([a-zA-Z0-9:]+\\)\"[[:space:]]+from[ ]+\"\\([a-zA-Z0-9:]+\\)\"[[:space:]]+" org-ts-regexp-inactive)
		       current-line)
		      nil)
		  (progn (forward-line) (loop-continue))
		(if (string= (match-string 1 current-line) todo-state)
		    (setq streak (1+ streak))
		  (loop-break)
		  )
		)
		  (forward-line)
		  )
	      )
	      )
      )
    (widen)
    (previous-buffer)
    )
      streak
  )
  )

(defun org-dblock-write:last-streaks (params)
  (require 'loop)
  (let* (
	 ;; EXAMPLE OF EXTRACTING PARAMS (fmt (or (plist-get params :format) "%d. %m. %Y"))
	 
	 (file  (or (plist-get params :file) regular) )
	 (string-to-insert "")
	)
    (save-window-excursion
     (save-excursion
      (find-file file)
      (widen)
      (goto-char (point-min))

      (loop-while (outline-next-heading)
	(if (eq (org-entry-get nil "count-last-streak") nil)
	    (loop-continue)
	  (setq string-to-insert
		(concat string-to-insert
			(org-element-property :title (org-element-at-point))
			": ("
			(number-to-string(my/count-last-todo-states-streak-within-logbook "DONE"))
			"/"
			(org-entry-get nil "streak-to-achieve")
			;;(org-element-property :streak-to-achieve (org-element-at-point))
			")\n"
			))
	  )

	)
      ;;(org-element-property :count-last-streak (org-element-at-point))
      ;;(previous-buffer)

      ))
    (insert string-to-insert)
    )
  )

;; find-file-after-hook
(setq my/org-mmo-heading "MMO-like development branches")
(defun my/org-branch-main ()
  "docstring"
  ;;(interactive)
  (require 'loop)
  (when (string= (car (reverse (split-string (buffer-file-name) "/"))) "brench.org")
    (save-excursion
     (let*
	(
	 (mmo-heading-point
	  (progn
	    ;; допустим мы в файле brench.organization
	    (widen)
	    (goto-char (point-min))
	    (while (not (string= (org-element-property :title (org-element-at-point)) my/org-mmo-heading))
	      (outline-next-heading)
	      (point)
	      ))
	  )
	 (branches
	  (org-map-entries 'org-element-at-point
			   (concat "LEVEL="
				   (number-to-string
				    (1+ (org-element-property :level (org-element-at-point)))
				    ))
			   'tree )
	  )
	 )
      (org-narrow-to-subtree)
      (while (not (eobp))
	(outline-next-heading)
	(if (and
	     
	     (not (string= (org-element-property :todo-keyword (org-element-at-point)) "DONE"))
	     (not (eq (org-entry-get nil "ACTION" nil) nil))
	     (not (eq (org-entry-get nil "streak-to-achieve" nil) nil))
	     )
	    (progn (org-entry-put nil "current-streak" 
				  (number-to-string
				   (my/count-last-todo-states-streak-within-logbook
				    "DONE"
				    (org-entry-get nil "ACTION" nil)
				    )))
		   (if (eq (string-to-number
			    (org-entry-get nil "streak-to-achieve" nil)
			    )
			   (string-to-number
			    (org-entry-get nil "current-streak" nil)
			    )
			   )
		       (org-entry-put nil "TODO" "DONE")
		       )
		   )
	  )
	)
      (widen)
      (goto-char (point-min))
      )))
  (point)
  )(provide 'org-branch)
