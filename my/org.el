;;; org.el --- Org Mode customization.

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
(defvar org-structure-template-alist '())

;; agenda files
(setq org-agenda-files '())

(add-to-list 'org-agenda-files (expand-file-name "agenda.org" my/org))
(add-to-list 'org-agenda-files (expand-file-name "tasks.org" my/org))
(add-to-list 'org-agenda-files (expand-file-name "learn/learn.org" my/org))

(setq org-enforce-todo-dependencies t)
(setq org-outline-path-complete-in-steps nil) 
(setq org-src-tab-acts-natively t)
(setq org-track-ordered-property-with-tag t)
(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
(setq org-refile-use-outline-path t)         

;; https://www.youtube.com/watch?v=nUvdddKZQzs&index=9&list=PLVtKhBrRV_ZkPnBtt_TD1Cs9PJlU0IIdE
(setq org-log-into-drawer "LOGBOOK")

;; org flags
(setq org-log-done t)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-file-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; support languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (C . t)
   (emacs-lisp . t)
   (js . t)
   (perl . t)
   (python . t)
   (sed . t) ;; used to be (sh .t )
   (shell . t) ;; used to be (sh .t )
   (sql . t)))

(defun my/org/file (file)
  "Load an org file from org folder"
  (interactive "s\Org file: ")
  (let*
      ((file.org (concat file ".org"))
       (file-path (expand-file-name file.org my/org)))
    (set-window-buffer nil (find-file file-path))))

(defun my/org/add-template (letter lang)
  "Add an org template for a given language"
  (let ((code (format "#+BEGIN_SRC %s\n?\n#+END_SRC" lang)))
    (add-to-list 'org-structure-template-alist
		 (list letter code))))

(defun my/org/archive-item ()
  "Mark a task as done and archive it."
  (interactive)
  (org-todo "DONE")
  (org-archive-subtree-default))

(defun my/org/archive-item-with-hours ()
  "Mark a task as done and associate hours with its completion"
  (interactive)
  (my/org/archive-item)
  (org-capture nil "h"))

(my/org/add-template "C" "C")
(my/org/add-template "B" "sh")
(my/org/add-template "E" "emacs-lisp")
(my/org/add-template "P" "perl")
(my/org/add-template "V" "viml")
(my/org/add-template "S" "sed")
(my/org/add-template "W" "awk")

(provide 'my/org)

;;; org.el ends here
