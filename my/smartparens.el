;;; smartparens.el --- Configuration for the smartparens package

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

;; Cheatsheet: https://gist.github.com/pvik/8eb5755cc34da0226e3fc23a320a3c95

(defun my/smartparens/newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(defun my/smartparens/add-space-after-sexp-insertion (id action _context)
  (when (eq action 'insert)
    (save-excursion
      (forward-char (length (plist-get (sp-get-pair id) :close)))
      (when (or (eq (char-syntax (following-char)) ?w)
                (looking-at (sp--get-opening-regexp)))
        (insert " ")))))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (sp-pair "\`" nil :actions :rem)
    (sp-pair "\~" nil :actions :rem)
    (sp-pair "\*" nil :actions :rem)
    (sp-pair "(" ")" :wrap "M-(")
    (sp-pair "[" "]" :wrap "M-[")
    (sp-pair "{" "}" :wrap "M-{")

    (sp-local-pair 'emacs-lisp-mode "`" "'")
    (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
    (sp-local-pair 'comint-mode "'" nil :actions nil)

    (define-key smartparens-mode-map (kbd "C-)") 'sp-forward-slurp-sexp)
    (define-key smartparens-mode-map (kbd "C-(") 'sp-backward-slurp-sexp)
    (define-key smartparens-mode-map (kbd "C-}") 'sp-forward-barf-sexp)
    (define-key smartparens-mode-map (kbd "C-{") 'sp-backward-barf-sexp)
    (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
    (define-key smartparens-mode-map (kbd "C-<left>") 'sp-backward-slurp-sexp)
    (define-key smartparens-mode-map (kbd "C-S-<right>") 'sp-forward-barf-sexp)
    (define-key smartparens-mode-map (kbd "C-S-<left>") 'sp-backward-barf-sexp)

    (sp-local-pair 'c++-mode "{" nil :post-handlers '((my/smartparens/newline-and-enter-sexp "RET")))
    (sp-local-pair 'scss-mode "{" nil :post-handlers '((my/smartparens/newline-and-enter-sexp "RET")))
    (sp-local-pair 'less-css-mode "{" nil :post-handlers '((my/smartparens/newline-and-enter-sexp "RET")))
    (sp-local-pair 'emacs-lisp-mode "(" nil :post-handlers '(:add my/smartparens/add-space-after-sexp-insertion))

    (smartparens-global-mode 1)))

(provide 'my/smartparens)

;;; smartparens.el ends here
