filetype plugin indent on
syntax on

colorscheme default
hi Search cterm=NONE ctermfg=black ctermbg=yellow
 
" Show partial commands in the last line of the screen
set showcmd
" Better command-line completion
set wildmenu
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Underline the current line
set cursorline
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Display line numbers on the left
set number
" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set expandtab
set shiftwidth=4
set tabstop=4

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" Helps to copy paste without the line numbers
" set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
