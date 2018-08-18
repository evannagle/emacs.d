;;; packs.el --- Emacs init file.

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

(defvar my/.emacs.d/mods (expand-file-name "mods" user-emacs-directory))
(defvar my/.emacs.d/init.el (expand-file-name "init.el" my/.emacs.d/))
(defvar my/package-template (expand-file-name "template.el.m4" my/.emacs.d/mods))
(defvar my/packs/bookmarks '())

(add-to-list 'my/packs/bookmarks `("mods" ,my/.emacs.d/mods))
(add-to-list 'my/packs/bookmarks `("e" ,my/.emacs.d/))
(add-to-list 'my/packs/bookmarks `("i" ,my/.emacs.d/init.el))

(defun my/packs/init ()
  "Find the init.el file where packs are loaded."
  (interactive)
  (find-file my/.emacs.d/init.el))

(defun my/packs/ensure (package)
  "Ensure that a package has been installed"
  (unless (require package nil 'noerror)
    (package-install package)))

(defun my/packs/list ()
  (let ((files (directory-files my/.emacs.d/mods nil ".el$"))
	(packs '()))
    (dolist (file files)
      (unless (string= (substring file 0 2) ".#")
	(add-to-list 'packs (substring file 0 -3))))
    packs))

(defun my/packs/pick ()
  (message "%s" (ivy-completing-read "My Package: " (my/packs/list))))

(defun my/packs/module-template-buffer ()
  "Get contents of my/package-template as a string"
  (with-temp-buffer
    (insert-file-contents my/package-template)
    (buffer-string)))

(defun my/packs/new (name)
  "Create a new module"
  (interactive "sName: ")
  (let* ((name.el (concat name ".el"))
	 (file (expand-file-name name.el my/.emacs.d/mods))
	 (template (my/packs/module-template-buffer))
	 (template (replace-regexp-in-string "$name" name template))
	 (template (replace-regexp-in-string "$file" name.el template))
	 (template (replace-regexp-in-string "$description" (format "Configuration for the %s package" name) template)))
    (unless (file-exists-p file)
      (write-region template nil file nil))
    (my/packs/conf name)))
  
(defun my/packs/inst (package)
  "Install a package and create a config template"
  (interactive "sPackage: ")
  (if (stringp package)
      (setq package (intern package)))
  (my/packs/ensure 'use-package)
  (my/packs/ensure package)
  (my/packs/new (symbol-name package))
  (my/packs/conf (symbol-name package)))

(defun my/packs/conf (&optional package)
  "Configure a module"
  (interactive)
  (if (not package)
      (setq package (my/packs/pick)))
  (let* ((package.el (concat package ".el"))
	 (file (expand-file-name package.el my/.emacs.d/mods)))
    (find-file file)
    (goto-line 21)))
  
(defun my/packs/load (&rest mods)
  "Load one or more modules from the .emacs.d/mods folder"
  (dolist (mod mods)
    (let* ((module-name (symbol-name mod))
	   (module-path (expand-file-name module-name my/.emacs.d/mods))
	   (module-symbol (intern (format "my/%s" module-name))))
      (require module-symbol module-path nil))))

(defun my/packs/leap (mods-str)
  (interactive "sPackages: ")
  (let ((mods (split-string mods-str " ")))
  (dolist (mod mods)
    (let* ((mark (assoc mod my/packs/bookmarks))
	   (relfile (car (cdr mark)))
	   (file (and relfile (expand-file-name relfile))))
      (if file
	  (find-file file)
	(my/packs/conf mod))))))

(provide 'my-packs)

;;; packs.el ends here
