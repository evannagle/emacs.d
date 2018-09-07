;;; mu4e.el --- Configuration for the mu4e package

;; Copyright (C) 2018 Evan Nagle

;; Author: Evan Nagle <evan@mantle.co>
;; URL: https://github.com/evannagle/my-emacs
;; Version: 0.0.1
;; Hat Tip to http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/

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

(defvar my/mu4e "/usr/local/share/emacs/site-lisp/mu/mu4e")

(add-to-list 'load-path my/mu4e)

(require 'mu4e)
(require 'org-mu4e)

;; Folders
(defvar mu4e-maildir "~/.Mail")
(defvar mu4e-sent-folder "/Sent")
(defvar mu4e-drafts-folder "/Drafts")
(defvar mu4e-trash-folder "/Trash")
(defvar mu4e-refile-folder "/Archive")

;; Incoming Mail
(defvar mu4e-get-mail-command "offlineimap")
(defvar mu4e-update-interval 180)

;; Just a demo
;; Real setup is stored in private.el
(defvar my/mu4e/accounts
  '(("Gmail"
     (user-mail-address "email@gmail.com")
     (mu4e-sent-folder "Sent")
     (starttls-use-gnutls t)
     (starttls-gnutls-program "/usr/local/bin/gnutls-cli")
     (starttls-extra-arguments nil)
     (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
     (smtpmail-smtp-user "email")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-try-auth-methods "tls")
     (smtpmail-smtp-service 587)
     (smtpmail-debug-info t))))

;; Outgoing Mail
(defun my/mu4e/account ()
  "Set the account for composing a message.
   This function is taken from: 
     https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
  (let* ((account
	  (if mu4e-compose-parent-message
	      (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
		(string-match "/\\(.*?\\)/" maildir)
		(match-string 1 maildir))
	    (completing-read (format "Compose with account: (%s) "
				     (mapconcat #'(lambda (var) (car var))
						my/mu4e/accounts "/"))
			     (mapcar #'(lambda (var) (car var)) my/mu4e/accounts)
			     nil t nil nil (caar my/mu4e/accounts))))
	 (account-vars (cdr (assoc account my/mu4e/accounts))))
    (if account-vars
	(mapc #'(lambda (var)
		  (set (car var) (cadr var)))
	      account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my/mu4e/account)

(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")

(setq mu4e-sent-messages-behavior 'delete)

(provide 'my/mu4e)

;;; mu4e.el ends here
