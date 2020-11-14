" YAML config {{{
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" }}}

" fzy config {{{
nnoremap <C-f> :FuzzyOpen<CR>
nnoremap <C-p> :FuzzyGrep<CR>
" }}}

" vim-markdown {{{
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
" }}}

" terraform {{{
let g:terraform_align=1

" call neomake#configure#automake('nw', 750)

" vim-go {{{
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     

" vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" vim-test {{{
let test#strategy = "neovim"

" vim-polyglot {{{
let g:jsx_ext_required = 0
" }}}
"
" LanguageTool {{{
let g:languagetool_jar='$HOME/.config/nvim/languagetool/LanguageTool-5.1-SNAPSHOT/languagetool-commandline.jar'
let g:languagetool_lang='en-GB'
" }}}
"
