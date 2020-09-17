;; speeds up initialization
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))
;; /speeds up initialization
(require 'package)
(package-initialize)
(setq bookmark-file
      (cond
       ((eq system-type 'gnu/linux) "~/.emacs.d/bookmark-linux")
       ((eq system-type 'windows-nt) "~/.emacs.d/bookmark-win")
       )
      )


(setq data-folder-path
      (cond
       ((eq system-type 'gnu/linux) "/data/")
       ((eq system-type 'windows-nt) "D:/")
       )
      )
(setq my-org-directory (concat data-folder-path "Sync/org/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   '("b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "af8c277f4aa7dab97fe4e2d5ae78d4d12de7364eb1e93a0d3e0739d10adc08b5" "0ac7d13bc30eac2f92bbc3008294dafb5ba5167f2bf25c0a013f29f62763b996" "6ec768e90ce4b95869e859323cb3ee506c544a764e954ac436bd44702bd666c0" default))
 '(dired-always-read-filesystem t)
 '(dired-open-extensions
   '(("pdf" . "okular")
     ("csv" . "konsole -e visidata")
     ("html" . "google-chrome")
     ("mp4" . "mpv")
     ("mp3" . "clementine")
     ("ogg" . "clementine")
     ("opus" . "clementine")
     ("odt" . "libreoffice")
     ("doc" . "libreoffice")
     ("docx" . "libreoffice")))
 '(dired-open-functions
   '(dired-open-by-extension diredp-find-file-reuse-dir-buffer))
 '(display-time-mode t)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(fci-rule-color "#383838")
 '(fringe-mode 0 nil (fringe))
 '(global-auto-revert-non-file-buffers t)
 '(global-display-line-numbers-mode t)
 '(helm-ff-lynx-style-map nil)
 '(help-window-select t)
 '(highlight-indent-guides-method 'character)
 '(ido-auto-merge-delay-time 0.7)
 '(inhibit-startup-screen t)
 '(initial-major-mode 'messages-buffer-mode)
 '(ivy-initial-inputs-alist
   '((counsel-minor . "^+")
     (counsel-package . "^+")
     (counsel-org-capture . "^")
     (counsel-M-x . "^")
     (counsel-describe-symbol . "^")))
 '(menu-bar-mode nil)
 '(org-M-RET-may-split-line '((default)))
 '(org-agenda-files nil)
 '(org-catch-invisible-edits 'error)
 '(org-complete-tags-always-offer-all-agenda-tags t)
 '(org-ctrl-k-protect-subtree 'error)
 '(org-directory my-org-directory)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.csv\\'" . "konsole -e visidata \"%s\"")))
 '(org-habit-graph-column 0)
 '(org-insert-heading-respect-content t)
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file-other-frame)
     (wl . wl-other-frame)))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus ol-info ol-irc ol-mhe ol-rmail ol-w3m org-collector))
 '(org-ql-views
   '(("entries with CREATED or SCHEDULED property on today" :buffers-files org-agenda-files :query
      (or
       (regexp
	(concat "CREATED:[ ]*\\["
		(format-time-string "%Y-%m-%d")
		" [[:alpha:]]\\{3\\}\\( [[:digit:]]\\{2\\}:[[:digit:]]\\{2\\}\\)?\\]"))
       (scheduled :on today))
      :sort nil :narrow nil :super-groups nil :title "entries with CREATED or SCHEDULED property on today")
     ("Overview: Agenda-like" :buffers-files org-agenda-files :query
      (and
       (not
	(done))
       (or
	(habit)
	(deadline auto)
	(scheduled :to today)
	(ts-active :on today)))
      :sort
      (date priority todo)
      :super-groups org-super-agenda-groups :title "Agenda-like")
     ("Overview: NEXT tasks" :buffers-files org-agenda-files :query
      (todo "NEXT")
      :sort
      (priority date)
      :super-groups org-super-agenda-groups :title "Overview: NEXT tasks")
     ("Review: Recently timestamped" . org-ql-view-recent-items)
     (#("Review: Dangling tasks" 0 22
	(help-echo "Tasks whose ancestor is done"))
      :buffers-files org-agenda-files :query
      (and
       (todo)
       (ancestors
	(done)))
      :title
      #("Review: Dangling tasks" 0 22
	(help-echo "Tasks whose ancestor is done"))
      :sort
      (date priority todo)
      :super-groups
      ((:auto-parent t)))
     (#("Review: Stale tasks" 0 19
	(help-echo "Tasks without a timestamp in the past 2 weeks"))
      :buffers-files org-agenda-files :query
      (and
       (todo)
       (not
	(ts :from -14)))
      :title
      #("Review: Stale tasks" 0 19
	(help-echo "Tasks without a timestamp in the past 2 weeks"))
      :sort
      (date priority todo)
      :super-groups
      ((:auto-parent t)))
     (#("Review: Stuck projects" 0 22
	(help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :buffers-files org-agenda-files :query
      (and
       (todo)
       (descendants
	(todo))
       (not
	(descendants
	 (todo "NEXT"))))
      :title
      #("Review: Stuck projects" 0 22
	(help-echo "Tasks with sub-tasks but no NEXT sub-tasks"))
      :sort
      (priority date)
      :super-groups org-super-agenda-groups)))
 '(package-selected-packages
   '(peg web-mode diminish loop json-mode org-ql counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(temporary-file-directory (concat data-folder-path "org/tmp/"))
 '(tool-bar-mode nil)
 '(web-mode-enable-current-element-highlight t)
 '(wg-emacs-exit-save-behavior nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "khaki3" :foreground "Black"))))
 '(company-preview-common ((t (:inherit \#311d57 :foreground "red"))))
 '(company-scrollbar-bg ((t (:background "DeepSkyBlue"))))
 '(company-scrollbar-fg ((t (:background "DeepSkyBlue"))))
 '(company-tooltip ((t (:background "#22143d" :foreground "#cccccc"))))
 '(company-tooltip-annotation ((t (:foreground "#757575"))))
 '(company-tooltip-common ((t (:foreground "white" :weight ultra-bold))))
 '(company-tooltip-selection ((t (:background "dark cyan"))))
 '(highlight-symbol-face ((t (:background "dark cyan"))))
 '(web-mode-current-element-highlight-face ((t (:background "#008b8b" :foreground "#ffffff")))))
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
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
      (kill-buffer)
      date-search-result
      )
    )
  )

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
	 (bike-duration (if (eq ride-a-bike-p 0) 0 (ivy-read "duration(mins):" mins)))

	 (run-p (string-to-number (ivy-read "run?" one-or-zero :require-match t)))
	 (run-time (if (eq run-p 0) "0000" (ivy-read "when?" '("0000"))))
	 (run-duration (if (eq run-p 0) 0 (ivy-read "duration(mins):" mins)))

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
	    (save-buffer)
	    (kill-buffer)
	    )
	)
      )
    ;; /appending to "data" array
    "" ;;returning an empty string as a template string for orgmode
    )
  )
