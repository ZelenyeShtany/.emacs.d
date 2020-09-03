;;; counsel-ffdata-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "counsel-ffdata" "counsel-ffdata.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from counsel-ffdata.el

(autoload 'counsel-ffdata-firefox-bookmarks "counsel-ffdata" "\
Search your Firefox bookmarks.

If FORCE-UPDATE? is non-nil, force update database and cache before searching.

\(fn &optional FORCE-UPDATE\\=\\?)" t nil)

(autoload 'counsel-ffdata-firefox-history "counsel-ffdata" "\
Search your Firefox history.

If FORCE-UPDATE? is non-nil, force update database and cache before searching.

\(fn &optional FORCE-UPDATE\\=\\?)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "counsel-ffdata" '("counsel-ffdata-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; counsel-ffdata-autoloads.el ends here
