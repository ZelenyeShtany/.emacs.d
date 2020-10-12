;;; 0blayout-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "0blayout" "0blayout.el" (0 0 0 0))
;;; Generated autoloads from 0blayout.el

(autoload '0blayout-add-keybindings-with-prefix "0blayout" "\
Add 0blayout keybindings using the prefix PREFIX.

\(fn PREFIX)" nil nil)

(defvar 0blayout-mode nil "\
Non-nil if 0blayout mode is enabled.
See the `0blayout-mode' command
for a description of this minor mode.")

(custom-autoload '0blayout-mode "0blayout" nil)

(autoload '0blayout-mode "0blayout" "\
Handle layouts with ease

If called interactively, enable 0blayout mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "0blayout" '("0blayout-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; 0blayout-autoloads.el ends here
