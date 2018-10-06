;;; evil.el --- Configuration for the evil package

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


(defvar my/evil/commands
  '((elisp-def . "def[ine]")
    (evil-indent . "in[dent]")
    (my/org/archive-item . "arc[hive]")))

(defun my/evil/commands/load ()
  "Load my/evil/commands after evil mode is activated."
  (dolist (cmd my/evil/commands)
    (let ((ex-cmd (cdr cmd))
	  (el-cmd (car cmd)))
      (evil-ex-define-cmd ex-cmd el-cmd))))

(use-package evil
  :ensure t
  :init
  ;;https://github.com/emacs-evil/evil-collection
  (setq evil-want-integration nil)

  :config
  (evil-mode 1)
  (setq evil-want-fine-undo t)
  (my/evil/commands/load)
  (define-key evil-insert-state-map (kbd "C-n") 'next-line)
  (define-key evil-insert-state-map (kbd "C-p") 'previous-line)
  (define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
  (define-key evil-insert-state-map (kbd "C-f") 'forward-char)
  (define-key evil-insert-state-map (kbd "C-b") 'backward-char)
  (define-key evil-insert-state-map (kbd "C-t") 'transpose-chars))

(provide 'my/evil)

;;; evil.el ends here
