;;; hours.el --- Handle hours.

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

(defvar my/org "~/Dropbox/Apps/Beorg")
(defvar my/hours (expand-file-name "hours" my/org))
(defvar org-capture-templates '())

(add-to-list
 'org-capture-templates
 '("h" "Hours" entry (file my/hours/find-client-file)
   "* %^{description} \n  CLOCK:  => %^{Hours}\n  :DATE:  %T"))

(defun my/hours/clients ()
  "Returns a list of clients as defined by subdirs in my/hours"
  (let ((files (directory-files my/hours nil ".org$"))
	(clients '()))
    (dolist (file files)
      (unless (or (string= file "report.org")
		  (string= (substring file 0 2) ".#"))
	(add-to-list 'clients (substring file 0 -4))))
    clients))

(defun my/hours/find-client ()
  "Select a client from the list of all clients."
  (my/hours/find-client-ivy))

(defun my/hours/find-client-ido ()
  "Select a client from the list of all clients using ivy."
  (let ((choices (my/hours/clients)))
    (message "%s" (ido-completing-read "Client: " choices))))

(defun my/hours/find-client-ivy ()
  "Select a client from the list of all clients using ivy."
  (let ((choices (my/hours/clients)))
    (message "%s" (ivy-completing-read "Client: " choices))))

(defun my/hours/find-client-file ()
  "Find the file where a client's hours are logged."
  (let ((client (my/hours/find-client)))
    (expand-file-name (concat client ".org") my/hours)))

(defun my/hours/report ()
  "Open the report."
  (interactive)
  (find-file (expand-file-name "report.org" my/hours)))

(defun my/hours/client (&optional client)
  "Open the hours report for a specific client."
  (interactive)
  (if (not client)
      (setq client (my/hours/find-client)))
  (find-file (expand-file-name (concat client ".org") my/hours)))

(provide 'my/hours)

;;; hours.el ends here
