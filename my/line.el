;;; line.el --- Configuration for the line package

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
(setq-default truncate-lines 1)

(defun my/line/kill-left (p)
  "Kill P lines backwards"
  (interactive "p")
  (kill-line (- 1 p)))

(defun my/line/dup (p)
  "Duplicate the curent line N times"
  (interactive "p")
  (move-beginning-of-line 1)
  (my/line/dup-right p))

(defun my/line/new-line-and-indent ()
  "Add two newlines and put the cursor at the right indentation between them if a newline is
attempted when the cursor is between two curly braces, otherwise do a regular newline-and-indent"
  (interactive)
  (if (and (equal (char-before) 123)
	   (equal (char-after) 125))
      (progn (newline-and-indent)
	     (split-line)
	     (indent-for-tab-command))
    (newline-and-indent)))

(defun my/line/dup-leap (p n)
  "Duplicate line N of the the current file P times"
  (interactive "p\nnLine: ")
  (save-excursion
    (goto-line n)
    (move-beginning-of-line 1)
    (kill-line)
    (yank))
  (dotimes (i p)
    (progn
      ;;(open-line 1)
      (next-line 1)
      (yank))))

(defun my/line/dup-right (p)
  "Duplicate what's right of the cursor N times"
  (interactive "p")
  (kill-line)
  (yank)
  (dotimes (i p)
    (progn
      (open-line 1)
      (next-line 1)
      (yank))))

(defun my/line/dup-left (p)
  "Duplicate what's left of the cursor N times"
  (interactive "p")
  (my/line/kill-left p)
  ;;(set-mark-command 1)
  ;;(move-beginning-of-line 1)
  ;;(copy-region-as-kill (mark) (point))
  (yank)
  (move-end-of-line 1)
  (dotimes (i p)
    (progn
      (open-line 1)
      (next-line 1)
      (yank))))

(defun my/line/dup-zap (p char)
  "Duplicate the current line up to char C, repeat N times"
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-char "Zap to char: " t)))
  (move-beginning-of-line 1)
  (zap-to-char 1 char)
  (yank)
  (dotimes (i p)
    (progn
      (move-end-of-line 1)
      (open-line 1)
      (next-line 1)
      (yank))))

(defun my/line/eval ()
  "Eval sexp that ends on current line"
  (interactive)
  (save-excursion
    (end-of-line)
    (eval-last-sexp nil)))

(provide 'my/line)

;;; line.el ends here
