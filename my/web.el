;;; web.el --- Configuration for the web package

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

(defun my/web/save-buffer ()
  "Auto-indent file, save, and refresh browser"
  (interactive)
  (evil-normal-state)
  (my/buffer/autoindent)
  (save-buffer)
  (my/shell-cmd/pick-and-run "refresh-chrome"))

(provide 'my/web)

;;; web.el ends here
