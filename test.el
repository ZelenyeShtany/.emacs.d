(defun test42 ()
  "docstring"
  (interactive)
  (let* (
	 (if t (list (a 10) (b 20) )
		 (list (c 15) (d 25))
		 )
	 )
    
    (message "a: %s" a)
    (message "b: %s" b)
    (message "c: %s" c)
    (message "d: %s" d)
    )
  )
