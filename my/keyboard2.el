;;; keyboard2.el --- Configuration for the keyboard2 package

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

(defun my/keyboard2/e ()
  (interactive)
  (find-file my/.emacs.d/))

(defun my/keyboard2/i ()
  (interactive)
  (find-file my/.emacs.d/init.el))

(defun my/keyboard2/o ()
  (interactive)
  (find-file my/org))

(defun my/keyboard2/p ()
  (interactive)
  (find-file my/.emacs.d/mods))

(defun my/keyboard2/r ()
  (interactive)
  (find-file (expand-file-name "refile.org" my/org)))

(defun my/keyboard2/t ()
  (interactive)
  (find-file (expand-file-name "todo.org" my/org)))

(defun my/keyboard2/u ()
  (interactive)
  (org-move-item-up))

(defun my/keyboard2/x ()
  (interactive)
  (my/org/archive-item))

(defvar my/keyboard2/inputs "eioprtux")

(dotimes (i (length my/keyboard2/inputs))
  (let* ((code (aref my/keyboard2/inputs i))
	 (key (byte-to-string code))
	 (seq (format "C-M-s-%s" key))
	 (func-name (format "my/keyboard2/%s" key))
	 (func (intern func-name)))
    (global-set-key (kbd seq) func)))

(provide 'my/keyboard2)

;;; keyboard2.el ends here