(defun my/get-approppriate-location-to-insert(filepath subheading-title)
  "docstring"
  (interactive)
  ;; prompt for a date
  (let (
	
	(success 0)
	)
  (require 'loop)
  (loop-do-while (eq success 0)
    (let* (
	   (date-element-begin 0)
	   (date-element-end 0)
	   (date (read-string "date:" (concat "[" (format-time-string "%Y-%m-%d") "]")))
	   (files (list filepath))
	   (dates  (org-map-entries 'org-element-at-point "LEVEL=1" files ) )
	   ;;                      [  function to call  ]        [list of files]
	   (datefound 0)
	   (date-element nil)
	   )
      ;; (setq datefound 1) if entered date exists within the file DONE
      (catch 'datefound
	(when (> (length dates) 0)
	(dolist (curdate dates);;(goto-char(org-element-property :begin curdate))
	  (if (string= (org-element-property :title curdate) date)
	      (progn
		(setq date-element-end (org-element-property :end curdate))
		(setq date-element-begin (org-element-property :begin curdate))
		(setq datefound 1)
		(throw 'datefound 1)
		)
            )
	  )
	)
	)
      
      ;; if typed date found,
      (if (eq datefound 1)
          ;;check if it has a sugheading subheading-title
	  (let* (
		 (elements (progn
			     (goto-char date-element-begin)
			     (org-map-entries 'org-element-at-point "LEVEL=2" 'tree)
			     ))
		 (morningfound 0)
       		 )
	    ;; try to find subheading-title heading. DONE
	    (catch 'morningfound
	      (dolist (cur-element elements)
		(message "%s" (org-element-property :title cur-element))
		(if (string= (org-element-property :title cur-element) subheading-title)
		    (progn
		      (setq morningfound 1)
		      (setq morning cur-element)
		      (throw 'morningfound 1)
		      )
		  )
		)
	      )
	    ;;If morning heading exists 
	    (if (eq morningfound 1)
		;;then prompt for an option
		(let*
		    (
		     (options  (list "выбрать другую дату" (concat "перезаписать запись \"" subheading-title "\""))  )
		     (chosen-option (ivy-read
				     "запись уже есть. Изменить запись или выбрать другую дату?" options :require-match t))

		     )
		     
		  (cond
		   ;; skip the rest of the loop (continue)
		   ((string= chosen-option (nth 0 options))
		    (loop-continue)
		    )

		   ;; cut subheading subheading-title create a new one, return a point
		   ((string= chosen-option (nth 1 options) )
		    (let*
			()
		      (goto-char (org-element-property :begin morning))
		      (org-cut-subtree)
		      (goto-char date-element-end)
		      (org-insert-subheading 4)
		      (insert (concat subheading-title "\n"))
		      (setq success 1)
		      (point)
		      )
		    )
		   )
		  )

	      ;;else insert subheading-title subheading and return a point
	      (let* ()
		(goto-char date-element-end)
		(org-insert-subheading 4)
		(insert (concat subheading-title "\n"))
		(setq success 1)
		(point)
		)
	      )
	    )
	;; date not found
	(let* (
	       (tvar 0)
	       (morning nil)
	       )
	  (goto-char
	   (if (> (length dates) 0)
	       (org-element-property :begin (car dates) )
	       (goto-char (point-max))
	     ) )
	  (org-insert-heading)
	  (insert date)
	  ;;(org-end-of-subtree) ;;skipping properties and other automatically set drawers
	  (org-insert-subheading 4)
	  (setq morning (org-element-at-point))
	  (insert (concat subheading-title "\n"))
	  ;;(org-end-of-subtree)
	  ;;(if (not (eq (forward-char 1) nil) ) (insert "\n") )
	  (setq success 1)
	  )
	)

	
      ;; if the date exists within the file

    ;; if
    )
  )
  )
  )
;; org-element-adopt-element

(add-to-list 'load-path "~/.emacs.d/dired+/")
(load "dired+")

(add-to-list 'load-path "~/.emacs.d/elpa/peg-1.0")

(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol.el/")
(require 'highlight-symbol)
(with-eval-after-load "highlight-symbol"
  (setq highlight-symbol-idle-delay 0.2)
  ;;(unless global-auto-highlight-symbol-mode
  ;;(global-auto-highlight-symbol-mode t))
  )


(add-to-list 'load-path "~/.emacs.d/mypack/")
(load "mypack")
;;(load "my-org-recur-adjustments")


(require 'ido)
     (ido-mode t)
(load-theme 'afternoon t)



(add-to-list 'load-path "~/.emacs.d/zoom/")
(require 'zoom)



(add-to-list 'load-path "~/.emacs.d/elpa/powerline-20200817.1321/")
(require 'powerline)
(powerline-default-theme)

(add-to-list 'load-path "~/.emacs.d/deferred/")
(require 'deferred)


(add-to-list 'load-path "~/.emacs.d/elpa/auto-minor-mode/")
;;(require 'auto-minor-mode)
;; <open .emacs quickly>
(define-key global-map (kbd "C-x i")
  (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
;; </open .emacs quickly>

(set-language-environment "UTF-8")

;; <capture template>


;; <capture template/>



;; <focus on a new window when splitting screen>
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)
			  (if(and (buffer-narrowed-p) (string-match "/"  (buffer-name)))
			     (switch-to-buffer (car (split-string (buffer-name) "/")))
			    (switch-to-buffer "*Messages*")

			    )
			  )
		)
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)
			  (if(and (buffer-narrowed-p) (string-match "/"  (buffer-name)))
			      (switch-to-buffer(car (split-string (buffer-name) "/")))
			    (switch-to-buffer "*Messages*")
			    ))
		)
;; </focus on a new window when splitting screen>

;; <ido vertical selection>
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
;; </ido vertical selection>


;; <smex>
(require 'smex) ; Not needed if you use package.el
  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; </smex>


;; open agenda
(define-key global-map (kbd "C-c a")
(lambda () (interactive) (org-agenda)))
;;


;; <auto-creation of new line>
;; </auto-creation of new line>

(eval-when-compile
  (require 'use-package))


(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))





(use-package org
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :init
;;(add-hook 'org-after-todo-state-change-hook 'my-org-recur-finish)
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 50)))
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  ;; (add-hook 'org-mode-hook '(lambda ()
  ;;  "Beautify Org Checkbox Symbol"
  ;;  (push '(":PROPERTIES:" .  "P") prettify-symbols-alist)
  ;;  (push '(":LOGBOOK:" .  "L") prettify-symbols-alist)
  ;;  (prettify-symbols-mode)))
  (defun my/number-of-spaces-at-point(point)
    "docstring"
    (interactive)
    (require 'loop)
    (let* (
	   (count 0)
	   )
      (save-excursion
      (loop-do-while (eq (char-after) ? )
	(setq count (+ count 1))
	(forward-char)
	)
      )
      count
    )
    )
  (defun my/org-headline-return ()
    "docstring"
    (interactive)
    (let* (
	   (level (org-element-property :level (org-element-at-point)))
	   (begin (org-element-property :begin (org-element-at-point)))
	   (title-length (length (org-element-property :title (org-element-at-point))))
	   (contents-end (org-element-property :contents-end (org-element-at-point)))
	   )
      (if (
	   and
	   (eq (org-element-type (org-element-at-point)) 'headline)
	   (eq (point)
	       (+ begin level (my/number-of-spaces-at-point(+ begin level))
		  title-length)
	       )
	   )
	  
	  (if (org-goto-first-child)
	      (progn
		(forward-char -1)
		(insert "\n")
		)
	    
	    (progn
	      (goto-char contents-end)
	      (if (not(eq (char-before) "\n" ) )
		  (progn (insert "\n") (forward-char -1))
		  )
	      )
	    )
	(org-return)
	)
      )
      )
  
  (defun my/copy-id-to-clipboard()
       (interactive)
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
	 (setq mytmpid (concat "id:" (funcall 'org-id-get-create)))
	 (kill-new mytmpid)
	 (message "Copied %s to killring (clipboard)" mytmpid)
       ))
  
  (setq notes (concat data-folder-path "Sync/org/notes.org")
	todos (concat data-folder-path "Sync/org/todos.org")
	timerasp (concat data-folder-path "Sync/org/timerasp.org")
	poor-man-cbt (concat data-folder-path "Sync/org/poor-man-cbt.org")
	english-tracker (concat data-folder-path "Sync/tables/english tracker/englishtracker.org")
	migraines-tracker (concat data-folder-path "Sync/tables/migraines.org")
	habits-tracker (concat data-folder-path "Sync/tables/habits tracker/2020/habits.org")
	exercise-tracker (concat data-folder-path "Sync/tables/exercises tracker/2020/exercisetracker.org")
	sleepdiary (concat data-folder-path "Sync/org/sleepdiary.org")
	sleep-tracking-file (concat data-folder-path "Sync/org/sleepdiary.org")
	org-return-follows-link t
	org-use-speed-commands t
	org-use-sub-superscripts nil
	org-ellipsis "⤵"
	org-protocol-default-template-key "d"
	org-highest-priority 49
	org-lowest-priority 54
	org-default-priority 52
	org-log-reschedule 'time
	org-log-redeadline 'time
	org-log-done 'time
	org-pretty-entities 1
	org-startup-indented 1
	org-log-into-drawer "LOGBOOK"
	org-support-shift-select 'always
	org-image-actual-width nil ;; allowing images to be resized by #+attr_org atribute
	org-todo-keyword-faces
	'(
	  ("STARTED" . (:weight bold :background "#f5e3ae" :foreground "#3F3F3F" :box(:color "#3F3F3F")))
	  ("DONE" . (:weight bold :background "#ACE1AF" :foreground "#3F3F3F" :box(:color "#3F3F3F") )) 
	  ("TODO" . (:weight bold :background "#DCA3A3" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  
	  ("FEATURE" . (:weight bold :background "#93E0E3" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  ("TROUBLE" . (:weight bold :background "#DCA3A3" :foreground "#3F3F3F" :box(:color "#3F3F3F") )) 
	  ("SOLUTION" . (:weight bold :background "#F0DFAF" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  ("BUG" . (:weight bold :background "#DCA3A3" :foreground "#3F3F3F" :box(:color "#3F3F3F") )) 

	  ("TOREAD" . (:weight bold :background "#CC9393" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  ("TOWATCH" . (:weight bold :background "#CC9393" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  ("SOMEDAY" . (:weight bold :background "#6C3333" :foreground "#DCDCCC" :box(:color "#3F3F3F") )) 
	  ("TOBUY" . (:weight bold :background "#CC9393" :foreground "#3F3F3F" :box(:color "#3F3F3F") )) 
	  ("NEXT" . (:weight bold :background "#93E0E3" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  ("TOSTUDY" . (:weight bold :background "#F0DFAF" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  ("STUCK" . (:weight bold  :background "#366060" :foreground "#DCDCCC" :box(:color "#3F3F3F") ))
	  ("CANCELED" . (:weight bold  :background "#2B2B2B" :foreground "#DCDCCC" :box(:color "#3F3F3F") ))
	  ("IDEA" . (:weight bold  :background "#ba3244" :foreground "#3F3F3F" :box(:color "#3F3F3F") ))
	  )
	org-tag-persistent-alist 
	'(
	  (:startgrouptag)
	  ("ADHD")
	  (:grouptags)
	  ("внимание")
	  (:endgrouptag)
	  ("SCT")
	  ("quantifiedself")
	  ("NSTU")
	  ("important")
	  ("book")
	  ("cpp")
	  ("workflow")
	  
	  (:startgrouptag)
	  ("emacs")
	  (:grouptags)
	  ("emacs_config")
	  ("orgmode")
	  ("elisp")
	  (:endgrouptag)
	       
	  (:startgrouptag)
	  ("mindset")
	  (:grouptags)
	  ("copingcard")
	  (:endgrouptag)
	       
	       
	  (:startgrouptag)
	  ("web")
	  (:grouptags)
	  ("article")
	  (:endgrouptag)

	  
	  ("engl")
	  ("music")
	  ("film")
	  )

	
	org-capture-templates
	'(("t" "Todo" entry (file+headline todos "Tasks")
	   "* TODO %?")
	  ("j" "Journal" entry (file+datetree notes)
	   "* %?")
	  ("i" "Idea" entry (file+datetree notes)
	   "* IDEA %?")
	  ;;("d" "TEST" entry (file+datetree (concat data-folder-path "Sync/org/notes.org"))
	  ;; "* frombroser: %a" :immediate-finish t)
	  ("r" "CBT-Report" plain (file+function poor-man-cbt (lambda () (interactive) (my/get-approppriate-location-to-insert poor-man-cbt "запись")))
"
*** Действительно ли вы следовали расписанию?
%^{Действительно ли вы следовали расписанию?}
*** Почему вы не следовали расписанию, над которым так долго дрочились?
%^{Почему вы не следовали расписанию, над которым так долго дрочились?}
*** Какие мысли вас преследовали?
%^{Какие мысли вас преследовали?}
*** Приложите, пожалуйста, csv-файл лога текущего дня из Boosted App
%^{Приложите, пожалуйста, csv-файл лога текущего дня из Boosted App}
*** +Почему вы такой долбоеб?+ Что можно сделать, чтобы исправить ситуацию завтра?
%^{+Почему вы такой долбоеб?+ Что можно сделать, чтобы исправить ситуацию завтра?}")

("n" "English Tracker" plain (file+function english-tracker (lambda () (interactive) (my/get-approppriate-location-to-insert english-tracker "запись")))
"
*** reading1h
%^{reading1h|0|1}
*** grammar
%^{grammar|0|1}
*** writing
%^{writing|0|1}
*** anki
**** add (добавлял новые слова?)
%^{anki add(добавлял новые слова?)|0|1}
**** revise (повторял слова?)
%^{anki revise (повторял слова?)|0|1}
*** notes
%^{notes}")

("g" "Migraines" plain (file+function migraines-tracker (lambda () (interactive) (my/get-approppriate-location-to-insert migraines-tracker "запись")))
"
*** как думаешь, что спровоцировало приступ? погода? какая-то еда? недосып/пересып? 
%^{как думаешь, что спровоцировало приступ? погода? какая-то еда? недосып/пересып?}
*** степень тяжести приступа (1-4) 
%^{степень тяжести приступа (1-4)|1|2|3|4}
*** notes
%^{notes}")

("h" "Habits" plain (file+function habits-tracker (lambda () (interactive) (my/get-approppriate-location-to-insert habits-tracker "запись")))
"
*** Taking Charge of Adult ADHD notes
%^{Taking Charge of Adult ADHD notes|0|1}
*** SOC Skills / Евгения Стрелецкая
%^{SOC Skills / Евгения Стрелецкая|0|1}
*** НГТУ 3H+30M
%^{НГТУ 3H+30M|0|1}
*** DISCR MATHS 2h
%^{DISCR MATHS 2h|0|1}
*** nofap
%^{nofap|0|1}
*** meditation(mins)
%^{meditation(mins)|0}
*** зубы(утро+вечер)
%^{зубы(утро+вечер)|0|1}
*** душ
%^{душ|0|1}
*** cold shower
%^{cold shower|0|1}
"

)


("x" "Exercise Tracker" plain (file+function exercise-tracker (lambda () (interactive) (my/get-approppriate-location-to-insert exercise-tracker "запись")))
"
*** Planned to be done?(any kind of sport activity)
%^{Planned to be done?(any kind of sport activity)|0|1}
*** Riding a bike
**** done?
%^{Riding a bike: done?|0|1}
**** duration(mins)
%^{duration(mins)|0}
**** time
%^{time|0000}
*** Run
**** done?
%^{Run: done?|0|1}
**** duration(mins)
%^{duration(mins)}
**** time
%^{time|0000}
*** Squats
**** done?
%^{Squats: done?|0|1}
**** sets
%^{sets|0,0,0}
*** Pushups
**** done?
%^{Pushups: done?|0|1}
**** sets
%^{sets|0,0,0}
*** Press
**** done?
%^{Press: done?|0|1}
**** sets
%^{sets|0,0,0}
*** notes
%^{notes}
"

)

("G" "JSON TEST" plain (file "/data/Sync/tables/english tracker/september.json" )
(function (lambda () (interactive) (my/json-point "/data/Sync/tables/english tracker/september.json"))) :immediate-finish t
)


("m" "Sleep Morning" plain (file+function sleep-tracking-file (lambda () (interactive) (my/get-approppriate-location-to-insert sleep-tracking-file "заполнить утром")))
"
*** лечь в 23:00-00:00, встать в 08:00-09:00
%^{лечь в 23:00-00:00, встать в 08:00-09:00|0|1}
*** когда пошел спать вчера
%^{когда пошел спать вчера|0000}
*** когда встал утром сегодня
%^{когда встал утром сегодня|0000}
*** ск-ко часов спал
%^{ск-ко часов спал|8:30}
*** сколько времени засыпал(мин)
%^{сколько времени засыпал(мин)}
*** какие медикаменты принимал, чтобы уснуть
%^{какие медикаменты принимал, чтобы уснуть|-}
*** как чувствовал себя после пробуждения(1-4)
%^{как чувствовал себя после пробуждения(1-4)}
	  ")
	  ("e" "Sleep Evening" plain (file+function sleep-tracking-file (lambda () (interactive) (my/get-approppriate-location-to-insert sleep-tracking-file "заполнить вечером")))
"
*** ск-ко пил кофе сегодня
%^{ск-ко пил кофе сегодня|0|1}
*** во ск-ко дремал сегодня
%^{во ск-ко дремал сегодня|0000}
*** ск-ко дремал
%^{ск-ко дремал|0000}
*** во сколько занимался спортом сегодня
%^{во сколько занимался спортом сегодня|8}
*** сколько занимался спортом(мин)
%^{сколько занимался спортом(мин)}
*** как себя чувствовал в течение дня.
1. приходилось стараться не заснуть.
2. немного уставшим
3. достаточно бдительным
4. отлично
%^{как себя чувствовал в течение дня.|1|2|3|4}
	  ")
	  ("d" "capture through org protocol" entry
	   (file+headline org-board-capture-file "Unsorted")
             "* %?%:description\n:PROPERTIES:\n:URL: %:link\n:END:\n\n Added %U" :immediate-finish t)
	  )
	)

;; web archiving through org-capture + org-board
(defun do-org-board-dl-hook ()
  (when (equal (buffer-name) "CAPTURE-webarchive.org")
    (org-board-archive)))

(add-hook 'org-capture-before-finalize-hook 'do-org-board-dl-hook)

(setq org-board-capture-file (concat data-folder-path "Sync/org/webarchive.org"))
;; /web archiving through org-capture + org-board  
  (require 'org-download)
  :bind (:map org-mode-map
	      ("<RET>" . 'my/org-headline-return)
	      ("C-<RET>" . 'org-return)
	      ("<f5>" . 'my/copy-id-to-clipboard)
	      ("M-r" . 'org-todo)
	      ("M-t" . 'counsel-org-tag)
	      ("M-s" . 'org-schedule)
	      ("M-d" . 'org-deadline)
	      ("M-<return>" . 'org-insert-subheading)
	      ("C-j" . nil)
	      ("C-c i" . 'org-time-stamp-inactive)
	      ("C-c 1" . (lambda() (interactive) (my-insert-into-table "DONE")))
	      ("C-c 2" . (lambda() (interactive) (my-insert-into-table "MISSED")))
	      ("C-c 3" . (lambda() (interactive) (my-insert-into-table "TODO")))
	      ("C-c 0" . (lambda() (interactive) (org-table-blank-field)))
	      :map global-map 
	      ("C-c j" . (lambda () (interactive) (org-capture nil "j")))
	      ("C-c x" . (lambda () (interactive) (org-capture nil "t")))
	      ("C-c r" . (lambda () (interactive) (org-capture nil "r")))
	      )
	 )

;; <using key bindings while on russian keyboard layout>
(use-package reverse-im
  :ensure t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))
;; </using key bindings while on russian keyboard layout>


;;(use-package org-caldav
;;  :init
;;  (setq org-caldav-url "http://localhost/nextcloud/remote.php/dav/calendars/zelenyeshtany"
;;	org-caldav-calendar-id "mycal"
;;	org-caldav-inbox (concat data-folder-path "Sync/org/inboxcal.org")
;;	org-caldav-files '((concat data-folder-path "Sync/org/todos.org") (concat data-folder-path "Sync/org/notes.org") (concat data-folder-path "Sync/org/habits.org"))
;;	org-icalendar-timezone "Kazakhstan/Almaty"
;;	org-icalendar-use-deadline '(event-if-not-todo event-if-todo)
;;	org-icalendar-use-scheduled '(todo-start event-if-todo )
;;	org-caldav-skip-conditions '('todo '("DONE") 'nottodo '("TODO") 'notscheduled) ;;syntax cheat sheet => org-agenda-skip-if
;;	org-caldav-debug-level 1
;;	)
;;  )
;;

;;default directory for find-file command (C-x C-f)
;;(setq default-directory "/home/zelenyeshtany/Sync/org/")
;;

;; <placing backup files (with ~ in the end) in special directory>
;; stored in 'temporary-file-directory' variable
    (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
;; </placing backup files (with ~ in the end) in special directory>


;;<org-download - drag-n-drop images>
;; Drag-and-drop to `dired`
(use-package org-download
  :after
  (org)
  :hook (dired-mode . org-download-enable)
  :init
  (setq org-download-method 'directory)
  (setq-default org-download-image-dir (concat data-folder-path "Sync/org/img/"))
  (global-set-key (kbd "C-x p") (lambda () (interactive) (org-download-screenshot)))
)
;;  (add-hook 'dired-mode-hook 'org-download-enable)
  

;;</org-download - drag-n-drop images>


;;org-board
(setq org-board-new 1)
;;


(setq system-time-locale "C")
(require 'org-id)




(use-package multiple-cursors
  :bind (:map global-map
	      ("C-M-z" . 'mc/edit-lines)
	      ("C-?" . 'mc/mark-all-like-this)
	      )
)


;;mermaid: gantt charts, etc
(require 'ob-mermaid)
(setq ob-mermaid-cli-path "/home/zelenyeshtany/node_modules/.bin/mmdc")
;;mermaid: gantt charts, etc
(require 'org-protocol)


(defun my-insert-into-table(string)
(interactive)
  (progn
    (org-table-blank-field)
    (insert string)
    (org-table-align)
)
  )
(with-eval-after-load "org-agenda"
(define-key org-agenda-mode-map (kbd "r") 'org-agenda-todo)
(define-key org-agenda-mode-map (kbd "t") 'counsel-org-tag-agenda)
(define-key org-agenda-mode-map (kbd "C-r") 'org-agenda-redo-all)
(define-key org-agenda-mode-map (kbd "e") 'org-agenda-redo)
)




(use-package dired
  :init
  (add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ))
  (setq dired-guess-shell-alist-user '(
				     ("\\.pdf\\'" "okular")
				     ("\\.mp4\\'" "mpv")
				     ("\\.mkv\\'" "mpv")
				     ))

  :bind (:map dired-mode-map
	 ("C-S-n" . 'dired-create-directory)
	 ("<tab>" . 'dired-subtree-toggle)
	 ("+" . 'dired-create-empty-file)     
	 ("<f2>" . 'dired-do-rename)
	 ("X" . 'diredp-move-file)
	 ("<ret>" . 'dired-open-by-extension)
	 ("M-?" .  (lambda () (interactive) (find-file-other-window (concat data-folder-path "Sync/org/diredhelp.org"))))
	 ("<deletechar>" . 'dired-do-delete)
	 ("<DEL>" . 'diredp-up-directory-reuse-dir-buffer)
	 ("<ret>" . 'diredp-find-file-reuse-dir-buffer)
	 ("d" . 'diredp-delete-this-file)
	 )
  )


(global-set-key (kbd "M-o") 'ace-window)


(setq scroll-step 1)
(setq scroll-conservatively 150)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))


;; automatically invoking org-sidebar-tree even if
;; a file is already open
(defun my-find-file ()
  (interactive)
  (call-interactively 'ido-find-file))
;; (defadvice my-find-file (after do-something) (org-sidebar-tree))
;;(ad-activate 'my-find-file)
;; </automatically invoking ...>


(require 'yasnippet)
(yas-global-mode 1)


(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))


(define-key esc-map "." #'xref-find-definitions-other-window)
(put 'narrow-to-region 'disabled nil)







;; <EMOJI>
;;(add-hook 'org-mode-hook
;;	  (lambda() (emojify-mode)))
;;(setq emojify-user-emojis '(("\n:PROPERTIES:" . (("name" . "Orgmode Properties Icon")
;;						 ("image" . "~/.emacs.d/iconfinder_properties.png")
;;						 ("style" . "github")))
;;			    )
;;      )
;;
;; If emojify is already loaded refresh emoji data
;;(when (featurep 'emojify)
;;  (emojify-set-emoji-data))
;;</EMOJI>



(global-auto-revert-mode 1)
;;(add-hook 'org-agenda-mode-hook
;;	  (lambda () (auto-revert-mode) )
;;)

;;(add-hook 'org-agenda-mode-hook (lambda () (auto-revert-mode t) )) ;;FIXME
;;(add-hook 'org-agenda-mode-hook
;;          (lambda ()
;;            ;; Set buffer-local variables here.  For example:
;;            ;; (dired-omit-mode 1)
;;	    (make-local-variable revert-buffer-function)
;;	    (setq revert-buffer-function #'org-agenda-revert-buffer)
;;            ))
;;
;;(defun org-agenda-revert-buffer (_ignore-auto noconfirm))

(add-hook 'after-revert-hook #'(lambda () (interactive) (org-agenda-redo t)))
(require 'ivy-rich)
(require 'ivy)
(ivy-mode 1)
(ivy-rich-mode 1)
;;(ivy-rich-mode 1)


(define-key global-map (kbd "C-x f") 'counsel-find-file)

(require 'dired-open)

(kill-buffer "*scratch*")
(counsel-mode 1)

(global-set-key (kbd "C-<return>") 'cua-rectangle-mark-mode)

(defun replace-regexp-visual ()
  "call vr/replace(more convenient func name)"
  (interactive)
(save-excursion
(goto-char (point-min))
(call-interactively 'vr/replace)
)
)
(define-key global-map (kbd "C-S-f") #'replace-regexp-visual)
(require 'visual-regexp)

(defun org-cua-rectangle-conflict-resolving (&optional arg)
  (interactive "P")
  (if (eq major-mode 'org-mode)
      (org-insert-heading arg)
    (cua-rectangle-mark-mode arg)))
(define-key cua-global-keymap (kbd "C-<return>") #'org-cua-rectangle-conflict-resolving)


 (defun delete-nth (index seq)
   "Delete the INDEX th element of SEQ.
 Return result sequence, SEQ __is__ modified."
   (if (equal index 0)
       (progn
         (setcar seq (car (cdr seq)))
         (setcdr seq (cdr (cdr seq))))
     (setcdr (nthcdr (1- index) seq) (nthcdr (1+ index) seq))))


(define-key global-map (kbd "C-y") 'yas-new-snippet)


(defun my-toggle-narrow-to-defun ()
  "If narrowed, then widen current buffer. 
Narrow to defun if it's not."
  (interactive)
  (let* (
	 (new-indirect-buffer-name (concat (buffer-name) "/" (lisp-current-defun-name)))
	)

    (cond
     ((my/org-at-source-block-p) (org-edit-src-code)(delete-other-windows)  )
     ((my/org-mode-p)(org-toggle-narrow-to-subtree))
     ( t (if (not (buffer-narrowed-p))
	     (progn
	       (clone-indirect-buffer new-indirect-buffer-name nil )
	       (switch-to-buffer new-indirect-buffer-name)
	       (narrow-to-defun)
	       )
	   ;;(progn (widen) (setq my-narrowed nil)) - old version
	   (progn
	     (kill-buffer)
	     (switch-to-buffer (car (split-string (buffer-name) "/")))
	     )
	   ))
     )
    )
  )


(define-key global-map (kbd "M-n") 'my-toggle-narrow-to-defun)
(define-key global-map (kbd "C-s") 'save-buffer)
(define-key global-map (kbd "C-f") 'swiper)


(defun my-org-set-todo-state (todostate)
  "Change TODO state of current heading to todostate"
  (save-excursion
  (let* (
	 (todo-state (concat todostate " "))
	 (regexp "\\([[:word:]]+ \\)\\(.*\\)")
	 (heading-level (car (my-org-get-current-heading-level-and-point)))
	 (heading-point (nth 1 (my-org-get-current-heading-level-and-point)))
	 )
      (progn
      (if (eq (org-get-todo-state) nil)
	  (setq new-line (concat todo-state (org-get-heading)))
	(progn
	  (setq new-line (replace-regexp-in-string regexp (concat todo-state "\\2") (org-get-heading) nil nil))
	)
	)
      (goto-char (+ heading-point heading-level 1))
      (zap-up-to-char -1 ?*)
      (zap-up-to-char 1 ?\n)
      (insert (concat " " new-line))
      )
    )
    )
    )




;;org-after-todo-state-change-hook
;;org-state
(setq debug-on-error 1)

(defun chunyang-elisp-function-or-variable-quickhelp (symbol)
  "Display summary of function or variable at point.

Adapted from `describe-function-or-variable'."
  (interactive
   (let* ((v-or-f (variable-at-point))
          (found (symbolp v-or-f))
          (v-or-f (if found v-or-f (function-called-at-point))))
     (list v-or-f)))
  (if (not (and symbol (symbolp symbol)))
      (message "You didn't specify a function or variable")
    (let* ((fdoc (when (fboundp symbol)
                   (or (documentation symbol t) "Not documented.")))
           (fdoc-short (and (stringp fdoc)
                            (substring fdoc 0 (string-match "\n" fdoc))))
           (vdoc (when  (boundp symbol)
                   (or (documentation-property symbol 'variable-documentation t)
                       "Not documented as a variable.")))
           (vdoc-short (and (stringp vdoc)
                            (substring vdoc 0 (string-match "\n" vdoc)))))
      (and (require 'popup nil 'no-error)
           (popup-tip
            (or
             ;;(and fdoc-short vdoc-short
             ;;     (concat fdoc-short "\n\n"
             ;;             (make-string 30 ?-) "\n" (symbol-name symbol)
             ;;             " is also a " "variable." "\n\n"
             ;;             vdoc-short))
             fdoc
             vdoc)
            :margin t)))))
(define-key global-map (kbd "M-?") 'chunyang-elisp-function-or-variable-quickhelp)


(define-key help-mode-map (kbd "<DEL>") 'help-go-back)
(define-key help-mode-map (kbd "<M-left>") 'help-go-back)
(define-key help-mode-map (kbd "<M-right>") 'help-go-forward)




;;(add-to-list 'load-path "~/.emacs.d/org-gcal/")
;;(require 'org-gcal)
;;(setq org-gcal-client-id "333013805673-varidbf7tnsge2tv22u3af6admtc60qv.apps.googleusercontent.com"
;;      org-gcal-client-secret "KOKdhQLYYJkil_zE3ufDUCa1"
;;      org-gcal-file-alist '(("1emonvv6qe3lm3tto7huqr8hh8@group.calendar.google.com" . (concat data-folder-path "Sync/org/gcal.org"))))
;;

(defun my-help ()
  "docstring"
  (interactive)
  (find-file
   (concat data-folder-path "Sync/org/help.org")
   )
  )
(define-key global-map (kbd "<f1>") #'my-help)



;;old params:calid sss
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(server-start)


;;(define-key global-map (kbd "C-x 8") 'xref-find-definitions-other-window)

(setq ivy-initial-inputs-alist
   (quote
    ((counsel-minor . "^+")
     (counsel-package . "^+")
     (counsel-org-capture . "")
     (counsel-M-x . "")
     (counsel-describe-symbol . ""))))

(define-key global-map (kbd "C-x d") 'counsel-dired)
(define-key global-map (kbd "C-x C-f")
(lambda () (interactive) (message "not defined))"))
  )


(define-key emacs-lisp-mode-map (kbd "M-<right>") 'forward-sexp)
(define-key emacs-lisp-mode-map (kbd "M-<left>") 'backward-sexp)


(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c C-c") 'ace-jump-mode)



;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-x C-x") 'cua-exchange-point-and-mark)
(define-key org-mode-map (kbd "M-q") 'org-fill-paragraph)
(define-key global-map (kbd "M-q") 'avy-goto-char)
(define-key global-map (kbd "C-x g") 'revert-buffer)
;;(run-with-timer 0 30 'org-gcal-sync)



(use-package windower
  :init
  :bind (:map global-map
	      ("<s-tab>" . 'windower-switch-to-last-buffer)
	      ("C-x 1" . 'windower-toggle-single)
	      ("C-x \\" . 'windower-toggle-split)
	      
	      ("<M-s-left>" . 'windower-move-border-left)
	      ("<M-s-down>" . 'windower-move-border-below)
	      ("<M-s-up>" .  'windower-move-border-above)
	      ("<M-s-right>" . 'windower-move-border-right)

	      ("<S-s-left>" . 'windower-swap-left)
	      ("<S-s-down>" . 'windower-swap-below)
	      ("<S-s-up>" . 'windower-swap-above)
	      ("<S-s-right>" . 'windower-swap-right)
	      ("<S-s-right>" . 'windower-swap-right)
	      )  
)


(setq aw-scope 'frame)


;; open describe- functions in other frame
;;ensure that help-window-select set to always(t)
(defun my/describe-functions-open-window (arg)
  "docstring"
  (if (> my/windows-quantity-before-call 1)
      (progn
	(previous-buffer)
	(select-window my/previous-selected-window)
	(if (< (window-pixel-height) (window-pixel-width))
	    (split-window-horizontally)
	  (split-window-vertically)
	  )
	(other-window 1)
	(switch-to-buffer "*Help*")
	)
    )
  )
;;     );;(lambda (&rest args) (interactive)(split-window-horizontally) (other-window 1)))
;;   )
(defun my/count-windows-before-call (arg)
  "docstring"
  (if (ivy--buffer-list "*Help*")
      (progn
	(switch-to-buffer "*Help*")
	(rename-uniquely)
	(previous-buffer)
	)
    )
  (setq my/windows-quantity-before-call (count-windows 1))
  (setq my/previous-selected-window (selected-window))
  (message "selected window: %s" (selected-window))
  )

(advice-add 'describe-function :after 'my/describe-functions-open-window)
(advice-add 'describe-variable :after 'my/describe-functions-open-window)
(advice-add 'describe-key :after 'my/describe-functions-open-window)

(advice-add 'describe-function :before 'my/count-windows-before-call)
(advice-add 'describe-variable :before 'my/count-windows-before-call)
(advice-add 'describe-key :before 'my/count-windows-before-call)
(setq my/windows-quantity-before-call nil)
(setq my/previous-selected-window nil)
;; /open describe- functions in other frame


(define-prefix-command 'jump-map)
(global-set-key (kbd "C-j") 'jump-map)
(define-key jump-map (kbd "v") 'find-variable-other-frame)
(define-key jump-map (kbd "f") 'find-function-other-frame)


(require 'auto-minor-mode)
(use-package auto-minor-mode
  :init
  (add-to-list 'auto-minor-mode-alist '("\\.el\\([.]gz\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.emacs\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.p\\(\\(hp\\)\\|\\(y\\)\\)\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.js\\(on\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]c\\(\\(ss\\)\\|\\(pp\\)\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]h\\(\\(pp\\)\\|\\(tml\\)\\)?\\'" . highlight-symbol-mode))

  (add-to-list 'auto-minor-mode-alist '("\\.el\\([.]gz\\)?\\'" . hs-minor-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.p\\(\\(hp\\)\\|\\(y\\)\\)\\'" . hs-minor-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.js\\(on\\)?\\'" . hs-minor-mode))
)

(use-package counsel
  :diminish counsel-mode
  :init
  (global-set-key [remap org-set-tags-command] #'counsel-org-tag)
  (global-set-key [remap describe-function] #'counsel-describe-function)
  (global-set-key [remap describe-variable] #'counsel-describe-variable) 
  :bind (:map global-map
	      ("C-x C-b" . 'counsel-switch-buffer)
	      ("C-w" . 'counsel-imenu)
	      )
  )

;; if you want to defer Elpy loading:
(use-package elpy
  :ensure t
  :defer t
  :init
  (highlight-indentation-mode 0)
  (advice-add 'python-mode :before 'elpy-enable)
  (setq elpy-rpc-backend "jedi") 
  :bind (:map elpy-mode-map
	      ("C-j d" . 'elpy-goto-definition)
	      ("C-j a" . 'elpy-goto-assignment)
	      ("M-f" . 'elpy-folding-toggle-at-point)
	      ("C-<down>" . 'forward-paragraph)
	      ("C-<up>" . 'backward-paragraph)
	      ("<f2>" . 'elpy-multiedit-python-symbol-at-point)
	 )

  )


(define-key global-map (kbd "M-f") 'hs-toggle-hiding)
(define-key org-mode-map (kbd "M-i") 'org-time-stamp-inactive)
(define-key org-mode-map (kbd "M-l") 'org-insert-link)
(define-key global-map (kbd "C-x m") 'counsel-bookmark)


(global-set-key [remap mouse-kill] nil)
(global-set-key [remap mouse-kill-secondary] nil)


(define-key global-map (kbd "C-c v") 'org-ql-view)
(define-key global-map (kbd "C-c s") 'org-ql-search)


(defun unpackaged/org-element-descendant-of (type element)
  "Return non-nil if ELEMENT is a descendant of TYPE.
TYPE should be an element type, like `item' or `paragraph'.
ELEMENT should be a list like that returned by `org-element-context'."
  ;; MAYBE: Use `org-element-lineage'.
  (when-let* ((parent (org-element-property :parent element)))
    (or (eq type (car parent))
        (unpackaged/org-element-descendant-of type parent))))

;;;###autoload
(defun unpackaged/org-return-dwim (&optional default)
  "A helpful replacement for `org-return'.  With prefix, call `org-return'.

On headings, move point to position after entry content.  In
lists, insert a new item or end the list, with checkbox if
appropriate.  In tables, insert a new row or end the table."
  ;; Inspired by John Kitchin: http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
  (interactive "P")
  (if default
      (org-return)
    (cond
     ;; Act depending on context around point.

     ;; NOTE: I prefer RET to not follow links, but by uncommenting this block, links will be
     ;; followed.

     ((eq 'link (car (org-element-context)))
      ;; Link: Open it.
      (org-open-at-point-global))

     ((org-at-heading-p)
      ;; Heading: Move to position after entry content.
      ;; NOTE: This is probably the most interesting feature of this function.
      (let ((heading-start (org-entry-beginning-position)))
        (goto-char (org-entry-end-position))
        (cond ((and (org-at-heading-p)
                    (= heading-start (org-entry-beginning-position)))
               ;; Entry ends on its heading; add newline after
               (end-of-line)
               (insert "\n\n"))
              (t
               ;; Entry ends after its heading; back up
               (forward-line -1)
               (end-of-line)
               (when (org-at-heading-p)
                 ;; At the same heading
                 (forward-line)
                 (insert "\n")
                 (forward-line -1))
               ;; FIXME: looking-back is supposed to be called with more arguments.
               (while (not (looking-back (rx (repeat 3 (seq (optional blank) "\n")))))
                 (insert "\n"))
               (forward-line -1)))))

     ((org-at-item-checkbox-p)
      ;; Checkbox: Insert new item with checkbox.
      (org-insert-todo-heading nil))

     ((org-in-item-p)
      ;; Plain list.  Yes, this gets a little complicated...
      (let ((context (org-element-context)))
        (if (or (eq 'plain-list (car context))  ; First item in list
                (and (eq 'item (car context))
                     (not (eq (org-element-property :contents-begin context)
                              (org-element-property :contents-end context))))
                (unpackaged/org-element-descendant-of 'item context))  ; Element in list item, e.g. a link
            ;; Non-empty item: Add new item.
            (org-insert-item)
          ;; Empty item: Close the list.
          ;; TODO: Do this with org functions rather than operating on the text. Can't seem to find the right function.
          (delete-region (line-beginning-position) (line-end-position))
          (insert "\n"))))

     ((when (fboundp 'org-inlinetask-in-task-p)
        (org-inlinetask-in-task-p))
      ;; Inline task: Don't insert a new heading.
      (org-return))

     ((org-at-table-p)
      (cond ((save-excursion
               (beginning-of-line)
               ;; See `org-table-next-field'.
               (cl-loop with end = (line-end-position)
                        for cell = (org-element-table-cell-parser)
                        always (equal (org-element-property :contents-begin cell)
                                      (org-element-property :contents-end cell))
                        while (re-search-forward "|" end t)))
             ;; Empty row: end the table.
             (delete-region (line-beginning-position) (line-end-position))
             (org-return))
            (t
             ;; Non-empty row: call `org-return'.
             (org-return))))
     (t
      ;; All other cases: call `org-return'.
      (org-return)))))
;;(define-key org-mode-map (kbd "<RET>") 'unpackaged/org-return-dwim)
(defun org-ql-view-todo ()
  "docstring"
  (interactive)
  (call-interactively 'org-agenda-todo)
  (org-ql-view-refresh)
  
  )

(with-eval-after-load "org-ql-view"
(define-key org-ql-view-map (kbd "r") 'org-ql-view-todo)
)
(define-key global-map (kbd "C-x C-s")
  (lambda () (interactive) (message "not defined))"))
  )
(define-key org-src-mode-map (kbd "M-n") #'org-edit-src-exit)

;;("/home/zelenyeshtany/Sync/org/CS.org" "/home/zelenyeshtany/Sync/org/Getting Started with Orgzly.org" "/home/zelenyeshtany/Sync/org/annotations.org" "/home/zelenyeshtany/Sync/org/articles.org" "/home/zelenyeshtany/Sync/org/books.org" "/home/zelenyeshtany/Sync/org/brench.org" "/home/zelenyeshtany/Sync/org/clonezilla.org" "/home/zelenyeshtany/Sync/org/copingcards.org" "/home/zelenyeshtany/Sync/org/diredhelp.org" "/home/zelenyeshtany/Sync/org/discrmath.org" "/home/zelenyeshtany/Sync/org/elispCoding.org" "/home/zelenyeshtany/Sync/org/emacs-todos.org" "/home/zelenyeshtany/Sync/org/emacsconfig.org" "/home/zelenyeshtany/Sync/org/engl.org" "/home/zelenyeshtany/Sync/org/englwords.org" "/home/zelenyeshtany/Sync/org/gcal.org" "/home/zelenyeshtany/Sync/org/habits.org" "/home/zelenyeshtany/Sync/org/helmhelp.org" "/home/zelenyeshtany/Sync/org/help.org" "/home/zelenyeshtany/Sync/org/inbox.org" "/home/zelenyeshtany/Sync/org/inboxcal.org" "/home/zelenyeshtany/Sync/org/meditation.org" "/home/zelenyeshtany/Sync/org/mtp.org" "/home/zelenyeshtany/Sync/org/new.org" "/home/zelenyeshtany/Sync/org/newreflex.org" "/home/zelenyeshtany/Sync/org/notes.org" "/home/zelenyeshtany/Sync/org/notes2.org" "/home/zelenyeshtany/Sync/org/nstu.org" "/home/zelenyeshtany/Sync/org/sleephygiene.org" "/home/zelenyeshtany/Sync/org/sss.org" "/home/zelenyeshtany/Sync/org/superego.org" "/home/zelenyeshtany/Sync/org/tabl.org" "/home/zelenyeshtany/Sync/org/tables.org" "/home/zelenyeshtany/Sync/org/takingChargeOfAdultADHDnotes.org" "/home/zelenyeshtany/Sync/org/test.org" "/home/zelenyeshtany/Sync/org/timerasp.org" "/home/zelenyeshtany/Sync/org/todos.org" "/home/zelenyeshtany/Sync/org/ubuntuconfig.org" "/home/zelenyeshtany/Sync/org/webarchive.org" "/home/zelenyeshtany/Sync/org/утррит.org" "/home/zelenyeshtany/Sync/org/вечрит.org")
;;
;;
;;

(defun my-org-element-type (element)
  "Return type of ELEMENT.

The function returns the type of the element or object provided.
It can also return the following special value:
  `plain-text'       for a string
  `org-data'         for a complete document
  nil                in any other case."
  (cond
   ((not (consp element)) (and (stringp element) 'plain-text))
   ((symbolp (car element)) (car element))))


(defun my/org-at-source-block-p ()
  "returns non-nil if point is at source block"
(eq (my-org-element-type (org-element-at-point)) 'src-block)
)

;; old version
;;(defun my-toggle-narrow-to-defun () ;;old
;;  "If narrowed, then widen current buffer. 
;;Narrow to defun if it's not."
;;  (interactive)
;;  (let* (
;;	 (new-indirect-buffer-name (concat (buffer-name) "/" (lisp-current-defun-name)))
;;	)
;;    
;;  (if (not (buffer-narrowed-p))
;;	(progn
;;	  (clone-indirect-buffer new-indirect-buffer-name nil )
;;	  (switch-to-buffer new-indirect-buffer-name)
;;	  (narrow-to-defun)
;;	  )
;;      ;;(progn (widen) (setq my-narrowed nil)) - old version
;;    (progn
;;      (kill-buffer)
;;      (switch-to-buffer (car (split-string (buffer-name) "/")))
;;      )
;;    )
;;    )
;;  )


(defun my/org-mode-p ()
  "Return `t' if major-mode or derived-mode-p equals 'org-mode, otherwise `nil'."
  (or (eq major-mode 'org-mode) (when (derived-mode-p 'org-mode) t)))

(defun my/org-move-right ()
  "docstring"
  (interactive)
  (if(org-at-table-p)
      (org-table-next-field)
    (right-word)
   )
  )
(defun my/org-move-left ()
  "docstring"
  (interactive)
  (if(org-at-table-p)
      (org-table-previous-field)
    (left-word)
   )
  )

(define-key org-mode-map (kbd "C-<right>") #'my/org-move-right)
(define-key org-mode-map (kbd "C-<left>") #'my/org-move-left)
(define-key global-map (kbd "<mouse-3>") nil)
(define-key global-map (kbd "M-c") #'comment-dwim)


(defun my-jump-to-prev (arg)
  "docstring"
  (interactive "p")
  (if (region-active-p)
      (mc/mark-previous-like-this arg)
    (highlight-symbol-prev)
      )
  )
(defun my-jump-to-next (arg)
  "docstring"
  (interactive "p")
  (if (region-active-p)
      (mc/mark-next-like-this arg)
    (highlight-symbol-next)
      )
  )
(define-key global-map (kbd "C-M-<right>") #'my-jump-to-next)
(define-key global-map (kbd "C-M-<left>") #'my-jump-to-prev)


(set-face-attribute 'mode-line nil :font "Ubuntu Mono 12")
;;(set-face-attribute 'default nil :font "Calibri 12")
;; (setq helm-ff-default-directory (concat data-folder-path "Sync/org/"))


(defun er-sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(define-key global-map (kbd "C-r") #'er-sudo-edit)

(defun my-make-frame-command (args)
  "docstring"
  (interactive "P")
(let*
    (
     (result nil)
     (buffer-list (ivy--buffer-list ""))
     (buffer-with-name-drafts-exists-p
     (dolist
	 (cur-buffer buffer-list result)
       (if (string= cur-buffer "drafts")
	   (setq result t)
	 )
       ))
     
     (buffer
      (if buffer-with-name-drafts-exists-p
	  ;; return existing buffers list
	  (get-buffer "drafts")
	  (generate-new-buffer "drafts")
	  )
      )
     )
  
  (set-buffer-major-mode buffer)
  (display-buffer buffer '(display-buffer-pop-up-frame . nil))
  )
  )
;;(make-frame-command)
(define-key global-map (kbd "C-x 5 2") #'my-make-frame-command)


(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (delete-region (point) (progn (forward-word arg) (point)))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(define-key global-map (kbd "C-<backspace>") 'backward-delete-word)
(define-key global-map (kbd "C-<del>") 'delete-word)
;;If you use CUA mode, you might want to register these functions as movements, so that shift-<key> works properly:

;;(dolist (cmd '(delete-word backward-delete-word))
;;(put cmd 'CUA 'move))


;; (scroll-restore-mode 1)
;; ;; Allow scroll-restore to modify the cursor face
;; (setq scroll-restore-handle-cursor t)
;; ;; Make the cursor invisible while POINT is off-screen
;; (setq scroll-restore-cursor-type nil)
(define-key global-map (kbd "M-<up>") #'bm-previous)
(define-key global-map (kbd "M-<down>") #'bm-next)
(define-key global-map (kbd "M-b") #'bm-toggle)


(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(define-key global-map (kbd "C-l") #'copy-line)

(beacon-mode 1)
(use-package emacsql-sqlite
  :ensure t
  )

;; (use-package counsel-ffdata
;;   :ensure t
;;   )
;; (add-to-list 'load-path "~/.emacs.d/elpa/counsel-ffdata-20191017.1237/")
;; (require 'counsel-ffdata)
(define-key global-map (kbd "M-q") #'fill-paragraph)
;; (use-package centaur-tabs
;;   :demand
;;   :config
;;   (centaur-tabs-mode t)
;;   :bind
;;   ("C-<prior>" . centaur-tabs-backward)
;;   ("C-<next>" . centaur-tabs-forward))
;;(zoom-mode 1)

;; (use-package visual-regexp-steroids
;;   :quelpa (visual-regexp-steroids :fetcher github :repo "benma/visual-regexp-steroids.el"))

;;(require 'highlight-indent-guides)
;;(add-to-list 'load-path "~/.emacs.d/highlight-indent/")
;;(add-hook 'python-mode-hook 'highlight-indent-guides-mode)

(setq ivy-use-selectable-prompt t)
(use-package company
:diminish company-mode
  )
  
(use-package ivy
  :diminish ivy-mode
  )

  
(use-package yasnippet
  :diminish yas-minor-mode
  )

(use-package hideshow
  :diminish hs-minor-mode
  )

(use-package highlight-symbol
  :diminish highlight-symbol-mode
  )

(add-to-list 'load-path "~/.emacs.d/elpa/org-ql-20200713.909/")
(require 'org-ql)

(use-package beacon
  :diminish beacon-mode
  )
(use-package eldoc
  :diminish eldoc-mode
  )

(use-package org-indent
  :diminish org-indent-mode
  )
(use-package simple
  :diminish auto-fill-function
  )
(scroll-bar-mode 1)


(defun counsel-org-tag ()
  "Add or remove tags in `org-mode'."
  (interactive)
  (save-excursion
    (if (eq major-mode 'org-agenda-mode)
        (if org-agenda-bulk-marked-entries
            (setq counsel-org-tags nil)
          (let ((hdmarker (or (org-get-at-bol 'org-hd-marker)
                              (org-agenda-error))))
            (with-current-buffer (marker-buffer hdmarker)
              (goto-char hdmarker)
              (setq counsel-org-tags (counsel--org-get-tags)))))
      (unless (org-at-heading-p)
        (org-back-to-heading t))
      (setq counsel-org-tags (counsel--org-get-tags)))
    
    (let ((org-last-tags-completion-table
           (append (and (or org-complete-tags-always-offer-all-agenda-tags
                            (eq major-mode 'org-agenda-mode))
                        (org-global-tags-completion-table
                         (org-agenda-files)))
                   (unless (boundp 'org-current-tag-alist)
                     org-tag-persistent-alist)
                   (or (if (boundp 'org-current-tag-alist)
                           org-current-tag-alist
                         org-tag-alist)
                       (org-get-buffer-tags)))))
      (ivy-read (counsel-org-tag-prompt)
                (lambda (str _pred _action)
                  (delete-dups
                   (all-completions str #'org-tags-completion-function)))
                :history 'org-tags-history
                :action #'counsel-org-tag-action
                :caller 'counsel-org-tag)
      )))
(setq json-array-type 'list)
(use-package web-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  )
