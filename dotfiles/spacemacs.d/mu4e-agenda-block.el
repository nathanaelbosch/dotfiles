;;; mu4e-agenda-block.el --- Show mu4e unread emails in org-agenda -*- lexical-binding: t; -*-

;;; --- Customization ---
;; Shared with whatsapp-agenda-block.el and signal-agenda-block.el.
;; defvar only sets a value if unbound, so whichever file loads first
;; defines the value; the others reuse it.

(defvar my/inbox-name-width 25
  "Column width for the name/sender field in inbox agenda blocks.")

(defvar my/inbox-preview-width 50
  "Column width for the preview/subject field in inbox agenda blocks.")

(defvar my/inbox-date-format "%Y-%m-%d"
  "Date format for inbox agenda blocks.
Uses strftime syntax, shared by mu's --date-format, SQLite's STRFTIME,
and Emacs's `format-time-string'.")

(defvar my/inbox-date-width 10
  "Column width for the date field in inbox agenda blocks.
Should be wide enough for the chosen `my/inbox-date-format'.")

(defvar my/mu4e-agenda-query "flag:unread"
  "mu query for the unread emails agenda block.")

;;; --- Keybinding support ---

;; NOTE: The --sortfield and --fields flags work with mu 1.8.x through 1.10.x.
;; If you upgrade mu (especially past 1.10), verify that these flags still exist.
;; In newer versions, --sortfield may become --sort and --fields may change syntax.

(defun my/mu4e-agenda-open-at-point ()
  "Open the mu4e email at point in the agenda."
  (interactive)
  (let ((msgid (get-text-property (point) 'mu4e-msgid)))
    (if msgid
        (mu4e-search (format "msgid:%s" msgid))
      (user-error "No mu4e message at point"))))

(defun my/org-agenda-switch-to-mu4e-advice (orig-fn &rest args)
  "Around advice for `org-agenda-switch-to'.
If point has a mu4e-msgid text property, open the email in mu4e.
Otherwise, call the original function."
  (let ((msgid (get-text-property (point) 'mu4e-msgid)))
    (if msgid
        (mu4e-search (format "msgid:%s" msgid))
      (apply orig-fn args))))

(advice-add 'org-agenda-switch-to :around #'my/org-agenda-switch-to-mu4e-advice)

(defun my/org-agenda-goto-mu4e-advice (orig-fn &rest args)
  "Around advice for `org-agenda-goto'.
If point has a mu4e-msgid text property, open the email in mu4e
in another window.  Otherwise, call the original function."
  (let ((msgid (get-text-property (point) 'mu4e-msgid)))
    (if msgid
        (progn
          (switch-to-buffer-other-window (current-buffer))
          (mu4e-search (format "msgid:%s" msgid)))
      (apply orig-fn args))))

(advice-add 'org-agenda-goto :around #'my/org-agenda-goto-mu4e-advice)

;;; --- Shared helpers ---

(defun my/inbox--insert-separator ()
  "Insert `org-agenda-block-separator' if not at the beginning of the buffer."
  (unless (bobp)
    (let ((sep (if (stringp org-agenda-block-separator)
                   org-agenda-block-separator
                 (make-string (window-width) org-agenda-block-separator))))
      (insert (concat "\n" sep "\n")))))

(defun my/inbox--format-line (date name preview)
  "Format a single inbox line with DATE, NAME, and PREVIEW."
  (concat "  "
          (propertize (string-pad date my/inbox-date-width)
                      'face 'org-date)
          "  "
          (propertize (string-pad
                       (truncate-string-to-width name my/inbox-name-width)
                       my/inbox-name-width)
                      'face 'org-agenda-calendar-event)
          "  "
          (propertize (truncate-string-to-width preview my/inbox-preview-width)
                      'face 'font-lock-comment-face)
          "\n"))

;;; --- Agenda block ---

(defun my/org-agenda-mu4e-unread (&optional match)
  "Insert a list of unread mu4e emails into the agenda buffer.
MATCH is ignored; the query is controlled by `my/mu4e-agenda-query'.
Add this as a block in `org-agenda-custom-commands':
  (my/org-agenda-mu4e-unread \"\"
    ((org-agenda-overriding-header \"Unread emails\")))"
  (let* ((inhibit-read-only t)
         (query my/mu4e-agenda-query)
         (fmt-fields "d\tf\ts\ti")
         (cmd (format "mu find %s --sortfield=date --reverse --fields %s --nocolor 2>/dev/null"
                      (shell-quote-argument query)
                      (shell-quote-argument fmt-fields)))
         (output (string-trim (shell-command-to-string cmd)))
         (lines (when (and (not (string-empty-p output))
                           (not (string-match-p "^mu:" output)))
                  (split-string output "\n" t)))
         (header (or org-agenda-overriding-header
                     (format "Unread emails (%d)" (length lines)))))
    (goto-char (point-max))
    (my/inbox--insert-separator)
    (insert (propertize (concat header "\n") 'face 'org-agenda-structure))
    (if (not lines)
        (insert "  No unread emails\n")
      (dolist (line lines)
        (let* ((parts (split-string line "\t"))
               (date-raw (or (nth 0 parts) ""))
               (from (or (nth 1 parts) ""))
               (subject (or (nth 2 parts) ""))
               (msgid (or (nth 3 parts) ""))
               (date (condition-case nil
                         (format-time-string my/inbox-date-format
                                             (date-to-time date-raw))
                       (error date-raw)))
               (formatted (my/inbox--format-line date from subject)))
          (add-text-properties 0 (length formatted)
                               (list 'mu4e-msgid msgid
                                     'mouse-face 'highlight)
                               formatted)
          (insert formatted))))))

(provide 'mu4e-agenda-block)
;;; mu4e-agenda-block.el ends here
