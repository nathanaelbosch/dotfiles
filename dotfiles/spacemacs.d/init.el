;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; neotree
     auto-completion
     better-defaults
     bibtex
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     emacs-lisp
     evil-commentary
     finance
     git
     google-calendar
     helm
     html
     (latex :variables
            latex-enable-auto-fill nil
            latex-enable-folding t)
     lua
     markdown
     mu4e
     org
     pandoc
     pdf-tools
     (python :variables
             python-test-runner 'pytest)
     ranger
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     syntax-checking
     themes-megapack
     version-control
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(interleave)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         sanityinc-tomorrow-day
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   ;; dotspacemacs-line-numbers t
   dotspacemacs-line-numbers '(:relative
                               nil
                               :disabled-for-modes
                               dired-mode
                               doc-view-mode
                               pdf-view-mode)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; I like C-v to paste!
  ;; (cua-mode 1)
  (desktop-save-mode 1)
  ;; Visual line mode when working with text based content
  (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  ;; Forgot what this was about
  (setq-default TeX-master nil)
  ;; Default undo behaviour was a bit rough
  (setq evil-want-fine-undo t)
  ;; Something about having TODOs in my project folder, but I'm working on it
  ;; (setq-default dotspacemacs-configuration-layers
  ;;               '((org :variables org-projectile-file "TODOs.org")))
  ;; Ctrl-Shift-c to comment
  (global-set-key (kbd "C-S-c") 'evil-commentary-line)
  ;; Interleave mode
  ;; (define-key interleave-pdf-mode-map (kbd "M-c")   #'interleave-sync-pdf-page-current)
  ;; Use org-indent-mode by default
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  ;; Email in Emacs
  ;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

  ;; No more warnings in the init, but might actually lead to problems
  (setq explicit-shell-file-name "/bin/fish")
  (setq shell-file-name "fish")

  ;; Function to read lines of a file and output a list
  (defun read-lines (filePath)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents filePath)
      (split-string (buffer-string) "\n" t)))
  ;; Read lines from gcal.auth and store them in the variable
  (setq auth-lines (read-lines "~/gcal.auth"))
  ;; Google Calendar
  (setq org-gcal-client-id (car auth-lines)
        org-gcal-client-secret (car (cdr auth-lines)))

  ;; Org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
     (python . t)
     (gnuplot . t)
     ))
  )

