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

;; key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c L") 'org-insert-link-global)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "s-O") 'my/org/file)
(global-set-key (kbd "M-A") 'my/org/archive-item)

;; agenda files
(setq org-agenda-files '())

(add-to-list 'org-agenda-files (expand-file-name "todo.org" my/org))
(add-to-list 'org-agenda-files (expand-file-name "learn.org" my/org))
(add-to-list 'org-agenda-files (expand-file-name "links.org" my/org))

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

(my/org/add-template "B" "sh")
(my/org/add-template "E" "emacs-lisp")
(my/org/add-template "P" "perl")
(my/org/add-template "W" "awk")

(provide 'my/org)

;;; org.el ends here
