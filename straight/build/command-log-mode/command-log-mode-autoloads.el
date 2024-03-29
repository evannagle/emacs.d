;;; command-log-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "command-log-mode" "command-log-mode.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from command-log-mode.el

(autoload 'command-log-mode "command-log-mode" "\
Toggle keyboard command logging.

If called interactively, enable Command-Log mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'clm/toggle-command-log-buffer "command-log-mode" "\
Toggle the command log showing or not.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "command-log-mode" '("clm/" "command-log-mode-" "global-command-log-mode")))

;;;***

(provide 'command-log-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; command-log-mode-autoloads.el ends here
