" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['/Users/simon.harvey/.rvm/gems/ruby-2.4.3/bin/solargraph', 'stdio'],
    \ 'go': ['gopls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }

" Launch gopls when Go files are in use
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
