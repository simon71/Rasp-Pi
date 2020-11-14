let mapleader="\<SPACE>"


"{{{
"nmap <s-down>  <c-w>j
"nmap <s-up>    <c-w>k
"nmap <s-left>  <c-w>h
"nmap <s-right> <c-w>l
""}}}


"" vim-easy-align{{{
"" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap al <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap al <Plug>(EasyAlign)
""}}}


" {{{
nmap <Enter> O<esc> 	" Enter to insert new line after the cursor
nmap <CR> o<Esc> 	" shift-enter to insest new line before it
" }}}

" disable search highlighting {{{
nnoremap <silent><space><space> :nohlsearch<CR>
"}}}
