;;; bindings.el --- Configuration for the bindings package

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

(global-set-key (kbd "s-<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "s-.") 'save-buffer)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'my/split/dir-below)
(global-set-key (kbd "s-3") 'my/split/dir-right)
(global-set-key (kbd "s-4") 'my/split/dir-right-delete-other-windows)
(global-set-key (kbd "s-b") 'bookmark-jump)
(global-set-key (kbd "s-c") 'whole-line-or-region-kill-ring-save)
(global-set-key (kbd "s-d") 'my/line/dup)
(global-set-key (kbd "s-D") 'my/line/dup-leap)
(global-set-key (kbd "s-e") 'my/line/eval)
(global-set-key (kbd "s-f") 'projectile-find-file)
(global-set-key (kbd "s-g") 'ag)
(global-set-key (kbd "s-i") 'my/buffer/autoindent)
(global-set-key (kbd "s-j") 'ivy-switch-buffer)
(global-set-key (kbd "s-J") 'previous-buffer)
(global-set-key (kbd "s-K") 'next-buffer)
(global-set-key (kbd "s-k") (lambda () (interactive) (dired nil)))
(global-set-key (kbd "s-n") 'mu4e-compose-new)
(global-set-key (kbd "s-m") 'mu4e)
(global-set-key (kbd "s-O") 'my/org/file)
(global-set-key (kbd "s-r") 'swiper-all-query-replace)
(global-set-key (kbd "s-R") 'my/screen/right)
(global-set-key (kbd "s-s") 'swiper-all)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-v") 'whole-line-or-region-yank)
(global-set-key (kbd "s-x") 'whole-line-or-region-kill-region)

(global-set-key (kbd "M-A") 'my/org/archive-item)

(global-set-key (kbd "C-s-c") 'my/packs/conf)
(global-set-key (kbd "C-s-h") 'mark-whole-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x f") 'counsel-find-file)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c L") 'org-insert-link-global)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)
(global-set-key (kbd "C-c c") 'org-capture)

(add-hook 'org-mode-hook
	  '(lambda ()
	     (define-key org-mode-map (kbd "s-r") 'org-refile)
	     (define-key org-mode-map (kbd "s-x") 'my/org/archive-item)
	     (define-key org-mode-map (kbd "s-e") 'org-ctrl-c-ctrl-c)))
;;; osx.el ends here

(provide 'my/bindings)

;;; bindings.el ends here
