;;; backups.el --- Move backups to a temp directory, and keep more backup versions.

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

(defvar my/backup-dir temporary-file-directory)
(defvar my/backup-count 6)
(defvar my/backup-dir temporary-file-directory)

(setq delete-by-moving-to-trash t)

(setq backup-directory-alist `((".*" . ,my/backup-dir))
      backup-by-copying t
      auto-save-file-name-transforms `((".*" ,my/backup-dir t))
      auto-save-list-file-prefix nil
      delete-old-versions t
      kept-new-versions my/backup-count
      kept-old-versions 1
      version-control 1)

(provide 'my/backups)

;;; backups.el ends here
