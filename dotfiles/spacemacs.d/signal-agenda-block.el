;;; signal-agenda-block.el --- Show unread Signal chats in org-agenda -*- lexical-binding: t; -*-

;;; --- Customization ---
;; Shared with mu4e-agenda-block.el and whatsapp-agenda-block.el.

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

(defvar my/signal-db-path
  (expand-file-name "~/.config/Signal/sql/db.sqlite")
  "Path to the Signal Desktop SQLite database.")

(defvar my/signal-config-path
  (expand-file-name "~/.config/Signal/config.json")
  "Path to the Signal Desktop config.json (contains the DB encryption key).")

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

;;; --- Signal-specific ---

(defun my/signal-db-key ()
  "Read the Signal Desktop database encryption key from config.json."
  (with-temp-buffer
    (insert-file-contents my/signal-config-path)
    (let ((json (json-parse-buffer :object-type 'alist)))
      (alist-get 'key json))))

;;; --- Agenda block ---

(defun my/org-agenda-signal-unread (&optional match)
  "Insert a list of unread Signal chats into the agenda buffer.
MATCH is ignored.  Add this as a block in `org-agenda-custom-commands':
  (my/org-agenda-signal-unread \"\"
    ((org-agenda-overriding-header \"Unread Signal\")))"
  (let* ((inhibit-read-only t)
         (db my/signal-db-path)
         (key (my/signal-db-key))
         (date-fmt my/inbox-date-format)
         (query (concat
                 "PRAGMA key = \"x'" key "'\"; "
                 "SELECT "
                 "  STRFTIME('" date-fmt "', m.sent_at / 1000, 'unixepoch', 'localtime'),"
                 "  COALESCE("
                 "    NULLIF(json_extract(c.json, '$.name'),''),"
                 "    NULLIF(json_extract(c.json, '$.profileName'),''),"
                 "    json_extract(c.json, '$.e164')),"
                 "  COALESCE("
                 "    NULLIF(REPLACE(SUBSTR(m.body, 1, 80), CHAR(10), ' '),''),"
                 "    CASE"
                 "      WHEN json_extract(m.json, '$.sticker.emoji') IS NOT NULL"
                 "        THEN '[sticker ' || json_extract(m.json, '$.sticker.emoji') || ']'"
                 "      WHEN m.hasVisualMediaAttachments = 1 THEN '[image]'"
                 "      WHEN m.hasAttachments = 1 THEN '[attachment]'"
                 "      ELSE ''"
                 "    END),"
                 "  c.id "
                 "FROM conversations c "
                 "LEFT JOIN messages m ON m.conversationId = c.id "
                 "  AND m.sent_at = ("
                 "    SELECT MAX(m2.sent_at) FROM messages m2 "
                 "    WHERE m2.conversationId = c.id "
                 "    AND m2.type IN ('incoming','outgoing')) "
                 "WHERE json_extract(c.json, '$.unreadCount') > 0 "
                 "   OR json_extract(c.json, '$.markedUnread') = true "
                 "ORDER BY m.sent_at DESC;"))
         (cmd (format "sqlcipher -separator '\t' %s %s 2>/dev/null"
                      (shell-quote-argument db)
                      (shell-quote-argument query)))
         (output (string-trim (shell-command-to-string cmd)))
         (all-lines (split-string output "\n" t))
         (lines (seq-filter (lambda (l) (not (string= l "ok"))) all-lines))
         (header (or org-agenda-overriding-header
                     (format "Unread Signal (%d)" (length lines)))))
    (goto-char (point-max))
    (my/inbox--insert-separator)
    (insert (propertize (concat header "\n") 'face 'org-agenda-structure))
    (if (not lines)
        (insert "  No unread Signal chats\n")
      (dolist (line lines)
        (let* ((parts (split-string line "\t"))
               (date (or (nth 0 parts) ""))
               (name (or (nth 1 parts) ""))
               (preview (or (nth 2 parts) ""))
               (conv-id (or (nth 3 parts) ""))
               (formatted (my/inbox--format-line date name preview)))
          (add-text-properties 0 (length formatted)
                               (list 'signal-conv-id conv-id
                                     'mouse-face 'highlight)
                               formatted)
          (insert formatted))))))

(provide 'signal-agenda-block)
;;; signal-agenda-block.el ends here
