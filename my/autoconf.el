;;; autoconf.el --- Autogenerated list of installed packages.

;; Copyright (C) 2018 Evan Nagle

;; Author: Evan Nagle <evan@mantle.co>
;; URL: https://github.com/evannagle/my-emacs
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(provide 'using)

;;; autoconf.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f540efec38befb1a2f37e98831d9ba5b8cc495b4dea75c499dfbe7d8c594be9d" "766c5700d551f8a3bbc3be8eb4c1e3329febcb7ba572c9ee2e83cb12e18854a8" default)))
 '(epg-gpg-program "/usr/local/Cellar/gnupg/2.2.3/bin/gpg")
 '(mac-option-modifier (quote (:ordinary meta :function meta :mouse meta)))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("z" "Next items on agenda "
      ((tags "URGENT"
	     ((org-agenda-overriding-header "Urgent Tasks")))
       (todo "NEXT"
	     ((org-agenda-overriding-header "Next Tasks on Agenda")))
       (agenda ""
	       ((org-deadline-warning-days 2)
		(org-agenda-span
		 (quote day))
		(org-agenda-overriding-header "Upcoming Deadlines"))))
      nil nil))))
 '(org-agenda-files
   (quote
    ("/Users/evannagle/Dropbox/Apps/Beorg/learn/learn.org" "/Users/evannagle/Dropbox/Apps/Beorg/tasks.org" "/Users/evannagle/Dropbox/Apps/Beorg/agenda.org")))
 '(package-selected-packages
   (quote
    (fzf jinja2-mode evil-smartparens smartparens hydra org-mu4e evil-magit flx-ido flx evil-collection mu4e pass "ob-sh" ob-sh coffee-mode elisp-def evil-escape exec-path-from-shell whole-line-or-region evil web-mode php-mode less-css-mode gitignore-mode rainbow-delimiters projectile org-bullets magit helpful expand-region diminish counsel company ag ace-window benchmark-init slime use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
