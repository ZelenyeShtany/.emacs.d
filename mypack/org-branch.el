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
	(when id (org-id-goto id))
	(setq logbook-beg (org-log-beginning t))
    
    ;;goto logbook of this heading
    (goto-char logbook-beg)

    (if (save-excursion (re-search-forward ":END:" (save-excursion
								(outline-next-heading)
								(point))
				 t))
	(let*
	    ((logbook-end (match-beginning 0)))
	  (narrow-to-region logbook-beg logbook-end)
	  (goto-char (point-min))
	  (loop-while (not (eobp))
	    ;; if line not start from :STATISTICS:, skip it (forward-line)
	      (let*
		  ((current-line (buffer-substring (line-beginning-position) (line-end-position))))
		(if (string-match
		     ;;(concat "^" statistics-property-name "[ ]+\\([a-zA-Z0-9:]+\\)[ ]+" org-ts-regexp-inactive)
		     (concat "^- State[ ]+\"\\([a-zA-Z0-9:]+\\)\"[[:space:]]+from[ ]+\"\\([a-zA-Z0-9:]+\\)\"[[:space:]]+" org-ts-regexp-inactive)
		     current-line)
		    (if (string= (match-string 1 current-line) todo-state)
			(setq streak (1+ streak))
		      (loop-break))
		  (progn (forward-line) (loop-continue)))
		  (forward-line)))))
    (widen)
    (previous-buffer))
      streak))

;; (defun org-dblock-write:last-streaks (params)
;;   (require 'loop)
;;   (let* (
;; 	 ;; EXAMPLE OF EXTRACTING PARAMS (fmt (or (plist-get params :format) "%d. %m. %Y"))
;; 	 (file  (or (plist-get params :file) regular) )
;; 	 (string-to-insert ""))
;;     (save-window-excursion
;;      (save-excursion
;;       (find-file file)
;;       (widen)
;;       (goto-char (point-min))

;;       (loop-while (outline-next-heading)
;; 	(if (eq (org-entry-get nil "count-last-streak") nil)
;; 	    (loop-continue)
;; 	  (setq string-to-insert
;; 		(concat string-to-insert
;; 			(org-element-property :title (org-element-at-point))
;; 			": ("
;; 			(number-to-string(my/count-last-todo-states-streak-within-logbook "DONE"))
;; 			"/"
;; 			(org-entry-get nil "streak-to-achieve")
;; 			;;(org-element-property :streak-to-achieve (org-element-at-point))
;; 			")\n"))))))
;;     (insert string-to-insert)))

;; find-file-after-hook
(setq my/org-mmo-heading "MMO-like development branches")
(defvar my-org-branch/branch-filename "brench.org" "file with mmo-like branches")
(defun my/org-branch-main ()
  "docstring"
  (require 'loop)
  (if (string= (car (reverse (split-string (buffer-file-name) "/"))) my-org-branch/branch-filename)
    (save-excursion
     (let*
	((mmo-heading-point
	  (progn
	    (widen)
	    (goto-char (point-min))
	    (while (not (string= (org-element-property :title (org-element-at-point)) my/org-mmo-heading))
	      (outline-next-heading)
	      ;;(point)
	      )))
	 (branches
	  (org-map-entries 'org-element-at-point
			   (concat "LEVEL="
				   (number-to-string
				    (1+ (org-element-property :level (org-element-at-point)))))
			   'tree )))
      (org-narrow-to-subtree)
      (while (outline-next-heading)
	(let*
	    ((action (org-entry-get nil "ACTION" nil))
	     (streak-to-achieve (org-entry-get nil "streak-to-achieve" nil))
	     (heading (org-element-property :title (org-element-at-point))))
	  (when (and
		 (not (string= (org-element-property :todo-keyword (org-element-at-point)) "DONE"))
		 action streak-to-achieve)
	  (org-entry-put nil "current-streak"
			 (number-to-string
			  (my/count-last-todo-states-streak-within-logbook
			   "DONE"
			   action)))
	  (when (eq (string-to-number streak-to-achieve)
		  (string-to-number
		   (org-entry-get nil "current-streak" nil)))
	      (org-entry-put nil "TODO" "DONE")))))
      (widen)
      (goto-char (point-min))))
    (message "Error: current buffer is not %s" my-org-branch/branch-filename))
  (point))


(advice-add 'org-update-dblock :after 'my-org-columnview-dblock/post-format)
(defun my-org-columnview-dblock/post-format ()
  "Replace DONE by *DONE* in org-table."
  (let*
      (
       ;; TODO: write function that returns number of column with "TODO" title.
       ;; just a number instead of a function is not a reliable solution
       (todo-state-column 1)
       (current-table-line 2)
       )
    (save-excursion
      (when (and (string= (org-element-property :block-name (org-element-at-point))
			"columnview"
			)
	       (string= (car (reverse (split-string (buffer-file-name) "/"))) my-org-branch/branch-filename)
	       )
      (org-narrow-to-element)
      (org-table-goto-column todo-state-column) ;; goto column of TODO state
      (while (org-table-goto-line current-table-line)
	(when (string= (replace-regexp-in-string
			"\\(^ +\\| +$\\)" ""
			(replace-regexp-in-string "[[:space:]
]+" " " (org-table-get-field)) ) "DONE")
	  (org-table-get-field nil "*DONE*"))
	(setq current-table-line (1+ current-table-line))
	)
      (widen)
      (org-table-align)))))
;;(org-element-at-point) --> :block-name


;;(org-element-property :count-last-streak (org-element-at-point))
;;(previous-buffer)
(provide 'org-branch)

