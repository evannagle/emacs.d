;;; INIT.el --- Emacs init file.
;;; -*- lexical-binding: t -*-

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

(setq package--init-file-ensured t)
(setq my/.emacs.d/ user-emacs-directory)
(setq my/.emacs.d/mods (expand-file-name "my" my/.emacs.d/))
(setq my/.emacs.d/mods/packs.el (expand-file-name "packs.el" my/.emacs.d/mods))
(setq my/.emacs.d/mods/private.el (expand-file-name "private.el" my/.emacs.d/mods))
(setq my/.emacs.d/data (expand-file-name "data" my/.emacs.d/))
(setq my/.emacs.d/init.el (expand-file-name "init.el" my/.emacs.d/))

(load my/.emacs.d/mods/private.el t)
(load my/.emacs.d/mods/packs.el t)

(my/packs/load
 ;; -------------------------------------------------------
 ;; package management
 ;; -------------------------------------------------------
 'straight
 'melpa

 ;; https://github.com/raxod502/straight.el
 ;; 'straight

 ;; -------------------------------------------------------
 ;; look and feel
 ;; -------------------------------------------------------
 'theme

 ;; global line numbering
 'nums 

 'rainbow-delimiters

 ;; https://emacsredux.com/blog/2014/08/25/a-peek-at-emacs-24-dot-4-prettify-symbols-mode/
 ;; 'prettify-symbols-mode 

 ;; -------------------------------------------------------
 ;; org mode
 ;; -------------------------------------------------------
 'org

 ;; track project hours
 'hours 

 ;; -------------------------------------------------------
 ;; dired mode
 ;; -------------------------------------------------------
 'dired
 'dired-k

 ;; -------------------------------------------------------
 ;; shell
 ;; -------------------------------------------------------
 ;; os specific
 ;; https://github.com/purcell/exec-path-from-shell
 ;; 'exec-path-from-shell

 ;; 'os
 ;; 'shell
 ;; 'shell-cmd
 
 ;; -------------------------------------------------------
 ;; for the vi-afflicted
 ;; -------------------------------------------------------
 ;; https://github.com/emacs-evil/evil
 'evil

 ;; https://github.com/linktohack/evil-commentary
 'evil-commentary

 ;; https://github.com/emacs-evil/evil-collection
 ;; this includes dired bindings
 'evil-collection

 ;; https://github.com/syl20bnr/evil-escape
 ;;'evil-escape

 ;; https://github.com/emacs-evil/evil-surround
 ;; 'evil-surround

 ;; -------------------------------------------------------
 ;; git
 ;; -------------------------------------------------------
 ;; https://magit.vc/
 'magit

 ;; https://github.com/emacs-evil/evil-magit
 'evil-magit

 ;; -------------------------------------------------------
 ;; utility / chrome
 ;; -------------------------------------------------------
 'dechrome

 ;; hide cached/stored data in .emacs.d subdirs
 'data-tuck

 ;; https://github.com/Wilfred/helpful
 'helpful

 ;; remove start screens and beeps
 'quiet

 ;; https://github.com/Wilfred/elisp-def
 'elisp-def

 ;; https://github.com/emacsmirror/diminish
 'diminish

 ;; https://github.com/bbatsov/crux
 'crux
 
 'backups
 'line

 ;; Abbreviations
 ;; https://www.emacswiki.org/emacs/AbbrevMode
 ;; 'abbrevs

 ;; -------------------------------------------------------
 ;; windows and buffers
 ;; -------------------------------------------------------
 'ace-window
 'buffers
 'split

 ;; https://www.emacswiki.org/emacs/CommandLogMode
 ;; 'command-log

 ;; -------------------------------------------------------
 ;; spacing
 ;; -------------------------------------------------------
 'dtrt-indent
 'aggressive-indent-mode

 ;; -------------------------------------------------------
 ;; autocompletion and search
 ;; -------------------------------------------------------
 ;; https://github.com/Wilfred/ag.el
 ;; silver searcher
 'ag

 ;; https://github.com/company-mode/company-mode
 'company

 ;; https://github.com/abo-abo/swiper
 ;; ivy extensions
 'counsel

 ;; https://github.com/bling/fzf.el
 'fzf

 ;; https://github.com/abo-abo/swiper
 ;; autocompletion
 'ivy

 ;; https://github.com/joaotavora/yasnippet
 'yas

 ;; #######################################################
 ;; language modes
 ;; #######################################################

 ;; C
 'c-mode

 ;; CSS
 'less-css-mode
 
 ;; Git
 'gitignore-mode
 
 ;; JavaScript
 'typescript-mode

 ;; PHP
 'php-mode
 'php-docs

 ;; HTML
 'jinja2-mode
 'web-mode
 'twig-mode
 
 ;; Lua
 ;; 'lua-mode

 ;; Yaml
 'yaml-mode

 ;; -------------------------------------------------------
 ;; bindings
 ;; -------------------------------------------------------
 'bindings

 ;; https://github.com/abo-abo/hydra
 ;; 'hydra
 ;; 'hydra-bindings
 )

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; init.el ends here
