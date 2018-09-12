;;; evil-escape.el --- Configuration for the evil-escape package

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


(use-package evil-escape
  :ensure t
  :commands evil-escape-mode
  :init
  (setq evil-escape-kbd (kbd "s-n"))
  (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
        evil-escape-key-sequence "jk"
        evil-escape-delay 0.2)
  (add-hook 'after-init-hook #'evil-escape-mode)
  :config
  ;; no `evil-escape' in minibuffer
  (cl-pushnew #'minibufferp evil-escape-inhibit-functions :test #'eq)

  (define-key evil-insert-state-map  evil-escape-kbd #'evil-escape)
  (define-key evil-replace-state-map evil-escape-kbd #'evil-escape)
  (define-key evil-visual-state-map  evil-escape-kbd #'evil-escape)
  (define-key evil-operator-state-map evil-escape-kbd #'evil-escape))

(provide 'my/evil-escape)

;;; evil-escape.el ends here
