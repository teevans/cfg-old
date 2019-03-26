" Faster Split Moving
nnoremap <C-L> <C-W><C-L>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
"                           Faster Save
nnoremap <leader>m          :w<CR>
"                           Turn Edit Snippets
nnoremap <leader>es         :UltiSnipsEdit<CR>
"                           Edit .vimrc
nnoremap <leader>vm         :e ~/.vimrc<CR>
"                           Reload .vimrc
nnoremap <leader>V          :so ~/.vimrc<CR>
"                           Open Gundo (Undo Tree)
nnoremap <leader>u          :GundoToggle<CR>
"                           Yank current file path
nnoremap <leader>F          :let @* = expand("%")<CR>
"                           Buffer manager
nnoremap <leader>B          :BuffergatorToggle<CR>
"                           Force close current buffer and maintain window arrangement
nnoremap <leader>x          :bp\|bd! #<CR>
"                           Spelling Checker
inoremap <expr> <c-x><c-k> fzf#complete('cat ~/Library/Spelling/dynamic-text.dat')
"                           Reveal file in NERDTree
nnoremap <leader>r          :NERDTreeFind<CR>
"                           Open NERDTree File Browser
nnoremap <Bslash>           :NERDTreeToggle<CR>
"                           Jump to anywhere with 2 characters
nmap s                      <Plug>(easymotion-overwin-f)
"                           EasyMotion search
map  <leader><leader>/      <Plug>(easymotion-sn)
omap <leader><leader>/      <Plug>(easymotion-tn)

" Hides highlighting on search
nnoremap <leader><CR> :noh<CR>
"                           Search open buffers
nnoremap <leader>fb         :Buffers<CR>
"                           Search buffer commits
nnoremap <leader>fc         :BCommits<CR>
"                           Search commits
nnoremap <leader>fC         :Commits<CR>
"                           Search v:oldfiles and open buffers
nnoremap <leader>fe         :History<CR>
"                           Search lines in current buffer
nnoremap <leader>fl         :BLines<CR>
"                           Search lines in loaded buffers
nnoremap <leader>fL         :Lines<CR>
"                           Search marks
nnoremap <leader>fm         :Marks<CR>
"                           Search marks
nnoremap <leader>fM         :Maps<CR>
"                           Search git files
nnoremap <leader>fo         :GFiles<CR>
"                           Search all files
nnoremap <leader>fO         :Files<CR>
"                           Search buffer tags
nnoremap <leader>fr         :Rg<CR>
"                           Search buffer tags
nnoremap <leader>ft         :BTags<CR>
"                           Search all tags
nnoremap <leader>fT         :Tags<CR>
"                           Search windows
nnoremap <leader>fw         :Windows<CR>

"         Remap Ctrl a to Alt A for incrementing and decrementing nubmers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Remap to make splits easier
nnoremap sp :vsplit <CR>
nnoremap sv :split <CR>


" Ale Jump to issues easier
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" Remapping Control I and Tab to make things work a little better
nnoremap <Tab> za
nnoremap <F6> <C-i>

" C# Autoremaps
autocmd BufWritePre *.cs :OmniSharpCodeFormat

" Base64 Helpers
" 1. base64-encode(visual-selection) -> F2 -> encoded base64-string
:vnoremap <F2> c<c-r>=system("base64 -w 0", @")<cr><esc>

" 2. base64-decode(visual-selection) -> F3 -> decoded string
:vnoremap <F3> c<c-r>=system("base64 -d", @")<cr> 
