

(require 'package)
;;(package-initialize)

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
(defun my/phone-p ()
  (and (equal (system-name) "localhost") 
       (not (equal user-login-name "zelenyeshtany"))))
(setq bookmark-file
      (cond
       ((my/phone-p) "~/.emacs.d/bookmark-android")
       ((eq system-type 'gnu/linux) "~/.emacs.d/bookmark-linux")
       ((eq system-type 'windows-nt) "~/.emacs.d/bookmark-win")
       )
      )

(setq data-folder-path
      (cond
       ((my/phone-p) "~/storage/shared/")
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
   '(ggtags lsp-pyright lsp-jedi lsp-ui emacs-ccls company-lsp org-mind-map 0blayout org-cliplink gruvbox-theme org-mru-clock org-superstar ada-mode ack wgrep-ag peg web-mode diminish loop json-mode org-ql counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
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
 '(temporary-file-directory
   (if
       (my/phone-p)
       (concat data-folder-path "emacs-tmp/")
     (concat data-folder-path "org/tmp/")))
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
(require 'org)
(org-babel-load-file
 (expand-file-name "org-babel-init.org"
                   user-emacs-directory))
