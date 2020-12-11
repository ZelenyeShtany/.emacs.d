(defvar org-tb-default-1-column-width 3)
(defvar org-tb-vertical-delimiter "|")
(defun org-tb--get-char-n-times (char n)
  (let*(
       (string "")
       )
    (cl-dotimes (elm n)
      (setq string (concat string char))
      )
    
    string
    )
    )

(defun org-tb--create-empty-schedule ()
;;(org-tb--get-char-n-times "a" 10)
  (insert
   (concat
    (org-tb--get-char-n-times " " org-tb-default-1-column-width)
    org-tb-vertical-delimiter
    
    
    )
   )
  

    )
