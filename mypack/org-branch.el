(require 'my-week-day-based-habits)

(defun my/count-last-todo-states-streak-within-logbook (id todo-state)
  "counts last `TODO-STATE' streak within a logbook of a specified (via `ID') heading
"
  (require 'loop)
  (let*
      (
       (streak 0)
       logbook-beg
       )
      (save-excursion
    ;; goto heading with id specified in argument
	(org-id-goto id)
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
(provide 'org-branch)