(defun org-ref-config ()
  (setq reftex-default-bibliography '("~/MEGA/papers/references.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/MEGA/papers/notes.org"
        org-ref-default-bibliography '("~/MEGA/papers/references.bib")
        org-ref-pdf-directory "~/MEGA/papers/bibtex-pdfs/")

  ;; Further variables for helm-bibtex
  (setq bibtex-completion-bibliography "~/MEGA/papers/references.bib"
        bibtex-completion-library-path "~/MEGA/papers/bibtex-pdfs"
        bibtex-completion-notes-path "~/MEGA/papers/helm-bibtex-notes")

  ;; open pdf with system pdf viewer (works on mac)
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "open" "*open*" "open" fpath)))

  ;; alternative
  ;; (setq bibtex-completion-pdf-open-function 'org-open-file)

  ;; Download directory
  (setq biblio-download-directory "~/MEGA/papers/bibtex-pdfs")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Inline images
  (setq org-startup-with-inline-images t)

  ;; Scroll margin
  (setq scroll-margin 1)

  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)

  ;; Visual line mode when working with text based content
  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)

  ;; Default folder for agenda files?
  (setq org-agenda-files '("~/Dropbox/org/"
                           "~/Dropbox/org/gcal/"))
  (with-eval-after-load 'org (setq org-default-notes-file '"~/Dropbox/org/todo.org"))

  ;; org-ref
  ;; Followed https://codearsonist.com/reading-for-programmers and https://github.com/jkitchin/org-ref
  (org-ref-config)

  ;;
  (setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Inbox")
           "* TODO %?")
          ("g" "Google Calendar Entry" entry (file "~/Dropbox/org/gcal/gcal.org")
           "* TODO %?")
          ;; ("w" "Weekly review" entry (file+olp+datetree "~/Dropbox/org/reviews.org")
          ;;  (file "~/Dropbox/org/weeklyreview_template.org"))
          ;; ("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org")
          ;;  "* %?\nEntered on %U\n  %i\n  %a")
           ("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org")
           "* %?\n\nEntered on %U\n  %i")
           ("w" "Wäsche" entry (file+headline "~/Dropbox/org/todo.org" "Misc")
            "* TODO Wäsche\nSCHEDULED: %t\n- [ ] Machen\n- [ ] Aufhängen\n- [ ] Abhängen")
           ("m" "Masterpraktikum")
           ("mg" "Masterpraktikum: General" entry (file+headline "~/Dropbox/org/masterpraktikum.org" "General")
            "* TODO %?")
           ("mc" "Masterpraktikum: Clustering" entry (file+olp "~/Dropbox/org/masterpraktikum.org" "Clustering" "Tasks")
            "* TODO %?")
           ("ma" "Masterpraktikum: Anomaly Detection 2" entry (file+olp "~/Dropbox/org/masterpraktikum.org" "Anomaly Detection 2" "Tasks")
            "* TODO %?")
           ("r" "To read" entry (file+headline "~/Dropbox/org/todo.org" "Inbox")
            "* TOREAD %?")
  ))
  ;; Custom todo keywords - or not
  (setq org-todo-keywords
        '((sequence "TODO(t)" "IN PROGRESS(p)" "NEXT(n)" "WAITING(w)" "INACTIVE(i)" "|" "CANCELLED(c)" "DONE(d)" )
          (sequence "HABIT(h)" "TOREAD(r)" "|")
          ))
  ;; (setq org-todo-keyword-faces
  ;;       '(("TOREAD" . "#5e8d87")
  ;;         ("TOWATCH" . "#5e8d87")
  ;;         ("HABIT" . "#de935f")
  ;;          ))
  ;; Hitting "kj" fast makes me escape insert mode
  ;; (setq-default evil-escape-key-sequence "kj")

  ;; Email in emacs with mu4e
  (setq mu4e-sent-folder "/Gmail/[Google Mail].All Mail"
        mu4e-drafts-folder "/Gmail/[Google Mail].Drafts"
        mu4e-trash-folder "/Gmail/[Google Mail].Bin"
        mu4e-refile-folder "/Gmail/[Google Mail].All Mail")
  ;; (setq mu4e-account-alist
  ;;       '(("gmail"
  ;;          ;; Under each account, set the account-specific variables you want.
  ;;          (mu4e-sent-messages-behavior delete)
  ;;          (mu4e-sent-folder "/Gmail/[Gmail]/.Sent Mail")
  ;;          (mu4e-drafts-folder "/gmail/[Gmail]/.Drafts")
  ;;          (user-mail-address "billy@gmail.com")
  ;;          (user-full-name "Billy"))
  ;;         ("college"
  ;;          (mu4e-sent-messages-behavior sent)
  ;;          (mu4e-sent-folder "/college/Sent Items")
  ;;          (mu4e-drafts-folder "/college/Drafts")
  ;;          (user-mail-address "bb15@college.edu")
  ;;          (user-full-name "Billy Bob 15"))))
  ;; (mu4e/mail-account-reset)

  ;; Google Calendar
  (setq org-gcal-file-alist '(("nathanael.bosch@gmail.com" . "~/Dropbox/org/gcal/gcal.org")
                              ("y5ka3vijk107hk59p3ruo8b7mq8@group.calendar.google.com" . "~/Dropbox/org/gcal/vacances.org")
                              ("43ntc9b5o132nim5q8pnin4hm8@group.calendar.google.com" . "~/Dropbox/org/gcal/uni.org")
                              ("67bvrtshu9ufjh2bk4c3vul8vc@group.calendar.google.com" . "~/Dropbox/org/gcal/urlaube.org")
                              ("5g7i1tndcav3oulm0c9ktb0v1bblscmr@import.calendar.google.com" . "~/Dropbox/org/gcal/tumonline.org")
                              ))
  (add-hook 'org-capture-after-finalize-hook 'google-calendar/sync-cal-after-capture)
  ;; (setq alert-default-style 'libnotify)

  ;; org-refile
  (setq org-refile-targets (quote (("todo.org" :maxlevel . 2)
                                   ("notes.org" :maxlevel . 2)
                                   )))

  ;; Start magit commit in insert mode
  (add-hook 'with-editor-mode-hook 'evil-insert-state)

  ;; Hide tag someday in agenda
  (setq org-agenda-filter-preset '("-someday"))
  (setq org-agenda-regexp-filter-preset '("-WAITING"))

  (setq org-agenda-custom-commands
        ;; (append org-agenda-custom-commands
                '(("g" . "GTD-Workflow")
                  ("gn" "Next Actions" tags-todo "NEXT" ((org-use-tag-inheritance nil)))
                  ("gd" "DONE" tags-todo "DONE" ((org-use-tag-inheritance nil)))
                  ("gs" "SOMEDAY" tags "someday" ((org-agenda-filter-preset
                                                   '("+someday"))(org-agenda-todo-ignore-with-date nil)))
                  ;; ("gs" "SOMEDAY" tags "someday" ((org-use-tag-inheritance nil)))
                  ("gw" "Waiting" todo "WAITING")
                  ("r" . "Review")
                  ("rd" "Today" agenda ""
                   ((org-agenda-span 1)
                    (org-agenda-view-columns-initially t)
                    (org-agenda-skip-scheduled-if-done nil)
                    ))
                  ("rw" "Week" agenda ""
                   ((org-agenda-span 'week)
                    (org-agenda-view-columns-initially t)
                    (org-agenda-skip-scheduled-if-done nil)
                    ))
                  )
                )
  ;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-scheduled-if-done t)
  ;; (setq org-agenda-window-setup 'current-window)
  ;; (setq org-agenda-window-setup 'only-window)

  ;; Auto-refresh buffers when files changed on disk
  (global-auto-revert-mode t)

  ;; Automatically save org buffers when agenda is open
  ;; (add-hook 'org-agenda-mode-hook
  ;;           (lambda ()
  ;;             (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
  ;;             (auto-save-mode)))
  ;; Save even more stuff
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)
  ;; Start agenda in day mode
  (setq org-agenda-span 1)
  ;; Start week on monday
  (setq org-agenda-start-on-weekday 1)

  ;; Correct indentation in org-babel source blocks
  (setq org-src-tab-acts-natively t)

  ;; Column view
  (setq org-agenda-overriding-columns-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{:}")
  ;; (setq org-agenda-overriding-columns-format "%7TODO(To Do) %38ITEM(Details) %TAGS(Context) %5Effort(Time){:} %6CLOCKSUM{:}")

  ;; Custom Org commands to follow the spacemacs mnemonics instead of C-c C-x ...
  (evil-leader/set-key-for-mode 'org-mode "U" 'org-update-all-dblocks)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/notes.org" "~/Projekte/math_thesis/notes.org" "~/Dropbox/org/todo.org")))
 '(package-selected-packages
   (quote
    (yasnippet-snippets web-beautify symon string-inflection spaceline-all-the-icons prettier-js pippel pipenv password-generator overseer org-brain magit-svn kaolin-themes importmagic epc ctable concurrent deferred impatient-mode simple-httpd helm-xref helm-purpose window-purpose imenu-list helm-git-grep gitignore-templates eziam-theme evil-org evil-lion evil-ledger evil-goggles evil-cleverparens paredit anzu highlight editorconfig doom-themes doom-modeline eldoc-eval shrink-path all-the-icons memoize counsel-projectile counsel swiper color-theme-sanityinc-tomorrow centered-cursor-mode browse-at-remote packed helm helm-core async popup evil goto-chg dotenv-mode flycheck-ledger ledger-mode hacker-typer nyan-mode treepy graphql visual-fill-column ranger ag web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data org-projectile-helm zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme evil-commentary espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme xterm-color unfill shell-pop mwim multi-term helm-company helm-c-yasnippet git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company-auctex company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete auctex-latexmk auctex pandoc-mode ox-pandoc ht org-ref pdf-tools key-chord ivy tablist helm-bibtex parsebib biblio biblio-core smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit ghub with-editor yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
