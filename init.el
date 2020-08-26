;; speeds up initialization
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))
;; /speeds up initialization

  (require 'package)
  (package-initialize)

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
     ("html" . "google-chrome")
     ("mp4" . "mpv")
     ("mp3" . "rhythmbox")
     ("ogg" . "rhythmbox")
     ("opus" . "rhythmbox")
     ("odt" . "libreoffice")
     ("doc" . "libreoffice")
     ("docx" . "libreoffice")))
 '(dired-open-functions
   '(dired-open-by-extension diredp-find-file-reuse-dir-buffer))
 '(display-time-mode t)
 '(fci-rule-color "#383838")
 '(fringe-mode 0 nil (fringe))
 '(global-auto-revert-mode-text "Synced")
 '(global-auto-revert-non-file-buffers t)
 '(global-display-line-numbers-mode t)
 '(helm-ff-lynx-style-map nil)
 '(ido-auto-merge-delay-time 0.7)
 '(inhibit-startup-screen t)
 '(initial-major-mode 'messages-buffer-mode)
 '(ivy-initial-inputs-alist
   '((counsel-minor . "^+")
     (counsel-package . "^+")
     (counsel-org-capture . "^")
     (counsel-M-x . "^")
     (counsel-describe-symbol . "^")))
 '(org-M-RET-may-split-line '((default)))
 '(org-agenda-files '("~/Sync/org/"))
 '(org-catch-invisible-edits 'error)
 '(org-complete-tags-always-offer-all-agenda-tags t)
 '(org-ctrl-k-protect-subtree 'error)
 '(org-directory "~/Sync/org/")
 '(org-habit-graph-column 0)
 '(org-insert-heading-respect-content t)
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
   '(csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(temporary-file-directory "~/org/tmp/")
 '(tool-bar-mode nil)
 '(wg-emacs-exit-save-behavior nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-symbol-face ((t (:background "dark cyan")))))
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

