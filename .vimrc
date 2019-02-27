" ========== Fresh Start Steps ==========
" 1. Install neovim
"   https://github.com/neovim/homebrew-neovim/blob/master/README.md
"
" 2. install python support
"   $ pip install --user neovim
"   :UpdateRemotePlugins
"
" 3. Install patched fonts 
"   http://powerline.readthedocs.org/en/latest/installation/osx.html
"   https://github.com/powerline/fonts.git
"   ./install.sh
" =======================================

" auto install plugins
"
" Source the Plugins File. 
" This file holds a list of all plugins
" auto create backup directories
"

" Install VimPlug if it's not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Allows us to use Control S and Control Q
silent !stty -ixon
"Restore on leaving Vim
autocmd VimLeave * silent !stty ixon

source ~/.config/vim/plugins.vim
source ~/.config/vim/settings.vim
source ~/.config/vim/functions.vim
source ~/.config/vim/mappings.vim
source ~/.config/vim/plugin-config.vim
