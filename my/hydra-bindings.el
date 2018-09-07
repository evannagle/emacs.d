;;; hydra-bindings.el --- Configuration for the hydra-bindings package

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

(defhydra hydra-chrome-tab (global-map "<f2>")
  "Chrome Tab"
  ("a" (my/web/select-tab 1))
  ("s" (my/web/select-tab 2))
  ("d" (my/web/select-tab 3))
  ("f" (my/web/select-tab 4))
  ("j" (my/web/select-tab 5))
  ("k" (my/web/select-tab 6))
  ("l" (my/web/select-tab 7))
  (";" (my/web/select-tab 8))
  ("r" (my/web/refresh)))

(provide 'my/hydra-bindings)

;;; hydra-bindings.el ends here
