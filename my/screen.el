;;; screeen.el -- Manage screen size

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

(defun my/screen/max ()
  "Maximize the screen."
  (interactive)
  (setq frame-resize-pixelwise t)
  (toggle-frame-maximized))

(defun my/screen/full ()
  "Maximize Emacs to full screen."
  (interactive)
  (setq frame-resize-pixelwise t)
  (toggle-frame-fullscreen))

(defun my/screen/left ()
  "Set Emacs to half screen on the left."
  (interactive)
  (setq frame-resize-pixelwise t)
  (let ((frame (selected-frame))
      (one-half-display-pixel-width (/ (display-pixel-width) 2)))
  (set-frame-width frame one-half-display-pixel-width nil 'pixelwise)
  (set-frame-position frame 0 0)))

(defun my/screen/right ()
  "Set Emacs to half the screen on the right."
  (interactive)
  (setq frame-resize-pixelwise t)
  (let ((frame (selected-frame))
      (one-half-display-pixel-width (/ (display-pixel-width) 2)))
  (set-frame-width frame one-half-display-pixel-width nil 'pixelwise)
  (set-frame-position frame (- (display-pixel-width) (frame-pixel-width)) 0)))

(my/screen/max)

(provide 'my/screen)

;;; maximize.el ends here
