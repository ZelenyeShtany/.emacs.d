;; org-timer-stop-hook
;; org-timer-done-hook
;; org-timer-start-hook -- after start
;; org-timer-set-hook 
;; org-timer-pause-hook
;; 
(defun my/before-org-timer-start ()
  "docstring"
  (interactive)
  (let* (
	 org-clock-start-time
	 ts
	 )
    ;; if cursor is within a org subtree, goto its logbook (or create)
    ;; and insert "CLOCK: [timestamp]"
    (if 
	;;org-in-subtree-not-table-p
	(not (org-before-first-heading-p))
     (org-back-to-heading t)
    (goto-char (org-log-beginning t))
    (insert org-clock-string " ")
    (setq org-clock-start-time (org-current-time org-clock-rounding-minutes t))
    (setq ts (org-insert-time-stamp org-clock-start-time
				'with-hm 'inactive)))
    )
    )
(add-hook 'name-hook 'function)
