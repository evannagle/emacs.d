;;; gpg.el --- Configuration for the gpg package

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


(use-package epg
  :ensure t)

(require 'epa-file)
(epa-file-enable)
(custom-set-variables '(epg-gpg-program  "/usr/local/Cellar/gnupg/2.2.3/bin/gpg"))

(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)

(setq gnus-select-method
  '(nnimap "gmail"
           (nnimap-address "imap.gmail.com")
           (nnimap-server-port "imaps")
           (nnimap-stream ssl)))

(setq send-mail-function 'smtpmail-send-it
 message-send-mail-function 'smtpmail-send-it
 user-mail-address "evan.nagle@gmail.com"
 smtpmail-starttls-credentials '(("smtp.gmail.com" 465 nil nil)) ; tried 587
 smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
 smtpmail-default-smtp-server "smtp.gmail.com"
 smtpmail-smtp-server "smtp.gmail.com"
 smtpmail-smtp-service 587 ; 465 ; tried 587
 smtpmail-debug-info t ; where is this output?
 starttls-extra-arguments nil
 starttls-gnutls-program "/usr/bin/gnutls-cli" ; executable, correct path
 starttls-extra-arguments nil
 starttls-use-gnutls t
 smtpmail-local-domain "my.dotted.ip.address")

;; Debugging epg setup:
;; (epg-find-configuration 'OpenPGP)
;; (epg-find-configuration 'OpenPGP t)
;; (epg-config--make-gpg-configuration epg-gpg-program)

(provide 'my/gpg)

;;; gpg.el ends here
