;;; whatsapp-agenda-block.el --- Show unread WhatsApp chats in org-agenda -*- lexical-binding: t; -*-

;;; --- Customization ---
;; Shared with mu4e-agenda-block.el and signal-agenda-block.el.

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

(defvar my/whatsapp-messages-db
  (expand-file-name "~/src/whatsapp-mcp/whatsapp-bridge/store/messages.db")
  "Path to the whatsapp-mcp bridge messages.db SQLite database.")

(defvar my/whatsapp-session-db
  (expand-file-name "~/src/whatsapp-mcp/whatsapp-bridge/store/whatsapp.db")
  "Path to the whatsmeow session database (contains contacts).")

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

(defun my/org-agenda-whatsapp-unread (&optional match)
  "Insert a list of unread WhatsApp chats into the agenda buffer.
MATCH is ignored.  Add this as a block in `org-agenda-custom-commands':
  (my/org-agenda-whatsapp-unread \"\"
    ((org-agenda-overriding-header \"Unread WhatsApp\")))"
  (let* ((inhibit-read-only t)
         (msg-db my/whatsapp-messages-db)
         (ses-db my/whatsapp-session-db)
         (date-fmt my/inbox-date-format)
         (query (concat
                 "ATTACH DATABASE " (format "'%s'" ses-db) " AS wa; "
                 "SELECT "
                 "  STRFTIME('" date-fmt "', c.last_message_time),"
                 "  COALESCE(NULLIF(wc.full_name,''), NULLIF(wc.push_name,''), c.name),"
                 "  REPLACE(SUBSTR(m.content, 1, 80), CHAR(10), ' '),"
                 "  c.jid "
                 "FROM chats c "
                 "LEFT JOIN wa.whatsmeow_contacts wc ON c.jid = wc.their_jid "
                 "LEFT JOIN messages m ON c.jid = m.chat_jid "
                 "  AND m.timestamp = (SELECT MAX(m2.timestamp) FROM messages m2 WHERE m2.chat_jid = c.jid) "
                 "WHERE c.unread_count > 0 "
                 "ORDER BY c.last_message_time DESC;"))
         (cmd (format "sqlite3 -separator '\t' %s %s 2>/dev/null"
                      (shell-quote-argument msg-db)
                      (shell-quote-argument query)))
         (output (string-trim (shell-command-to-string cmd)))
         (lines (when (not (string-empty-p output))
                  (split-string output "\n" t)))
         (header (or org-agenda-overriding-header
                     (format "Unread WhatsApp (%d)" (length lines)))))
    (goto-char (point-max))
    (my/inbox--insert-separator)
    (insert (propertize (concat header "\n") 'face 'org-agenda-structure))
    (if (not lines)
        (insert "  No unread WhatsApp chats\n")
      (dolist (line lines)
        (let* ((parts (split-string line "\t"))
               (date (or (nth 0 parts) ""))
               (name (or (nth 1 parts) ""))
               (preview (or (nth 2 parts) ""))
               (jid (or (nth 3 parts) ""))
               (formatted (my/inbox--format-line date name preview)))
          (add-text-properties 0 (length formatted)
                               (list 'whatsapp-jid jid
                                     'mouse-face 'highlight)
                               formatted)
          (insert formatted))))))

(provide 'whatsapp-agenda-block)
;;; whatsapp-agenda-block.el ends here
