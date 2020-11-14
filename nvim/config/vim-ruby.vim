
" vim-ruby
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
autocmd FileType ruby,eruby let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let ruby_spacs_errors = 1
let ruby_line_continuation_error = 1
let ruby_global_variable_error   = 1
let ruby_spellcheck_strings = 1
let g:rubycomplete_classes_in_global = 1 " Vim can parse the entire buffer to add a list of classes to the completion results.
