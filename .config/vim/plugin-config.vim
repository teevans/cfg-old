" Meant to hold individual plugin settings. 
"

" NerdTree
let NERDTreeShowHidden=1

" Buffergater
let g:buffergator_suppress_keymaps = 1

"FZF
"
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_buffers_jump = 1
let g:fzf_height = 10

" CTRL-A CTRL-Q to select all and build quickfix list
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --skip-vcs-ignores""'

" Airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ }

let g:airline_theme                                       = "deus"
let g:airline_powerline_fonts                             = 1
let g:airline#extensions#whitespace#enabled               = 0
let g:airline#extensions#hunks#non_zero_only              = 1    " git gutter
let g:airline#extensions#tabline#enabled                  = 1
let g:airline#extensions#tabline#fnamemod                 = ':t' " filename only
let g:airline#extensions#tabline#show_close_button        = 0
let g:airline#extensions#tabline#show_buffers             = 1
let g:airline#extensions#tabline#tab_nr_type              = 2    " splits and tab number
let g:airline#extensions#tabline#switch_buffers_and_tabs  = 0
let g:airline#extensions#tabline#formatter                = 'unique_tail_improved'
let g:airline_section_c                                   = '%t'

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Ultiships
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsSnippetsDir="~/.config/vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Go Lang
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "ultisnips"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_experimental = 1

" Go Convenience maps
autocmd FileType go nmap <leader>gb <Plug>(go-build)
autocmd FileType go nmap <leader>gf :GoTestFunc<cr>
autocmd FileType go nmap <leader>gl :GoDecls<cr>
autocmd FileType go nmap <leader>gd :GoDef<cr>

" Go Syntax Highlighting
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_auto_sameids = 1

" Ale 
let g:ale_fixers = {
	\'javascript': ['eslint'],
	\'javascript.jsx': ['eslint'],
	\'typescript': ['tslint'],
	\'typescript.jsx': ['tslint'],
	\'css': ['prettier'],
	\'html': ['prettier'],
	\}

let g:ale_linters = {
	\'go': ['golint'],
	\'cs': ['OmniSharp'],
	\'javascript': ['eslint'],
	\'javascript.jsx': ['eslint'],
	\'typescript': ['tslint'],
	\'typescript.jsx': ['tslint'],
	\'proto': ['prototool'],
	\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_proto_prototool_command = 'lint'

" OmniSharpSetup
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" COC Autocomplete Plugin

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction<Paste>

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

