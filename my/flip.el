;;; flip.el --- Configuration for the flip package

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

(defvar my/flip/dict 
  '(("true" "false")
    ("yes" "no")
    ("+" "-")
    ("open" "closed")))

(defun my/flip/word ()
  "Flip true/false, 1/0, etc. to the inverse value"
  (interactive)
  (let (bounds pos1 pos2 word)
    (setq bounds (bounds-of-thing-at-point 'word))
    (setq pos1 (car bounds))
    (setq pos2 (cdr bounds))
    (setq word (downcase (buffer-substring-no-properties pos1 pos2)))

    (dolist (pair my/flip/dict)
      (setq word1 (car pair))
      (setq word2 (nth 1 pair))
      (if (string-match-p (regexp-quote word1) word)
	  (replace-string word1 word2 nil pos1 pos2)
	(if (string-match-p (regexp-quote word2) word)
	    (replace-string word2 word1 nil pos1 pos2))))))

(provide 'my/flip)

;;; flip.el ends here
