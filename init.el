;;; init.el --- Emacs init file.
;;; -*- lexical-binding: t -*-

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

(setq package--init-file-ensured t)
(setq my/.emacs.d/ user-emacs-directory)
(setq my/.emacs.d/mods (expand-file-name "my" my/.emacs.d/))
(setq my/.emacs.d/data (expand-file-name "data" my/.emacs.d/))
(setq my/packs.el (expand-file-name "packs.el" my/.emacs.d/mods))
(setq my/org "~/Dropbox/Apps/Beorg")

(load my/packs.el)

(my/packs/load
 ;; core packs
 'melpa
 'backups
 'data-tuck
 'quiet
 'dechrome
 'screen
 'os
 'line
 'nums
 'gpg
 'theme
 'org
 'abbrevs
 'slime
 'speed
 
 ;; core elpa plugs
 'ace-window
 'ag
 'company
 'counsel
 'avy
 'ivy
 
 ;; nice elpa plugs
 'diminish
 'expand-region
 'helpful
 'magit
 'org-bullets
 'projectile
 'rainbow-delimiters

 ;; modes
 'gitignore-mode
 'less-css-mode
 'php-mode
 'php-docs
 'web-mode
 
 ;; fun stuff
 'split
 'hours)

;;; init.el ends here
