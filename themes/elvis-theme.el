;;; elvis-theme.el -- Elvis Theme

;; Author: Evan Nagle <evan@mantle.co>
;; URL: 
;; Version: 0.0.1

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(deftheme elvis
  "Elvis - A dark, atomic theme.")

(defvar elvis-colors-alist
  (let* ((256color  (eq (display-color-cells (selected-frame)) 256))
         (colors `(("elvis-accent"   . "#528BFF")
                   ("elvis-fg"       . (if ,256color "color-248" "#ABB2BF"))
                   ("elvis-bg"       . (if ,256color "color-235" "#282C34"))
                   ("elvis-bg-1"     . (if ,256color "color-234" "#121417"))
                   ("elvis-bg-hl"    . (if ,256color "color-236" "#2C323C"))
                   ("elvis-gutter"   . (if ,256color "color-239" "#4B5363"))
                   ("elvis-mono-1"   . (if ,256color "color-248" "#ABB2BF"))
                   ("elvis-mono-2"   . (if ,256color "color-244" "#828997"))
                   ("elvis-mono-3"   . (if ,256color "color-240" "#5C6370"))
                   ("elvis-cyan"     . "#56B6C2")
                   ("elvis-blue"     . "#61AFEF")
                   ("elvis-purple"   . "#C678DD")
                   ("elvis-green"    . "#98C379")
                   ("elvis-red-1"    . "#E06C75")
                   ("elvis-red-2"    . "#BE5046")
                   ("elvis-orange-1" . "#D19A66")
                   ("elvis-orange-2" . "#E5C07B")
                   ("elvis-gray"     . (if ,256color "color-237" "#3E4451"))
                   ("elvis-silver"   . (if ,256color "color-247" "#9DA5B4"))
                   ("elvis-black"    . (if ,256color "color-233" "#21252B"))
                   ("elvis-border"   . (if ,256color "color-232" "#181A1F")))))
    colors)
  "List of Atom One Dark colors.")

(defmacro elvis-with-color-variables (&rest body)
  "Bind the colors list around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@ (mapcar (lambda (cons)
                      (list (intern (car cons)) (cdr cons)))
                    elvis-colors-alist))
     ,@body))

(elvis-with-color-variables
  (custom-theme-set-faces
   'elvis

   `(default ((t (:foreground ,elvis-fg :background ,elvis-bg))))
   `(success ((t (:foreground ,elvis-green))))
   `(warning ((t (:foreground ,elvis-orange-2))))
   `(error ((t (:foreground ,elvis-red-1 :weight bold))))
   `(link ((t (:foreground ,elvis-blue :underline t :weight bold))))
   `(link-visited ((t (:foreground ,elvis-blue :underline t :weight normal))))
   `(cursor ((t (:background ,elvis-accent))))
   `(fringe ((t (:background ,elvis-bg))))
   `(region ((t (:background ,elvis-gray))))
   `(highlight ((t (:background ,elvis-gray))))
   `(hl-line ((t (:background ,elvis-bg-hl))))
   `(vertical-border ((t (:background ,elvis-border :foreground ,elvis-border))))
   `(secondary-selection ((t (:background ,elvis-bg-1))))
   `(query-replace ((t (:inherit (isearch)))))
   `(minibuffer-prompt ((t (:foreground ,elvis-silver))))

   `(font-lock-builtin-face ((t (:foreground ,elvis-cyan))))
   `(font-lock-comment-face ((t (:foreground ,elvis-mono-3))))
   `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
   `(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face ((t (:foreground ,elvis-blue))))
   `(font-lock-keyword-face ((t (:foreground ,elvis-purple))))
   `(font-lock-preprocessor-face ((t (:foreground ,elvis-mono-2))))
   `(font-lock-string-face ((t (:foreground ,elvis-green))))
   `(font-lock-type-face ((t (:foreground ,elvis-orange-2))))
   `(font-lock-constant-face ((t (:foreground ,elvis-cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,elvis-red-1))))
   `(font-lock-warning-face ((t (:foreground ,elvis-mono-3 :bold t))))

   ;; mode-line
   `(mode-line ((t (:background ,elvis-black :foreground ,elvis-blue :box (:color ,elvis-border :line-width 1)))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-inactive ((t (:background ,elvis-border :foreground ,elvis-gray :box (:color ,elvis-border :line-width 1)))))

   ;; ido
   `(ido-first-match ((t (:foreground ,elvis-purple :weight bold))))
   `(ido-only-match ((t (:foreground ,elvis-red-1 :weight bold))))
   `(ido-subdir ((t (:foreground ,elvis-blue))))
   `(ido-virtual ((t (:foreground ,elvis-mono-3))))

   ;; ace-jump
   `(ace-jump-face-background ((t (:foreground ,elvis-mono-3 :background ,elvis-bg-1 :inverse-video nil))))
   `(ace-jump-face-foreground ((t (:foreground ,elvis-red-1 :background ,elvis-bg-1 :inverse-video nil))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,elvis-fg :background ,elvis-bg-1))))
   `(company-tooltip-annotation ((t (:foreground ,elvis-mono-2 :background ,elvis-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,elvis-fg :background ,elvis-gray))))
   `(company-tooltip-mouse ((t (:background ,elvis-gray))))
   `(company-tooltip-common ((t (:foreground ,elvis-orange-2 :background ,elvis-bg-1))))
   `(company-tooltip-common-selection ((t (:foreground ,elvis-orange-2 :background ,elvis-gray))))
   `(company-preview ((t (:background ,elvis-bg))))
   `(company-preview-common ((t (:foreground ,elvis-orange-2 :background ,elvis-bg))))
   `(company-scrollbar-fg ((t (:background ,elvis-mono-1))))
   `(company-scrollbar-bg ((t (:background ,elvis-bg-1))))

   ;; compilation
   `(compilation-face ((t (:foreground ,elvis-fg))))
   `(compilation-line-number ((t (:foreground ,elvis-mono-2))))
   `(compilation-column-number ((t (:foreground ,elvis-mono-2))))

   ;; isearch
   `(isearch ((t (:foreground ,elvis-bg :background ,elvis-purple))))
   `(isearch-fail ((t (:foreground ,elvis-red-2 :background nil))))
   `(lazy-highlight ((t (:foreground ,elvis-purple :background ,elvis-bg-1 :underline ,elvis-purple))))

   ;; diff-hl (https://github.com/dgutov/diff-hl)
   '(diff-hl-change ((t (:foreground "#E9C062" :background "#8b733a"))))
   '(diff-hl-delete ((t (:foreground "#CC6666" :background "#7a3d3d"))))
   '(diff-hl-insert ((t (:foreground "#A8FF60" :background "#547f30"))))

   ;; dired-mode
   '(Dired-directory ((t (:inherit (font-lock-keyword-face)))))
   '(dired-flagged ((t (:inherit (diff-hl-delete)))))
   '(dired-symlink ((t (:foreground "#FD5FF1"))))

   ;; helm
   `(helm-header ((t (:foreground ,elvis-mono-2
                      :background ,elvis-bg
                      :underline nil
                      :box (:line-width 6 :color ,elvis-bg)))))
   `(helm-source-header ((t (:foreground ,elvis-orange-2
                             :background ,elvis-bg
                             :underline nil
                             :weight bold
                             :box (:line-width 6 :color ,elvis-bg)))))
   `(helm-selection ((t (:background ,elvis-gray))))
   `(helm-selection-line ((t (:background ,elvis-gray))))
   `(helm-visible-mark ((t (:foreground ,elvis-bg :foreground ,elvis-orange-2))))
   `(helm-candidate-number ((t (:foreground ,elvis-green :background ,elvis-bg-1))))
   `(helm-separator ((t (:background ,elvis-bg :foreground ,elvis-red-1))))
   `(helm-M-x-key ((t (:foreground ,elvis-orange-1))))
   `(helm-bookmark-addressbook ((t (:foreground ,elvis-orange-1))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,elvis-purple))))
   `(helm-bookmark-info ((t (:foreground ,elvis-green))))
   `(helm-bookmark-man ((t (:foreground ,elvis-orange-2))))
   `(helm-bookmark-w3m ((t (:foreground ,elvis-purple))))
   `(helm-match ((t (:foreground ,elvis-orange-2))))
   `(helm-ff-directory ((t (:foreground ,elvis-cyan :background ,elvis-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,elvis-fg :background ,elvis-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,elvis-green :background ,elvis-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,elvis-red-1 :background ,elvis-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,elvis-orange-2 :background ,elvis-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,elvis-bg :background ,elvis-orange-2 :weight normal))))
   `(helm-buffer-not-saved ((t (:foreground ,elvis-red-1))))
   `(helm-buffer-process ((t (:foreground ,elvis-mono-2))))
   `(helm-buffer-saved-out ((t (:foreground ,elvis-fg))))
   `(helm-buffer-size ((t (:foreground ,elvis-mono-2))))
   `(helm-buffer-directory ((t (:foreground ,elvis-purple))))
   `(helm-grep-cmd-line ((t (:foreground ,elvis-cyan))))
   `(helm-grep-file ((t (:foreground ,elvis-fg))))
   `(helm-grep-finish ((t (:foreground ,elvis-green))))
   `(helm-grep-lineno ((t (:foreground ,elvis-mono-2))))
   `(helm-grep-finish ((t (:foreground ,elvis-red-1))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-swoop-target-line-block-face ((t (:background ,elvis-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-line-face ((t (:background ,elvis-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-word-face ((t (:background ,elvis-purple :foreground "#ffffff"))))
   `(helm-locate-finish ((t (:foreground ,elvis-green))))
   `(info-menu-star ((t (:foreground ,elvis-red-1))))

   ;; git-commit
   `(git-commit-comment-action  ((t (:foreground ,elvis-green :weight bold))))
   `(git-commit-comment-branch  ((t (:foreground ,elvis-blue :weight bold))))
   `(git-commit-comment-heading ((t (:foreground ,elvis-orange-2 :weight bold))))

   ;; jabber
   `(jabber-roster-user-online ((t (:foreground ,elvis-green))))
   `(jabber-roster-user-away ((t (:foreground ,elvis-red-1))))
   `(jabber-roster-user-xa ((t (:foreground ,elvis-red-2))))
   `(jabber-roster-user-dnd ((t (:foreground ,elvis-purple))))
   `(jabber-roster-user-chatty ((t (:foreground ,elvis-orange-2))))
   `(jabber-roster-user-error ((t (:foreground ,elvis-red-1 :bold t))))
   `(jabber-roster-user-offline ((t (:foreground ,elvis-mono-3))))
   `(jabber-chat-prompt-local ((t (:foreground ,elvis-blue))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,elvis-orange-2))))
   `(jabber-chat-prompt-system ((t (:foreground ,elvis-mono-3))))
   `(jabber-chat-error ((t (:inherit jabber-roster-user-error))))
   `(jabber-rare-time-face ((t (:foreground ,elvis-cyan))))
   `(jabber-activity-face ((t (:inherit jabber-chat-prompt-foreign))))
   `(jabber-activity-personal-face ((t (:inherit jabber-chat-prompt-local))))

   ;; js2-mode
   `(js2-function-call ((t (:inherit (font-lock-function-name-face)))))
   `(js2-function-param ((t (:foreground ,elvis-mono-1))))
   `(js2-jsdoc-tag ((t (:foreground ,elvis-purple))))
   `(js2-jsdoc-type ((t (:foreground ,elvis-orange-2))))
   `(js2-jsdoc-value((t (:foreground ,elvis-red-1))))
   `(js2-object-property ((t (:foreground ,elvis-red-1))))

   ;; magit
   `(magit-section-highlight ((t (:background ,elvis-bg-hl))))
   `(magit-section-heading ((t (:foreground ,elvis-orange-2 :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,elvis-fg :weight bold))))
   `(magit-diff-file-heading ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,elvis-gray :weight bold))))
   `(magit-diff-file-heading-selection ((t (:foreground ,elvis-orange-2 :background ,elvis-bg-hl :weight bold))))
   `(magit-diff-hunk-heading ((t (:foreground ,elvis-mono-2 :background ,elvis-gray))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,elvis-mono-1 :background ,elvis-mono-3))))
   `(magit-diff-hunk-heading-selection ((t (:foreground ,elvis-purple :background ,elvis-mono-3))))
   `(magit-diff-context ((t (:foreground ,elvis-fg))))
   `(magit-diff-context-highlight ((t (:background ,elvis-bg-1 :foreground ,elvis-fg))))
   `(magit-diffstat-added ((t (:foreground ,elvis-green))))
   `(magit-diffstat-removed ((t (:foreground ,elvis-red-1))))
   `(magit-process-ok ((t (:foreground ,elvis-green))))
   `(magit-process-ng ((t (:foreground ,elvis-red-1))))
   `(magit-log-author ((t (:foreground ,elvis-orange-2))))
   `(magit-log-date ((t (:foreground ,elvis-mono-2))))
   `(magit-log-graph ((t (:foreground ,elvis-silver))))
   `(magit-sequence-pick ((t (:foreground ,elvis-orange-2))))
   `(magit-sequence-stop ((t (:foreground ,elvis-green))))
   `(magit-sequence-part ((t (:foreground ,elvis-orange-1))))
   `(magit-sequence-head ((t (:foreground ,elvis-blue))))
   `(magit-sequence-drop ((t (:foreground ,elvis-red-1))))
   `(magit-sequence-done ((t (:foreground ,elvis-mono-2))))
   `(magit-sequence-onto ((t (:foreground ,elvis-mono-2))))
   `(magit-bisect-good ((t (:foreground ,elvis-green))))
   `(magit-bisect-skip ((t (:foreground ,elvis-orange-1))))
   `(magit-bisect-bad ((t (:foreground ,elvis-red-1))))
   `(magit-blame-heading ((t (:background ,elvis-bg-1 :foreground ,elvis-mono-2))))
   `(magit-blame-hash ((t (:background ,elvis-bg-1 :foreground ,elvis-purple))))
   `(magit-blame-name ((t (:background ,elvis-bg-1 :foreground ,elvis-orange-2))))
   `(magit-blame-date ((t (:background ,elvis-bg-1 :foreground ,elvis-mono-3))))
   `(magit-blame-summary ((t (:background ,elvis-bg-1 :foreground ,elvis-mono-2))))
   `(magit-dimmed ((t (:foreground ,elvis-mono-2))))
   `(magit-hash ((t (:foreground ,elvis-purple))))
   `(magit-tag  ((t (:foreground ,elvis-orange-1 :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,elvis-green :weight bold))))
   `(magit-branch-local   ((t (:foreground ,elvis-blue :weight bold))))
   `(magit-branch-current ((t (:foreground ,elvis-blue :weight bold :box t))))
   `(magit-head           ((t (:foreground ,elvis-blue :weight bold))))
   `(magit-refname        ((t (:background ,elvis-bg :foreground ,elvis-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,elvis-bg :foreground ,elvis-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,elvis-bg :foreground ,elvis-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,elvis-green))))
   `(magit-signature-bad       ((t (:foreground ,elvis-red-1))))
   `(magit-signature-untrusted ((t (:foreground ,elvis-orange-1))))
   `(magit-cherry-unmatched    ((t (:foreground ,elvis-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,elvis-purple))))
   `(magit-reflog-commit       ((t (:foreground ,elvis-green))))
   `(magit-reflog-amend        ((t (:foreground ,elvis-purple))))
   `(magit-reflog-merge        ((t (:foreground ,elvis-green))))
   `(magit-reflog-checkout     ((t (:foreground ,elvis-blue))))
   `(magit-reflog-reset        ((t (:foreground ,elvis-red-1))))
   `(magit-reflog-rebase       ((t (:foreground ,elvis-purple))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,elvis-green))))
   `(magit-reflog-remote       ((t (:foreground ,elvis-cyan))))
   `(magit-reflog-other        ((t (:foreground ,elvis-cyan))))

   ;; perspective
   `(persp-selected-face ((t (:foreground ,elvis-blue))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,elvis-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,elvis-purple))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,elvis-blue))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,elvis-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,elvis-green))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,elvis-orange-1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,elvis-orange-2))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,elvis-red-1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,elvis-red-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,elvis-mono-1))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,elvis-mono-2))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,elvis-mono-3))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,elvis-black))))

   ;; rbenv
   `(rbenv-active-ruby-face ((t (:foreground ,elvis-green))))

   ;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,elvis-red-1 :background ,elvis-gray :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,elvis-gray :weight bold))))

   ;; web-mode
   `(web-mode-symbol-face ((t (:foreground ,elvis-orange-1))))

   ;; flx-ido
   `(flx-highlight-face ((t (:inherit (link) :weight bold))))

   ;; rpm-spec-mode
   `(rpm-spec-tag-face ((t (:foreground ,elvis-blue))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground "#FFFFFF" :background ,elvis-red-2))))
   `(rpm-spec-macro-face ((t (:foreground ,elvis-orange-2))))
   `(rpm-spec-var-face ((t (:foreground ,elvis-red-1))))
   `(rpm-spec-doc-face ((t (:foreground ,elvis-purple))))
   `(rpm-spec-dir-face ((t (:foreground ,elvis-cyan))))
   `(rpm-spec-package-face ((t (:foreground ,elvis-red-2))))
   `(rpm-spec-ghost-face ((t (:foreground ,elvis-red-2))))
   `(rpm-spec-section-face ((t (:foreground ,elvis-orange-2))))

   ;; term
   `(term-color-black ((t :foreground ,elvis-mono-1)))
   `(term-color-blue ((t (:foreground ,elvis-blue))))
   `(term-color-cyan ((t :foreground ,elvis-cyan)))
   `(term-color-green ((t (:foreground ,elvis-green))))
   `(term-color-magenta ((t :foreground ,elvis-purple)))
   `(term-color-red ((t :foreground ,elvis-red-1)))
   `(term-color-white ((t :foreground ,elvis-fg)))
   `(term-color-yellow ((t (:foreground ,elvis-orange-1))))

   ;; linum
   `(linum ((t (:foreground ,elvis-gutter :background ,elvis-bg))))
   ;; hlinum
   `(linum-highlight-face ((t (:foreground ,elvis-fg :background ,elvis-bg))))
   ;; native line numbers (emacs version >=26)
   `(line-number ((t (:foreground ,elvis-gutter :background ,elvis-bg))))
   `(line-number-current-line ((t (:foreground ,elvis-fg :background ,elvis-bg))))

   ;; latex-mode
   `(font-latex-sectioning-0-face ((t (:foreground ,elvis-blue :height 1.0))))
   `(font-latex-sectioning-1-face ((t (:foreground ,elvis-blue :height 1.0))))
   `(font-latex-sectioning-2-face ((t (:foreground ,elvis-blue :height 1.0))))
   `(font-latex-sectioning-3-face ((t (:foreground ,elvis-blue :height 1.0))))
   `(font-latex-sectioning-4-face ((t (:foreground ,elvis-blue :height 1.0))))
   `(font-latex-sectioning-5-face ((t (:foreground ,elvis-blue :height 1.0))))
   `(font-latex-bold-face ((t (:foreground ,elvis-green :weight bold))))
   `(font-latex-italic-face ((t (:foreground ,elvis-green))))
   `(font-latex-warning-face ((t (:foreground ,elvis-red-1))))
   `(font-latex-doctex-preprocessor-face ((t (:foreground ,elvis-cyan))))

   ;; org-mode
   `(org-date ((t (:foreground ,elvis-cyan))))
   `(org-footnote ((t (:foreground ,elvis-cyan))))
   `(org-sexp-date ((t (:foreground ,elvis-cyan))))

   ;; realgud
   `(realgud-overlay-arrow1        ((t (:foreground ,elvis-green))))
   `(realgud-overlay-arrow3        ((t (:foreground ,elvis-orange-1))   `(realgud-overlay-arrow2        ((t (:foreground ,elvis-orange-2))))
))
   '(realgud-bp-enabled-face       ((t (:inherit (error)))))
   `(realgud-bp-disabled-face      ((t (:inherit (secondary-selection)))))
   `(realgud-bp-line-enabled-face  ((t (:box (:color ,elvis-red-1)))))
   `(realgud-bp-line-disabled-face ((t (:box (:color ,elvis-gray)))))
   `(realgud-line-number           ((t (:foreground ,elvis-mono-2))))
   `(realgud-backtrace-number      ((t (:inherit (secondary-selection)))))

   ;; undo-tree
   `(undo-tree-visualizer-current-face ((t (:foreground ,elvis-red-1))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,elvis-orange-1))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,elvis-cyan))))
   ))

(elvis-with-color-variables
  (custom-theme-set-variables
   'elvis
;;;;; fill-column-indicator
   `(fci-rule-color ,elvis-gray)
   ))

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'elvis)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; elvis-theme.el ends here
