;;; jetbrains-darcula-theme.el --- A complete port of the default JetBrains Darcula theme -*- lexical-binding: t; -*-

;; Copyright (C) 2020 , Ian Y.E. Pan

;; Author: Ian Y.E. Pan
;; URL: https://github.com/ianpan870102/jetbrains-darcula-emacs-theme
;; Version: 1.0.0

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;; A complete port of the default JetBrains Darcula theme for Emacs

;;; Code:

(deftheme jetbrains-darcula)

;;;###autoload
(defcustom jetbrains-darcula-theme-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist."
  :group 'jetbrains-darcula-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

;;; Color Palette

(defvar jetbrains-darcula-theme-default-colors-alist
  '(("fg0"               . "#8997a6")
    ("fg1"               . "#a9b7c6") ; default fg
    ("fg2"               . "#cccccc")
    ("fg3"               . "#e8e8e8")
    ("fg4"               . "#fafafa")
    ("bg0"               . "#111111")
    ("bg1"               . "#2b2b2b") ; default bg
    ("bg2"               . "#303030")
    ("bg3"               . "#313335") ; hl-line
    ("bg4"               . "#383c3f")
    ("bg-hl"             . "#214283")
    ("jb-r"              . "#ac0909")
    ("jb-g"              . "#36a546")
    ("jb-y"              . "#f1eb7f")
    ("key2"              . "#c57825")
    ("key3"              . "#d0d0ff")
    ("accent"            . "#ffffff")
    ("mode-line-bg"      . "#3c3f41")
    ("mode-line-bg-dark" . "#2c2f31")
    ("line-num"          . "#606366")
    ("builtin"           . "#c57825")
    ("keyword"           . "#c57825")
    ("const"             . "#9676ac")
    ("comment"           . "#8e9292")
    ("doc"               . "#5e8759")
    ("func"              . "#ffc66d")
    ("str"               . "#5e8759")
    ("type"              . "#c57825")
    ("var"               . "#9676ac")
    ("warning"           . "#990000")

    ;; standardized palette
    ("jb-yellow"     . "#ffc66d")
    ("jb-bluegreen"  . "#318495")
    ("jb-magenta"    . "#9676ac")
    ("jb-orange"     . "#c57825")
    ("jb-red"        . "#8c0909")
    ("jb-blue"       . "#7ca8c6")
    ("jb-green"      . "#5e8759")))

(defmacro jetbrains-darcula-theme-with-color-variables (&rest body)
  "`let' bind all colors around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append jetbrains-darcula-theme-default-colors-alist
                           jetbrains-darcula-theme-override-colors-alist)))
     ,@body))

