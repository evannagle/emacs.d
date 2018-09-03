;;; shell-cmd.el --- Configuration for the shell-cmd package

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

(defvar my/shell-cmd/dir (expand-file-name "sh" my/.emacs.d/))

(defun my/shell-cmd/list (dir)
  (let ((files (directory-files dir nil ".sh$"))
	(found '()))
    (dolist (file files)
      (unless (string= (substring file 0 2) ".#")
	(add-to-list 'found (substring file 0 -3))))
    found))

(defun my/shell-cmd/conf (&optional script)
  "Edit a bash script"
  (interactive)
  (unless script
    (setq script (my/shell-cmd/pick my/shell-cmd/dir)))
  (find-file script)
  (goto-line 3))

(defun my/shell-cmd/pick (dir)
  (let ((script (message "%s" (ivy-completing-read "Script: " (my/shell-cmd/list dir)))))
    (concat dir "/" script ".sh")))

(defun my/shell-cmd/run (&optional script)
  "Run a shell script"
  (interactive)
  (unless script
      (setq script (my/shell-cmd/pick my/shell-cmd/dir)))
  (shell-command-to-string script))
   
(defun my/shell-cmd/pick-and-run (script)
  (setq script (concat my/shell-cmd/dir "/" script ".sh"))
  (my/shell-cmd/run script))

(provide 'my/shell-cmd)

;;; shell-cmd.el ends here
