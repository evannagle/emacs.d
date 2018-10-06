;;; buffers.el --- Configuration for the buffers package

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

(defun my/buffers/kill-quick ()
  "Save buffer if needed and kill it."
  (interactive)
  (if (buffer-modified-p)
      (save-buffer))
  (kill-buffer nil))

(defun my/buffers/clean ()
  "Remove unmodified buffers."
  (interactive)
  (save-window-excursion
    (dolist (buffer (buffer-list))
      (and (buffer-live-p buffer)
	   (not (buffer-modified-p buffer))
	   (kill-buffer buffer)))))

(defun my/buffers/revert-current ()
  "Kill and reload the current buffer"
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))


(defun my/buffers/reload-current ()
  "Kill and reload the current buffer"
  "Reload buffer without confirmation."
  (interactive)
  (save-buffer)
  (my/buffers/revert-current))

(defun my/buffers/switch-to-scratch ()
  "Open the scratch buffer"
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun my/buffers/switch-to-messages ()
  "Open the messages buffer"
  (interactive)
  (switch-to-buffer "*Messages*"))

(provide 'my/buffers)

;;; buffers.el ends here