(jetbrains-darcula-theme-with-color-variables
  (custom-theme-set-faces
   'jetbrains-darcula
   `(default                                  ((,class (:background ,bg1 :foreground ,fg1))))

   `(font-lock-builtin-face                   ((,class (:foreground ,builtin))))
   `(font-lock-comment-face                   ((,class (:foreground ,comment :italic t))))
   `(font-lock-negation-char-face             ((,class (:foreground ,const))))
   `(font-lock-reference-face                 ((,class (:foreground ,const))))
   `(font-lock-constant-face                  ((,class (:foreground ,const))))
   `(font-lock-doc-face                       ((,class (:foreground ,doc))))
   `(font-lock-function-name-face             ((,class (:foreground ,func :bold nil))))
   `(font-lock-keyword-face                   ((,class (:bold nil :foreground ,keyword))))
   `(font-lock-string-face                    ((,class (:foreground ,str))))
   `(font-lock-type-face                      ((,class (:foreground ,type ))))
   `(font-lock-variable-name-face             ((,class (:foreground ,var))))
   `(font-lock-warning-face                   ((,class (:foreground ,jb-red :background ,bg2))))

   `(region                                   ((,class (:background ,bg-hl :extend nil))))
   `(secondary-selection                      ((,class (:inherit region))))
   `(highlight                                ((,class (:foreground ,bg3 :background ,fg3))))
   `(hl-line                                  ((,class (:background ,bg3))))
   `(fringe                                   ((,class (:background ,bg1 :foreground ,fg4))))
   `(cursor                                   ((,class (:background "white"))))
   `(show-paren-match-face                    ((,class (:background ,warning))))
   `(show-paren-match                         ((t (:foreground "yellow" :background ,bg4 :bold t))))
   `(show-paren-mismatch                      ((t (:background ,warning))))
   `(isearch                                  ((t (:foreground ,accent :background ,jb-green))))
   `(isearch-fail                             ((t (:foreground ,accent :background ,jb-red))))
   `(lazy-highlight                           ((t (:foreground ,accent :background ,jb-y))))
   `(vertical-border                          ((,class (:foreground ,bg3))))
   `(minibuffer-prompt                        ((,class (:foreground ,fg2 :weight normal))))
   `(default-italic                           ((,class (:italic t))))
   `(link                                     ((,class (:foreground ,jb-blue :underline t))))
   `(error                                    ((,class (:foreground ,jb-orange))))
   `(warning                                  ((,class (:foreground ,jb-magenta))))
   `(success                                  ((,class (:foreground ,jb-bluegreen))))
   `(dired-directory                          ((t (:inherit (font-lock-keyword-face)))))
   `(line-number                              ((,class (:foreground ,line-num :background ,bg3))))
   `(line-number-current-line                 ((,class (:foreground ,fg1 :background ,bg3))))

   `(mode-line                                ((,class (:bold nil :foreground ,fg4 :background ,mode-line-bg))))
   `(mode-line-inactive                       ((,class (:bold nil :foreground ,fg1 :background ,mode-line-bg-dark))))
   `(mode-line-buffer-id                      ((,class (:bold nil :foreground ,accent :background nil))))
   `(mode-line-highlight                      ((,class (:foreground ,keyword :box nil :weight normal))))
   `(mode-line-emphasis                       ((,class (:foreground ,fg1))))

   `(company-tooltip                          ((t (:foreground ,fg2 :background ,bg4))))
   `(company-preview-common                   ((t (:foreground unspecified :background ,bg4))))
   `(company-scrollbar-bg                     ((t (:background ,bg4))))
   `(company-scrollbar-fg                     ((t (:background ,bg0))))
   `(company-tooltip-common                   ((t (:foreground "#926297" :bold t))))
   `(company-tooltip-selection                ((t (:background ,bg-hl))))
   `(company-tooltip-annotation               ((t (:foreground ,doc)))) ; parameter hints etc.

   `(org-document-title                       ((,class (:foreground ,jb-orange :height 1.2 :bold t))))
   `(org-level-1                              ((,class (:bold nil :foreground ,jb-orange :height 1.1))))
   `(org-level-2                              ((,class (:bold nil :foreground ,jb-magenta))))
   `(org-level-3                              ((,class (:bold nil :foreground ,jb-green))))
   `(org-level-4                              ((,class (:bold nil :foreground ,jb-bluegreen))))
   `(org-code                                 ((,class (:foreground ,fg2))))
   `(org-hide                                 ((,class (:foreground ,fg4))))
   `(org-date                                 ((,class (:underline t :foreground ,jb-green) )))
   `(org-footnote                             ((,class (:underline t :foreground ,fg4))))
   `(org-link                                 ((,class (:underline t :foreground ,type ))))
   `(org-special-keyword                      ((,class (:foreground ,jb-green))))
   `(org-block                                ((,class (:foreground ,fg2 :background ,bg0 :extend t))))
   `(org-quote                                ((,class (:inherit org-block :slant italic))))
   `(org-verse                                ((,class (:inherit org-block :slant italic))))
   `(org-todo                                 ((,class (:box (:line-width 1 :color ,fg3) :foreground ,keyword :bold nil))))
   `(org-done                                 ((,class (:box (:line-width 1 :color ,bg3) :bold nil :foreground ,bg4))))
   `(org-warning                              ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure                     ((,class (:weight normal :foreground ,fg3 :box (:color ,fg4) :background ,bg3))))
   `(org-agenda-date                          ((,class (:foreground ,var :height 1.1 ))))
   `(org-agenda-date-weekend                  ((,class (:weight normal :foreground ,fg4))))
   `(org-agenda-date-today                    ((,class (:weight normal :foreground ,keyword :height 1.2))))
   `(org-agenda-done                          ((,class (:foreground ,bg4))))
   `(org-scheduled                            ((,class (:foreground ,type))))
   `(org-scheduled-today                      ((,class (:foreground ,func :weight normal :height 1.2))))
   `(org-ellipsis                             ((,class (:foreground ,builtin))))
   `(org-verbatim                             ((,class (:foreground ,fg4))))
   `(org-document-info-keyword                ((,class (:foreground ,jb-green))))
   `(org-sexp-date                            ((,class (:foreground ,fg4))))

   `(font-latex-bold-face                     ((,class (:foreground ,type))))
   `(font-latex-italic-face                   ((,class (:foreground ,key3 :italic t))))
   `(font-latex-string-face                   ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords      ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords       ((,class (:foreground ,var))))

   `(ido-only-match                           ((,class (:foreground ,keyword))))
   `(ido-subdir                               ((,class (:weight normal :foreground ,fg0))))
   `(ido-first-match                          ((,class (:foreground ,keyword :bold nil))))

   `(gnus-header-content                      ((,class (:foreground ,keyword))))
   `(gnus-header-from                         ((,class (:foreground ,var))))
   `(gnus-header-name                         ((,class (:foreground ,type))))
   `(gnus-header-subject                      ((,class (:foreground ,func :bold nil))))

   `(mu4e-view-url-number-face                ((,class (:foreground ,type))))
   `(mu4e-cited-1-face                        ((,class (:foreground ,fg2))))
   `(mu4e-cited-7-face                        ((,class (:foreground ,fg3))))
   `(mu4e-header-marks-face                   ((,class (:foreground ,type))))

   `(ffap                                     ((,class (:foreground ,fg4))))

   `(js2-private-function-call                ((,class (:foreground ,const))))
   `(js2-jsdoc-html-tag-delimiter             ((,class (:foreground ,str))))
   `(js2-jsdoc-html-tag-name                  ((,class (:foreground ,key2))))
   `(js2-external-variable                    ((,class (:foreground ,type  ))))
   `(js2-function-param                       ((,class (:foreground ,const))))
   `(js2-jsdoc-value                          ((,class (:foreground ,str))))
   `(js2-private-member                       ((,class (:foreground ,fg3))))
   `(js2-warning                              ((t (:underline ,warning))))
   `(js2-error                                ((t (:foreground ,warning :weight normal))))
   `(js2-jsdoc-tag                            ((t (:foreground ,var))))
   `(js2-jsdoc-type                           ((t (:foreground ,var))))
   `(js2-instance-member                      ((t (:foreground ,var))))
   `(js2-object-property                      ((t (:foreground ,func))))
   `(js2-magic-paren                          ((t (:foreground ,const))))
   `(js2-function-call                        ((t (:foreground ,const))))
   `(js2-keywords                             ((t (:foreground ,keyword))))
   `(js3-warning-face                         ((,class (:underline ,keyword))))
   `(js3-error-face                           ((,class (:underline ,warning))))
   `(js3-external-variable-face               ((,class (:foreground ,var))))
   `(js3-function-param-face                  ((,class (:foreground ,key3))))
   `(js3-jsdoc-tag-face                       ((,class (:foreground ,keyword))))
   `(js3-instance-member-face                 ((,class (:foreground ,const))))

   `(ac-completion-face                       ((,class (:underline t :foreground ,keyword))))
   `(info-quoted-name                         ((,class (:foreground ,builtin))))
   `(info-string                              ((,class (:foreground ,str))))
   `(icompletep-determined                    ((,class :foreground ,builtin)))

   `(slime-repl-inputed-output-face           ((,class (:foreground ,type))))
   `(trailing-whitespace                      ((,class :foreground nil :background ,warning)))

   `(undo-tree-visualizer-current-face        ((,class :foreground ,builtin)))
   `(undo-tree-visualizer-default-face        ((,class :foreground ,fg2)))
   `(undo-tree-visualizer-unmodified-face     ((,class :foreground ,var)))
   `(undo-tree-visualizer-register-face       ((,class :foreground ,type)))

   `(rainbow-delimiters-depth-1-face          ((,class :foreground "gold")))
   `(rainbow-delimiters-depth-2-face          ((,class :foreground "orchid")))
   `(rainbow-delimiters-depth-3-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-depth-4-face          ((,class :foreground "gold")))
   `(rainbow-delimiters-depth-5-face          ((,class :foreground "orchid")))
   `(rainbow-delimiters-depth-6-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-depth-7-face          ((,class :foreground "gold")))
   `(rainbow-delimiters-depth-8-face          ((,class :foreground "orchid")))
   `(rainbow-delimiters-depth-9-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-unmatched-face        ((,class :foreground ,warning)))

   ;;;;; New magit faces (adpated from sanityinc-tomorrow themes)
   `(magit-item-highlight                     ((,class :background ,bg3)))
   `(magit-hunk-heading                       ((,class (:background ,bg3))))
   `(magit-hunk-heading-highlight             ((,class (:background ,bg3))))
   `(magit-bisect-bad                         ((t (:foreground ,jb-red))))
   `(magit-bisect-good                        ((t (:foreground ,jb-green))))
   `(magit-bisect-skip                        ((t (:foreground ,jb-orange))))
   `(magit-blame-date                         ((t (:foreground ,jb-red))))
   `(magit-blame-heading                      ((t (:foreground ,jb-orange :background ,bg3 :extend t))))
   `(magit-branch                             ((,class (:foreground ,jb-blue :weight normal))))
   `(magit-branch-current                     ((t (:foreground ,jb-blue))))
   `(magit-branch-local                       ((t (:foreground ,jb-bluegreen))))
   `(magit-branch-remote                      ((t (:foreground ,jb-green))))
   `(magit-cherry-equivalent                  ((t (:foreground ,jb-magenta))))
   `(magit-cherry-unmatched                   ((t (:foreground ,jb-bluegreen))))
   `(magit-diff-context-highlight             ((,class (:background ,bg3 :foreground ,fg3))))
   `(magit-diffstat-added                     ((t (:foreground ,jb-green))))
   `(magit-diffstat-removed                   ((t (:foreground ,jb-orange))))
   `(magit-dimmed                             ((t (:foreground ,comment))))
   `(magit-filename                           ((t (:foreground ,jb-magenta))))
   `(magit-hash                               ((t (:foreground ,comment))))
   `(magit-header-line                        ((t (:inherit nil))))
   `(magit-log-author                         ((t (:foreground ,jb-orange))))
   `(magit-log-date                           ((t (:foreground ,jb-blue))))
   `(magit-log-graph                          ((t (:foreground ,comment))))
   `(magit-mode-line-process                  ((t (:foreground ,jb-orange))))
   `(magit-mode-line-process-error            ((t (:foreground ,jb-red))))
   `(magit-process-ok                         ((t (:inherit success))))
   `(magit-process-ng                         ((t (:inherit error))))
   `(magit-reflog-amend                       ((t (:foreground ,jb-magenta))))
   `(magit-reflog-checkout                    ((t (:foreground ,jb-blue))))
   `(magit-reflog-cherry-pick                 ((t (:foreground ,jb-green))))
   `(magit-reflog-commit                      ((t (:foreground ,jb-green))))
   `(magit-reflog-merge                       ((t (:foreground ,jb-green))))
   `(magit-reflog-other                       ((t (:foreground ,jb-bluegreen))))
   `(magit-reflog-rebase                      ((t (:foreground ,jb-magenta))))
   `(magit-reflog-remote                      ((t (:foreground ,jb-bluegreen))))
   `(magit-reflog-reset                       ((t (:inherit error))))
   `(magit-refname                            ((t (:foreground ,comment))))
   `(magit-section-heading                    ((t (:foreground ,jb-magenta))))
   `(magit-section-heading-selection          ((t (:foreground ,jb-orange :extend t))))
   `(magit-section-highlight                  ((t (:background ,bg3 :extend t))))
   `(magit-sequence-drop                      ((t (:foreground ,jb-red))))
   `(magit-sequence-head                      ((t (:foreground ,jb-blue))))
   `(magit-sequence-part                      ((t (:foreground ,jb-orange))))
   `(magit-sequence-stop                      ((t (:foreground ,jb-green))))
   `(magit-signature-bad                      ((t (:inherit error))))
   `(magit-signature-error                    ((t (:inherit error))))
   `(magit-signature-expijb-red               ((t (:foreground ,jb-orange))))
   `(magit-signature-good                     ((t (:inherit success))))
   `(magit-signature-revoked                  ((t (:foreground ,jb-magenta))))
   `(magit-signature-untrusted                ((t (:foreground ,jb-bluegreen))))
   `(magit-tag                                ((t (:foreground ,jb-yellow))))

   `(term                                     ((,class (:foreground ,fg1 :background ,bg1))))
   `(term-color-black                         ((,class (:foreground ,bg3 :background ,bg3))))
   `(term-color-blue                          ((,class (:foreground ,func :background ,func))))
   `(term-color-red                           ((,class (:foreground ,keyword :background ,bg3))))
   `(term-color-green                         ((,class (:foreground ,type :background ,bg3))))
   `(term-color-yellow                        ((,class (:foreground ,var :background ,var))))
   `(term-color-magenta                       ((,class (:foreground ,builtin :background ,builtin))))
   `(term-color-cyan                          ((,class (:foreground ,str :background ,str))))
   `(term-color-white                         ((,class (:foreground ,fg2 :background ,fg2))))

   `(helm-header                              ((,class (:foreground ,fg2 :background ,bg1 :underline nil :box nil))))
   `(helm-source-header                       ((,class (:foreground ,keyword :background ,bg1 :underline nil :weight normal))))
   `(helm-selection                           ((,class (:background ,bg2 :underline nil))))
   `(helm-selection-line                      ((,class (:background ,bg2))))
   `(helm-visible-mark                        ((,class (:foreground ,bg1 :background ,bg3))))
   `(helm-candidate-number                    ((,class (:foreground ,bg1 :background ,fg1))))
   `(helm-separator                           ((,class (:foreground ,type :background ,bg1))))
   `(helm-time-zone-current                   ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-time-zone-home                      ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-not-saved                    ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-process                      ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-buffer-saved-out                    ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-buffer-size                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-ff-directory                        ((,class (:foreground ,func :background ,bg1 :weight normal))))
   `(helm-ff-file                             ((,class (:foreground ,fg1 :background ,bg1 :weight normal))))
   `(helm-ff-executable                       ((,class (:foreground ,key2 :background ,bg1 :weight normal))))
   `(helm-ff-invalid-symlink                  ((,class (:foreground ,key3 :background ,bg1 :weight normal))))
   `(helm-ff-symlink                          ((,class (:foreground ,keyword :background ,bg1 :weight normal))))
   `(helm-ff-prefix                           ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
   `(helm-grep-cmd-line                       ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-file                           ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-finish                         ((,class (:foreground ,fg2 :background ,bg1))))
   `(helm-grep-lineno                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-match                          ((,class (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running                        ((,class (:foreground ,func :background ,bg1))))
   `(helm-moccur-buffer                       ((,class (:foreground ,func :background ,bg1))))
   `(helm-source-go-package-godoc-description ((,class (:foreground ,str))))
   `(helm-bookmark-w3m                        ((,class (:foreground ,type))))

   `(web-mode-html-bracket-face               ((,class (:foreground ,jb-yellow))))
   `(web-mode-html-tag-face                   ((,class (:foreground ,jb-yellow))))
   `(web-mode-html-attr-name-face             ((,class (:foreground ,var))))
   `(web-mode-html-attr-value-face            ((,class (:foreground ,str))))
   `(web-mode-builtin-face                    ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                    ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face                   ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-keyword-face                    ((,class (:inherit ,font-lock-keyword-face))))
   `(web-mode-doctype-face                    ((,class (:inherit ,font-lock-doc-face))))
   `(web-mode-function-name-face              ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-string-face                     ((,class (:inherit ,font-lock-string-face))))
   `(web-mode-type-face                       ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-warning-face                    ((,class (:inherit ,font-lock-warning-face))))

   `(ediff-fine-diff-Ancestor                 ((t (:background "#885555"))))
   `(ediff-fine-diff-A                        ((t (:background "#885555"))))
   `(ediff-fine-diff-B                        ((t (:background "#558855"))))
   `(ediff-fine-diff-C                        ((t (:background "#555588"))))
   `(ediff-current-diff-Ancestor              ((t (:background "#663333"))))
   `(ediff-current-diff-A                     ((t (:background "#663333"))))
   `(ediff-current-diff-B                     ((t (:background "#336633"))))
   `(ediff-current-diff-C                     ((t (:background "#333366"))))
   `(ediff-even-diff-Ancestor                 ((t (:background ,bg3))))
   `(ediff-even-diff-A                        ((t (:background ,bg3))))
   `(ediff-even-diff-B                        ((t (:background ,bg3))))
   `(ediff-even-diff-C                        ((t (:background ,bg3))))
   `(ediff-odd-diff-Ancestor                  ((t (:background ,bg3))))
   `(ediff-odd-diff-A                         ((t (:background ,bg3))))
   `(ediff-odd-diff-B                         ((t (:background ,bg3))))
   `(ediff-odd-diff-C                         ((t (:background ,bg3))))

   `(jde-java-font-lock-package-face          ((t (:foreground ,var))))
   `(jde-java-font-lock-public-face           ((t (:foreground ,keyword))))
   `(jde-java-font-lock-private-face          ((t (:foreground ,keyword))))
   `(jde-java-font-lock-constant-face         ((t (:foreground ,const))))
   `(jde-java-font-lock-modifier-face         ((t (:foreground ,key3))))
   `(jde-jave-font-lock-protected-face        ((t (:foreground ,keyword))))
   `(jde-java-font-lock-number-face           ((t (:foreground ,var))))

   `(centaur-tabs-default                     ((t (:background ,bg1 :foreground ,fg1))))
   `(centaur-tabs-selected                    ((t (:background ,bg1 :foreground ,fg3 :box nil))))
   `(centaur-tabs-unselected                  ((t (:background ,bg2 :foreground ,fg0 :box nil))))
   `(centaur-tabs-selected-modified           ((t (:background ,bg2 :foreground ,accent :box nil))))
   `(centaur-tabs-unselected-modified         ((t (:background ,bg2 :foreground ,fg4 :box nil))))
   `(centaur-tabs-active-bar-face             ((t (:background ,accent :box nil))))
   `(centaur-tabs-modified-marker-selected    ((t (:inherit 'centaur-tabs-selected-modified :foreground ,accent :box nil))))
   `(centaur-tabs-modified-marker-unselected  ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,accent :box nil))))

   `(solaire-default-face                     ((t (:inherit default :background ,bg2))))
   `(solaire-minibuffer-face                  ((t (:inherit default :background ,bg2))))
   `(solaire-hl-line-face                     ((t (:inherit hl-line :background ,bg3))))
   `(solaire-org-hide-face                    ((t (:inherit org-hide :background ,bg2))))

   `(ivy-confirm-face                         ((t (:inherit minibuffer-prompt :foreground ,keyword))))
   `(ivy-current-match                        ((t (:background ,bg-hl :extend t))))
   `(ivy-highlight-face                       ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face                  ((t (:inherit minibuffer-prompt :foreground ,warning))))
   `(ivy-minibuffer-match-face-1              ((t (:inherit isearch))))
   `(ivy-minibuffer-match-face-2              ((t (:inherit ivy-minibuffer-match-face-1))))
   `(ivy-minibuffer-match-face-3              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-face-4              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-highlight           ((t (:inherit ivy-current-match))))
   `(ivy-modified-buffer                      ((t (:inherit default :foreground ,var))))
   `(ivy-virtual                              ((t (:inherit default :foreground ,doc))))
   `(ivy-posframe                             ((t (:background "#252526"))))

   `(counsel-key-binding                      ((t (:foreground ,var))))

   `(swiper-match-face-1                      ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2                      ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3                      ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4                      ((t (:inherit ivy-minibuffer-match-face-4))))
   `(swiper-line-face                         ((t (:foreground ,fg0 :background ,bg4 :extend t))))

   `(git-gutter:added                         ((t (:background ,jb-g :foreground ,jb-g :weight normal))))
   `(git-gutter:deleted                       ((t (:background ,jb-r :foreground ,jb-r :weight normal))))
   `(git-gutter:modified                      ((t (:background ,jb-y :foreground ,jb-y :weight normal))))
   `(git-gutter-fr:added                      ((t (:background ,jb-g :foreground ,jb-g :weight normal))))
   `(git-gutter-fr:deleted                    ((t (:background ,jb-r :foreground ,jb-r :weight normal))))
   `(git-gutter-fr:modified                   ((t (:background ,jb-y :foreground ,jb-y :weight normal))))

   `(diff-hl-insert                           ((t (:background ,jb-g :foreground ,jb-g))))
   `(diff-hl-delete                           ((t (:background ,jb-r :foreground ,jb-r))))
   `(diff-hl-change                           ((t (:background ,jb-y :foreground ,jb-y))))

   `(neo-dir-link-face                        ((t (:foreground "#cccccc" :family "Sans Serif"))))
   `(neo-header-face                          ((t (:foreground "#cccccc" :family "Sans Serif"))))
   `(neo-banner-face                          ((t (:foreground "#cccccc" :family "Sans Serif"))))
   `(neo-root-dir-face                        ((t (:foreground "#cccccc" :family "Sans Serif"))))
   `(neo-file-link-face                       ((t (:foreground "#aaaaaa" :family "Sans Serif"))))
   `(neo-expand-btn-face                      ((t (:foreground "#aaaaaa"))))

   `(sml/global                               ((t (:foreground ,fg1 :weight normal))))
   `(sml/filename                             ((t (:foreground ,fg1 :weight normal))))
   `(sml/prefix                               ((t (:foreground ,fg1 :weight normal))))
   `(sml/read-only                            ((t (:foreground ,fg1 :weight normal))))
   `(sml/modes                                ((t (:foreground ,fg1 :weight normal))))
   `(sml/modified                             ((t (:foreground ,fg3 :weight normal))))

   `(evil-ex-substitute-matches               ((t (:foreground ,warning :weight normal :strike-through t))))
   `(evil-ex-substitute-replacement           ((t (:foreground ,jb-bluegreen :weight normal))))

   `(hl-todo                                  ((t (:inverse-video t))))
   `(highlight-numbers-number                 ((t (:foreground ,jb-blue))))
   `(highlight-operators-face                 ((t (:inherit default))))
   `(highlight-symbol-face                    ((t (:background "#354a32"))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jetbrains-darcula)
(provide 'jetbrains-darcula-theme)

;;; jetbrains-darcula-theme.el ends here
