
;; speeds up initialization

;; The GC can easily double startup time, so we suppress it at startup
;; by turning up gc-cons-threshold (and perhaps gc-cons-percentage) temporarily
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)
;; for better lsp-mode performance



;; Increase the amount of data which Emacs
;; reads from the process. Again the emacs default
;; is too low 4k considering that the some of the
;; language server responses are in 800k - 3M range
(setq read-process-output-max (* 1024 1024))
;; /for better lsp-mode performance

;;(require 'package)
;;; benchmarking
;; won't work
;; (add-to-list 'load-path "~/.emacs.d/elpa/benchmark-init-20150905.938")
;; (require 'benchmark-init)
;; To disable collection of benchmark data after init is done.
;;(add-hook 'after-init-hook 'benchmark-init/deactivate)


;;(setenv "PATH" (concat ":" (getenv "PATH") ))

(add-to-list 'exec-path "/home/zelenyeshtany/.nvm/versions/node/v14.9.0/bin")

(add-to-list 'load-path "~/.emacs.d/elpa/esup-20200814.1400")
(require 'esup)
;;; Add to list

(add-to-list 'load-path "~/.emacs.d/emacs-redshift")
(add-to-list 'load-path "~/.emacs.d/emacs-calfw")
(add-to-list 'load-path "~/.emacs.d/transmission-el")
(add-to-list 'load-path "~/.emacs.d/elpa/use-package-20200629.1856")
(add-to-list 'load-path "~/.emacs.d/org-ql/") 
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
(add-to-list 'load-path "~/.emacs.d/elpa/gruvbox-theme-20200807.855")
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
;;(add-to-list 'load-path "~/.emacs.d/elpa/zenburn-theme-20200701.1333")
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
;;(setq package-load-list '((magit nil) all))

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
 '(ivy-format-functions-alist
   '((counsel-compile-env . counsel-compile-env--format-hint)
     (counsel-kmacro . counsel--kmacro-format-function)
     (counsel-colors-web . counsel--colors-web-format-function)
     (counsel-colors-emacs . counsel--colors-emacs-format-function)
     (counsel-evil-registers . counsel--yank-pop-format-function)
     (counsel-yank-pop . counsel--yank-pop-format-function)
     (counsel-git-log . counsel--git-log-format-function)
     (counsel-faces . counsel--faces-format-function)
     (swiper-isearch . swiper-isearch-format-function)
     (swiper-all . swiper--all-format-function)
     (swiper-multi . swiper--all-format-function)
     (t . ivy-format-function-default)))
 '(ivy-sort-functions-alist
   '((org-refile)
     (counsel-minor . ivy-string<)
     (counsel-colors-web . ivy-string<)
     (counsel-unicode-char . ivy-string<)
     (counsel-register . ivy-string<)
     (counsel-mark-ring . ivy-string<)
     (counsel-file-register . ivy-string<)
     (counsel-describe-face . ivy-string<)
     (counsel-info-lookup-symbol . ivy-string<)
     (counsel-apropos . ivy-string<)
     (counsel-describe-symbol . ivy-string<)
     (read-file-name-internal . ivy-sort-file-function-default)
     (t . ivy-string<)))
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
 '(org-agenda-log-mode-items '(closed clock state))
 '(org-agenda-sorting-strategy
   '((agenda time-up scheduled-down habit-down priority-down category-keep)
     (todo priority-down category-keep)
     (tags priority-down category-keep)
     (search category-keep)))
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
 '(org-refile-targets '((nil :maxlevel . 10)))
 '(package-selected-packages
   '(elisp-benchmarks cmake-mode expand-region md4rd elfeed w3m mu4e lsp-modeline esup lsp-clangd dired-du ggtags lsp-pyright lsp-jedi lsp-ui emacs-ccls company-lsp org-mind-map 0blayout org-cliplink gruvbox-theme org-mru-clock org-superstar ada-mode ack wgrep-ag peg web-mode diminish loop json-mode counsel-ffdata emacsql-sqlite beacon elpy magit bm csv-mode markdown-mode+ js2-highlight-vars windower markdown-mode undo-tree dumb-jump cyberpunk-theme persist alert company-quickhelp visual-regexp xah-find helm-org dired-filter dired-open dired-avfs dired-subtree dired-hacks-utils page-break-lines ag counsel ivy yasnippet-snippets yasnippet helm-smex helm-swoop helm afternoon-theme modus-vivendi-theme light-soap-theme dark-krystal-theme ace-window dired-launch mermaid-mode ob-mermaid multiple-cursors org-timeline org-board org-download use-package reverse-im blimp ido-vertical-mode zenburn-theme hamburg-theme))
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
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(when (not my/phone-p)
  (use-package tool-bar
    :custom
    (tool-bar-mode nil)
    ))
(setq comp-deferred-compilation nil)

;;; phone config
(when my/phone-p
  ;;(setq global-mode-string "")
  (define-key global-map (kbd "<prior>") #'org-mru-clock-in)
  (define-key global-map (kbd "<next>") #'org-clock-out)
  (define-key global-map (kbd "<end>") #'org-clock-cancel)
  (setq display-time-default-load-average nil)
  )

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )


;; (use-package visual-regexp-steroids
;;   :custom
;;   (vr/command-python "python /home/zesh/.emacs.d/elpa/visual-regexp-steroids-20170222.853/regexp.py")
;;   )

(use-package calfw)
(use-package calfw-cal)
(use-package calfw-org)




(use-package tramp
  :custom
  (tramp-default-method "ssh")
  :config
  (defun my-tramp/open-remote-server()
    (interactive)
    (dired "/ssh:shmelevvl@192.168.1.105:~/")
    )
  (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

  (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
  (defvar sudo-tramp-prefix 
    "/sudo:" 
    (concat "Prefix to be used by sudo commands when building tramp path "))
  (defun sudo-file-name (filename)
    (set 'splitname (split-string filename ":"))
    (if (> (length splitname) 1)
        (progn (set 'final-split (cdr splitname))
               (set 'sudo-tramp-prefix "/sudo:")
               )
      (progn (set 'final-split splitname)
             (set 'sudo-tramp-prefix (concat sudo-tramp-prefix "root@localhost:")))
      )
    (set 'final-fn (concat sudo-tramp-prefix (mapconcat (lambda (e) e) final-split ":")))
    (message "splitname is %s" splitname)
    (message "sudo-tramp-prefix is %s" sudo-tramp-prefix)
    (message "final-split is %s" final-split)
    (message "final-fn is %s" final-fn)
    (message "%s" final-fn)
    )

  (defun sudo-find-file (filename &optional wildcards)
    "Calls find-file with filename with sudo-tramp-prefix prepended"
    (interactive "fFind file with sudo ")      
    (let ((sudo-name (sudo-file-name filename)))
      (apply 'find-file 
             (cons sudo-name (if (boundp 'wildcards) '(wildcards))))))

  (defun sudo-reopen-file ()
    "Reopen file as root by prefixing its name with sudo-tramp-prefix and by clearing buffer-read-only"
    (interactive)
    (let* 
        ((file-name (expand-file-name buffer-file-name))
         (sudo-name (sudo-file-name file-name)))
      (progn           
        (setq buffer-file-name sudo-name)
        (rename-buffer sudo-name)
        (setq buffer-read-only nil)
        (message (concat "File name set to " sudo-name)))))
  ;;(global-set-key (kbd "C-c o") 'sudo-find-file)
  ;;(global-set-key (kbd "C-c o s") 'sudo-reopen-file)

  :bind (
	 ("C-x C-d" . 'my-tramp/open-remote-server)
	 ("C-r" . 'sudo-reopen-file)
	 )
  )

(use-package transmission
  :commands (transmission transmission-add)
  :init
  (defun transmission-switch-host()
    (interactive)
    (require 'ivy)
    (unload-feature 'transmission)
    (require 'transmission)
    (let ((hosts(list "localhost" "192.168.1.105")))
      (setq transmission-host (ivy-read "host:" hosts :require-match t))
      )
    )
  :custom
  (transmission-host "192.168.1.105")
  )
(use-package outline
  :bind
  (:map
   outline-minor-mode-map
   ("<tab>" . 'my/outline-cycle)
   )
  )

(defun my/outline-cycle (&optional arg)
  "Cycle visibility when point is on heading."
  (interactive "P")
  (if (outline-on-heading-p) (outline-cycle) (indent-for-tab-command arg))
  )

(use-package pkg-info)

(use-package magit
  :commands (magit)
  )

;;; IRC
(setenv "IRCNICK" "khakipants33")
(use-package erc
  :commands (erc)
  :custom
  (erc-autojoin-channels-alist 
   '(
     (
      "freenode.net"
      "#archlinux"
      "#bash"
      "#linux"
      "#bitcoin"
      "#emacs"
      "#gentoo"
      "#i3"
      "#latex"
      "#org-mode"
      "#python"
      )))
  (erc-autojoin-timing 'ident)
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 22)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-threshold-time 43200)
  (erc-prompt-for-nickserv-password nil)
  (erc-server-reconnect-attempts 5)
  (erc-server-reconnect-timeout 3)
  (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
                             "324" "329" "332" "333" "353" "477"))
  :config
  (add-to-list 'erc-modules 'notifications)
  ;;(add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules)
  )

;; (use-package gnus
;;   :commands (gnus)
;;   :config
;;   (setq gnus-have-read-active-file nil)
;;   :custom
;;   ;;For instance, if the ‘news.somewhere.edu’ NNTP server is where you
;;   ;;want to get your daily dosage of news from, you’d say:
;;   (gnus-select-method
;;    '(nntp "news.gmane.io")
;;    ;;'(nnmaildir "emacs-devel archive" (directory "~/Maildir/2000-11"))
;;    ;; '(nnmbox ""
;;    ;; 	    (nnmbox-mbox-file "~/mbox/2020-11")
;;    ;; 	    )
;;    )
;;   ;; (setq nnmail-split-methods
;;   ;; 	’(("mail.junk" "^From:.*Lars Ingebrigtsen")
;;   ;; 	  ("mail.crazy" "^Subject:.*die\\|^Organization:.*flabby")
;;   ;; 	  ("mail.other" "")))
;;   ;;(gnus-select-method '(nnnil ""))
;;   ;; (gnus-secondary-select-methods
;;   ;;  ;;'(nnimap "gmail"
;;   ;;  ;;(nnimap-address "imap.gmail.com")
;;   ;;  ;;(nnimap-server-port 993)
;;   ;;  ;;(nnimap-stream ssl)
;;   ;;  ;;	 )
;;   ;;  '(
;;   ;;    ;; (nnmaildir "gmail|zelenyeshtany" (directory "~/Maildir/zelenyeshtany-gmail"))
;;   ;;    ;; (nnmaildir "gmail|chandlerkhaki" (directory "~/Maildir/chandlerkhaki-gmail"))
;;   ;;    ;; (nnmaildir "emacs-devel archive" (directory "~/Maildir/2000-11"))
;;   ;;    )
;;   ;;  )

;;   ;;If you want to read directly from the local spool, say:
;;   ;;(gnus-select-method '(nnspool ""))

;;   ;; You can turn off writing the ‘.newsrc’ file by setting
;;   ;; ‘gnus-save-newsrc-file’ to ‘nil’, which means you can delete the file
;;   ;; and save some space, as well as exiting from Gnus faster.  However, this
;;   ;; will make it impossible to use other newsreaders than Gnus.  But hey,
;;   ;; who would want to, right?
;;   ;;(gnus-save-newsrc-file nil)
;;   ;;(gnus-read-newsrc-file nil)


;;   ;; nnmbox
;;   ;;(nnmbox-mbox-file   "~/mbox/2000-09")
;;   ;;(nnmbox-active-file "~/.mbox-active")
;;   ;;(nnmbox-get-new-mail nil)
;;   ;; /nnmbox

;;   (gnus-startup-file "~/.newsrc.el") ;; ???
;;   (nnml-directory "~/gmail")
;;   (message-directory "~/gmail")
;;   (gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")
;;   (mm-text-html-renderer 'gnus-w3m)
;;   ;; The following configures gnus to use the Gmail SMTP server for sending email.
;;   (message-send-mail-function 'smtpmail-send-it)
;;   ;;(smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
;;   ;;(smtpmail-auth-credentials '(("smtp.gmail.com" 587 "your-name@gmail.com" nil)))
;;   ;;(smtpmail-default-smtp-server "smtp.gmail.com")
;;   ;;(smtpmail-smtp-server "smtp.gmail.com")
;;   ;;(smtpmail-smtp-service 587)
;;   )
;; WIEGLEY

;; /WIEGLEY

(use-package cmake-mode
  :commands (cmake-mode)
  :mode ("\\(CMakeLists\\.txt\\)\\|\\(\\.cmake$\\)" . cmake-mode)
  )

(when (not my/phone-p)(use-package md4rd
			:load-path "~/.emacs.d/elpa/md4rd-20201108.2202"
			:commands (reddit md4rd)
			))

(setenv "STARDICT_DATA_DIR"
	(if my/phone-p
	    "/data/data/com.termux/files/home/stardict/"
	  "/data/Dictionaries/stardict/")
	)
(defun my/lookup-at-stardict()
  "Look up a WORD in sdcv (stardict CLI tool)."
  (interactive)
  (let*
      (
       (word-or-colloc (read-string "word or collocation: ")))
    (message
     "%s"
     (replace-regexp-in-string "[^[:print:]
]" "" 
 (shell-command-to-string
  (concat
   "sdcv "
   word-or-colloc
   " | sed ':a;N;$!ba;s/\\n/<br>/g' | html2text"
   ) ;; see 's' alias for sdcv command is ~/.bashrc 
  )))))
(when my/phone-p
  (define-key global-map (kbd "<home>") 'my/lookup-at-stardict)
  )

;;sdcv $1 | sed ':a;N;$!ba;s/\n/<br>/g' | html2text
(defun my/create-tmp-buffer ()
  "Create(or switch to existing) temporary buffer with name \"drafts\"."
  (interactive)

  (let* (
	 (files (list "/data/Sync/org/atomoxetine_research.org"))
	 (tmpbuf nil)
	 )
    (save-excursion
      (find-file "/data/Sync/org/atomoxetine_research.org")
      (when (buffer-narrowed-p) (widen) )
      (goto-char (point-min))
      ;;(buffer-substring (line-beginning-position)(line-end-position))
      (if
          (string-match "[0-9]" (org-element-property :title (org-element-at-point))))
      )

    )
  )
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
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
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
;; (defun unpackaged/org-element-descendant-of (type element)
;;   "Return non-nil if ELEMENT is a descendant of TYPE.
;; TYPE should be an element type, like `item' or `paragraph'.
;; ELEMENT should be a list like that returned by `org-element-context'."
;;   ;; MAYBE: Use `org-element-lineage'.
;;   (when-let* ((parent (org-element-property :parent element)))
;;     (or (eq type (car parent))
;;         (unpackaged/org-element-descendant-of type parent))))

;;;;###autoload
;; (defun unpackaged/org-return-dwim (&optional default)
;;   "A helpful replacement for `org-return'.  With prefix, call `org-return'.

;; On headings, move point to position after entry content.  In
;; lists, insert a new item or end the list, with checkbox if
;; appropriate.  In tables, insert a new row or end the table."
;;   ;; Inspired by John Kitchin: http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
;;   (interactive "P")
;;   (if default
;;       (org-return)
;;     (cond
;;      ;; Act depending on context around point.

;;      ;; NOTE: I prefer RET to not follow links, but by uncommenting this block, links will be
;;      ;; followed.

;;      ((eq 'link (car (org-element-context)))
;;       ;; Link: Open it.
;;       (org-open-at-point-global))

;;      ((org-at-heading-p)
;;       ;; Heading: Move to position after entry content.
;;       ;; NOTE: This is probably the most interesting feature of this function.
;;       (let ((heading-start (org-entry-beginning-position)))
;;         (goto-char (org-entry-end-position))
;;         (cond ((and (org-at-heading-p)
;;                     (= heading-start (org-entry-beginning-position)))
;;                ;; Entry ends on its heading; add newline after
;;                (end-of-line)
;;                (insert "\n\n"))
;;               (t
;;                ;; Entry ends after its heading; back up
;;                (forward-line -1)
;;                (end-of-line)
;;                (when (org-at-heading-p)
;;                  ;; At the same heading
;;                  (forward-line)
;;                  (insert "\n")
;;                  (forward-line -1))
;;                ;; FIXME: looking-back is supposed to be called with more arguments.
;;                (while (not (looking-back (rx (repeat 3 (seq (optional blank) "\n")))))
;;                  (insert "\n"))
;;                (forward-line -1)))))

;;      ((org-at-item-checkbox-p)
;;       ;; Checkbox: Insert new item with checkbox.
;;       (org-insert-todo-heading nil))

;;      ((org-in-item-p)
;;       ;; Plain list.  Yes, this gets a little complicated...
;;       (let ((context (org-element-context)))
;;         (if (or (eq 'plain-list (car context))  ; First item in list
;;                 (and (eq 'item (car context))
;;                      (not (eq (org-element-property :contents-begin context)
;;                               (org-element-property :contents-end context))))
;;                 (unpackaged/org-element-descendant-of 'item context))  ; Element in list item, e.g. a link
;;             ;; Non-empty item: Add new item.
;;             (org-insert-item)
;;           ;; Empty item: Close the list.
;;           ;; TODO: Do this with org functions rather than operating on the text. Can't seem to find the right function.
;;           (delete-region (line-beginning-position) (line-end-position))
;;           (insert "\n"))))

;;      ((when (fboundp 'org-inlinetask-in-task-p)
;;         (org-inlinetask-in-task-p))
;;       ;; Inline task: Don't insert a new heading.
;;       (org-return))

;;      ((org-at-table-p)
;;       (cond ((save-excursion
;;                (beginning-of-line)
;;                ;; See `org-table-next-field'.
;;                (cl-loop with end = (line-end-position)
;;                         for cell = (org-element-table-cell-parser)
;;                         always (equal (org-element-property :contents-begin cell)
;;                                       (org-element-property :contents-end cell))
;;                         while (re-search-forward "|" end t)))
;;              ;; Empty row: end the table.
;;              (delete-region (line-beginning-position) (line-end-position))
;;              (org-return))
;;             (t
;;              ;; Non-empty row: call `org-return'.
;;              (org-return))))
;;      (t
;;       ;; All other cases: call `org-return'.
;;       (org-return)))))

(defun my-help ()
  "docstring"
  (interactive)
  (find-file
   (concat my-org-directory "help.org")
   )
  )
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
    (let*
	(
	 (buffer) 
	 )
      (org-edit-src-code)
      (setq buffer (current-buffer))
      
      (delete-window)
      (switch-to-buffer
       buffer
       ;;(clone-indirect-buffer nil nil ) ;; create indirect buffer with current_buffer_name<N> name
       )
      )
    ;;(org-narrow-to-block)
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
  )
(defun delete-nth (index seq)
  "Delete the INDEX th element of SEQ.
 Return result sequence, SEQ __is__ modified."
  (if (equal index 0)
      (progn
        (setcar seq (car (cdr seq)))
        (setcdr seq (cdr (cdr seq))))
    (setcdr (nthcdr (1- index) seq) (nthcdr (1+ index) seq))))

(defun replace-regexp-visual ()
  "call vr/replace(more convenient func name)"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (call-interactively 'vr/replace)
    )
  )
(defun my-find-file ()
  (interactive)
  (call-interactively 'ido-find-file))

(defun my-insert-into-table(string)
  (interactive)
  (progn
    (org-table-blank-field)
    (insert string)
    (org-table-align)
    )
  )  
(use-package mypack
  :after (org)
  )
(use-package my-json
  :after (org)
  )

(use-package my-week-day-based-habits
  :after (org)
  )

(use-package org-branch
  :after (org)
  )
;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :custom
;;   (eaf-find-alternate-file-in-dired t)
;;   :config
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))

(use-package org
  :commands (org-mode)
  :mode ("\\.org\\'" . org-mode)
  :custom
  ;;(org-refile-targets '(org-agenda-files . (:maxlevel . 10)))
  (org-emphasis-alist '(("*" (bold :foreground "#fabd2f"))
			("/" italic)
			("_" underline)
			("=" org-verbatim verbatim)
			("~" org-code verbatim)
			("+"
			 (:strike-through t))))
  (org-log-refile 'time)
  (org-refile-use-outline-path nil)
  (org-agenda-files (list my-org-directory))
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

  (org-clock-sound (concat my-org-directory "timer-sounds/bell.wav"))
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
     ("english-listening-skill")
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
      "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:")
     ("i" "Idea" entry (file+datetree inbox)
      "* IDEA %?\n:PROPERTIES:\n:CREATED: %U\n:END:")
     ;;("d" "TEST" entry (file+datetree (concat my-org-directory "notes.org"))
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
  (defun my/org-open-at-point (&optional arg)
    (interactive)
    (if (and
	 (org-at-table-p)
	 (my/org-link-at-point-p))
	(org-open-at-point)
      (org-return arg)))
  (defun my/org-delete-link-at-point ()
    "docstring"
    (interactive)
    (if(my/org-link-at-point-p)
        (delete-region (match-beginning 0) (match-end 0))
      nil))

  (defun my/org-at-source-block-p ()
    "returns non-nil if point is at source block"
    (eq (my-org-element-type (org-element-at-point)) 'src-block))

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
      (right-word)))
  (defun my/org-move-left ()
    "docstring"
    (interactive)
    (if(org-at-table-p)
        (org-table-previous-field)
      (left-word)))

  (defun my-org-set-todo-state (todostate)
    "Change TODO state of current heading to todostate"
    (save-excursion
      (let* (
             (todo-state (concat todostate " "))
             (regexp "\\([[:word:]]+ \\)\\(.*\\)")
             (heading-level (car (my-org-get-current-heading-level-and-point)))
             (heading-point (nth 1 (my-org-get-current-heading-level-and-point))))
        (progn
          (if (eq (org-get-todo-state) nil)
              (setq new-line (concat todo-state (org-get-heading)))
            (progn
              (setq new-line (replace-regexp-in-string regexp (concat todo-state "\\2") (org-get-heading) nil nil))))
          (goto-char (+ heading-point heading-level 1))
          (zap-up-to-char -1 ?*)
          (zap-up-to-char 1 ?\n)
          (insert (concat " " new-line))))))

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
	     (video-dir "/data/gitserver/org/video/")
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
                    "]' -o '" video-dir "%(title)s-%(id)s.%(ext)s' "
                    link))

                  )
                 ((string= chosen-download-option "only audio")
                  (shell-command-to-string
                   (concat
                    ;;"youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en --extract-audio --audio-format 'mp3' -f 'worstaudio[abr>="
                    "youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en -f 'worstaudio[abr>="
                    desired-audio-bitrate 
                    "]' -o '" video-dir "%(title)s-%(id)s.%(ext)s' "
                    link))
                  )
                 ((string= chosen-download-option "only video")
                  (shell-command-to-string
                   (concat
                    "youtube-dl --embed-subs --write-sub --write-auto-sub --sub-lang en -f 'worstvideo[height>="
                    video-height
                    "]' -o '" video-dir "%(title)s-%(id)s.%(ext)s' "
                    link))
                  ;; ;;test
                  ;; (start-process-shell-command "youtube-dl" nil (concat
                  ;; 		    "youtube-dl --embed-subs --write-sub --sub-lang en -f 'worstvideo[height>="
                  ;; 		    "144"
                  ;; 		    "]' -o '" video-dir "%(title)s-%(id)s.%(ext)s' "
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
                             (dired video-dir)
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
   engl (concat my-org-directory "engl.org")
   inbox (concat my-org-directory "inbox.org")
   notes (concat my-org-directory "notes.org")
   regular (concat my-org-directory "regular.org")
   todos (concat my-org-directory "todos.org")
   timerasp (concat my-org-directory "timerasp.org")
   poor-man-cbt (concat data-folder-path "other/tables/poor-man-CBT/data.json")
   ;; english-tracker (concat data-folder-path "other/tables/english tracker/data.json")
   migraines-tracker (concat data-folder-path "other/tables/migraines/data.json")
   meditations-tracker (concat data-folder-path "other/tables/meditations/2020/data.json")
   exercise-tracker (concat data-folder-path "other/tables/exercises tracker/2020/data.json")
   sleepdiary (concat data-folder-path "other/tables/sleep diary/2020/data.json"))

  ;; web archiving through org-capture + org-board
  (defun do-org-board-dl-hook ()
    (when (equal (buffer-name) "CAPTURE-webarchive.org")
      (org-board-archive)))

  (add-hook 'org-capture-before-finalize-hook 'do-org-board-dl-hook)

  (setq org-board-capture-file (concat my-org-directory "webarchive.org"))
  ;; /web archiving through org-capture + org-board  
  ;;(use-package org-download
  ;;:defer t
  ;;)
  ;;(use-package my-week-day-based-habits
  ;;:defer t
  ;;)
  :bind (:map org-mode-map
	      ("<return>" . 'my/org-open-at-point)
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

(add-to-list 'load-path "~/.emacs.d/dired+/")
(use-package dired+
  :after (dired)
  )
(use-package dired
  :defer t
  :config

  (setq
   dired-listing-switches "-alhv" ;; human-readable file sizes
   )
  
  :bind (:map dired-mode-map
	      ("C-S-n" . 'dired-create-directory)
	      ("<f1>" . 'my-help)
	      ("<tab>" . 'dired-subtree-toggle)
	      ("+" . 'dired-create-empty-file)     
	      ("<f2>" . 'dired-do-rename)
	      ;;("X" . 'diredp-move-file)
	      ("<ret>" . 'dired-open-by-extension)
	      ("M-?" .  (lambda () (interactive) (find-file-other-window (concat my-org-directory "diredhelp.org"))))
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

(use-package dired-open
  :after (dired)
  :custom
  (dired-open-extensions
   '(("pdf" . "evince")
     ("csv" . "konsole -e visidata")
     ("html" . "google-chrome")
     ("mp4" . "mpv")
     ("webp" . "mpv")
     ("avi" . "mpv")
     ("webm" . "mpv")
     ("wav" . "mpv")
     ("mkv" . "vlc")
     ("mp3" . "vlc")
     ("ogg" . "clementine")
     ("opus" . "clementine")
     ("odt" . "libreoffice")
     ("doc" . "libreoffice")
     ("docx" . "libreoffice")))
  )

(use-package dired-x
  :after (dired)
  )

(use-package elfeed
  :commands (elfeed)
  :bind (
	 ("C-c w". 'elfeed)
	 )
  :custom
  (elfeed-feeds
   ;; tags here
   '(("http://nullprogram.com/feed/" emacs blog)
     "http://planet.emacsen.org/atom.xml" ;; no tags
     "https://lukesmith.xyz/rss.xml"
     "https://lukesmith.xyz/youtube.xml"
     "https://notrelated.xyz/rss"
     "https://www.reddit.com/r/emacs/.rss"
     "https://isocpp.org/blog/rss/category/articles-books"
     ;;"https://videos.lukesmith.xyz/feeds/videos.xml?accountId=3" peertube or sth
     ))
  :config
  ;; If you're getting many "Queue timeout exceeded"
  ;; errors, increase the fetch timeout via
					;
					; elfeed-set-timeout.
  (setf url-queue-timeout 30)

  )

(add-to-list 'load-path "~/.emacs.d/smartparens")
(use-package smartparens-config
  :commands (sp-point-in-string)
  :diminish smartparens-mode
  :hook ((emacs-lisp-mode cc-mode) . smartparens-mode)

  )

(use-package mu4e
  :commands (mu4e)
  :custom
  (mu4e-get-mail-command "mbsync -c ~/.emacs.d/mu4e/.mbsyncrc -a")
  (mu4e-view-show-images t)
  ;; give me ISO(ish) format date-time stamps in the header list
  (mu4e-headers-date-format "%Y-%m-%d %H:%M")

  ;;rename files when moving
  ;;NEEDED FOR MBSYNC
  (mu4e-change-filenames-when-moving t)
  ;;from the info manual
  (mu4e-attachment-dir  "/data/Downloads")

  ;;HZ
  (message-kill-buffer-on-exit t)
  (mu4e-compose-dont-reply-to-self t)
  )

;; (require 'org-mu4e)

;; ;; convert org mode to HTML automatically
;; (setq org-mu4e-convert-to-html t)

;; ;;from vxlabs config
;; ;; show full addresses in view message (instead of just names)
;; ;; toggle per name with M-RET
;; (setq mu4e-view-show-addresses 't)

;; ;; don't ask when quitting
;; (setq mu4e-confirm-quit nil)

;; mu4e-context
(use-package mu4e-context
  :after (mu4e)
  :custom
  (mu4e-context-policy 'pick-first)
  (mu4e-compose-context-policy 'always-ask)
  (mu4e-contexts
   (list
    (make-mu4e-context
     :name "zelenye shtany" ;;for zelenyeshtany-gmail
     :enter-func (lambda () (mu4e-message "Entering context work"))
     :leave-func (lambda () (mu4e-message "Leaving context work"))
     :match-func (lambda (msg)
		   (when msg
		     (mu4e-message-contact-field-matches
		      msg '(:from :to :cc :bcc) "zelenyeshtany@gmail.com")))
     :vars '((user-mail-address . "zelenyeshtany@gmail.com")
	     (user-full-name . "zelenye shtany")
	     (mu4e-sent-folder . "/zelenyeshtany-gmail/[zelenyeshtany].Sent Mail")
	     (mu4e-drafts-folder . "/zelenyeshtany-gmail/[zelenyeshtany].drafts")
	     (mu4e-trash-folder . "/zelenyeshtany-gmail/[zelenyeshtany].Bin")
	     (mu4e-compose-signature . (concat "Formal Signature\n" "Emacs 25, org-mode 9, mu4e 1.0\n"))
	     (mu4e-compose-format-flowed . t)
	     (smtpmail-queue-dir . "~/Maildir/zelenyeshtany-gmail/queue/cur")
	     (message-send-mail-function . smtpmail-send-it)
	     (smtpmail-smtp-user . "zelenyeshtany")
	     (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
	     (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
	     (smtpmail-default-smtp-server . "smtp.gmail.com")
	     (smtpmail-smtp-server . "smtp.gmail.com")
	     (smtpmail-smtp-service . 587)
	     (smtpmail-debug-info . t)
	     (smtpmail-debug-verbose . t)
	     (mu4e-maildir-shortcuts . ( ("/zelenyeshtany-gmail/INBOX"            . ?i)
					 ("/zelenyeshtany-gmail/[zelenyeshtany].Sent Mail" . ?s)
					 ("/zelenyeshtany-gmail/[zelenyeshtany].Bin"       . ?t)
					 ("/zelenyeshtany-gmail/[zelenyeshtany].All Mail"  . ?a)
					 ("/zelenyeshtany-gmail/[zelenyeshtany].Starred"   . ?r)
					 ("/zelenyeshtany-gmail/[zelenyeshtany].drafts"    . ?d)
					 ))))
    (make-mu4e-context
     :name "chandler khaki" ;;for chandlerkhaki-gmail
     :enter-func (lambda () (mu4e-message "Entering context personal"))
     :leave-func (lambda () (mu4e-message "Leaving context personal"))
     :match-func (lambda (msg)
		   (when msg
		     (mu4e-message-contact-field-matches
		      msg '(:from :to :cc :bcc) "chandlerkhaki@gmail.com")))
     :vars '((user-mail-address . "chandlerkhaki@gmail.com")
	     (user-full-name . "chandler khaki")
	     (mu4e-sent-folder . "/chandlerkhaki-gmail/[chandlerkhaki].Sent Mail")
	     (mu4e-drafts-folder . "/chandlerkhaki-gmail/[chandlerkhaki].drafts")
	     (mu4e-trash-folder . "/chandlerkhaki-gmail/[chandlerkhaki].Trash")
	     (mu4e-compose-signature . (concat "Informal Signature\n" "Emacs is awesome!\n"))
	     (mu4e-compose-format-flowed . t)
	     (smtpmail-queue-dir . "~/Maildir/chandlerkhaki-gmail/queue/cur")
	     (message-send-mail-function . smtpmail-send-it)
	     (smtpmail-smtp-user . "chandlerkhaki")
	     (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
	     (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
	     (smtpmail-default-smtp-server . "smtp.gmail.com")
	     (smtpmail-smtp-server . "smtp.gmail.com")
	     (smtpmail-smtp-service . 587)
	     (smtpmail-debug-info . t)
	     (smtpmail-debug-verbose . t)
	     (mu4e-maildir-shortcuts . ( ("/chandlerkhaki-gmail/INBOX"            . ?i)
					 ("/chandlerkhaki-gmail/[chandlerkhaki].Sent Mail" . ?s)
					 ("/chandlerkhaki-gmail/[chandlerkhaki].Trash"     . ?t)
					 ("/chandlerkhaki-gmail/[chandlerkhaki].All Mail"  . ?a)
					 ("/chandlerkhaki-gmail/[chandlerkhaki].Starred"   . ?r)
					 ("/chandlerkhaki-gmail/[chandlerkhaki].drafts"    . ?d)
					 ))))))
  )

(add-to-list 'load-path "~/.emacs.d/sticky-windows")
(use-package sticky-windows
  :defer t
  )

(add-to-list 'load-path "~/.emacs.d/elpa/peg-1.0")

(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol.el/")
(use-package highlight-symbol
  :hook ((cc-mode emacs-lisp-mode) . highlight-symbol-mode)
  :defer t
  :diminish highlight-symbol-mode
  :custom
  (highlight-symbol-idle-delay 0.2)
  )

(add-to-list 'load-path "~/.emacs.d/org-pandoc-import/") 

(use-package swiper
  :commands (swiper)
  :bind (
	 ("C-f" . 'swiper)
	 )
  )

(use-package expand-region
  :commands (er/expand-region)
  :bind
  (
   ("M-w" . 'er/expand-region)
   )
  )

(use-package org-pandoc-import)
(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :after (org)
  )
;;tiny(abo-abo)
;;quickly insert text at point
(use-package tiny
  :config
  (tiny-setup-default)
  )
''/tiny

(use-package org-branch
  :defer t
  :after (org)
  )

;;(use-package wgrep)
(use-package elisp-mode)


(use-package hideshow
  :diminish hs-minor-mode
  :hook ((emacs-lisp-mode) . hs-minor-mode)
  )

;; (use-package org-ql
;;   :after (org)
;;   )

(use-package org-ql-view
  :commands (org-ql-view)
  )

(use-package org-ql-search
  :after (org-ql)
  )

(use-package beacon
  :diminish beacon-mode
  )
(use-package eldoc
  :diminish eldoc-mode
  )

(use-package org-indent
  :after (org)
  :diminish org-indent-mode
  )
(use-package simple
  :diminish auto-fill-function
  )


(use-package emacsql-sqlite
  :defer t
  )

(use-package org-protocol
  :defer t
  )
(use-package visual-regexp
  :commands (vr/replace)
  )
(use-package ido
  :defer t
  )
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/zoom/")
(use-package zoom
  :defer t
  )

(add-to-list 'load-path "~/.emacs.d/elpa/powerline-20200817.1321/")
(use-package powerline)
(powerline-default-theme)


(add-to-list 'load-path "~/.emacs.d/spaceline/")
;; (use-package spaceline
;;:defer t
;; )
;; (use-package spaceline-segments
;; :defer t
;; )
;; (use-package spaceline-config
;;:defer t
;;)
;; (spaceline-spacemacs-theme)
;; (setq spaceline-highlight-face-func 'spaceline-highlight-face-modified)

(add-to-list 'load-path "~/.emacs.d/deferred/")
(use-package deferred
  :defer t
  )


(add-to-list 'load-path "~/.emacs.d/elpa/auto-minor-mode/")

(use-package ido-vertical-mode
  ;;:defer t
  )
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

(use-package multiple-cursors
  :commands (mc/edit-lines mc/mark-previous-like-this mc/mark-next-like-this)
  :bind (:map global-map
              ("C-M-z" . 'mc/edit-lines)
              ("C-?" . 'mc/mark-all-like-this)
              )
  )

;;(use-package ivy-rich
;;:after (ivy)
;;:config
;;(ivy-rich-mode 1)
;;)

(use-package gruvbox)
(load-theme 'gruvbox-light-medium t)

(define-key global-map (kbd "<prior>") #'my/sound-while-clocking-in)
(define-key global-map (kbd "<next>") #'org-clock-out)
(define-key global-map (kbd "<end>") #'org-clock-cancel)

(define-key global-map (kbd "C-e") #'smarter-move-end-of-line)
(define-key global-map (kbd "C-x C-e") 'eval-print-last-sexp)
(define-key global-map (kbd "C-c v") 'org-ql-view)


;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)
(define-key org-mode-map (kbd "C-a") 'smarter-move-beginning-of-line)

(define-key global-map (kbd "C-y") 'yas-new-snippet)
(define-key global-map (kbd "M-n") 'my-toggle-narrow-to-sth)
(define-key global-map (kbd "C-s") 'save-buffer)

(set-language-environment "UTF-8")

(define-key global-map (kbd "C-x i")
  (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

;; open agenda
(define-key global-map (kbd "C-c a")
  (lambda () (interactive) (org-agenda)))
;;

;; <placing backup files (with ~ in the end) in special directory>
;; stored in 'temporary-file-directory' variable
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; </placing backup files (with ~ in the end) in special directory>

(setq system-time-locale "C")
(use-package org-id
  :defer t
  )

(global-set-key (kbd "M-o") 'ace-window)

(add-to-list 'display-buffer-alist
	     (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

(define-key esc-map "." #'xref-find-definitions-other-window)
(put 'narrow-to-region 'disabled nil)
(global-auto-revert-mode 1)
(add-hook 'after-revert-hook #'(lambda () (interactive) (org-agenda-redo t)))

(define-key global-map (kbd "C-x f") 'counsel-find-file)
(kill-buffer "*scratch*")
(global-set-key (kbd "C-<return>") 'cua-rectangle-mark-mode)
(define-key global-map (kbd "C-S-f") #'replace-regexp-visual)
(define-key cua-global-keymap (kbd "C-<return>") #'org-cua-rectangle-conflict-resolving)
(setq debug-on-error nil)

(define-key global-map (kbd "M-?") 'chunyang-elisp-function-or-variable-quickhelp)
(define-key help-mode-map (kbd "<DEL>") 'help-go-back)
(define-key help-mode-map (kbd "<M-left>") 'help-go-back)
(define-key help-mode-map (kbd "<M-right>") 'help-go-forward)

;;(define-key global-map (kbd "C-x 8") 'xref-find-definitions-other-window)
(define-key global-map (kbd "<f1>") #'my-help)

;;old params:calid sss
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(server-start)

(define-key global-map (kbd "C-x d") 'counsel-dired)
(define-key global-map (kbd "C-x C-f")
  (lambda () (interactive) (message "not defined))"))
  )
(define-key emacs-lisp-mode-map (kbd "M-<right>") 'forward-sexp)
(define-key emacs-lisp-mode-map (kbd "M-<left>") 'backward-sexp)
(define-key global-map (kbd "C-x C-x") 'cua-exchange-point-and-mark)
(define-key org-mode-map (kbd "M-q") 'org-fill-paragraph)
;;(define-key global-map (kbd "M-q") 'avy-goto-char)
(define-key global-map (kbd "C-x g") 'revert-buffer)

(define-prefix-command 'jump-map)
(global-set-key (kbd "C-j") 'jump-map)
(define-key jump-map (kbd "v") 'find-variable)
(define-key jump-map (kbd "f") 'find-function)

(define-key global-map (kbd "M-f") 'hs-toggle-hiding)
(define-key org-mode-map (kbd "M-i") 'org-time-stamp-inactive)
(define-key org-mode-map (kbd "M-l") 'org-insert-link)
(define-key global-map (kbd "C-x m") 'counsel-bookmark)


(global-set-key [remap mouse-kill] nil)
(global-set-key [remap mouse-kill-secondary] nil)


;;(define-key global-map (kbd "C-c v") 'org-ql-view)
;;(define-key global-map (kbd "C-c s") 'org-ql-search)

;;(define-key org-mode-map (kbd "<RET>") 'unpackaged/org-return-dwim)

(with-eval-after-load "org-ql-view"
  (define-key org-ql-view-map (kbd "r") 'org-ql-view-todo)
  )
(define-key global-map (kbd "C-x C-s")
  (lambda () (interactive) (message "not defined))"))
  )
(define-key org-src-mode-map (kbd "M-n") #'org-edit-src-exit)

(define-key org-mode-map (kbd "C-<right>") #'my/org-move-right)
(define-key org-mode-map (kbd "C-<left>") #'my/org-move-left)
(define-key global-map (kbd "<mouse-3>") nil)
(define-key global-map (kbd "M-c") #'comment-dwim)

(define-key global-map (kbd "C-M-<right>") #'my-jump-to-next)
(define-key global-map (kbd "C-M-<left>") #'my-jump-to-prev)

(set-face-attribute 'mode-line nil :font "Ubuntu Mono 10")
;;(set-face-attribute 'default nil :font "Ubuntu Mono 10")
;;(set-face-attribute 'default nil :height 90)
;;(set-face-attribute 'default nil :font "Calibri 12")
;; (setq helm-ff-default-directory (concat data-folder-path "Sync/org/"))

(define-key global-map (kbd "C-r") #'er-sudo-edit)

(define-key global-map (kbd "C-x 5 2") #'my-make-frame-command)

(define-key global-map (kbd "C-<backspace>") 'backward-delete-word)
(define-key global-map (kbd "C-<del>") 'delete-word)
;;If you use CUA mode, you might want to register these functions as movements, so that shift-<key> works properly:

;;(dolist (cmd '(delete-word backward-delete-word))
;;(put cmd 'CUA 'move))

(define-key global-map (kbd "M-<up>") #'bm-previous)
(define-key global-map (kbd "M-<down>") #'bm-next)
(define-key global-map (kbd "M-b") #'bm-toggle)
(define-key global-map (kbd "M-q") #'fill-paragraph)

;;(use-package highlight-indent-guides
;; :defer t
;;)
;;(add-to-list 'load-path "~/.emacs.d/highlight-indent/")
;;(add-hook 'python-mode-hook 'highlight-indent-guides-mode)

(define-key global-map (kbd "C-l") #'copy-line)

(beacon-mode 1)

(define-key global-map (kbd "C-M-f") #'ag)
(define-key global-map (kbd "C-x e") #'eval-last-sexp)
(setq visible-bell t)

;;(fringe-mode '(8 . 0))
(use-package fringe
  :after (flycheck)
  :hook ((flycheck-mode) . (lambda () (fringe-mode (cons 8 0))))
  )
(define-key global-map (kbd "C-c c") #'counsel-org-capture)
(define-key global-map (kbd "M-<backspace>") #'sp-splice-sexp)

(global-set-key [remap mark-sexp]
                'my/mark-sexp)

;;(advice-add 'dired-mark-read-file-name :after 'ivy-next-history-element)
(define-key emacs-lisp-mode-map (kbd "M-q") 'indent-region)

(global-so-long-mode);; for long-line files performance improvement


;; orgmode auto completion
(defun add-pcomplete-to-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(add-hook 'org-mode-hook #'add-pcomplete-to-capf)

(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)
			  (if(and (buffer-narrowed-p) (string-match "/"  (buffer-name)))
			      (switch-to-buffer (car (split-string (buffer-name) "/")))
			    ;;(switch-to-buffer "*Messages*")

			    )
			  )
		)
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)
			  (if(and (buffer-narrowed-p) (string-match "/"  (buffer-name)))
			      (switch-to-buffer(car (split-string (buffer-name) "/")))
			    ;;(switch-to-buffer "*Messages*")
			    ))
		)

(setq scroll-step 1)
(setq scroll-conservatively 150)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

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

(use-package smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
					; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(use-package reverse-im
  :ensure t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))

;;(use-package org-caldav
;;  :init
;;  (setq org-caldav-url "http://localhost/nextcloud/remote.php/dav/calendars/zelenyeshtany"
;;	org-caldav-calendar-id "mycal"
;;	org-caldav-inbox (concat my-org-directory "inboxcal.org")
;;	org-caldav-files '((concat my-org-directory "todos.org") (concat data-folder-path "Sync/org/notes.org") (concat data-folder-path "Sync/org/habits.org"))
;;	org-icalendar-timezone "Kazakhstan/Almaty"
;;	org-icalendar-use-deadline '(event-if-not-todo event-if-todo)
;;	org-icalendar-use-scheduled '(todo-start event-if-todo )
;;	org-caldav-skip-conditions '('todo '("DONE") 'nottodo '("TODO") 'notscheduled) ;;syntax cheat sheet => org-agenda-skip-if
;;	org-caldav-debug-level 1
;;	)
;;  )
;;

(use-package org-download
  :ensure t
  :after (org)
  :hook ((dired-mode org-mode) . org-download-enable)
  :bind (:map global-map
	      ("C-x p" . 'org-download-screenshot)
	      )
  :init
  (setq org-download-method 'directory)
  (setq-default org-download-image-dir (concat my-org-directory "img/"))
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

(setq org-board-new 1)

(use-package ob-mermaid
  :defer t
  )
(setq ob-mermaid-cli-path "/home/zelenyeshtany/node_modules/.bin/mmdc")

(use-package org-agenda
  :commands (org-agenda)  
  :after (org)
  :bind (:map org-agenda-mode-map
	      ("r" . 'org-agenda-todo)
	      ("t" . 'counsel-org-tag-agenda)
	      ("C-r" . 'org-agenda-redo-all)
	      ("e" . 'org-agenda-redo)
	      ("C-c n" . 'org-agenda-add-note)
	      ("C-s" . 'org-save-all-org-buffers)
	      ("s" . 'org-agenda-schedule)
	      ("C-<down>" . 'org-agenda-later)
	      ("C-<up>" . 'org-agenda-earlier)
	      )
  )

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  )

;;(add-to-list 'load-path "~/.emacs.d/org-gcal/")
;;(use-package org-gcal
;;:defer t
;;)
;;(setq org-gcal-client-id "333013805673-varidbf7tnsge2tv22u3af6admtc60qv.apps.googleusercontent.com"
;;      org-gcal-client-secret "KOKdhQLYYJkil_zE3ufDUCa1"
;;      org-gcal-file-alist '(("1emonvv6qe3lm3tto7huqr8hh8@group.calendar.google.com" . (concat my-org-directory "gcal.org"))))

(use-package ivy
  :diminish ivy-mode
  :config
  (ivy-mode 1)  
  )

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
;;(define-key global-map (kbd "C-c C-c") 'ace-jump-mode)

;; enable a more powerful jump back function from ace jump mode
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

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

(use-package ace-window
  :commands (ace-window)
  :bind (
	 ("M-o" . 'ace-window)
	 )
  )
(setq aw-scope 'frame)

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
  :commands (counsel-M-x
	     counsel-org-capture
	     counsel-package
	     counsel-describe-symbol
             counsel-bookmark)
  :after (ivy)
  :diminish counsel-mode
  :config
  (counsel-mode 1)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-initial-inputs-alist
	(quote
	 ((counsel-minor . "^+")
	  (counsel-package . "^+")
	  (counsel-org-capture . "")
	  (counsel-M-x . "")
	  (counsel-describe-symbol . ""))))
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

(use-package company
  :defer t
  :hook ((emacs-lisp-mode org-mode) . company-mode)
  :diminish company-mode
  )

(setq json-array-type 'vector)
(setq json-encoding-pretty-print nil)

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

;; time tracking
(use-package org-mru-clock
  :ensure t
  :defer t
  :bind (
	 :map org-mode-map
	 ("C-c C-x C-i" . 'my/sound-while-clocking-in)
	 :map global-map
	 ("C-c C-x C-i" . 'my/sound-while-clocking-in)
	 )
  :commands (org-mru-clock-in org-mru-clock-select-recent-task)
  :custom
  (org-mru-clock-how-many 50)
  ;;;;;;;;;;;;;;; Also possible: #'ido-completing-read
  (org-mru-clock-completing-read #'ivy-completing-read)
  :config
  (defun org-mru-clock--find-clocks (file)
  "Search through the given FILE and find all open clocks."
  (let ((buf (or (get-file-buffer file)
                 (find-file-noselect file)))
	;; original function has a different regex which isnt appropriate for me and cause an error
        (org-clock-re (concat "^ *" org-clock-string " *\\(\\[[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\} ?[^\r\n>]*?\\]\\)"))
        clocks)
    (with-current-buffer buf
      (org-with-wide-buffer
       (save-excursion
         (goto-char (point-min))
         (while (re-search-forward org-clock-re nil t)
           (when (org-mru-clock--predicate)
             (push (cons (copy-marker (match-end 1) t)
                         (org-time-string-to-time (match-string 1)))
                   clocks))))))
    clocks))
  )
;; /time tracking

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
  :custom
  (org-mind-map-engine "dot")
  (org-mind-map-include-text t)
  ;; Default. Directed Graph
  ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
  ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
  ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
  ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
  ;; (setq org-mind-map-engine "twopi")  ; Radial layouts
  ;; (setq org-mind-map-engine "circo")  ; Circular Layout
  )

(use-package redshift
  :bind (
	 ("C-}" . 'redshift-increase-temp)
	 )
  )

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

;; (use-package pdf-tools
;;   :init
;;   (use-package pdf-sel
;;:defer t
;;)
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

(use-package ag
  :ensure t
  :commands (ag)
  )

(defun mytest (&optional arg)
  "docstring"
  (interactive "P")
  (message "%s" (eq arg nil))

  )

;; play sound every n second while clocking in
(defun my/sound-while-clocking-in (&optional arg)
  "Run `org-clock-in' with interminent beeping.

This function runs timer that runs `beep'
terminal command periodically.

If ARG is non-nil, clock-in without beeping at all.
Useful when you're listening lectures, podcasts or whatever.
  "
  (interactive "P")
  ;;(run-with-timer 0 (* 30 60) 'recentf-save-list)
  ;;(play-sound-file "/org/timer-sounds/bell.wav")
  ;;org-clock-clocking-in
  (org-mru-clock-in)
  (when (not arg)
    (setq my/clocking-in-timer
          ;; run with 3 seconds delay at start and repeat every 30secs
          (run-with-timer 3 30
                          ;;'play-sound-file "/org/timer-sounds/bell.wav" ;; archive
                          'shell-command-to-string "
  for i in `seq 1 1`; do
      beep -f 3000 -d 20 -l 80
  done
  "))))
(defun my/delete-clocking-in-timer ()
  "docstring"
  ;;(interactive)
  (when (boundp 'my/clocking-in-timer) (cancel-timer my/clocking-in-timer))
  )
;;(add-hook 'org-clock-in-hook 'my/sound-while-clocking-in)
(add-hook 'org-clock-out-hook 'my/delete-clocking-in-timer)
(add-hook 'org-clock-cancel-hook 'my/delete-clocking-in-timer)

;; /play sound every n second while clocking in

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; LSP-MODE
;; (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
;;     projectile hydra flycheck company avy which-key helm-xref dap-mode))

;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
;;   (package-refresh-contents)
;;   (mapc #'package-install package-selected-packages))

;; ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
;; (helm-mode)
;; (use-package helm-xref
;;:defer t
;;)
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
;;   (use-package dap-cpptools
;;:defer t
;;)
;;   (yas-global-mode))
;; /LSP-MODE

;; LSP NEW
;;(add-to-list 'load-path "~/.emacs.d/emacs-ccls/")

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-modeline
  :after (lsp-mode)
  )
(use-package lsp-headerline
  :after (lsp-mode)
  )
;; To defer LSP server startup (and DidOpen notifications)
;; until the buffer is visible you can use lsp-deferred instead of lsp
(use-package lsp-mode
  :defer t
  :hook (
         ((python-mode c++-mode c-mode) . lsp-deferred)
         ;;(lsp-mode . lsp-headerline-breadcrumb-mode)

         )
  :commands (lsp lsp-deferred)
  :custom
  (lsp-headerline-breadcrumb-enable t)
  (lsp-clients-clangd-executable "/usr/bin/clangd-11")
  (add-to-list 'lsp-enabled-clients 'clang)
  (add-hook 'c-mode--hook #'lsp-clangd-c-enable)
  (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
  (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable))

;; optionally
(use-package lsp-ui-sideline
  :after (lsp-ui)
  )

(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands
  lsp-treemacs-errors-list
  lsp-treemacs-symbols
  )



;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))
(use-package company-lsp
  :defer t
  :ensure t
  )
;; (use-package lsp-jedi ;; python
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          ;;(lsp); or lsp-deferred
			  (lsp-deferred)
			  (add-to-list 'lsp-enabled-clients 'pyright)
			  )))
;; / LSP NEW

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))

(use-package flycheck
  :after (lsp-mode)
  :hook (
	 ;;(lsp-mode cc-mode) . flycheck-mode
	 (cc-mode . (lambda()
		       (flycheck-mode)
		       (setq flycheck-checker 'c/c++-clang)))
	 (c++-mode . (lambda()
		       (flycheck-mode)
		       (setq flycheck-checker 'c/c++-clang)))
	 (python-mode . (lambda() (flycheck-mode) (setq flycheck-checker 'python-pyright)))
	 )
  ;;:custom
  ;;(flycheck-checker 'c/c++-clang)
  )


;;emacs / ggtags / config to make GNU Global see cpp system header files
;; added to ~/.bashrc also
;;(setenv "GTAGSLIBPATH" (concat (getenv "HOME")"/.gtags/"))
;; (use-package ccls
;;   :defer t
;;   :init
;;   (setq ccls-executable "/usr/local/bin/ccls")
;;   :hook ((c-mode c++-mode objc-mode cuda-mode) .
;;          (lambda () (use-package ccls
;;:defer t
;;) (lsp-deferred)
;;            (add-to-list 'lsp-enabled-clients 'ccls)
;;            ))
;;   )

(use-package semantic
  :hook ((c++-mode c-mode) . semantic-mode)
  :config
  (semantic-add-system-include "/usr/local/include")
  (semantic-add-system-include "/usr/include")
  (semantic-add-system-include "/usr/include/x86_64-linux-gnu/qt5/QtWidgets/")
  )

;;(define-key c++-mode-map (kbd "C-j") 'semantic-ia-fast-jump)

(use-package cc-mode
   :defer t
   :bind (:map
          c++-mode-map
          ("C-j" . 'semantic-ia-fast-jump)
          ("M-<left>" . 'backward-sexp)
          ("M-<right>" . 'forward-sexp)
          :map
          c-mode-map
          ("C-j" . 'semantic-ia-fast-jump)
          ("M-<left>" . 'backward-sexp)
          ("M-<right>" . 'forward-sexp)
          )
   )

;; However, it is important to reset it eventually. Not doing so will
;; cause garbage collection freezes during long-term interactive use.
;; Conversely, a gc-cons-threshold that is too small will cause stuttering.
;; We use 16mb as our default
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216 ; 16mb
          gc-cons-percentage 0.1)))


;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
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
