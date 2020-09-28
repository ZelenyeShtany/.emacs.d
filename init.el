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
 '(auto-revert-verbose nil)
 '(bm-highlight-style 'bm-highlight-only-fringe)
 '(column-number-mode t)
 '(company-idle-delay 0.1)
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
 '(mode-line-format
   '("%e"
     (:eval
      (let*
	  ((active
	    (powerline-selected-window-active))
	   (mode-line-buffer-id
	    (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
	   (mode-line
	    (if active 'mode-line 'mode-line-inactive))
	   (face0
	    (if active 'powerline-active0 'powerline-inactive0))
	   (face1
	    (if active 'powerline-active1 'powerline-inactive1))
	   (face2
	    (if active 'powerline-active2 'powerline-inactive2))
	   (separator-left
	    (intern
	     (format "powerline-%s-%s"
		     (powerline-current-separator)
		     (car powerline-default-separator-dir))))
	   (separator-right
	    (intern
	     (format "powerline-%s-%s"
		     (powerline-current-separator)
		     (cdr powerline-default-separator-dir))))
	   (lhs
	    (list
	     (powerline-raw "%*" face0 'l)
	     (when powerline-display-buffer-size
	       (powerline-buffer-size face0 'l))
	     (when powerline-display-mule-info
	       (powerline-raw mode-line-mule-info face0 'l))
	     (powerline-buffer-id
	      `(mode-line-buffer-id ,face0)
	      'l)
	     (when
		 (and
		  (boundp 'which-func-mode)
		  which-func-mode)
	       (powerline-raw which-func-format face0 'l))
	     (powerline-raw " " face0)
	     (funcall separator-left face0 face1)
	     (when
		 (and
		  (boundp 'erc-track-minor-mode)
		  erc-track-minor-mode)
	       (powerline-raw erc-modified-channels-object face1 'l))
	     (powerline-major-mode face1 'l)
	     (powerline-process face1)
	     (powerline-minor-modes face1 'l)
	     (powerline-narrow face1 'l)
	     (powerline-raw " " face1)
	     (funcall separator-left face1 face2)
	     (powerline-vc face2 'r)
	     (when
		 (bound-and-true-p nyan-mode)
	       (powerline-raw
		(list
		 (nyan-create))
		face2 'l))))
	   (rhs
	    (list
	     (powerline-raw global-mode-string face2 'r)
	     (funcall separator-right face2 face1)
	     (unless window-system
	       (powerline-raw
		(char-to-string 57505)
		face1 'l))
	     (powerline-raw "%4l" face1 'l)
	     (powerline-raw ":" face1 'l)
	     (powerline-raw "%3c" face1 'r)
	     (funcall separator-right face1 face0)
	     (powerline-raw " " face0)
	     (powerline-raw "%6p" face0 'r)
	     (when powerline-display-hud
	       (powerline-hud face0 face2))
	     (powerline-fill face0 0))))
	(concat
	 (powerline-render lhs)
	 (powerline-fill face2
			 (powerline-width rhs))
	 (powerline-render rhs))))))
 '(org-M-RET-may-split-line '((default)))
 '(org-agenda-files (list org-directory))
 '(org-catch-invisible-edits 'error)
 '(org-complete-tags-always-offer-all-agenda-tags t)
 '(org-ctrl-k-protect-subtree 'error)
 '(org-directory my-org-directory)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "okular \"%s\"")
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
 '(org-read-date-prefer-future nil)
 '(package-selected-packages
   '(org-pomodoro org-superstar ada-mode ack wgrep-ag peg web-mode diminish loop json-mode org-ql counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
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
 '(bm-fringe-face ((t (:background "deep sky blue" :foreground "white"))))
 '(company-preview-common ((t (:inherit \#311d57 :foreground "red"))))
 '(company-scrollbar-bg ((t (:background "DarkCyan"))))
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

;; sticky windows 
(add-to-list 'load-path "~/.emacs.d/sticky-windows")
(require 'sticky-windows)
;; /sticky windows 
;;smartparens
(add-to-list 'load-path "~/.emacs.d/smartparens")
(use-package smartparens-config
  :diminish smartparens-mode
  )
;;/smartparens

(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol.el/")
(require 'highlight-symbol)
(with-eval-after-load "highlight-symbol"
  (setq highlight-symbol-idle-delay 0.2)
  ;;(unless global-auto-highlight-symbol-mode
  ;;(global-auto-highlight-symbol-mode t))
  )


(add-to-list 'load-path "~/.emacs.d/mypack/")
(load "mypack")
(require 'my-json)
;;(load "my-org-recur-adjustments")


(add-to-list 'load-path "~/.emacs.d/mypack/")
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
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 50)(org-superstar-mode 1)))
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
    (if (eq (org-element-type (org-element-at-point)) 'headline)
	 
	(let* (
	       (level (org-element-property :level (org-element-at-point)))
	       (begin (org-element-property :begin (org-element-at-point)))
	       (title-length (length (org-element-property :title (org-element-at-point))))
	       (contents-end (org-element-property :contents-end (org-element-at-point)))
	       (end-of-headline (+ begin level
				   (my/number-of-spaces-at-point(+ begin level))
				   title-length))
	       )
	  
	  (if (eq (point) end-of-headline)
	      (if (org-goto-first-child)
	      (progn
		(forward-char -1)
		(insert "\n")
		)
	    
	    (progn
	      (if (eq contents-end nil)
		  (progn
		    (goto-char end-of-headline)
		    (insert "\n")
		    )
		(goto-char contents-end)
		)
	      
	      (if (not (eq (char-before) ?\n ) )
		  (progn (insert "\n") (forward-char -1))
		)
	      )
	    )
	    (org-return)
	    )
	  
	  )
      (org-return)
      )
      )
  
  (defun my/copy-id-to-clipboard()
       (interactive)
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
	 (setq mytmpid (concat "id:" (funcall 'org-id-get-create)))
	 (kill-new mytmpid)
	 (message "Copied %s to killring (clipboard)" mytmpid)
       ))
  
  (setq
   notes (concat data-folder-path "Sync/org/notes.org")
   todos (concat data-folder-path "Sync/org/todos.org")
   timerasp (concat data-folder-path "Sync/org/timerasp.org")
   poor-man-cbt (concat data-folder-path "Sync/tables/poor-man-CBT/data.json")
   english-tracker (concat data-folder-path "Sync/tables/english tracker/data.json")
   migraines-tracker (concat data-folder-path "Sync/tables/migraines/data.json")
   habits-tracker (concat data-folder-path "Sync/tables/habits tracker/2020/data.json")
   exercise-tracker (concat data-folder-path "Sync/tables/exercises tracker/2020/data.json")
   sleepdiary (concat data-folder-path "Sync/tables/sleep diary/2020/data.json")
   org-clock-sound (concat data-folder-path "Sync/org/timer-sounds/bell.wav")
   org-return-follows-link t
   org-use-speed-commands t
   org-use-sub-superscripts nil
   org-ellipsis "⤵"
   org-protocol-default-template-key "d"
   org-read-date-prefer-future nil
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
   org-todo-keywords (list "TODO(1)" "STARTED(2)" "|" "CANCELED(3)"  "MISSED(4)" "DONE(5)")
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
     ("attention")
     (:endgrouptag)
     ("SCT")
     ("quantifiedself")
     ("NSTU")
     ("compression")
     ("podcasts")
     
     ("important")
     ("book")
     ("sobering")
     ("motivation")
     ("cpp")
     ("health")
     ("alcohol")
     ("organization")
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
   '(;; ("t" "Todo" entry (file+headline todos "Tasks")
     ;;  "* TODO %?")
     ("j" "Add to notes.org" entry (file+datetree notes)
      "* %?")
     ;; ("i" "Idea" entry (file+datetree notes)
     ;;  "* IDEA %?")
     ;;("d" "TEST" entry (file+datetree (concat data-folder-path "Sync/org/notes.org"))
     ;; "* frombroser: %a" :immediate-finish t)


     ("H" "Habits Tracker" plain (file habits-tracker )
      (function (lambda () (interactive) (my/json-habits habits-tracker))) :immediate-finish t
      )

     ("g" "Migraines Tracker" plain (file migraines-tracker )
      (function (lambda () (interactive) (my-json/migraines migraines-tracker))) :immediate-finish t
      )

     ("p" "Poor Man CBT" plain (file poor-man-cbt )
      (function (lambda () (interactive) (my-json/poor-man-CBT poor-man-cbt))) :immediate-finish t
      )

     ("n" "English Tracker" plain (file english-tracker )
      (function (lambda () (interactive) (my-json/engl english-tracker))) :immediate-finish t
      )

     ("E" "Exercise Tracker" plain (file exercise-tracker )
      (function (lambda () (interactive) (my/json-exercises exercise-tracker))) :immediate-finish t
      )

     ("M" "Sleep Tracker Morning" plain (file sleepdiary )
      (function (lambda () (interactive) (my/json-sleep sleepdiary nil))) :immediate-finish t
      )

     ("l" "Sleep Tracker Evening" plain (file sleepdiary )
      (function (lambda () (interactive) (my/json-sleep sleepdiary t))) :immediate-finish t
      )

     
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
(require 'my-week-day-based-habits)
  :bind (:map org-mode-map
	      ("C-<RET>" . 'org-return)
	      ("C-c n" . 'org-add-note)
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



;; telegram

;; (use-package dired
;;   :hook (dired-load . (lambda () (load "dired-x") (define-key dired-mode-map (kbd "C-c") 'dired-do-copy)))
;;   :bind (:map dired-mode-map
;; 	 ("C-c" . 'dired-do-copy)
;; 	 )
;;   )

;; /telegram



(use-package dired
  :hook (dired-load . (lambda ()
			(load "dired-x")
			(define-key dired-mode-map (kbd "C-c") 'dired-do-copy)))
  :init
  (setq dired-guess-shell-alist-user '(
				     ("\\.pdf\\'" "okular")
				     ("\\.mp4\\'" "mpv")
				     ("\\.mkv\\'" "mpv")
				     ))
  ;;(setq dired-dwim-target t)

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


(defun my-toggle-narrow-to-sth ()
  "If narrowed, then widen current buffer. 
Narrow to defun if it's not."
  (interactive)
  (cond
   (
    ;; if current buffer is already narrowed,
    ;; kill this indirect buffer and switch to base buffer
    (buffer-narrowed-p) 
    (let* (
	   (curbuf (current-buffer))
	   (curpoint (point))
	   )
      (switch-to-buffer (buffer-base-buffer))
      (goto-char curpoint)
      (kill-buffer curbuf)
      )
    )
   ((use-region-p) ;; id there's active region (text selection)
    (let* (
	   (beg (point))
	   (end (mark))
	   )
      (cua-cancel)
      (switch-to-buffer
       (clone-indirect-buffer nil nil ) ;; create indirect buffer with current_buffer_name<N> name
       ) ;; and switch to it
      (narrow-to-region beg end))
    )
   
   ((my/org-at-source-block-p)
    (switch-to-buffer
     (clone-indirect-buffer nil nil ) ;; create indirect buffer with current_buffer_name<N> name
     )
    (org-narrow-to-block)
    )
   ((my/org-mode-p)
    (switch-to-buffer
     (clone-indirect-buffer nil nil ) ;; create indirect buffer with current_buffer_name<N> name
     )
    (org-toggle-narrow-to-subtree)
    )

   (
    (derived-mode-p 'emacs-lisp-mode)

    (let*
	(
	 (new-indirect-buffer-name (concat (buffer-name) "/" (lisp-current-defun-name)))
	 )
      (if (or
	   (eq (char-after) ?\( )
	   (eq (char-before) ?\) )
	   )

	  ;; narrow to sexp
	  (let*
	      (
	       (beg (point))
	       (end  (goto-char (nth 2 (show-paren--default))))
	       )
	    (switch-to-buffer
	     (clone-indirect-buffer nil nil ) ;; create indirect buffer with current_buffer_name<N> name
	     )
	    (forward-char (if (eq (char-after) ?\( ) 1 -1) )
	    (sp-narrow-to-sexp 1)
	    )
	
	;; narrow to defun
	(if (eq (ivy--buffer-list new-indirect-buffer-name) nil)
	  (progn
	    (clone-indirect-buffer new-indirect-buffer-name nil )
	    (switch-to-buffer new-indirect-buffer-name)
	    (narrow-to-defun)
	    )
	(progn
	  (switch-to-buffer new-indirect-buffer-name)
	  (narrow-to-defun)
	  )
	)
	  )
      )
    )
   )
  )(define-key global-map (kbd "M-n") 'my-toggle-narrow-to-sth)
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
(setq debug-on-error nil)

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
;;(define-key global-map (kbd "C-c C-c") 'ace-jump-mode)



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


;; windower
;; redefining for my purposes
;; (delete-other-windows -> sticky-window-delete-other-windows)

(use-package windower
  :bind (:map global-map
	      ("<s-tab>" . 'windower-switch-to-last-buffer)
	      ("C-x 1" . 'my/windower-toggle-single)
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
;; /windower


(setq aw-scope 'frame)


;; open describe- functions in other frame
;;ensure that help-window-select set to always(t)
(defun my/describe-functions-open-window (&rest arg)
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
(defun my/count-windows-before-call (&rest arg)
  "docstring"
  (when (not (derived-mode-p 'help-mode))
      (progn
       (if (member "*Help*" (ivy--buffer-list "*Help*"))
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
    )
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

;; find-function and etc
(defun my/after-find-function-advice(&rest arg)
  "docstring"
  (interactive)
  (let* (
	 (curbuf (current-buffer))
	 )
    
  (previous-buffer)
  (if (< (window-pixel-height) (window-pixel-width))
	    (split-window-horizontally)
	  (split-window-vertically)
	  )
  (other-window 1)
  (switch-to-buffer curbuf)
  )
  )
;;(advice-add 'find-function :after 'my/after-find-function-advice)
(add-hook 'find-function-after-hook 'my/after-find-function-advice)

;; /find-function and etc



(define-prefix-command 'jump-map)
(global-set-key (kbd "C-j") 'jump-map)
(define-key jump-map (kbd "v") 'find-variable)
(define-key jump-map (kbd "f") 'find-function)


(require 'auto-minor-mode)
(use-package auto-minor-mode
  :init
  (add-to-list 'auto-minor-mode-alist '("\\.el\\([.]gz\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.emacs\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.p\\(\\(hp\\)\\|\\(y\\)\\)\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.js\\(on\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]c\\(\\(ss\\)\\|\\(pp\\)\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]h\\(\\(pp\\)\\|\\(tml\\)\\)?\\'" . highlight-symbol-mode))

  (add-to-list 'auto-minor-mode-alist '("\\.el\\([.]gz\\)?\\'" . company-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.emacs\\'" . company-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.p\\(\\(hp\\)\\|\\(y\\)\\)\\'" . company-mode))
  (add-to-list 'auto-minor-mode-alist '("\\.js\\(on\\)?\\'" . company-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]c\\(\\(ss\\)\\|\\(pp\\)\\)?\\'" . company-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]h\\(\\(pp\\)\\|\\(tml\\)\\)?\\'" . company-mode))
  
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


;;(define-key global-map (kbd "C-c v") 'org-ql-view)
;;(define-key global-map (kbd "C-c s") 'org-ql-search)


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
;;(defun my-toggle-narrow-to-sth () ;;old
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


(set-face-attribute 'mode-line nil :font "Ubuntu Mono 10")
;;(set-face-attribute 'default nil :font "Ubuntu Mono 10")
;;(set-face-attribute 'default nil :height 90)
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
(define-key global-map (kbd "C-M-f") #'ag)
(define-key global-map (kbd "C-x e") #'eval-last-sexp)
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
;;(scroll-bar-mode 1)


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
(setq json-array-type 'vector)
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
(setq json-encoding-pretty-print nil)



(defun smarter-move-end-of-line ()
  "docstring"
  (interactive)
  (cond
   (
    (derived-mode-p 'org-mode)
    (let*
	(
	 narrowed
	 )
      (when (not (buffer-narrowed-p)) (progn(org-narrow-to-subtree) (setq narrowed t)))

      (if(and
	  (eq (sp-point-in-string) ?\")
	  (not (eq (char-after) ?\"))
	  )
	  (sp-end-of-sexp)
	(move-end-of-line 1)
	)
      (when narrowed (widen))
      )
    )
   
   ((and
     (eq (sp-point-in-string) ?\")
     (not (eq (char-after) ?\"))
     )
    (sp-end-of-sexp)
    
    )
   (
    t
    (move-end-of-line 1)
    )
   )
  )
(define-key global-map (kbd "C-e") #'smarter-move-end-of-line)




(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  ;;(setq arg (or arg 1))

  (let* (
	 (arg (or arg 1))
	 )
    (cond
     (
      (derived-mode-p 'org-mode)
      (let*
	  (
	   narrowed
	   )
	(when (not (buffer-narrowed-p)) (progn(org-narrow-to-subtree) (setq narrowed t)))

	(if(and
	    (eq (sp-point-in-string) ?\")
	    (not (eq (char-before) ?\"))
	    )
	    (sp-beginning-of-sexp)
	  (let ((orig-point (point)))
	    (back-to-indentation)
	    (when (= orig-point (point))
	      (move-beginning-of-line 1)))
	  )
	(when narrowed (widen))
	)
      )
     
     ((and
       (eq (sp-point-in-string) ?\")
       (not (eq (char-before) ?\"))
       )
      (sp-beginning-of-sexp))
     (t
      (let ((orig-point (point)))
	(back-to-indentation)
	(when (= orig-point (point))
	  (move-beginning-of-line 1))))
     )
    ;; Move lines first
    ;; (when (/= arg 1)
    ;;   (let ((line-move-visual nil))
    ;;     (forward-line (1- arg))))
    )
  )
;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)
(define-key org-mode-map (kbd "C-a") 'smarter-move-beginning-of-line)
(use-package wgrep)
(use-package emacs-lisp-mode
  :hook (emacs-lisp-mode . smartparens-mode)
  )

(defun whitespace-p ()
  "returns t if character after point is a whitespace"
  (interactive)
  (eq(string-match "[[:space:]\n]" (char-to-string(char-after))) 0)
  )
(fringe-mode '(8 . 0))

(define-key global-map (kbd "C-c c") #'counsel-org-capture)
(define-key global-map (kbd "M-<backspace>") #'sp-splice-sexp)

(defun my/mark-sexp ()
  "docstring"
  (interactive)

  (cond
   (
    (eq (char-before) ?\) )
    (progn
      (goto-char (nth 2 (show-paren--default)))
      (sp-mark-sexp)
      )

    )

   (
    (eq (char-after) ?\( )
    (sp-mark-sexp)
    )

   (
    t
    (progn
      ;;(sp-beginning-of-sexp)
      (thing-at-point--beginning-of-sexp)
      (sp-mark-sexp)
      )
    )
   )
  )


(global-set-key [remap mark-sexp]
                'my/mark-sexp)


;;(advice-add 'dired-mark-read-file-name :after 'ivy-next-history-element)
(define-key emacs-lisp-mode-map (kbd "M-q") 'indent-region)
;; my orgmode dynamic blocks
(defun org-dblock-write:update-progress (params)
  (let* (
	 (fmt (or (plist-get params :format) "%d. %m. %Y"))
	 (myarg (string-to-number (or (plist-get params :myarg) "0")))
	)
    (if (eq myarg 1)
	(insert (concat "current time: " (format-time-string "%Y-%m-%d %S")))
	(insert 
     (concat "* MMO-like development branches
:PROPERTIES:
:CREATED:  [2020-07-04 Sat 14:55]
:END:
** english language
*** level 1 [[id:50dc4620-7b4b-46bf-9b87-43c7aba298c3][reward: case for internal HDD]]           :level:
:PROPERTIES:
:VISIBILITY: children
:END:
**** TODO 10 reading sessions in a row (" (number-to-string (my/count-last-todo-states-streak-within-logbook "9ade80ad-b62e-4b18-90c4-3d796907c435" "DONE")) "/10)
:PROPERTIES:
:ID:       5fd10544-ba7e-40aa-a015-c9fa6c8ffdcb
:ACTION:   [[id:19d35b60-c0da-4544-9b18-3fb52ed69e3f][reading habit]]
:STARTED:  [2020-07-11 Sat]
:Description: accomplish reading english books habit 10 times in a row (10-days streak)(занимаясь через день)
:END:
**** TODO 8 grammar units/20d (0/8)
:PROPERTIES:
:ID:       b9b7a38e-a925-4e67-ba22-b6c19d295729
:ACTION:   [[id:87e84f88-d61a-4762-8790-cc542073e8e1][studying grammar habit]]
:STARTED:  [2020-07-10 Fri]
:Description: study 8 grammar units in 20 days from \"Advanced Grammar in use 2ed\"
:END: 
**** TODO write 525 words in 1 week in english (0/525) (mon-sat)
:PROPERTIES:
:ID:       4a5f3dab-eb97-49af-a761-a76e8ebed24e
:ACTION: 
:STARTED:  [2020-07-10 Fri]
:Description: write 1575 words in 3 weeks in english while chatting with people from other countries or doing journaling
:END:
**** TODO 7 дней подряд добавлять минимум 5 слов в Anki(0/7)
:PROPERTIES:
:ID:       ed4f76be-a75d-472a-a4f3-43492e97571a
:STARTED:  [2020-07-10 Fri]
:END:
**** TODO anki revision 7 days in a row(0/7)
:PROPERTIES:
:CREATED:  [2020-08-15 Sat 07:49]
:END:
** computer science
:PROPERTIES:
:ID:       1799c14c-118c-46d1-8ccc-bb1e0cf9ddc5
:END:
*** 1 level reward: e-reader                                        :level:
:PROPERTIES:
:CREATED:  [2020-07-07 Tue 21:15]
:VISIBILITY: children
:END:
**** discrete maths 2h/d; 12d/2w (0/12)  [[http://www.sp19.eecs70.org/][currentcourse]] [[id:f3f793f1-441a-4e5f-8fc9-5808c71bf438][tracker]] [[file:discrmath.org][planning+trackingProgress]]
:PROPERTIES:
:STARTED: [2020-07-10 Fri]
:END:
дискретная математика 6 дней подряд по 2 часа в
день за неделю
** adhd
*** level 1 [[id:0eb8b63b-218f-4800-953e-97d563ed793d][reward: 3/6 of raspberry pi]]                :level:
:PROPERTIES:
:VISIBILITY: children
:END:
**** meditation 2-5m 7days streak (1/7)
:PROPERTIES:
:ID:       a62e03f8-8bf8-4c59-bbcf-0f5e93e62837
:STARTED:  [2020-07-10 Fri]
:END:
:LOGBOOK:
- Note taken on [2020-07-24 Fri 07:48] \\
  15 мин слишком много. совсем непродуктивные
  медитации выходят
:END:
Описание: медитация 5мин 30 дней подряд
**** Taking charge of adult ADHD notes [[file:takingChargeOfAdultADHDnotes.org][notes]] [0/1]
:PROPERTIES:
:CREATED:  [2020-07-06 Mon 20:56]
:END:
Описание: перечитать некоторые главы и
законспектировать Taking charge of adult ADHD
***** 8 rules
:PROPERTIES:
:CREATED:  [2020-08-12 Wed 10:32]
:END:
****** TODO 1 rule
** exercises
*** level 1 [[id:0eb8b63b-218f-4800-953e-97d563ed793d][reward: 1/6 of raspberry pi]]           :level:
:PROPERTIES:
:VISIBILITY: children
:END:
**** do any of exercises 7 days in a row (0/7) [[file:/data/Sync/tables/exercises tracker/2020/september.csv][tracker]]
:PROPERTIES:
:STARTED:  [2020-07-10 Fri]
:ID:       adf0d777-7918-4a36-addc-cf103017f257
:END:
What counts:
1. Do at least 20x4 push ups; x3 pull ups
2. Ride a bike for at least 30 mins
3. Run for at least 15mins
DO NOT DO SQUATS (trouble with knees)
** social skills
*** 1 level [[id:0eb8b63b-218f-4800-953e-97d563ed793d][reward: 1/6 of raspberry pi]]       :level:
:PROPERTIES:
:CREATED:  [2020-07-05 Sun 21:12]
:VISIBILITY: children
:END:
**** TODO Евгения Стрелецкая (40мин макс в день)
посмотреть и законспектить видосы от Евгении Стрелецкой и
законспектировать, скачать себе на диск. Выполнять
упражнения, которые там даны.

***** TODO [[https://www.youtube.com/watch?v=P9LG1kTH3nE][Застенчивость/стеснительность? Страх критики и негативных оценок. СОЦИОФОБИЯ Ч.1: СУТЬ, ПРИЧИНЫ]]
***** TODO [[https://www.youtube.com/watch?v=VlA_NmxYHXc][Победить СОЦИОФОБИЮ самостоятельно: когнитивно-поведенческая психотерапия (социальная фобия ч.2)]]
***** TODO [[https://www.youtube.com/watch?v=UgNNS62_ubQ][СОЦИОФОБИЯ Ч.3: секретные действенные методы избавления от стеснительности/застенчивости]]
**** TODO nofap 7 дней (1/7) [[id:f3f793f1-441a-4e5f-8fc9-5808c71bf438][tracker]]
:PROPERTIES:
:ID:     8d9858ca-4e06-4c68-a902-f206b8683ca1
:END:
** hygiene
*** 1 level [[id:0eb8b63b-218f-4800-953e-97d563ed793d][reward: 1/6 of raspberry pi]]             :level:
:PROPERTIES:
:VISIBILITY: children
:END:
**** sleep hygiene(встать в 8-8:30, ЛЕЧЬ в 23:30-00:00) 7days streak (2/7)
:PROPERTIES:
:ID:       98ddac3f-dca8-465d-a2ad-5ecec2c28032
:END:
**** shower at least 4days a week during a month (0/16)
:PROPERTIES:
:ID:       849c38f9-eb52-4adc-b090-c36b086dfa89
:END:
**** brush teeth 7days in a row 2 times a day (1/7)
:PROPERTIES:
:ID:       72c875d5-92d9-4dfc-bb0e-509250ac3981
:STARTED:  [2020-07-10 Fri]
:END:
** general it skills
:PROPERTIES:
:ID:       46c6896e-c7a4-48bb-b39c-861a13441f54
:END:
*** 1 level no reward
:PROPERTIES:
:VISIBILITY: children
:END:
**** DONE [[http://clonezilla.org][how to create OS images]]
***** чрезвычайно важно освоить сейчас, чтобы потом не было
огроменной траты времени на переустановку всей
системы
***** максимум 1час в день
:PROPERTIES:
:CREATED:  [2020-07-24 Fri 07:50]
:END:
")))
    ))
;; /my orgmode dynamic blocks


(use-package org-pomodoro
  :init
  (setq org-pomodoro-short-break-length 5
	org-pomodoro-length 15
	org-pomodoro-manual-break t
	)
  (defun my-org-pomodoro/prompt-for-worksession-duration (&optional arg)
    "docstring"
    (interactive "P")
    (if (not (org-pomodoro-active-p))
	(let* (
	   (default-minutes (list "5" "10" "15" "20" "25" "30"))
	   (default-pomodoro-duration org-pomodoro-length)
	   (chosen-duration org-pomodoro-length)
	   )
      (setq chosen-duration (string-to-number (ivy-read "enter duration: " default-minutes)))
      (setq org-pomodoro-length chosen-duration)
      (org-pomodoro arg)
      (setq org-pomodoro-length default-pomodoro-duration)
      )
      (org-pomodoro arg)
      )
    )
  )
(define-key global-map (kbd "C-c p") 'my-org-pomodoro/prompt-for-worksession-duration)


(defun my/windower-toggle-single ()
    "Un-maximize current window.
If multiple windows are active, save window configuration and
delete other windows.  If only one window is active and a window
configuration was previously save, restore that configuration."
    (interactive)
    (let*
	(
	 (number-of-dedicated-windows
	  (let*
	      (
	       (count 0)
	       )
	    (dolist
		(curwindow (window-list))
	      (if (window-dedicated-p curwindow)
		  (setq count (1+ count))
		  )
	      )
	    count
	    )
	  )
	 )
	(if (<= (- (count-windows) number-of-dedicated-windows) 1)
	(when windower--last-configuration
          (set-window-configuration windower--last-configuration))
      (setq windower--last-configuration (current-window-configuration))
      (sticky-window-delete-other-windows)))
    )
(require 'org-branch)
(org-dynamic-block-define "update-progress" 'org-dblock-write:update-progress)
