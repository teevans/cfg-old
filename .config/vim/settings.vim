" Setup Stuff here.

" Set , to leader key
let mapleader=","

syntax on
filetype detect
set termguicolors
set background=dark

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

set nowrap                               " Don't wrap lines
set ruler                                " Show cursor line and column in status bar
set hidden
set nocursorline                         " Disable highlight current line
set re=1                                 " Fixes slow cursorline
set tabstop=2                            " A tab is four spaces
set smarttab                             " Insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent                           " Always set autoindenting on
set copyindent                           " Copy the previous indentation on autoindenting
set shiftwidth=2                         " Number of spaces to use forautoindenting
set shiftround                           " Use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                            " Set show matching parenthesis
set ignorecase                           " Ignore case when searching
set smartcase                            " Ignore case if search pattern is all lowercase
set incsearch                            " Show search matches as you type
set backspace=indent,eol,start           " Allow backspacing over everything in insert mode
set wildignore=*.swp,*.bak,*.pyc,*.class
set pastetoggle=<f2>
set scrolloff=2                          " Start scrolling when 2 lines from edge
set sidescroll=1                         " Scroll horizontally by 1 column
set sidescrolloff=2                      " Start scrolling horizontally when 2 lines from edge
set number
set nolazyredraw                         " Disable lazyredraw
set mouse=a
set expandtab                            " Use spaces intead of tabs
set fillchars=vert:\                     " Sets the vertical split chars
set foldmethod=indent                    " Sets the indent type to tabs
set foldlevelstart=99

" Remove Comment leader when joining lines together.
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
set nojoinspaces

if exists('+relativenumber')
  set relativenumber
endif


" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set splits open more naturally
set splitbelow
set splitright

" Clipboard sharing
set clipboard=unnamedplus


" Show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮

" Session Management
let g:session_directory = "~/.config/vim/session"
let g:session_autoload = "no"
let g:session_default_to_last = 0
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" Backup Settings
set history=1000
set undolevels=1000
set undodir=~/.config/vim/tmp/undo/
set undofile
set backupdir=~/.config/vim/tmp/backup/
set directory=~/.config/vim/tmp/swap/
set backupskip=/tmp/*,/private/tmp/*
set backup
set writebackup
set noswapfile

" Set Cursor Settings
" Change cursor line darker on insert
autocmd InsertEnter * hi CursorLine cterm=NONE ctermbg=16
autocmd InsertLeave * hi CursorLine cterm=NONE ctermbg=black
" Change cursor shape per mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
      \ execute("normal `\"") |
  \ endif

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:signify_vcs_list = [ 'git' ]


" Fix Yaml bullshit.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python  setlocal tabstop=4 shiftwidth=4 softtabstop=4

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


