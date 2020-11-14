
;;(require 'package)
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

(require 'package)
;;benchmarking
  ;; won't work
    ;; (add-to-list 'load-path "~/.emacs.d/elpa/benchmark-init-20150905.938")
    ;; (require 'benchmark-init)
    ;; To disable collection of benchmark data after init is done.
    ;;(add-hook 'after-init-hook 'benchmark-init/deactivate)

(add-to-list 'load-path "~/.emacs.d/elpa/esup-20200814.1400")
(require 'esup)
;;/ benchmarking

(add-to-list 'load-path "~/.emacs.d/elpa/use-package-20200629.1856")
(add-to-list 'load-path "~/.emacs.d/mypack/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")

(add-to-list 'load-path "~/.emacs.d/elpa/tree-mode-20151104.1331")
(add-to-list 'load-path "~/.emacs.d/elpa/bind-key-20191110.416")
(add-to-list 'load-path "~/.emacs.d/elpa/elfeed-20200910.239")
(add-to-list 'load-path "~/.emacs.d/elpa/0blayout-20190703.527")
(add-to-list 'load-path "~/.emacs.d/elpa/ace-window-20200606.1259")
(add-to-list 'load-path "~/.emacs.d/elpa/ack-1.10")
(add-to-list 'load-path "~/.emacs.d/elpa/ack-1.10.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/ada-mode-7.1.4")
(add-to-list 'load-path "~/.emacs.d/elpa/ada-mode-7.1.4.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/afternoon-theme-20140104.1859")
(add-to-list 'load-path "~/.emacs.d/elpa/ag-20190726.9")
(add-to-list 'load-path "~/.emacs.d/elpa/alert-20200303.2118")
;;(add-to-list 'load-path "~/.emacs.d/elpa/anaphora")
(add-to-list 'load-path "~/.emacs.d/elpa/archives")
(add-to-list 'load-path "~/.emacs.d/elpa/async-20200113.1745")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-minor-mode")
(add-to-list 'load-path "~/.emacs.d/elpa/autothemer-20180920.923")
(add-to-list 'load-path "~/.emacs.d/elpa/avy-20200624.1148")
(add-to-list 'load-path "~/.emacs.d/elpa/beacon-1.3.3")
(add-to-list 'load-path "~/.emacs.d/elpa/beacon-1.3.3.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/blimp-20180903.2240")
(add-to-list 'load-path "~/.emacs.d/elpa/bm-20190807.1217")
(add-to-list 'load-path "~/.emacs.d/elpa/bui-20200426.2219")
(add-to-list 'load-path "~/.emacs.d/elpa/command-log-mode-20160413.447")
(add-to-list 'load-path "~/.emacs.d/elpa/company-20200831.2016")
(add-to-list 'load-path "~/.emacs.d/elpa/company-lsp-20190612.1553")
(add-to-list 'load-path "~/.emacs.d/elpa/counsel-20200706.1447")
(add-to-list 'load-path "~/.emacs.d/elpa/counsel-ffdata-20191017.1237")
(add-to-list 'load-path "~/.emacs.d/elpa/csv-mode-1.12")
(add-to-list 'load-path "~/.emacs.d/elpa/csv-mode-1.12.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/cyberpunk-theme-20200601.1632")
(add-to-list 'load-path "~/.emacs.d/elpa/dap-mode-20201024.2233")
(add-to-list 'load-path "~/.emacs.d/elpa/dark-krystal-theme-20170808.1300")
(add-to-list 'load-path "~/.emacs.d/elpa/dash-20200524.1947")
(add-to-list 'load-path "~/.emacs.d/elpa/dash-functional-20200617.702")
(add-to-list 'load-path "~/.emacs.d/elpa/diminish-20191127.1326")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-avfs-20161012.1104")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-du-0.5.2")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-du-0.5.2.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-filter-20191105.1404")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-hacks-utils-20190522.950")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-launch-20200430.1625")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-open-20180922.1113")
(add-to-list 'load-path "~/.emacs.d/elpa/dired-subtree-20180922.1615")
;;(add-to-list 'load-path "~/.emacs.d/elpa/dumb-jump-20200730.1839")
(add-to-list 'load-path "~/.emacs.d/elpa/eimp-20120826.2039")
(add-to-list 'load-path "~/.emacs.d/elpa/elpy-20200805.1736")
(add-to-list 'load-path "~/.emacs.d/elpa/emacsql-20200714.28")
(add-to-list 'load-path "~/.emacs.d/elpa/emacsql-sqlite-20190727.1710")
(add-to-list 'load-path "~/.emacs.d/elpa/emacsql-sqlite3-20200914.508")
(add-to-list 'load-path "~/.emacs.d/elpa/epl-20180205.2049")
(add-to-list 'load-path "~/.emacs.d/elpa/esxml-20171129.807")
(add-to-list 'load-path "~/.emacs.d/elpa/f-20191110.1357")
(add-to-list 'load-path "~/.emacs.d/elpa/flycheck-20201023.1716")
(add-to-list 'load-path "~/.emacs.d/elpa/ggtags-20190320.2208")
(add-to-list 'load-path "~/.emacs.d/elpa/git-commit-20200828.1753")
(add-to-list 'load-path "~/.emacs.d/elpa/gntp-20141025.250")
(add-to-list 'load-path "~/.emacs.d/elpa/gnupg")
(add-to-list 'load-path "~/.emacs.d/elpa/gruvbox-theme-20200807.855")
(add-to-list 'load-path "~/.emacs.d/elpa/hamburg-theme-20160123.740")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-20200719.557")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-core-20200718.741")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-lsp-20200910.518")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-org-20200311.633")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-smex-20171004.2008")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-swoop-20200515.417")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-xref-20201004.1817")
(add-to-list 'load-path "~/.emacs.d/elpa/highlight-indentation-20181204.839")
(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol-20160102.2009")
(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol.el")
(add-to-list 'load-path "~/.emacs.d/elpa/ht-20200217.2331")
(add-to-list 'load-path "~/.emacs.d/elpa/hydra-20200711.1210")
(add-to-list 'load-path "~/.emacs.d/elpa/ido-vertical-mode-20180618.2101")
(add-to-list 'load-path "~/.emacs.d/elpa/ivy-20200624.1140")
(add-to-list 'load-path "~/.emacs.d/elpa/ivy-rich-20200601.104")
(add-to-list 'load-path "~/.emacs.d/elpa/js2-highlight-vars-20170418.1829")
(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode-20200725.112")
(add-to-list 'load-path "~/.emacs.d/elpa/json-mode-20190123.422")
(add-to-list 'load-path "~/.emacs.d/elpa/json-reformat-20160212.853")
(add-to-list 'load-path "~/.emacs.d/elpa/json-snatcher-20150512.347")
(add-to-list 'load-path "~/.emacs.d/elpa/light-soap-theme-20150607.1445")
(add-to-list 'load-path "~/.emacs.d/elpa/log4e-20200420.745")
(add-to-list 'load-path "~/.emacs.d/elpa/loop-20160813.1407")
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-jedi-20200812.1826")
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-mode-20201029.2131")
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-pyright-20201014.1620")
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-treemacs-20201025.950")
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-ui-20201024.2307")
(add-to-list 'load-path "~/.emacs.d/elpa/lv-20200507.1518")
(add-to-list 'load-path "~/.emacs.d/elpa/magit-20200902.353")
(add-to-list 'load-path "~/.emacs.d/elpa/map-2.1")
(add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode+-20170320.2104")
(add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode-20200724.633")
(add-to-list 'load-path "~/.emacs.d/elpa/memoize-20200103.2036")
(add-to-list 'load-path "~/.emacs.d/elpa/mermaid-mode-20200702.1909")
(add-to-list 'load-path "~/.emacs.d/elpa/modus-vivendi-theme-20200718.1456")
(add-to-list 'load-path "~/.emacs.d/elpa/multiple-cursors-20191210.1759")
(add-to-list 'load-path "~/.emacs.d/elpa/ob-mermaid-20200320.1504")
(add-to-list 'load-path "~/.emacs.d/elpa/org-9.3.6")
(add-to-list 'load-path "~/.emacs.d/elpa/org-board-20200619.1016")
(add-to-list 'load-path "~/.emacs.d/elpa/org-brain-20200625.2050")
(add-to-list 'load-path "~/.emacs.d/elpa/org-cliplink-20190608.2134")
(add-to-list 'load-path "~/.emacs.d/elpa/org-download-20200615.936")
(add-to-list 'load-path "~/.emacs.d/elpa/org-mind-map-20180826.2340")
(add-to-list 'load-path "~/.emacs.d/elpa/org-mru-clock-20200930.819")
(add-to-list 'load-path "~/.emacs.d/elpa/org-ql-20200713.909")
(add-to-list 'load-path "~/.emacs.d/elpa/org-roam-20201005.1902")
(add-to-list 'load-path "~/.emacs.d/elpa/org-super-agenda-20200310.1337")
(add-to-list 'load-path "~/.emacs.d/elpa/org-superstar-20200818.2257")
(add-to-list 'load-path "~/.emacs.d/elpa/org-timeline-20190612.1759")
(add-to-list 'load-path "~/.emacs.d/elpa/ov-20200326.1042")
(add-to-list 'load-path "~/.emacs.d/elpa/page-break-lines-20200305.244")
(add-to-list 'load-path "~/.emacs.d/elpa/pdf-tools-20200512.1524")
(add-to-list 'load-path "~/.emacs.d/elpa/peg-1.0")
(add-to-list 'load-path "~/.emacs.d/elpa/peg-1.0.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/persist-0.4")
(add-to-list 'load-path "~/.emacs.d/elpa/persist-0.4.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/pfuture-20200425.1357")
(add-to-list 'load-path "~/.emacs.d/elpa/pkg-info-20150517.1143")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20200610.317")
(add-to-list 'load-path "~/.emacs.d/elpa/posframe-20201026.716")
(add-to-list 'load-path "~/.emacs.d/elpa/pos-tip-20191227.1356")
(add-to-list 'load-path "~/.emacs.d/elpa/powerline-20200817.1321")
(add-to-list 'load-path "~/.emacs.d/elpa/projectile-20201011.657")
(add-to-list 'load-path "~/.emacs.d/elpa/pythonic-20200806.434")
(add-to-list 'load-path "~/.emacs.d/elpa/pyvenv-20191202.1039")
(add-to-list 'load-path "~/.emacs.d/elpa/request-20200517.1305")
(add-to-list 'load-path "~/.emacs.d/elpa/reverse-im-20200520.853")
(add-to-list 'load-path "~/.emacs.d/elpa/s-20180406.808")
(add-to-list 'load-path "~/.emacs.d/elpa/shrink-path-20190208.1335")
(add-to-list 'load-path "~/.emacs.d/elpa/simple-call-tree")
(add-to-list 'load-path "~/.emacs.d/elpa/smex-20151212.2209")
(add-to-list 'load-path "~/.emacs.d/elpa/spinner-1.7.3")
(add-to-list 'load-path "~/.emacs.d/elpa/spinner-1.7.3.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/swiper-20200503.1102")
(add-to-list 'load-path "~/.emacs.d/elpa/tablist-20200427.2205")
(add-to-list 'load-path "~/.emacs.d/elpa/tiny-0.2.1")
(add-to-list 'load-path "~/.emacs.d/elpa/tiny-0.2.1.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/transient-20200707.2034")
(add-to-list 'load-path "~/.emacs.d/elpa/treemacs-20201026.2006")
(add-to-list 'load-path "~/.emacs.d/elpa/ts-20191010.210")
(add-to-list 'load-path "~/.emacs.d/elpa/undo-tree-0.7.4")
(add-to-list 'load-path "~/.emacs.d/elpa/undo-tree-0.7.4.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/uniquify-files-1.0.3")
(add-to-list 'load-path "~/.emacs.d/elpa/uniquify-files-1.0.3.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/use-package-20200629.1856")
(add-to-list 'load-path "~/.emacs.d/elpa/visual-regexp-20190414.814")
(add-to-list 'load-path "~/.emacs.d/elpa/visual-regexp-steroids-20170222.853")
(add-to-list 'load-path "~/.emacs.d/elpa/web-mode-20200826.1954")
(add-to-list 'load-path "~/.emacs.d/elpa/wgrep-20200217.1030")
(add-to-list 'load-path "~/.emacs.d/elpa/wgrep-ag-20200217.1028")
(add-to-list 'load-path "~/.emacs.d/elpa/which-key-20200908.2301")
(add-to-list 'load-path "~/.emacs.d/elpa/windower-0.0.1")
(add-to-list 'load-path "~/.emacs.d/elpa/windower-0.0.1.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/wisi-3.1.3")
(add-to-list 'load-path "~/.emacs.d/elpa/wisi-3.1.3.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/with-editor-20200720.2014")
;;(add-to-list 'load-path "~/.emacs.d/elpa/xah-find-20190314.2039")
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20200604.246")
;;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-snippets-20200606.1149")
(add-to-list 'load-path "~/.emacs.d/elpa/zenburn-theme-20200701.1333")
(add-to-list 'load-path "~/.emacs.d/sticky-windows")
(require 'sticky-windows)
(require 'diminish)


(eval-when-compile
  (require 'bind-key)
  (require 'use-package))
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))
;; /speeds up initialization

;; disabling some packages from autoloading
(setq package-load-list '((magit nil) all))

;;(package-initialize)
(defun my/phone-p ()
  (and (equal (system-name) "localhost") 
       (not (equal user-login-name "zelenyeshtany"))))


(defvar bookmark-file
      (cond
       ((my/phone-p) "~/.emacs.d/bookmark-android")
       ((eq system-type 'gnu/linux) "~/.emacs.d/bookmark-linux")
       ((eq system-type 'windows-nt) "~/.emacs.d/bookmark-win")
       )
      "Path to bookmarks file, depending on current operating system."
      )

(defvar data-folder-path
      (cond
       ((my/phone-p) "~/storage/shared/")
       ((eq system-type 'gnu/linux) "/data/")
       ((eq system-type 'windows-nt) "D:/")
       )
"Path to folder with all my data."
      )

(defvar my-org-directory (concat data-folder-path "Sync/org/")
"Path to my org folder.
Probably not required))."
)
(defvar my-org-from-smartphone-dir (concat my-org-directory "from-smartphone/")
"Path to folder with smartphone-only org files."
)

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
 '(display-time-mode -1)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(erc-log-insert-log-on-open t)
 '(fci-rule-color "#383838")
 '(fringe-mode 0 nil (fringe))
 '(global-auto-revert-non-file-buffers t)
 '(global-mode-string (if (my/phone-p) '("") '("" display-time-string)) t)
 '(helm-ff-lynx-style-map nil)
 '(help-window-select t)
 '(highlight-indent-guides-method 'character)
 '(ido-auto-merge-delay-time 0.7)
 '(inhibit-startup-screen t)
 '(initial-major-mode 'messages-buffer-mode)
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
   '(md4rd elfeed w3m mu4e lsp-modeline esup lsp-clangd dired-du ggtags lsp-pyright lsp-jedi lsp-ui emacs-ccls company-lsp org-mind-map 0blayout org-cliplink gruvbox-theme org-mru-clock org-superstar ada-mode ack wgrep-ag peg web-mode diminish loop json-mode org-ql counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
 '(powerline-display-buffer-size (if (my/phone-p) nil t))
 '(powerline-display-mule-info nil)
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
 (when (not (my/phone-p))'(tool-bar-mode nil))
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

(use-package org
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :custom
  (org-edit-src-content-indentation 0)
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
     ("\\.webm\\'" . "mpv \"%s\"")
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
     ("android")
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

     ;; ("n" "English Tracker" plain (file english-tracker )
     ;;  (function (lambda () (interactive) (my-json/engl english-tracker))) :immediate-finish t
     ;;  )

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
  (add-hook 'org-mode-hook '(lambda () (setq fill-column 50)))
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

  (defun my/org-at-source-block-p ()
    "returns non-nil if point is at source block"
    (eq (my-org-element-type (org-element-at-point)) 'src-block)
    )

  (defun my/org-mode-p ()
    "Return `t' if major-mode or derived-mode-p equals 'org-mode, otherwise `nil'."
    (or (eq major-mode 'org-mode) (when (derived-mode-p 'org-mode) t)))

  (defun org-cua-rectangle-conflict-resolving (&optional arg)
    (interactive "P")
    (if (eq major-mode 'org-mode)
        (org-insert-heading arg)
      (cua-rectangle-mark-mode arg)))

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
  (defun org-ql-view-todo ()
    "docstring"
    (interactive)
    (call-interactively 'org-agenda-todo)
    (org-ql-view-refresh)

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
   ;; english-tracker (concat data-folder-path "Sync/tables/english tracker/data.json")
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
  ;;(use-package org-download
;;:defer t
;;)
  ;;(use-package my-week-day-based-habits
;;:defer t
;;)
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
              ("C-c e" . (lambda () (interactive) (org-capture nil "e")))
              ("C-c i" . (lambda () (interactive) (org-capture nil "i")))
              ("C-c x" . (lambda () (interactive) (org-capture nil "t")))
              )
  :config
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
(org-babel-load-file
 (expand-file-name "org-babel-init.org"
                   user-emacs-directory))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;;   mode: emacs-lisp
;;   outline-regexp: "^;;;"
;; End:
