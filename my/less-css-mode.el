;;; less-css-mode.el --- Configuration for the less-css-mode package

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

(use-package less-css-mode
  :ensure t)

(defun my/css/col ()
  "Paste hex color into a color property"
  (interactive)
  (insert "color: ")
  (clipboard-yank)
  (insert ";"))

(defun my/css/bg ()
  "Paste hex color into a background property"
  (interactive)
  (insert "background: ")
  (clipboard-yank)
  (insert ";"))

(provide 'my/less-css-mode)

;;; less-css-mode.el ends here
