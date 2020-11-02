;; speeds up initialization
(setq gc-cons-threshold 100000000)


;; for better lsp-mode performance

;; Increase the amount of data which Emacs
;; reads from the process. Again the emacs default
;; is too low 4k considering that the some of the
;; language server responses are in 800k - 3M range
(setq read-process-output-max (* 1024 1024))
;; /for better lsp-mode performance

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
(setq my-org-from-smartphone-dir (concat my-org-directory "from-smartphone/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
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
 '(dired-open-functions
   '(dired-open-by-extension diredp-find-file-reuse-dir-buffer))
 '(diredp-hide-details-initially-flag t)
 '(display-time-mode t)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(fci-rule-color "#383838")
 '(fringe-mode 0 nil (fringe))
 '(global-auto-revert-non-file-buffers t)
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
 '(org-agenda-files (list org-directory my-org-from-smartphone-dir))
 '(org-agenda-log-mode-items '(closed clock state))
 '(org-catch-invisible-edits 'error)
 '(org-complete-tags-always-offer-all-agenda-tags t)
 '(org-ctrl-k-protect-subtree 'error)
 '(org-directory my-org-directory)
 '(org-habit-graph-column 0)
 '(org-insert-heading-respect-content t)
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame)))
 '(org-log-note-headings
   '((done . "CLOSING NOTE %t")
     (state . "State %-12s from %-12S %e")
     (note . "Note taken on %t")
     (reschedule . "Rescheduled from %S on %t")
     (delschedule . "Not scheduled, was %S on %t")
     (redeadline . "New deadline from %S on %t")
     (deldeadline . "Removed deadline, was %S on %t")
     (refile . "Refiled on %t")
     (clock-out . "")))
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
   '(lsp-pyright lsp-jedi lsp-ui emacs-ccls company-lsp org-mind-map 0blayout org-cliplink gruvbox-theme org-mru-clock org-superstar ada-mode ack wgrep-ag peg web-mode diminish loop json-mode org-ql counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
 '(safe-local-variable-values
   '((eval progn
	   (org-babel-goto-named-src-block "update-content")
	   (org-babel-execute-src-block)
	   (org-update-all-dblocks)
	   (save-buffer))
     (eval progn
	   (org-babel-goto-named-src-block "update-content")
	   (org-babel-execute-src-block)
	   (save-buffer))
     (eval progn
	   (org-babel-goto-named-src-block "update-content")
	   (org-babel-execute-src-block))
     (org-confirm-babel-evaluate)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(temporary-file-directory (concat data-folder-path "org/tmp/"))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3")))
 '(vc-annotate-very-old-color nil)
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
(load-theme 'gruvbox-dark-hard t)



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
  :custom
  (org-clock-mode-line-total 'current)
  (org-return-follows-link t)
  (org-use-speed-commands t)
  (org-use-sub-superscripts nil)
  (org-use-property-inheritance '("CLOCK_MODELINE_TOTAL"))
  (org-ellipsis "⤵")
  (org-protocol-default-template-key "d")
  (org-read-date-prefer-future 'time)
  (org-highest-priority 49)
  (org-lowest-priority 54)
  (org-default-priority 52)
  (org-log-reschedule 'time)
  (org-log-redeadline 'time)
  (org-log-done 'time)
  (org-pretty-entities 1)
  (org-startup-indented 1)
  (org-log-into-drawer "LOGBOOK")
  (org-support-shift-select 'always)
  (org-image-actual-width nil) ;; allowing images to be resized by #+attr_org atribute
  (org-todo-keywords (list "TODO(1)" "STARTED(2)" "IDEA(6)" "|" "CANCELED(3)"  "MISSED(4)" "DONE(5)"))
  (org-enforce-todo-dependencies t)
  (org-agenda-start-with-log-mode t)

  ;; time tracking
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (org-clock-persist t)
  ;; Resume clocking task on clock-in if the clock is open
  (org-clock-in-resume t)
  ;; Do not prompt to resume an active clock, just resume it
  (org-clock-persist-query-resume nil)
  ;; /time tracking

  
  (org-file-apps
   '((directory . emacs) ;; for opening folders via emacs (dired-mode)
     (auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince \"%s\"")
     ("\\.csv\\'" . "konsole -e visidata \"%s\"")))

  (org-clock-sound (concat data-folder-path "Sync/org/timer-sounds/bell.wav"))
  (org-todo-keyword-faces
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
     ))
  (org-tag-persistent-alist 
   '(
     (:startgrouptag)
     ("ADHD")
     (:grouptags)
     ("attention")
     ("forgetfulness")
     ("working_memory")
     (:endgrouptag)
     ("заторможенность")
     ("SCT")
     ("quantifiedself")
     ("NSTU")
     ("compression")
     ("podcasts")
     ("stress")
     ("постоянство")

     ("buy")
     ("nofap")
     ("nofap_success")
     ("nofap_fail")
     ("important")
     ("book")
     ("video")
     ("sobering")
     ("sleep")
     ("motivation")
     ("cpp")
     ("health")
     ("assonfire")
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
     ))
  (org-capture-templates
   '(;; ("t" "Todo" entry (file+headline todos "Tasks")
     ;;  "* TODO %?")
     ("j" "Add to inbox.org" entry (file+datetree inbox)
      "* %?")
     ("i" "Idea" entry (file+datetree inbox)
      "* IDEA %?")
     ;;("d" "TEST" entry (file+datetree (concat data-folder-path "Sync/org/notes.org"))
     ;; "* frombroser: %a" :immediate-finish t)
     ("e" "Добавить непонятное предложение на англ" entry (file+headline engl "Непонятные предложения")
      "* %?")

     ("H" "Meditations Tracker" plain (file meditations-tracker )
      (function (lambda () (interactive) (my/json-meditations meditations-tracker))) :immediate-finish t
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
     ))
  :init
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 50)(org-superstar-mode 1)))
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  ;;(add-hook 'org-after-todo-state-change-hook 'my-org-recur-finish)
  ;; (add-hook 'org-mode-hook '(lambda ()
  ;;  "Beautify Org Checkbox Symbol"
  ;;  (push '(":PROPERTIES:" .  "P") prettify-symbols-alist)
  ;;  (push '(":LOGBOOK:" .  "L") prettify-symbols-alist)
  ;;  (prettify-symbols-mode)))

  ;; redefined for custom %-escapes.
  ;; For example, 
  (defun my/org-delete-link-at-point ()
    "docstring"
    (interactive)
    (if
	(my/org-link-at-point-p)
	(delete-region (match-beginning 0) (match-end 0))
      nil
      )
    )

  (defun my/org-archive-youtube-video-at-point ()
    "docstring"
    (interactive)
    (if 
	(my/org-link-at-point-p)
	(let*
	    (
	     (download-options (list "video with audio" "only video" "only audio"))
	     (chosen-download-option
	      (ivy-read "What to download?" download-options :require-match t))
	     (video-height-list (list "144" "240" "360" "480" "720" "1080"))
	     (audio-bitrate-list (list "64" "128" "256"))
	     (link (my/org-extract-link-at-point))
	     (desc (my/org-extract-link-descr-at-point))
	     (desired-audio-bitrate 
	      (if (or
		   (string= chosen-download-option "video with audio")
		   (string= chosen-download-option "only audio")
		   )
		  (ivy-read "choose audio bitrate(at least...)" audio-bitrate-list :require-match t))
	      )
	     (video-height
	      (if
		  (or
		   (string= chosen-download-option "video with audio")
		   (string= chosen-download-option "only video")
		   )
		  (ivy-read "choose video height(at least...)" video-height-list :require-match t)
		)
	      )
	     (video-id nil)
	     (filename-with-extension nil)
	     (filepath-without-file-extension nil)
	     (filepath-with-extension nil)
	     (downloaded-file-audio-bitrate nil)
	     )
	  
	  (if (string-match "youtube.com" link)
	      (let* ()
		(cond
		 ((string= chosen-download-option "video with audio")
		  (shell-command-to-string
		   (concat
		    "youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en -f 'worstvideo[height>="
		    video-height
		    "]+worstaudio[abr>="
		    desired-audio-bitrate 
		    "]' -o '/org/video/%(title)s-%(id)s.%(ext)s' "
		    link))

		  )
		 ((string= chosen-download-option "only audio")
		  (shell-command-to-string
		   (concat
		    ;;"youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en --extract-audio --audio-format 'mp3' -f 'worstaudio[abr>="
		    "youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en -f 'worstaudio[abr>="
		    desired-audio-bitrate 
		    "]' -o '/org/video/%(title)s-%(id)s.%(ext)s' "
		    link))
		  )
		 ((string= chosen-download-option "only video")
		  (shell-command-to-string
		   (concat
		    "youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en -f 'worstvideo[height>="
		    video-height
		    "]' -o '/org/video/%(title)s-%(id)s.%(ext)s' "
		    link))
		  ;; ;;test
		  ;; (start-process-shell-command "youtube-dl" nil (concat
		  ;; 		    "youtube-dl --embed-subs --write-sub --sub-lang en -f 'worstvideo[height>="
		  ;; 		    "144"
		  ;; 		    "]' -o '/org/video/%(title)s-%(id)s.%(ext)s' "
		  ;; 		    "https://www.youtube.com/watch?v=APhhHCBI8xc"))
		  ;; ;;/test

		  )
		 )
		(my/org-delete-link-at-point)
		;; find file title within shell output buffer, assign to a variable

		;; i dont know exactly what file extension will be after all, so i save only file title
		(setq video-id (shell-command-to-string
				(concat
				 "youtube-dl --get-id "
				 link
				 )))
		;;erasing new-line character at the end
		(setq video-id (substring video-id 0
					  (- (length video-id) 1)))
		;; searching file
		(save-window-excursion
		  (save-excursion
		    
		    (while (progn
			     (dired "/org/video/")
			     (revert-buffer)
			     (goto-char (point-min))
			     (message "%s" (buffer-substring-no-properties (point-min) (point-max)))
			     ;;(find-lisp-find-dired "." video-id)
			     (message "searchin for '%s'" video-id)
			     
			     (eq (search-forward-regexp video-id (point-max)
							t)
				 nil)
			     )
		      (message "waiting... %s" (buffer-name))
		      (sleep-for 1)
		      )
		    ;; (goto-char (match-beginning 0))
		    (setq filepath-with-extension (dired-get-filename))
		    )
		  )

		;; find file with title and create org-link at point with to this file 
		(org-insert-link nil (concat "file:" filepath-with-extension))
		;;(kill-buffer shell-command-buffer-name)
		)
	    )
	  )
      )
    )

  (defun my/org-extract-link-descr-at-point ()
    "docstring"
    (interactive)
    (if (not(eq (org-in-regexp org-link-bracket-re 1) nil))
	(match-string-no-properties 2)
      nil
      )
    )

  (defun my/org-extract-link-at-point ()
    "docstring"
    (interactive)
    (if (not(eq (org-in-regexp org-link-bracket-re 1) nil))
	(match-string-no-properties 1)
      nil
      )
    )

  (defun my/org-link-at-point-p ()
    "Returns non-nil if point is on a orgmode link
Взял строчку `(org-in-regexp org-link-bracket-re 1)' из функции `org-insert-link'"
    (if (not(eq (org-in-regexp org-link-bracket-re 1) nil))
	(progn
	  (message "%s" (match-string-no-properties 1))
	  t)
      nil
      )
    )

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

  (defun my/toggle-org-columns ()
    "docstring"
    (interactive)

    (if (and (boundp 'org-columns-current-fmt)
	     (not (eq org-columns-current-fmt nil))
	     )
	(org-columns-quit)
      (org-columns)
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

  (defun my/org-clock-in (arg)
    "Clocks into a task at point if in org-mode, 
or calls a menu of last clocked tasks to choose"
    (interactive "P")
    (if (derived-mode-p 'org-mode)
	(org-clock-in)
      (org-clock-in '(4))
      )
    )
  
  (defun my/copy-id-to-clipboard()
    (interactive)
    (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
      (setq mytmpid (concat "id:" (funcall 'org-id-get-create)))
      (kill-new mytmpid)
      (message "Copied %s to killring (clipboard)" mytmpid)
      ))

  ;; time tracking
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;; /time tracking
  (setq
   engl (concat data-folder-path "Sync/org/engl.org")
   inbox (concat data-folder-path "Sync/org/inbox.org")
   notes (concat data-folder-path "Sync/org/notes.org")
   regular (concat data-folder-path "Sync/org/regular.org")
   todos (concat data-folder-path "Sync/org/todos.org")
   timerasp (concat data-folder-path "Sync/org/timerasp.org")
   poor-man-cbt (concat data-folder-path "Sync/tables/poor-man-CBT/data.json")
   english-tracker (concat data-folder-path "Sync/tables/english tracker/data.json")
   migraines-tracker (concat data-folder-path "Sync/tables/migraines/data.json")
   meditations-tracker (concat data-folder-path "Sync/tables/meditations/2020/data.json")
   exercise-tracker (concat data-folder-path "Sync/tables/exercises tracker/2020/data.json")
   sleepdiary (concat data-folder-path "Sync/tables/sleep diary/2020/data.json"))

  ;; web archiving through org-capture + org-board
  (defun do-org-board-dl-hook ()
    (when (equal (buffer-name) "CAPTURE-webarchive.org")
      (org-board-archive)))

  (add-hook 'org-capture-before-finalize-hook 'do-org-board-dl-hook)

  (setq org-board-capture-file (concat data-folder-path "Sync/org/webarchive.org"))
  ;; /web archiving through org-capture + org-board  
  ;;(require 'org-download)
  ;;(require 'my-week-day-based-habits)
  :bind (:map org-mode-map
	      ("M-a" . 'my/org-archive-youtube-video-at-point)
	      ("C-c f" . 'org-search-view)
	      ("C-c C-x C-c" . 'my/toggle-org-columns)
	      ;;("C-c C-x C-i" . 'my/org-clock-in)
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
	      ;;("C-c C-x C-i" . 'my/org-clock-in)
	      ("C-c f" . 'org-search-view)
	      ("C-c C-x C-o" . 'org-clock-out)
	      ("C-c C-x C-q" . 'org-clock-cancel)
	      ("C-c j" . (lambda () (interactive) (org-capture nil "j")))
	      ("C-c i" . (lambda () (interactive) (org-capture nil "i")))
	      ("C-c x" . (lambda () (interactive) (org-capture nil "t")))
	      )
  :config
  (defun org-store-log-note ()
    "Finish taking a log note, and insert it to where it belongs.
ATTENTION
This is redefined version of this function. I've redefined it for custom %-escapes.
My custom %-escapes:
%e - previous SCHEDULED timestamp, format: '[%Y-%m-%d]'
"
    (let ((txt (prog1 (buffer-string)
		 (kill-buffer)))
	  (note (cdr (assq org-log-note-purpose org-log-note-headings)))
	  lines)
      (while (string-match "\\`# .*\n[ \t\n]*" txt)
	(setq txt (replace-match "" t t txt)))
      (when (string-match "\\s-+\\'" txt)
	(setq txt (replace-match "" t t txt)))
      (setq lines (and (not (equal "" txt)) (org-split-string txt "\n")))
      (when (org-string-nw-p note)
	(setq note
	      (org-replace-escapes
	       note
	       (list
		(cons "%e" (if (not my/org-previous-scheduled-time) (org-format-time-string "[%Y-%m-%d]" (org-get-scheduled-time (point)))
			     my/org-previous-scheduled-time
			     ))
		(cons "%u" (user-login-name))
		(cons "%U" user-full-name)
		(cons "%t" (format-time-string
			    (org-time-stamp-format 'long 'inactive)
			    org-log-note-effective-time))
		(cons "%T" (format-time-string
			    (org-time-stamp-format 'long nil)
			    org-log-note-effective-time))
		(cons "%d" (format-time-string
			    (org-time-stamp-format nil 'inactive)
			    org-log-note-effective-time))
		(cons "%D" (format-time-string
			    (org-time-stamp-format nil nil)
			    org-log-note-effective-time))
		(cons "%s" (cond
			    ((not org-log-note-state) "")
			    ((string-match-p org-ts-regexp
					     org-log-note-state)
			     (format "\"[%s]\""
				     (substring org-log-note-state 1 -1)))
			    (t (format "\"%s\"" org-log-note-state))))
		(cons "%S"
		      (cond
		       ((not org-log-note-previous-state) "")
		       ((string-match-p org-ts-regexp
					org-log-note-previous-state)
			(format "\"[%s]\""
				(substring
				 org-log-note-previous-state 1 -1)))
		       (t (format "\"%s\""
				  org-log-note-previous-state)))))))
	(when lines (setq note (concat note " \\\\")))
	(push note lines))
      (when (and lines (not org-note-abort))
	(with-current-buffer (marker-buffer org-log-note-marker)
	  (org-with-wide-buffer
	   ;; Find location for the new note.
	   (goto-char org-log-note-marker)
	   (set-marker org-log-note-marker nil)
	   ;; Note associated to a clock is to be located right after
	   ;; the clock.  Do not move point.
	   (unless (eq org-log-note-purpose 'clock-out)
	     (goto-char (org-log-beginning t)))
	   ;; Make sure point is at the beginning of an empty line.
	   (cond ((not (bolp)) (let ((inhibit-read-only t)) (insert "\n")))
		 ((looking-at "[ \t]*\\S-") (save-excursion (insert "\n"))))
	   ;; In an existing list, add a new item at the top level.
	   ;; Otherwise, indent line like a regular one.
	   (let ((itemp (org-in-item-p)))
	     (if itemp
		 (indent-line-to
		  (let ((struct (save-excursion
				  (goto-char itemp) (org-list-struct))))
		    (org-list-get-ind (org-list-get-top-point struct) struct)))
	       (org-indent-line)))
	   (insert (org-list-bullet-string "-") (pop lines))
	   (let ((ind (org-list-item-body-column (line-beginning-position))))
	     (dolist (line lines)
	       (insert "\n")
	       (indent-line-to ind)
	       (insert line)))
	   (message "Note stored")
	   (org-back-to-heading t))
	  ;; Fix `buffer-undo-list' when `org-store-log-note' is called
	  ;; from within `org-add-log-note' because `buffer-undo-list'
	  ;; is then modified outside of `org-with-remote-undo'.
	  (when (eq this-command 'org-agenda-todo)
	    (setcdr buffer-undo-list (cddr buffer-undo-list))))))
    ;; Don't add undo information when called from `org-agenda-todo'.
    (let ((buffer-undo-list (eq this-command 'org-agenda-todo)))
      (set-window-configuration org-log-note-window-configuration)
      (with-current-buffer (marker-buffer org-log-note-return-to)
	(goto-char org-log-note-return-to))
      (move-marker org-log-note-return-to nil)
      (when org-log-post-message (message "%s" org-log-post-message))))
  (org-add-link-type
   "tag" 'endless/follow-tag-link)

  (defun endless/follow-tag-link (tag)
    "Display a list of TODO headlines with tag TAG.
With prefix argument, also display headlines without a TODO keyword."
    (org-tags-view (null current-prefix-arg) tag))

  (setq my/org-previous-scheduled-time nil)
  (defun my/org-set-previous-scheduled-time (&rest args)
    "Remembers previous scheduled
time into `my/org-previous-scheduled-time'
as a inactive timestamp string '[%Y-%m-%d]'"
    (interactive "P")
    (setq my/org-previous-scheduled-time (org-format-time-string "[%Y-%m-%d]" (org-get-scheduled-time (point))))
    )
  (advice-add 'org-schedule :before 'my/org-set-previous-scheduled-time)
  (advice-add 'org-todo :before 'my/org-set-previous-scheduled-time)

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

(use-package my-week-day-based-habits
  :requires (org)
  )

;;<org-download - drag-n-drop images>
;; Drag-and-drop to `dired`
(use-package org-download
  :requires (org)
  :hook (dired-mode . org-download-enable)
  :bind (:map global-map
	 ("C-x p" . #'org-download-screenshot)
	 )
  :init
  (setq org-download-method 'directory)
  (setq-default org-download-image-dir (concat data-folder-path "Sync/org/img/"))
  :config
  (defun my/org-download-annotate (link)
  "Annotate LINK with the time of download."
  (format "#+DOWNLOADED: %s @ %s\n#+ATTR_ORG: :width 100\n"
          (if (equal link org-download-screenshot-file)
              "screenshot"
            link)
          (format-time-string "%Y-%m-%d %H:%M:%S")))
  (setq org-download-annotate-function #'my/org-download-annotate)
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
;; (with-eval-after-load "org-agenda"
;; (define-key org-agenda-mode-map (kbd "r") 'org-agenda-todo)
;; (define-key org-agenda-mode-map (kbd "t") 'counsel-org-tag-agenda)
;; (define-key org-agenda-mode-map (kbd "C-r") 'org-agenda-redo-all)
;; (define-key org-agenda-mode-map (kbd "e") 'org-agenda-redo)
;; )

(use-package org-agenda
  :requires (org)
  :bind (:map org-agenda-mode-map
	 ("r" . 'org-agenda-todo)
	 ("t" . 'counsel-org-tag-agenda)
	 ("C-r" . 'org-agenda-redo-all)
	 ("e" . 'org-agenda-redo)
	 ("C-c n" . 'org-agenda-add-note)
	 )
  )



;; telegram

;; (use-package dired
;;   :hook (dired-load . (lambda () (load "dired-x") (define-key dired-mode-map (kbd "C-c") 'dired-do-copy)))
;;   :bind (:map dired-mode-map
;; 	 ("C-c" . 'dired-do-copy)
;; 	 )
;;   )

;; /telegram


(use-package dired-open
  :after (dired)
  :custom
  (dired-open-extensions
	'(("pdf" . "evince")
	  ("csv" . "konsole -e visidata")
	  ("html" . "google-chrome")
	  ("mp4" . "mpv")
	  ("avi" . "mpv")
	  ("webm" . "mpv")
	  ("mp3" . "clementine")
	  ("ogg" . "clementine")
	  ("opus" . "clementine")
	  ("odt" . "libreoffice")
	  ("doc" . "libreoffice")
	  ("docx" . "libreoffice")))
  )
(use-package dired-x
  :after (dired)
  )
(use-package dired
  ;; :hook (dired-load . (lambda ()
  ;; 			(require 'dired-x)
  ;; 			))
  :init
  (setq
   dired-listing-switches "-alh" ;; human-readable file sizes
   )
  
  :bind (:map dired-mode-map
	      ("C-S-n" . 'dired-create-directory)
	      ("<f1>" . 'my-help)
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
  ;; (setq dired-guess-shell-alist-user '(
  ;; 				     ("\\.pdf\\'" "evince")
  ;; 				     ("\\.mp4\\'" "mpv")
  ;; 				     ("\\.mkv\\'" "mpv")
  ;; 				     ("\\.avi\\'" "mpv")
  ;; 				     ("\\.webm\\'" "mpv")
  ;; 				     ))
  ;;(setq dired-dwim-target t)
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
;; (use-package elpy
;;   :ensure t
;;   :defer t
;;   :init
;;   (highlight-indentation-mode 0)
;;   (advice-add 'python-mode :before 'elpy-enable)
;;   (setq elpy-rpc-backend "jedi") 
;;   :bind (:map elpy-mode-map
;; 	      ("M-<up>" . 'bm-previous)
;; 	      ("M-<down>" . 'bm-next)
;; 	      ("C-j d" . 'elpy-goto-definition)
;; 	      ("C-j a" . 'elpy-goto-assignment)
;; 	      ("M-f" . 'elpy-folding-toggle-at-point)
;; 	      ("C-<down>" . 'forward-paragraph)
;; 	      ("C-<up>" . 'backward-paragraph)
;; 	      ("<f2>" . 'elpy-multiedit-python-symbol-at-point)
;; 	      )

;;   )


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


(define-key global-map (kbd "M-j") #'avy-goto-char-2)

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

;; /my orgmode dynamic blocks


;; (use-package org-pomodoro
;;   :init
;;   (setq org-pomodoro-short-break-length 5
;; 	org-pomodoro-length 15
;; 	org-pomodoro-manual-break t
;; 	)
;;   (defun my-org-pomodoro/prompt-for-worksession-duration (&optional arg)
;;     "docstring"
;;     (interactive "P")
;;     (if (not (org-pomodoro-active-p))
;; 	(let* (
;; 	   (default-minutes (list "5" "10" "15" "20" "25" "30"))
;; 	   (default-pomodoro-duration org-pomodoro-length)
;; 	   (chosen-duration org-pomodoro-length)
;; 	   )
;;       (setq chosen-duration (string-to-number (ivy-read "enter duration: " default-minutes)))
;;       (setq org-pomodoro-length chosen-duration)
;;       (org-pomodoro arg)
;;       (setq org-pomodoro-length default-pomodoro-duration)
;;       )
;;       (org-pomodoro arg)
;;       )
;;     )
;;   )
;;(define-key global-map (kbd "C-c p") 'my-org-pomodoro/prompt-for-worksession-duration)


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
;;(org-dynamic-block-define "update-progress" 'org-dblock-write:update-progress)


(defun my/create-tmp-buffer ()
  "docstring"
  (interactive)

  (let* (
	 (files (list "/data/Sync/org/atomoxetine_research.org"))
	 (tmpbuf nil)
	 )
    (save-excursion
      (find-file "/data/Sync/org/atomoxetine_research.org")
      (when (buffer-narrowed-p) (widen) )
      (goto-char (point-min))
      (if
	  ;;(buffer-substring (line-beginning-position)(line-end-position))
	  (if
	   (string-match "[0-9]" (org-element-property :title (org-element-at-point))))
	  
	  )
      
   x )
  
    )
  )


(define-key org-agenda-mode-map (kbd "C-<down>") 'org-agenda-later)
(define-key org-agenda-mode-map (kbd "C-<up>") 'org-agenda-earlier)
;;(add-hook 'org-timer-done-hook ')

(global-so-long-mode);; for long-line files performance improvement

;; showing that window is dedicated in the modeline
;; (setq mode-line-misc-info
;;       (cons '(:eval (if (window-dedicated-p) "DEDICATED" "NOT-DEDICATED")) mode-line-misc-info))
;;(push "TEST" global-mode-string)

;; time tracking
(use-package org-mru-clock
  :ensure t
  ;;:defer t
  :bind (
	 :map org-mode-map
	 ("C-c C-x C-i" . 'org-mru-clock-in)
	 :map global-map
	 ("C-c C-x C-i" . 'org-mru-clock-in)
	 )
  :commands (org-mru-clock-in org-mru-clock-select-recent-task)
  :config
  (setq org-mru-clock-how-many 50
        ;;;;;;;;;;;;;; Also possible: #'ido-completing-read
        org-mru-clock-completing-read #'ivy-completing-read))
;; /time tracking


;; NEW
;;(org-format-time-string "[%Y-%m-%d]" (org-get-scheduled-time (point)))
;;(parse-time-string (org-entry-get nil "SCHEDULED"))
;;(parse-time-string (org-get-scheduled-time nil))
;; /NEW
;; (setq myal (state . (concat "State %-12s from %-12S "
;; 			    (org-format-time-string "[%Y-%m-%d]" (org-get-scheduled-time (point)))
;; 			    )
;; 		  ))

      ;;org-add-log-setup for custom org-add-note
;; (use-package org-roam
;;   ;;:ensure t
;;   :hook
;;   (after-init . org-roam-mode)
;;   :custom
;;   (org-roam-directory "/org/roam")
;;   :bind (:map org-roam-mode-map
;; 	      ("C-c r" . org-roam)
;; 	      ("C-c s" . org-roam-find-file)
;; 	      ;;("C-c g" . org-roam-graph)
;; 	      :map org-mode-map
;; 	      ("C-c l" . org-roam-insert)
;; 	      ("C-c I" . org-roam-insert-immediate)
;; 	      )
;;   )

;; This is an Emacs package that creates graphviz directed graphs from
;; the headings of an org file
(use-package org-mind-map
  :init
  (require 'ox-org)
  :ensure t
  ;; Uncomment the below if 'ensure-system-packages` is installed
  ;;:ensure-system-package (gvgen . graphviz)
  :bind (
	 :map org-mode-map
	      ("C-c g" . org-mind-map-write)
	      )
  
  :config
  (setq org-mind-map-engine "dot"
	org-mind-map-include-text t
	)       ; Default. Directed Graph
  ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
  ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
  ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
  ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
  ;; (setq org-mind-map-engine "twopi")  ; Radial layouts
  ;; (setq org-mind-map-engine "circo")  ; Circular Layout
  )




;; (defun my/eval-and-insert()
;;   "docstring"
;;   (interactive)
;;   (let*
;;       (
;;        (beg (nth 2 (show-paren--default)))
;;        (end (point))
;;        (sexp (buffer-substring-no-properties beg end))
;;        )
      
;;     ;;(my/mark-sexp)
    
;;   (kill-region beg end)
;;   (insert (eval-expression sexp))
;;   )
;;   )

(define-key global-map (kbd "C-x C-e") 'eval-print-last-sexp)
(define-key global-map (kbd "C-c v") 'org-ql-view)
;; tiny(abo-abo)
;; quickly insert text at point
(use-package tiny
  :config
  (tiny-setup-default)
  )
;; /tiny

(use-package proced
    :commands (proced proced-toggle-auto-update)
    :bind (:map global-map
		("C-S-<escape>" . 'proced)
	   )
    :config
    (progn
      ;;(setq proced-auto-update-interval 2)

      (defun alexm/proced-settings ()
        (proced-toggle-auto-update t))

      (add-hook 'proced-mode-hook 'alexm/proced-settings)))


;; orgmode autom completion
(defun add-pcomplete-to-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(add-hook 'org-mode-hook #'add-pcomplete-to-capf)


(add-to-list 'load-path "~/.emacs.d/org-pandoc-import/")
(use-package org-pandoc-import)

;; (use-package pdf-tools
;;   :init
;;   (require 'pdf-sel)
;;   :config
;;   (pdf-tools-install);; Alternatively, and if you care about start-up time, you may want to use (pdf-loader-install)
;;   (setq pdf-annot-activate-created-annotations t)
;;   ;; select word by double click
;;   (add-hook 'pdf-view-mode-hook 'pdf-sel-mode)
;;   ;; /select word by double click
;;   :custom
;;   (pdf-tools-enabled-modes
;;    '(pdf-history-minor-mode pdf-isearch-minor-mode pdf-links-minor-mode pdf-misc-minor-mode pdf-outline-minor-mode pdf-misc-size-indication-minor-mode pdf-misc-menu-bar-minor-mode pdf-annot-minor-mode pdf-misc-context-menu-minor-mode pdf-cache-prefetch-minor-mode pdf-occur-global-minor-mode))
   
;;    )

;; play sound every n second while clocking in
(defun my/sound-while-clocking-in ()
  "docstring"
  ;;(interactive)
  ;;(run-with-timer 0 (* 30 60) 'recentf-save-list)
  ;;(play-sound-file "/org/timer-sounds/bell.wav")
  ;;
  ;;org-clock-clocking-in
  (setq my/clocking-in-timer
	;; run with 3 seconds delay at start and repeat every 30secs
	(run-with-timer 3 30
			;;'play-sound-file "/org/timer-sounds/bell.wav" ;; archive
			'shell-command-to-string "for i in `seq 1 3`; do
    beep -f 3000 -d 20 -l 80
done"
			)

	)
  )
(defun my/delete-clocking-in-timer ()
  "docstring"
  ;;(interactive)
  (cancel-timer my/clocking-in-timer)
  )
(add-hook 'org-clock-in-hook 'my/sound-while-clocking-in)
(add-hook 'org-clock-out-hook 'my/delete-clocking-in-timer)
;; /play sound every n second while clocking in


(setq visible-bell t)


;; LSP-MODE
;; (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
;;     projectile hydra flycheck company avy which-key helm-xref dap-mode))

;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
;;   (package-refresh-contents)
;;   (mapc #'package-install package-selected-packages))

;; ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
;; (helm-mode)
;; (require 'helm-xref)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

;; (which-key-mode)
;; (add-hook 'c-mode-hook 'lsp)
;; (add-hook 'cpp-mode-hook 'lsp)

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;;       company-idle-delay 0.0
;;       company-minimum-prefix-length 1
;;       lsp-idle-delay 0.1 ;; clangd is fast
;;       ;; be more ide-ish
;;       lsp-headerline-breadcrumb-enable t)

;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (require 'dap-cpptools)
;;   (yas-global-mode))
;; /LSP-MODE


;; LSP NEW
(add-to-list 'load-path "~/.emacs.d/emacs-ccls/")

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

;; To defer LSP server startup (and DidOpen notifications)
;; until the buffer is visible you can use lsp-deferred instead of lsp
(use-package lsp-mode
  :hook (
	 ((python-mode c++-mode c-mode) . lsp-deferred)
	 )
    :commands (lsp lsp-deferred))

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
(use-package company-lsp
:ensure t
)

(use-package ccls
  :init
  (setq ccls-executable "/usr/local/bin/ccls")
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp)
	   (add-to-list 'lsp-enabled-clients 'ccls)
	   ))
  )
;; (use-package lsp-jedi ;; python
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))

;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           ;;(lsp); or lsp-deferred
;; 			  (lsp-deferred)
;; 			  (add-to-list 'lsp-enabled-clients 'pyright)
;; 			  )))
;; LSP NEW
(add-hook
 'org-after-todo-state-change-hook
 #'(lambda () (interactive)
     (if
	 (and
	  ;; id of meditation habit headline
	  (string= (org-entry-get nil "id") "45540784-a689-4f67-87ae-fb015f30c651")
	  
	  (or
	   (string= (org-element-property :todo-keyword (org-element-at-point)) "MISSED")
	   (string= (org-element-property :todo-keyword (org-element-at-point)) "DONE")))
	 (my/json-meditations meditations-tracker))))
