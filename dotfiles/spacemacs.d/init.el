;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; neotree
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-sort-by-usage t
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      )
     ;; better-defaults
     bibtex
     ;; c-c++
     colors
     command-log
     csv
     ;; deft
     (elfeed :variables
             elfeed-feeds '(("http://blog.samaltman.com/posts.atom")
                            ("https://unterschichtblog.blogspot.com/feeds/posts/default?alt=rss")
                            ("https://aella.substack.com/feed")
                            ("https://sluts.substack.com/feed")
                            ("dynomight.net/feed.xml")
                            ("https://amoretlicentia.substack.com/feed")
                            ))
     emacs-lisp
     ;; epub
     ;; exwm
     ;; evil-commentary
     finance
     git
     ;; github
     ;; google-calendar
     ;; haskell
     helm
     html
     ;; javascript
     julia
     (latex :variables
            ;; latex-enable-auto-fill nil
            ;; latex-backend 'company-auctex
            latex-backend 'lsp
            latex-build-command "LatexMk"
            latex-enable-auto-fill nil
            latex-enable-magic t
            latex-enable-folding t)
     ;; lsp
     (markdown :variables
               markdown-live-preview-engine 'vmd
               )
     (mu4e :variables
           mu4e-installation-path "/snap/maildir-utils/current/share/emacs/site-lisp/mu4e"
           mu4e-use-maildirs-extension nil
           mu4e-maildir "~/Mail"
           mu4e-enable-mode-line t
           mu4e-get-mail-command "offlineimap"
           ;; mu4e-update-interval 180
           ;; mu4e-update-interval (* 1 60) ;; fetch mail with offlineimap every 1 minutes
           mu4e-org-contacts-file "~/org/contacts.org"
           mu4e-view-show-addresses t
           mu4e-view-show-images t
           mu4e-confirm-quit nil
           mu4e-enable-notifications t
           mu4e-headers-skip-duplicates t
           mu4e-enable-async-operations nil
           )
     ;;(multiple-cursors :variables multiple-cursors-backend 'evil-mc)
     neotree
     ;; octave
     (org :variables
          org-want-todo-bindings t
          org-enable-reveal-js-support t
          org-enable-hugo-support t
          )
     ;; pandoc
     pdf
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-test-runner 'pytest
             python-formatter 'ruff
             python-format-on-save t
             python-fill-column 88
             python-auto-set-local-pyvenv-virtualenv nil
             )
     ;; ranger
     ;; rust
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     ;; spell-checking
     syntax-checking
     themes-megapack
     treemacs
     ;; (wakatime :variables
     ;;           wakatime-api-key "fb284fd5-bc08-43bc-94d9-9220271186f9"
     ;;           wakatime-cli-path "/home/nath/.local/bin/wakatime")
     version-control
     ;; xkcd
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      yasnippet-snippets
                                      org-roam
                                      org-roam-bibtex
                                      ;; org-gcal ;; org-interface to google calendar
                                      ;; org-clock-csv ;; export clock data to csv
                                      ;; org-fragtog ;; nicely visually show latex in org-mode
                                      ;; org-protocol ;; not needed anymore I think as it works anyways?
                                      ;; org-modern ;; a modern style for org buffers - not sure if I still love this but to be revisited!
                                      cdlatex ;; Faster insertion of environments in latex
                                      fira-code-mode
                                      ;; minimap
                                      (copilot :location (recipe
                                                          :fetcher github
                                                          :repo "copilot-emacs/copilot.el"
                                                          :files ("*.el" "dist")))
                                      atomic-chrome ;; useful if I want to edit text in a browser
                                      ivy-emoji ;; to insert emojis
                                      ;; For org-roam
                                      zetteldesk
                                      org-roam-ui
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message "#+TITLE: Scratch

