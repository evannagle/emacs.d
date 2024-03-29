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

(defvar my/bindings/terminal-super (kbd "C-s"))

(unless (display-graphic-p)
  (global-unset-key my/bindings/terminal-super)
  (use-local-map (make-sparse-keymap))
  (local-set-key my/bindings/terminal-super ctl-x-map))

(defun my/sbd (key)
  "A super binding that maps to <> when in a terminal"
  (if (display-graphic-p)
      (kbd (format "s-%s" key))
    (kbd (format "%s %s" my/bindings/terminal-super key))))

(global-set-key (my/sbd "<escape>") 'keyboard-escape-quit)
(global-set-key (my/sbd "-") 'my/shell-cmd/run)
(global-set-key (my/sbd ".") 'save-buffer)
(global-set-key (my/sbd ">") 'my/web/save-buffer)
(global-set-key (my/sbd "/") 'evil-commentary-line)
(global-set-key (my/sbd "[") 'sp-forward-barf-sexp)
(global-set-key (my/sbd "]") 'sp-forward-slurp-sexp)
(global-set-key (my/sbd "{") 'sp-backward-slurp-sexp)
(global-set-key (my/sbd "}") 'sp-backward-barf-sexp)
(global-set-key (my/sbd ")") 'my/buffers/kill-quick)
(global-set-key (my/sbd "_") 'my/iterm/rerun)
(global-set-key (my/sbd "0") 'delete-window)
(global-set-key (my/sbd "1") 'delete-other-windows)
(global-set-key (my/sbd "2") 'my/split/dir-below)
(global-set-key (my/sbd "3") 'my/split/dir-right)
(global-set-key (my/sbd "4") 'my/split/dir-right-delete-other-windows)
(global-set-key (my/sbd "a") 'slime-eval-last-expression-in-repl)
(global-set-key (my/sbd "b") 'bookmark-jump)
;; leave c for the clipboard
(global-set-key (my/sbd "C") 'whole-line-or-region-kill-ring-save)
(global-set-key (my/sbd "d") 'my/line/dup)
(global-set-key (my/sbd "D") 'my/line/dup-leap)
(global-set-key (my/sbd "e") 'my/line/eval)
(global-set-key (my/sbd "f") 'my/shell/open-folder)
(global-set-key (my/sbd "F") 'projectile-find-file)
(global-set-key (my/sbd "g") 'ag)
(global-set-key (my/sbd "h") (lambda () (interactive) (org-capture nil "h")))
(global-set-key (my/sbd "i") 'my/web/autoindent)
(global-set-key (my/sbd "j") 'ivy-switch-buffer)
(global-set-key (my/sbd "J") 'previous-buffer)
(global-set-key (my/sbd "K") 'next-buffer)
(global-set-key (my/sbd "k") (lambda () (interactive) (dired nil)))
(global-set-key (my/sbd "l") 'my/line/hungry-new-line-and-indent)
;; (global-set-key (my/sbd "M") 'mu4e)
;; (global-set-key (my/sbd "n") 'mu4e-compose-new)
(global-set-key (my/sbd "O") 'my/org/file)
(global-set-key (my/sbd "r") 'my/buffers/reload-current)
(global-set-key (my/sbd "R") 'my/buffers/revert-current)
(global-set-key (my/sbd "s") 'shell-pop)
(global-set-key (my/sbd "t") 'my/shell/buffer)
(global-set-key (my/sbd "q") 'save-buffers-kill-terminal)
(global-set-key (my/sbd "v") 'whole-line-or-region-yank)
(global-set-key (my/sbd "w") 'delete-window)
(global-set-key (my/sbd "x") 'whole-line-or-region-kill-region)
(global-set-key (my/sbd "<f13>") 'my/buffers/switch-to-scratch)
(global-set-key (my/sbd "<f14>") 'my/buffers/switch-to-messages)
(global-set-key (my/sbd "<prior>") 'previous-buffer)
(global-set-key (my/sbd "<next>") 'next-buffer)

(global-set-key (kbd "M-A") 'my/org/archive-item)
(global-set-key (kbd "C-s-c") 'my/packs/conf)
(global-set-key (kbd "C-s-l") 'my/packs/leap)
(global-set-key (kbd "C-s-h") 'mark-whole-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x f") 'counsel-find-file)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c L") 'org-insert-link-global)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)
(global-set-key (kbd "C-c c") 'org-capture)

;; F keys for olkb

(defun my/todos ()
  "Jump to the TODOs bookmark at 't'"
  (interactive)
  (bookmark-jump "t"))

(define-key global-map [f1] 'my/todos)
(define-key global-map [f7] 'my/quickz/run)

(define-key global-map [f6]
  (lambda () (interactive) (org-capture nil "h")))

;; org mode
(add-hook 'org-mode-hook
	  '(lambda ()
	     (define-key org-mode-map (kbd "C-c r") 'org-refile)
	     (define-key org-mode-map (my/sbd "x") 'my/org/archive-item)
	     (define-key org-mode-map (my/sbd "r") 'my/org/archive-item-with-hours)
	     (define-key org-mode-map (my/sbd "e") 'org-ctrl-c-ctrl-c)))

;; html mode
(add-hook 'html-mode-hook
	  '(lambda ()
	     (define-key html-mode-map (my/sbd "e") 'emmet-expand-line)))

;; twig mode
(add-hook 'twig-mode-hook
	  '(lambda ()
	     (define-key twig-mode-map (my/sbd "e") 'emmet-expand-line)))

;; smartparens
(add-hook 'smartparens-mode-hook
	  '(lambda ()
	     (define-key smartparens-mode-map (kbd "M-(") 'sp-wrap-round)
	     (define-key smartparens-mode-map (kbd "M-[") 'sp-wrap-square)
	     (define-key smartparens-mode-map (kbd "M-{") 'sp-wrap-curly)))

(provide 'my/bindings)

;;; bindings.el ends here
