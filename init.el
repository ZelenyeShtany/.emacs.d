
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

(add-to-list 'load-path "~/.emacs.d/elpa/cmake-mode-20190710.1319")
(add-to-list 'load-path "~/.emacs.d/elpa/expand-region-20200304.1839")
(add-to-list 'load-path "~/.emacs.d/elpa/tree-mode-20151104.1331")
(add-to-list 'load-path "~/.emacs.d/elpa/bind-key-20191110.416")
(add-to-list 'load-path "~/.emacs.d/elpa/elfeed-20200910.239")
(add-to-list 'load-path "~/.emacs.d/elpa/0blayout-20190703.527")
(add-to-list 'load-path "~/.emacs.d/elpa/ace-window-20200606.1259")
(add-to-list 'load-path "~/.emacs.d/elpa/ack-1.10")
(add-to-list 'load-path "~/.emacs.d/elpa/ack-1.10.signed")
(add-to-list 'load-path "~/.emacs.d/elpa/ada-mode-7.1.4")
(add-to-list 'load-path "~/.emacs.d/elpa/ada-mode-7.1.4.signed")
;;(add-to-list 'load-path "~/.emacs.d/elpa/afternoon-theme-20140104.1859")
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
;;(add-to-list 'load-path "~/.emacs.d/elpa/gruvbox-theme-20200807.855")
;;(add-to-list 'load-path "~/.emacs.d/elpa/afternoon-theme-20140104.1859")
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
(defvar my/phone-p
  (and (equal (system-name) "localhost") 
       (not (equal user-login-name "zelenyeshtany"))))


(defvar bookmark-file
      (cond
       (my/phone-p "~/.emacs.d/bookmark-android")
       ((eq system-type 'gnu/linux) "~/.emacs.d/bookmark-linux")
       ((eq system-type 'windows-nt) "~/.emacs.d/bookmark-win")
       )
      "Path to bookmarks file, depending on current operating system."
      )

(defvar data-folder-path
      (cond
       (my/phone-p "~/../../")
       ((eq system-type 'gnu/linux) "/data/")
       ((eq system-type 'windows-nt) "D:/")
       )
"Path to folder with all my data."
      )


(defvar my-org-directory (concat data-folder-path (when (not my/phone-p) "gitserver/") "org/")
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
 '(global-mode-string (if my/phone-p '("") '("" display-time-string)) t)
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
;; '(org-agenda-files
;;   '("/data/data/com.termux/files/home/storage/shared/Sync/org/atomoxetine_research.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/brench.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/browsers_bookmarks.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/career.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/content.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/copingcards.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/cpp_roadmap.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/diredhelp.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/emacs-todos.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/engl.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/helmhelp.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/help.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/inbox.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/mtp.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/newreflex.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/notes.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/pswd.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/regular.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/sleephygiene.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/takingChargeOfAdultADHDnotes.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/test.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/todos.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/webarchive.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/вечрит.org" "/data/data/com.termux/files/home/storage/shared/Sync/org/утррит.org"))
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
   '(elisp-benchmarks cmake-mode expand-region md4rd elfeed w3m mu4e lsp-modeline esup lsp-clangd dired-du ggtags lsp-pyright lsp-jedi lsp-ui emacs-ccls company-lsp org-mind-map 0blayout org-cliplink gruvbox-theme org-mru-clock org-superstar ada-mode ack wgrep-ag peg web-mode diminish loop json-mode org-ql counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme org hamburg-theme))
 '(powerline-display-buffer-size (if my/phone-p nil t))
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
   (if my/phone-p
       (concat data-folder-path "emacs-tmp/")
     (concat data-folder-path "org/tmp/")))
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

(when (not my/phone-p)
 (use-package tool-bar
  :custom
  (tool-bar-mode nil)
  ))
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
;; eval: (outline-minor-mode 1)
;; End:
