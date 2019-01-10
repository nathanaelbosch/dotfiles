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
     csv
     emacs-lisp
     evil-commentary
     finance
     git
     google-calendar
     helm
     html
     (latex :variables
            ;; latex-enable-auto-fill nil
            latex-enable-folding t)
     lua
     markdown
     mu4e
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
     (org :variables org-want-todo-bindings t)
     pandoc
     pdf
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
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(interleave
                                      yasnippet-snippets
                                      org-subtask-reset
                                      org-habits)

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
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

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

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         sanityinc-tomorrow-day
                         )


   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

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
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
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

  (setup-google-calendar)

  ;; Org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
     (python . t)
     (gnuplot . t)
     ))

  (spacemacs/toggle-mode-line-org-clock-on)
  )


(defun setup-google-calendar ()
  ;; Wrapper function to setup my google calendar with org

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
  )


(defun setup-fira-code ()
  ;; Fira code stuff - copied from PierreSp
  ;; This works when using emacs --daemon + emacsclient
  (add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
  ;; This works when using emacs without server/client
  (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
  ;; I haven't found one statement that makes both of the above situations work, so I use both for now

  (defconst fira-code-font-lock-keywords-alist
    (mapcar (lambda (regex-char-pair)
              `(,(car regex-char-pair)
                (0 (prog1 ()
                     (compose-region (match-beginning 1)
                                     (match-end 1)
                                     ;; The first argument to concat is a string containing a literal tab
                                     ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
            '(("\\(www\\)"                   #Xe100)
              ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
              ("\\(\\*\\*\\*\\)"             #Xe102)
              ("\\(\\*\\*/\\)"               #Xe103)
              ("\\(\\*>\\)"                  #Xe104)
              ("[^*]\\(\\*/\\)"              #Xe105)
              ("\\(\\\\\\\\\\)"              #Xe106)
              ("\\(\\\\\\\\\\\\\\)"          #Xe107)
              ("\\({-\\)"                    #Xe108)
              ;; ("\\(\\[\\]\\)"                #Xe109) This is the [] ligature and I don't like
              ("\\(::\\)"                    #Xe10a)
              ("\\(:::\\)"                   #Xe10b)
              ("[^=]\\(:=\\)"                #Xe10c)
              ("\\(!!\\)"                    #Xe10d)
              ("\\(!=\\)"                    #Xe10e)
              ("\\(!==\\)"                   #Xe10f)
              ("\\(-}\\)"                    #Xe110)
              ("\\(--\\)"                    #Xe111)
              ("\\(---\\)"                   #Xe112)
              ("\\(-->\\)"                   #Xe113)
              ("[^-]\\(->\\)"                #Xe114)
              ("\\(->>\\)"                   #Xe115)
              ("\\(-<\\)"                    #Xe116)
              ("\\(-<<\\)"                   #Xe117)
              ("\\(-~\\)"                    #Xe118)
              ("\\(#{\\)"                    #Xe119)
              ("\\(#\\[\\)"                  #Xe11a)
              ("\\(##\\)"                    #Xe11b)
              ("\\(###\\)"                   #Xe11c)
              ("\\(####\\)"                  #Xe11d)
              ("\\(#(\\)"                    #Xe11e)
              ("\\(#\\?\\)"                  #Xe11f)
              ("\\(#_\\)"                    #Xe120)
              ("\\(#_(\\)"                   #Xe121)
              ("\\(\\.-\\)"                  #Xe122)
              ("\\(\\.=\\)"                  #Xe123)
              ("\\(\\.\\.\\)"                #Xe124)
              ("\\(\\.\\.<\\)"               #Xe125)
              ("\\(\\.\\.\\.\\)"             #Xe126)
              ("\\(\\?=\\)"                  #Xe127)
              ("\\(\\?\\?\\)"                #Xe128)
              ("\\(;;\\)"                    #Xe129)
              ("\\(/\\*\\)"                  #Xe12a)
              ("\\(/\\*\\*\\)"               #Xe12b)
              ("\\(/=\\)"                    #Xe12c)
              ("\\(/==\\)"                   #Xe12d)
              ("\\(/>\\)"                    #Xe12e)
              ("\\(//\\)"                    #Xe12f)
              ("\\(///\\)"                   #Xe130)
              ("\\(&&\\)"                    #Xe131)
              ("\\(||\\)"                    #Xe132)
              ("\\(||=\\)"                   #Xe133)
                                        ;("[^|]\\(|=\\)"                #Xe134)
              ("\\(|>\\)"                    #Xe135)
              ("\\(\\^=\\)"                  #Xe136)
              ("\\(\\$>\\)"                  #Xe137)
              ("\\(\\+\\+\\)"                #Xe138)
              ("\\(\\+\\+\\+\\)"             #Xe139)
              ("\\(\\+>\\)"                  #Xe13a)
              ("\\(=:=\\)"                   #Xe13b)
                                        ;("[^!/]\\(==\\)[^>]"           #Xe13c)
              ("\\(===\\)"                   #Xe13d)
              ("\\(==>\\)"                   #Xe13e)
                                        ;("[^=]\\(=>\\)"                #Xe13f)
              ("\\(=>>\\)"                   #Xe140)
              ("\\(<=\\)"                    #Xe141)
              ("\\(=<<\\)"                   #Xe142)
              ("\\(=/=\\)"                   #Xe143)
              ("\\(>-\\)"                    #Xe144)
              ("\\(>=\\)"                    #Xe145)
              ("\\(>=>\\)"                   #Xe146)
              ("[^-=]\\(>>\\)"               #Xe147)
              ("\\(>>-\\)"                   #Xe148)
              ("\\(>>=\\)"                   #Xe149)
              ("\\(>>>\\)"                   #Xe14a)
              ("\\(<\\*\\)"                  #Xe14b)
              ("\\(<\\*>\\)"                 #Xe14c)
              ("\\(<|\\)"                    #Xe14d)
              ("\\(<|>\\)"                   #Xe14e)
              ("\\(<\\$\\)"                  #Xe14f)
              ("\\(<\\$>\\)"                 #Xe150)
              ("\\(<!--\\)"                  #Xe151)
              ("\\(<-\\)"                    #Xe152)
              ("\\(<--\\)"                   #Xe153)
              ("\\(<->\\)"                   #Xe154)
              ("\\(<\\+\\)"                  #Xe155)
              ("\\(<\\+>\\)"                 #Xe156)
              ("\\(<=\\)"                    #Xe157)
              ("\\(<==\\)"                   #Xe158)
              ("\\(<=>\\)"                   #Xe159)
              ("\\(<=<\\)"                   #Xe15a)
              ("\\(<>\\)"                    #Xe15b)
              ("[^-=]\\(<<\\)"               #Xe15c)
              ("\\(<<-\\)"                   #Xe15d)
              ("\\(<<=\\)"                   #Xe15e)
              ("\\(<<<\\)"                   #Xe15f)
              ("\\(<~\\)"                    #Xe160)
              ("\\(<~~\\)"                   #Xe161)
              ("\\(</\\)"                    #Xe162)
              ("\\(</>\\)"                   #Xe163)
              ("\\(~@\\)"                    #Xe164)
              ("\\(~-\\)"                    #Xe165)
              ("\\(~=\\)"                    #Xe166)
              ("\\(~>\\)"                    #Xe167)
              ("[^<]\\(~~\\)"                #Xe168)
              ("\\(~~>\\)"                   #Xe169)
              ("\\(%%\\)"                    #Xe16a)
              ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
              ("[^:=]\\(:\\)[^:=]"           #Xe16c)
              ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
              ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f)
              )))

  (defun add-fira-code-symbol-keywords ()
    (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

  (add-hook 'prog-mode-hook
            #'add-fira-code-symbol-keywords)
  )


(defun org-ref-config ()
  ;; Followed https://codearsonist.com/reading-for-programmers and https://github.com/jkitchin/org-ref
  (setq reftex-default-bibliography '("~/MEGA/papers/references.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/MEGA/papers/notes.org"
        org-ref-default-bibliography '("~/MEGA/papers/references.bib")
        org-ref-pdf-directory "~/MEGA/papers/lib/")

  ;; Further variables for helm-bibtex
  (setq bibtex-completion-bibliography "~/MEGA/papers/references.bib"
        bibtex-completion-library-path "~/MEGA/papers/lib"
        bibtex-completion-notes-path "~/MEGA/papers/notes.org")

  ;; open pdf with system pdf viewer (works on mac)
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "open" "*open*" "open" fpath)))

  ;; alternative
  ;; (setq bibtex-completion-pdf-open-function 'org-open-file)

  ;; Download directory
  (setq biblio-download-directory "~/MEGA/papers/lib")

  (evil-leader/set-key-for-mode 'org-mode "I" 'interleave-mode)
  (evil-leader/set-key-for-mode 'org-mode "B" 'helm-bibtex)
  (evil-leader/set-key-for-mode 'bibtex-mode "B" 'helm-bibtex)
  )


(defun my-org-config()

  ;; Inline images
  (setq org-startup-with-inline-images t)

  ;; Default folder for agenda files?
  (setq org-agenda-files '("~/Dropbox/org/"
                           "~/Dropbox/org/gcal/"
                           "~/MEGA/papers/notes.org"))
  (with-eval-after-load 'org (setq org-default-notes-file '"~/Dropbox/org/todo.org"))

  ;;
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Inbox")
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
            "* Wäsche [%]
:PROPERTIES:
:ORDERED:  t
:END:
** TODO Wäsche: In die Maschine und machen
SCHEDULED: %t
** TODO Wäsche: Aufhängen
SCHEDULED: %t
** TODO Wäsche: Abhängen
SCHEDULED: %t
** TODO Wäsche: Aufräumen
SCHEDULED: %t
")
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
        '((sequence "TODO(t)" "IN PROGRESS(p)" "INACTIVE(i)" "|" "CANCELLED(c)" "DONE(d)" )
          (sequence "TOREAD(r)" "TOWATCH(w)" "TOLISTEN(l)" "|")
          ))
  (setq org-todo-keyword-faces
        '(("TOREAD" . "#5e8d87")
          ("TOWATCH" . "#85678f")
          ("TOLISTEN" . "#85678f")
          ("INACTIVE" . "#707880")
          ;; ("HABIT" . "#de935f")
          ("CANCELLED" . "#c5c8c6")
          ))
  (setq org-archive-tag "inactive")

  ;; Google Calendar
  (setq org-gcal-file-alist '(("nathanael.bosch@gmail.com" . "~/Dropbox/org/gcal/gcal.org")
                              ("y5ka3vijk107hk59p3ruo8b7mq8@group.calendar.google.com" . "~/Dropbox/org/gcal/vacances.org")
                              ("43ntc9b5o132nim5q8pnin4hm8@group.calendar.google.com" . "~/Dropbox/org/gcal/uni.org")
                              ("67bvrtshu9ufjh2bk4c3vul8vc@group.calendar.google.com" . "~/Dropbox/org/gcal/urlaube.org")
                              ("5g7i1tndcav3oulm0c9ktb0v1bblscmr@import.calendar.google.com" . "~/Dropbox/org/gcal/tumonline.org")
                              ))
  (add-hook 'org-capture-after-finalize-hook 'google-calendar/sync-cal-after-capture)

  ;; Hide tag someday in agenda
  (setq org-agenda-filter-preset '("-someday"))
  (setq org-agenda-regexp-filter-preset '("-WAITING"))

  (setq org-agenda-custom-commands
        ;; (append org-agenda-custom-commands
                '(("g" . "GTD-Workflow")
                  ("gw" "Upcoming week" agenda ""
                   ((org-agenda-span 'week)
                    (org-agenda-filter-preset '("-habit"))
                    (org-agenda-view-columns-initially t)
                    ))
                  ("gr" "Review past week" agenda
                   ((org-agenda-span 'week)
                    (org-agenda-skip-scheduled-if-done nil)
                    (org-agenda-log-mode)
                    ))

                  ("n" "Next Actions"
                   ((todo "TODO"
                    ((org-agenda-filter-preset '("-someday"))
                     (org-agenda-todo-ignore-scheduled t)
                     (org-deadline-warning-days 90)))
                    (tags-todo "habit")
                    (agenda ""
                     ((org-agenda-entry-types '(:deadline))
                      (org-agenda-span 1)
                      (org-deadline-warning-days 90)
                      (org-agenda-time-grid nil)
                      (org-agenda-overriding-header "Upcoming Deadlines")
                      )))
                   ;; ((org-agenda-compact-blocks t))
                   )

                  ;; Special types
                  ("s" "Someday" tags "someday"
                   ((org-agenda-filter-preset '("+someday"))
                    (org-use-tag-inheritance nil)
                    (org-agenda-todo-ignore-with-date nil)))
                  ("r" "To read" todo "TOREAD"
                   ((org-agenda-filter-preset '(""))
                    (org-agenda-sorting-strategy '(priority-down tag-down))
                    ))
                  ("w" "To watch" todo "TOWATCH"
                   ((org-agenda-filter-preset '(""))
                    (org-agenda-view-columns-initially t)
                    (org-agenda-sorting-strategy '(priority-down tag-down))
                    ))
                  ("l" "To listen" todo "TOLISTEN"
                   ((org-agenda-filter-preset '(""))
                    (org-agenda-sorting-strategy '(priority-down tag-down))
                    ))

                  ;; Contexts
                  ("h" "@Home"
                   ((tags "@home"
                         ((org-agenda-todo-ignore-with-date nil)))
                   ))
                  ("u" "@Uni"
                   ((tags "@uni"
                          ((org-agenda-todo-ignore-with-date nil)))
                    ))

                  ("d" "Upcoming deadlines" agenda ""
                   ((org-agenda-entry-types '(:deadline))
                    (org-agenda-span 1)
                    (org-deadline-warning-days 60)
                    (org-agenda-overriding-header "Upcoming Deadlines")
                    (org-agenda-time-grid nil)))

                  )
                )
  ;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-scheduled-if-done t)
  ;; (setq org-agenda-window-setup 'current-window)
  ;; (setq org-agenda-window-setup 'only-window)

  ;; org-refile
  (setq org-refile-targets (quote (("todo.org" :maxlevel . 2)
                                   ("notes.org" :maxlevel . 2)
                                   )))

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
  (setq org-agenda-overriding-columns-format "%CATEGORY(Category) %42ITEM(Details) %TAGS(Tags) %7TODO(To Do) %5Effort(Time){:} %7CLOCKSUM(Clocked){:}")
  ;; (setq org-agenda-overriding-columns-format "%7TODO(To Do) %38ITEM(Details) %TAGS(Context) %5Effort(Time){:} %6CLOCKSUM{:}")

  (setq org-clock-out-when-done t)

  ;; Not optimal, but otherwise it creates wayy too many folders
  (setq-default org-download-image-dir "~/Dropbox/org/images")


  ;; remove comments from org document for use with export hook
  ;; https://emacs.stackexchange.com/questions/22574/orgmode-export-how-to-prevent-a-new-line-for-comment-lines
  (defun delete-org-comments (backend)
    (loop for comment in (reverse (org-element-map (org-element-parse-buffer)
                                      'comment 'identity))
          do
          (setf (buffer-substring (org-element-property :begin comment)
                                  (org-element-property :end comment))
                "")))
  ;; add to export hook
  (add-hook 'org-export-before-processing-hook 'delete-org-comments)

  ;; Inline images
  (setq org-image-actual-width '(800))

  ;; Tasks that cannot be done because of dependencies should not clutter the agenda
  ;; t grays them out, 'invisible makes them disappear
  (setq org-agenda-dim-blocked-tasks t)
  (setq org-agenda-dim-blocked-tasks 'invisible)

  ;; (add-to-list 'org-modules 'habits)

  ;; Better overview in agenda with my recurring tasks
  (setq org-agenda-show-future-repeats 'next)

  ;; Parents can only be marked as DONE if children tasks are undone
  ;; with the "ORDERED" property TODO children is blocked until all earlier siblings are marked DONE
  (setq org-enforce-todo-dependencies t)
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

  ;; Scroll margin
  (setq scroll-margin 1)

  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)

  ;; Visual line mode when working with text based content
  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)

  ;; org-mode
  (my-org-config)
  ;; org-ref
  (org-ref-config)

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

  ;; (setq alert-default-style 'libnotify)


  ;; Start magit commit in insert mode
  (add-hook 'with-editor-mode-hook 'evil-insert-state)


  ;; Auto-refresh buffers when files changed on disk
  (global-auto-revert-mode t)


  ;; Custom Org commands to follow the spacemacs mnemonics instead of C-c C-x ...
  (evil-leader/set-key-for-mode 'org-mode "U" 'org-update-all-dblocks)

  (find-file "~/Dropbox/org/todo.org")

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
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (csv-mode pandoc-mode org-ref pdf-tools ivy htmlize gruvbox-theme flyspell-correct-helm flyspell-correct evil-mc evil-matchit autothemer iedit smartparens evil yasnippet company avy projectile magit ghub org-plus-contrib hydra pythonic zenburn-theme zen-and-art-theme yapfify xterm-color ws-butler winum white-sand-theme which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treepy toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit tablist sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme ranger rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox ox-pandoc orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme ledger-mode key-chord jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-bibtex helm-ag hc-zenburn-theme gruber-darker-theme graphql grandshell-theme goto-chg gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flycheck-pos-tip flycheck-ledger flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (pandoc-mode org-ref pdf-tools ivy htmlize gruvbox-theme flyspell-correct-helm flyspell-correct evil-mc evil-matchit autothemer iedit smartparens evil yasnippet company avy projectile magit ghub org-plus-contrib hydra pythonic zenburn-theme zen-and-art-theme yapfify xterm-color ws-butler winum white-sand-theme which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treepy toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit tablist sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme ranger rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox ox-pandoc orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme ledger-mode key-chord jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-bibtex helm-ag hc-zenburn-theme gruber-darker-theme graphql grandshell-theme goto-chg gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flycheck-pos-tip flycheck-ledger flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
