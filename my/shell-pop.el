;;; shell-pop.el --- Configuration for the shell-pop package

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

(use-package shell-pop
  :ensure t)

(setq explicit-shell-file-name "/bin/bash")

(defun oleh-term-exec-hook ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))

(eval-after-load "term"
  '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))

;; (eval-after-load "ansi-term"
;;   '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))

(add-hook 'term-exec-hook 'oleh-term-exec-hook)
(add-hook 'term-exec-hook (lambda () (read-only-mode -1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-default-directory "/Users/e/Repos")
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t") 
 '(shell-pop-window-size 40)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom")
 '(shell-pop-autocd-to-working-dir t)
 '(shell-pop-restore-window-configuration t)
 '(shell-pop-cleanup-buffer-at-process-exit t))

(defun config//term-normal-state ()
  "Enable `term-line-mode' when in normal state in `term-mode' buffer
 and make the buffer read only."
  (term-line-mode)
  (read-only-mode 1))

(defun config//term-insert-state ()
  "Enable `term-char-mode' when in insert state in a `term-mode' buffer."
  (when (get-buffer-process (current-buffer))
    (read-only-mode -1)
    (term-char-mode)
    ))

(defun config//term-evil-bindings ()
  "Enable term support for vim and hybrid editing styles."
  (add-hook 'evil-hybrid-state-entry-hook 'config//term-insert-state nil t)
  (add-hook 'evil-insert-state-entry-hook 'config//term-insert-state nil t)
  (add-hook 'evil-hybrid-state-exit-hook 'config//term-normal-state nil t)
  (add-hook 'evil-insert-state-exit-hook 'config//term-normal-state nil t))

(defun my/shell/buffer ()
  (interactive)
  (term "/bin/zsh"))

(setq term-char-mode-point-at-process-mark t)
(add-hook 'term-mode-hook 'config//term-evil-bindings)

(provide 'my/shell-pop)

;;; shell-pop.el ends here