(add-to-list 'load-path "~/.emacs.d/dired+/")
(load "dired+")

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


(add-to-list 'load-path "~/.emacs.d/deferred/")
(require 'deferred)


(add-to-list 'load-path "~/.emacs.d/elpa/auto-minor-mode/")
;;(require 'auto-minor-mode)
;; <open .emacs quickly>
(define-key global-map (kbd "C-x i")
  (lambda () (interactive) (find-file-other-frame "~/.emacs.d/init.el")))
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
  (add-hook 'org-mode-hook '(lambda ()
   "Beautify Org Checkbox Symbol"
   (push '(":PROPERTIES:" .  "P") prettify-symbols-alist)
   (push '(":LOGBOOK:" .  "L") prettify-symbols-alist)
   (prettify-symbols-mode)))


  (defun my/copy-id-to-clipboard()
       (interactive)
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
	 (setq mytmpid (concat "id:" (funcall 'org-id-get-create)))
	 (kill-new mytmpid)
	 (message "Copied %s to killring (clipboard)" mytmpid)
       ))
  
  (setq org-return-follows-link t
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
	  ("ADHD" .           ?A)
	  (:grouptags)
	  ("" .       ?v)
	  (:endgrouptag)
	  
	  ("" .       ?p)
	  ("quantifiedself" . ?q)
	  ("NSTU" .           ?N) 
	  ("book" .           ?b)
	  
	  (:startgrouptag)
	  ("emacs" .          ?e)
	  (:grouptags)
	  ("orgmode" .        ?o)
	  ("elisp")
	  (:endgrouptag)
	       
	  (:startgrouptag)
	  ("mindset" .        ?M)
	  (:grouptags)
	  ("copingcard" .     ?c)
	  (:endgrouptag)
	       
	       
	  (:startgrouptag)
	  ("web")
	  (:grouptags)
	  ("article")
	  (:endgrouptag)
	       
	  ("music" .          ?m)
	  ("film" .           ?f)
	  )

	org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Sync/org/todos.org" "Tasks")
	   "* TODO %?")
	  ("j" "Journal" entry (file+datetree "~/Sync/org/notes.org")
	   "* %?")
	  ("i" "Idea" entry (file+datetree "~/Sync/org/notes.org")
	   "* IDEA %?")
	  ;;("d" "TEST" entry (file+datetree "~/Sync/org/notes.org")
	  ;; "* frombroser: %a" :immediate-finish t)
	  ("r" "Report" entry (file+headline "~/Sync/org/timerasp.org" "Reports")
	   "* %u\n** Действительно ли вы следовали расписанию?\n%?\n** Почему вы не следовали расписанию, над которым так долго дрочились?\n\n** Какие мысли вас преследовали?\n\n** Приложите, пожалуйста, csv-файл лога текущего дня из Boosted App\n\n** +Почему вы такой долбоеб?+ Что можно сделать, чтобы исправить ситуацию завтра?\n")
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

(setq org-board-capture-file "~/Sync/org/webarchive.org")
;; /web archiving through org-capture + org-board  
  (require 'org-download)
  :bind (:map org-mode-map
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
;;	org-caldav-inbox "~/Sync/org/inboxcal.org"
;;	org-caldav-files '("~/Sync/org/todos.org" "~/Sync/org/notes.org" "~/Sync/org/habits.org")
;;	org-icalendar-timezone "Kazakhstan/Almaty"
;;	org-icalendar-use-deadline '(event-if-not-todo event-if-todo)
;;	org-icalendar-use-scheduled '(todo-start event-if-todo )
;;	org-caldav-skip-conditions '('todo '("DONE") 'nottodo '("TODO") 'notscheduled) ;;syntax cheat sheet => org-agenda-skip-if
;;	org-caldav-debug-level 1
;;	)
;;  )
;;

;;default directory for find-file command (C-x C-f)
(setq default-directory "/home/zelenyeshtany/Sync/org/")
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
  :after (org)
  :hook (dired-mode . org-download-enable)
  :init
  (setq org-download-method 'directory)
  (setq-default org-download-image-dir "~/Sync/org/img/")
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
	 ("<tab>" . 'dired-subtree-toggle)
	 ("<f2>" . 'dired-do-rename)
	 ("X" . 'diredp-move-file)
	 ("<ret>" . 'dired-open-by-extension)
	 ("M-?" .  (lambda () (interactive) (find-file-other-window "~/Sync/org/diredhelp.org")))
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

;;(require 'ivy-rich)
(require 'ivy)
(ivy-mode 1)
;;(ivy-rich-mode 1)

(define-key global-map (kbd "C-x f") 'helm-find-files)

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
;;(setq debug-on-error 1)

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
;;      org-gcal-file-alist '(("1emonvv6qe3lm3tto7huqr8hh8@group.calendar.google.com" . "~/Sync/org/gcal.org")))
;;
(define-key global-map (kbd "C-<f1>") (lambda () (interactive)(find-file "~/Sync/org/help.org")))



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

(define-key global-map (kbd "C-x d") 'ido-dired)
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
(advice-add 'describe-function :after '(lambda (&rest args)
				    (let* (current-buffer)
				      (when (> (count-windows 1) 1)
				      (call-interactively 'other-window)
				      (setq current-buffer (buffer-name))
				      
				      (if(eq my/windows-quantity-before-call 1)
					  (delete-window)
					(previous-buffer)
				      )
				    
				      (switch-to-buffer-other-frame current-buffer)
				      )
				    )
				    )
	    )
(advice-add 'describe-variable :after '(lambda (&rest args)
				    (let* (current-buffer)
				      (when (> (count-windows 1) 1)
				      (call-interactively 'other-window)
				      (setq current-buffer (buffer-name))
				    (if(eq my/windows-quantity-before-call 1)
					(delete-window)
				      (previous-buffer)
				      )
				    (switch-to-buffer-other-frame current-buffer))))
)
(advice-add 'describe-key :after '(lambda (&rest args)
				    (let* (current-buffer)
				    (when (> (count-windows 1) 1) 
				    (call-interactively 'other-window)
				    (setq current-buffer (buffer-name))
				    (if(eq my/windows-quantity-before-call 1)
					(delete-window)
				      (previous-buffer)
				      )
				    (switch-to-buffer-other-frame current-buffer)
				    
				    )
				    )
				    )
)

(advice-add 'describe-function :before '(lambda (&rest args) (setq my/windows-quantity-before-call (count-windows 1))))
(advice-add 'describe-variable :before '(lambda (&rest args)(setq my/windows-quantity-before-call (count-windows 1))))
(advice-add 'describe-key :before '(lambda (&rest args)(setq my/windows-quantity-before-call (count-windows 1))))
(setq my/windows-quantity-before-call nil)
	    
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
  (add-to-list 'auto-minor-mode-alist '("\\.js\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]c\\(\\(ss\\)\\|\\(pp\\)\\)?\\'" . highlight-symbol-mode))
  (add-to-list 'auto-minor-mode-alist '("[.]h\\(\\(pp\\)\\|\\(tml\\)\\)?\\'" . highlight-symbol-mode))
)

(use-package counsel
  :init
 (global-set-key [remap org-set-tags-command] #'counsel-org-tag)
  (global-set-key [remap describe-function] #'counsel-describe-function)
  (global-set-key [remap describe-variable] #'counsel-describe-variable) 

  :bind (:map global-map
	      ("C-x C-b" . 'counsel-switch-buffer)
	      ("C-w" . 'counsel-imenu)
	      )
)


(define-key global-map (kbd "M-f") 'hs-toggle-hiding)
(define-key global-map (kbd "M-i") 'org-time-stamp-inactive)
(define-key global-map (kbd "M-l") 'org-insert-link)
(define-key global-map (kbd "C-b") 'helm-bookmarks)


(global-set-key [remap mouse-kill] nil)
(global-set-key [remap mouse-kill-secondary] nil)


(define-key global-map (kbd "C-x v") 'org-ql-view)



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
(defun my/org-at-source-block-p ()
  "returns non-nil if point is at source block"
(eq (org-element-type (org-element-at-point)) 'src-block)
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
(define-key global-map (kbd "C->") #'my-jump-to-next)
(define-key global-map (kbd "C-<") #'my-jump-to-prev)


