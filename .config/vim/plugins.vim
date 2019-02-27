" This file is in charge of maintaing the VimPlug List

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" plugins

if has('nvim')
  call plug#begin('~/.config/nvim/bundle')
else
  call plug#begin('~/.config/vim/bundle')
endif

" core plugins
if !has('nvim')
  Plug 'tpope/vim-sensible'               " Sensible defaults
endif

Plug 'flazz/vim-colorschemes'           " Set of color schemes
Plug 'scrooloose/nerdtree'              " Directory browsing
Plug 'tpope/vim-fugitive'               " Git commands
Plug 'tpope/vim-commentary'             " Vim-commentary
Plug 'morhetz/gruvbox'                  " Color scheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'kshenoy/vim-signature'            " Mark gutter
Plug 'Valloric/ListToggle'              " Toggle location list
Plug 'easymotion/vim-easymotion'        " Fast movement
Plug 'godlygeek/tabular'                " Alignment
Plug 'henrik/vim-indexed-search'        " Show N of M matches during search
Plug 'junegunn/goyo.vim'                " Markdown
Plug 'mhinz/vim-signify'                " Git gutter
Plug 'mustache/vim-mustache-handlebars' " Mustache
Plug 'sjl/gundo.vim'                    " Undo Tree
Plug 'terryma/vim-expand-region'        " Expand regions
Plug 'tpope/vim-unimpaired'             " Move text
Plug 'vim-airline/vim-airline'          " Status bar
Plug 'vim-airline/vim-airline-themes'          " Status bar
Plug 'wellle/targets.vim'               " Additional text objects
Plug 'wesQ3/vim-windowswap'             " Window swapping
Plug 'xolox/vim-misc'                   " Requirement for session management
Plug 'xolox/vim-session'                " Session management
Plug 'yssl/QFEnter'                     " Choose window for quick fix open
Plug 'vim-ruby/vim-ruby'                " Ruby
Plug 'jeetsukumaran/vim-buffergator'    " Buffer management
Plug 'michaeljsmith/vim-indent-object'  " Indent text object
Plug 'radenling/vim-dispatch-neovim'    " Neovim dispatch
Plug 'janko-m/vim-test'                 " Testing
Plug 'kassio/neoterm'                   " Testing
Plug 'kchmck/vim-coffee-script'         " Coffeescript
Plug 'junegunn/gv.vim'                  " Git commit browser
Plug 'roman/golden-ratio'               " Window sizing
Plug 'tpope/vim-speeddating'            " Date inc/dec
Plug 'gregsexton/gitv'                  " Gitk for vim
Plug 'Raimondi/delimitMate'             " Auto close parens
Plug 'itchyny/calendar.vim'             " Calendar
Plug 'vim-scripts/dbext.vim'            " Database plugin
Plug 'joshdick/onedark.vim'             " One Dark themes
Plug 'amadeus/vim-mjml'                 " mjml support
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'craigemery/vim-autotag'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
Plug 'epilande/vim-react-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'wincent/scalpel'
Plug 'godlygeek/tabular'
Plug 'davidhalter/jedi-vim'
Plug 'roxma/nvim-yarp'
Plug 'uber/prototool', { 'rtp': 'vim/prototool' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-dadbod'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'



call plug#end()
