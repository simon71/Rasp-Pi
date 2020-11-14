autocmd filetype netrw nnoremap <buffer> <s-down> :wincmd j<cr>
" autocmd vimEnter * :Vexplore
" autocmd FileType netrw setl bufhidden=delete
autocmd FileType netrw setl bufhidden=wipe

command! Config execute ":e /nvim/init.vim"
command! Reload execute "source /nvim/init.vim"

" Python
autocmd FileType python let g:python_host_prog = '/usr/bin/python2'
