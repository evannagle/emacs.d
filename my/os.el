;;; os.el --- Helper functions for OSX.

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

(setq mac-command-modifier 'super)

(global-set-key (kbd "s-v") 'whole-line-or-region-yank)
(global-set-key (kbd "s-c") 'whole-line-or-region-kill-ring-save)
(global-set-key (kbd "s-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "s-s") 'swiper-all)
(global-set-key (kbd "s-r") 'swiper-all-query-replace)
(global-set-key (kbd "s-.") 'save-buffer)
(global-set-key (kbd "s-b") 'bookmark-jump)
(global-set-key (kbd "s-j") 'al/jump)

(provide 'my/os)

;;; osx.el ends here
