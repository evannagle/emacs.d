;;; speed.el --- Profile load speed.

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

(my/packs/ensure 'benchmark-init)

(defun my/speed/garbage ()
  "Tells how long it took for Emacs to load up, and how many
  garbage collections were performed."
  (interactive)
  (let*
      ((delta (time-subtract after-init-time before-init-time))
       (delta-time (float-time delta))
       (delta-timef (format "%.2fs" delta-time)))
    (message "ok: Emacs loaded in %s with %d garbage collections." delta-timef gcs-done)))

(defun my/speed/benchmark ()
  "Shows performance broken down by plugins and subroutines.
  Requires the benchmark-init plugin."
  (require 'benchmark-init)
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(defun my/speed/benchmark-report ()
  "Show the results of al/profiling/benchmark"
  (interactive)
  (benchmark-init/show-durations-tree))

(provide 'my/speed)

;;; FILE ends here
