;;; theme.el --- A light theme.

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

(setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))

(defvar my/theme/graphic 'dracula)
(defvar my/theme/terminal 'material-elvis)

(set-frame-font "Menlo-12" t t)

(if (display-graphic-p)
    (load-theme my/theme/graphic)
  (load-theme my/theme/terminal))

(provide 'my/theme)

;;; skin.el ends here
