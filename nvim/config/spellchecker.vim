set spelllang=en_gb

let g:lexical#thesaurus  = ['~/.config/nvim/thesaurus/words.txt']
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#spelllang  = ['en_gb']
let g:lexical#spellfile  = ['~/.config/nvim/spell/en.utf-8.add',]
let g:lexical#spell      = 1
let g:lexical#spell_key  = '<leader>s'

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,md call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

