" Custom Functions

" Formats the text as regular json.
function! FormatJSON()
  :%!python -m json.tool
endfunction

" Saves fold locations on save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END<Paste>
