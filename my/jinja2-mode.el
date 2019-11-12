;;; jinja2-mode.el --- Configuration for the jinja2-mode package

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

(use-package jinja2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
  (add-to-list 'auto-mode-alist '("\\.jinja2\\'" . jinj2-mode))
  :ensure t)

(provide 'my/jinja2-mode)

;;; jinja2-mode.el ends here