"

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         gruvbox
                         gruvbox-light-hard
                         sanityinc-tomorrow-night
                         sanityinc-tomorrow-day
                         leuven
                         )


   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.7)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Fira Code"
                               :size 14.
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'nerd-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   ;; dotspacemacs-line-numbers t
   dotspacemacs-line-numbers '(:relative
                               nil
                               :disabled-for-modes
                               dired-mode
                               doc-view-mode
                               pdf-view-mode
                               text-mode)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; No more warnings in the init, but might actually lead to problems
  ;; (setq explicit-shell-file-name "/bin/fish")
  ;; (setq shell-file-name "fish")
  ;; (require 'exwm-systemtray)
  ;; (exwm-systemtray-enable)
  ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp")
  ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Most important part of this config file: Load the ACTUAL config!
  (org-babel-load-file "~/.spacemacs.d/config.org")

  (find-file "~/org/inbox.org")
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
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
   '(ansi-color-faces-vector
     [default default default italic underline success warning error])
   '(custom-safe-themes
     '("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa"
       "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088"
       "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default))
   '(evil-want-Y-yank-to-eol nil)
   '(fira-code-mode-disabled-ligatures '("x" "::"))
   '(helm-completion-style 'emacs)
   '(line-number-mode nil)
   '(markdown-header-scaling t)
   '(minimap-window-location 'right)
   '(package-selected-packages
     '(ace-jump-helm-line ace-link afternoon-theme aggressive-indent alect-themes
                          all-the-icons ample-theme ample-zen-theme
                          anti-zenburn-theme apropospriate-theme atomic-chrome
                          attrap auctex-latexmk auto-compile auto-highlight-symbol
                          auto-yasnippet badwolf-theme
                          birds-of-paradise-plus-theme browse-at-remote
                          bubbleberry-theme bui busybee-theme cdlatex
                          centered-cursor-mode cherry-blossom-theme
                          chocolate-theme clean-aindent-mode clues-theme cmm-mode
                          code-cells code-review color-identifiers-mode
                          color-theme-sanityinc-solarized
                          color-theme-sanityinc-tomorrow column-enforce-mode
                          command-log-mode company-auctex company-c-headers
                          company-cabal company-math company-quickhelp
                          company-reftex company-shell company-statistics
                          company-web copilot cpp-auto-include csv-mode
                          cyberpunk-theme cython-mode dakrone-theme dante
                          darkmine-theme darkokai-theme darktooth-theme
                          define-word deft devdocs diff-hl diminish
                          dired-quick-sort disable-mouse disaster disk-usage
                          django-theme doom-themes dotenv-mode dracula-theme
                          drag-stuff dumb-jump eat edit-indirect ef-themes elfeed
                          elfeed-goodies elfeed-org elisp-def elisp-demos
                          elisp-slime-nav emmet-mode emr esh-help
                          eshell-prompt-extras eshell-z espresso-theme
                          eval-sexp-fu evil-anzu evil-args evil-cleverparens
                          evil-collection evil-easymotion evil-escape
                          evil-evilified-state evil-exchange evil-goggles
                          evil-indent-plus evil-ledger evil-lion evil-lisp-state
                          evil-matchit evil-nerd-commenter evil-numbers evil-org
                          evil-surround evil-tex evil-textobj-line evil-tutor
                          evil-unimpaired evil-visual-mark-mode evil-visualstar
                          exotica-theme expand-region eyebrowse eziam-themes
                          fancy-battery farmhouse-themes fira-code-mode fish-mode
                          flatland-theme flatui-theme flycheck-bashate
                          flycheck-elsa flycheck-grammarly flycheck-haskell
                          flycheck-ledger flycheck-package flycheck-pos-tip
                          gandalf-theme gendoxy gh-md git-link git-messenger
                          git-modes git-timemachine gitignore-templates gnuplot
                          golden-ratio google-c-style google-translate
                          gotham-theme grandshell-theme gruber-darker-theme
                          gruvbox-theme haskell-snippets hc-zenburn-theme helm-ag
                          helm-bibtex helm-c-yasnippet helm-comint helm-company
                          helm-css-scss helm-descbinds helm-git-grep helm-hoogle
                          helm-ls-git helm-lsp helm-make helm-mode-manager helm-mu
                          helm-org helm-org-rifle helm-projectile helm-purpose
                          helm-pydoc helm-swoop helm-themes helm-xref hemisu-theme
                          heroku-theme hide-comnt highlight-indentation
                          highlight-numbers highlight-parentheses hl-todo
                          hledger-mode hlint-refactor holy-mode hungry-delete
                          hybrid-mode impatient-mode indent-guide info+
                          inkpot-theme insert-shebang inspector ir-black-theme
                          ivy-emoji jazz-theme jbeans-theme js-doc js2-refactor
                          json-mode json-navigator json-reformat julia-repl
                          jupyter kaolin-themes keycast langtool light-soap-theme
                          link-hint live-py-mode livid-mode lorem-ipsum lsp-docker
                          lsp-haskell lsp-julia lsp-latex lsp-origami lsp-pyright
                          lsp-treemacs lsp-ui lush-theme macrostep madhat2r-theme
                          magic-latex-buffer markdown-toc material-theme
                          minimal-theme modus-themes moe-theme molokai-theme
                          monochrome-theme monokai-theme mu4e-alert multi-line
                          multi-term multi-vterm mustang-theme mwim nameless
                          naquadah-theme noctilux-theme nodejs-repl nov npm-mode
                          obsidian-theme occidental-theme oldlace-theme
                          omtose-phellack-themes open-junk-file org-board org-chef
                          org-cliplink org-clock-csv org-contrib org-download
                          org-fragtog org-gcal org-mime org-modern org-noter
                          org-pomodoro org-present org-projectile org-re-reveal
                          org-ref org-rich-yank org-roam-bibtex org-roam-ui
                          org-sidebar org-superstar organic-green-theme
                          orgit-forge outline-magic overseer ox-hugo
                          page-break-lines pandoc-mode paradox password-generator
                          pcre2el pdf-view-restore pet phoenix-dark-mono-theme
                          phoenix-dark-pink-theme pip-requirements pipenv pippel
                          planet-theme poetry popwin prettier-js
                          professional-theme pug-mode purple-haze-theme py-isort
                          pydoc pyenv-mode pylookup pytest quickrun
                          railscasts-theme rainbow-delimiters rainbow-identifiers
                          rainbow-mode ranger rebecca-theme restart-emacs
                          reverse-theme ron-mode ruff-format rustic sass-mode
                          scss-mode seti-theme shell-pop shfmt slim-mode smeargle
                          smyx-theme soft-charcoal-theme soft-morning-theme
                          soft-stone-theme solarized-theme soothe-theme space-doc
                          spacegray-theme spaceline spacemacs-purpose-popwin
                          spacemacs-whitespace-cleanup sphinx-doc
                          string-edit-at-point subatomic-theme subatomic256-theme
                          sublime-themes sunny-day-theme symbol-overlay symon
                          tagedit tango-2-theme tango-plus-theme tangotango-theme
                          tao-theme term-cursor terminal-here toc-org toml-mode
                          toxi-theme treemacs-evil treemacs-icons-dired
                          treemacs-magit treemacs-persp treemacs-projectile
                          twilight-anti-bright-theme twilight-bright-theme
                          twilight-theme ujelly-theme underwater-theme undo-fu
                          undo-fu-session unfill vi-tilde-fringe vmd-mode
                          volatile-highlights vundo w3m web-beautify web-mode
                          wgrep white-sand-theme wiki-summary winum writeroom-mode
                          ws-butler xkcd yaml-mode yasnippet-snippets yequake
                          zen-and-art-theme zenburn-theme zetteldesk zonokai-emacs
                          zotxt))
   '(pdf-view-midnight-colors '("#282828" . "#f9f5d7") t)
   '(safe-local-variable-values
     '((org-download-image-dir . "./Pictures/") (javascript-backend . tide)
       (javascript-backend . tern) (javascript-backend . lsp)))
   '(spacemacs-large-file-modes-list
     '(org-mode archive-mode tar-mode jka-compr git-commit-mode image-mode
                doc-view-mode doc-view-mode-maybe ebrowse-tree-mode pdf-view-mode
                tags-table-mode fundamental-mode))
   '(vc-annotate-background nil)
   '(vc-annotate-color-map
     '((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00")
       (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829")
       (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f")
       (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f")
       (340 . "#eab700") (360 . "#718c00")))
   '(vc-annotate-very-old-color nil)
   '(window-divider-mode nil))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:background nil))))
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
   '(minimap-active-region-background ((t (:extend t :background "dim gray"))))
   '(org-ref-cite-face ((t (:inherit org-link :foreground "#689d6a"))))
   '(org-ref-label-face ((t (:inherit org-link :foreground "#a89984"))))
   '(org-ref-ref-face ((t (:inherit org-link :foreground "#b16286"))))
   '(org-scheduled-previously ((t (:foreground "#d79921")))))
  )
