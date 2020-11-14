" scriptencoding utf-8
"-

call plug#begin()
" vim games

" 	Language Tools
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'reedes/vim-lexical' " Building on Vimâ€™s spell-check and thesaurus/dictionary completion
Plug 'dpelle/vim-LanguageTool' " download latest snaphots from https://internal1.languagetool.org/snapshots/
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Go Specific Plugins
Plug 'fatih/vim-go',          { 'do': ':GoUpdateBinaries' }
Plug 'godoctor/godoctor.vim'  " Go refactoring tools
Plug 'jodosha/vim-godebug'    " Debugger integration via delve

" 	Code Editing/Formatting Tools
Plug 'tpope/vim-commentary'    " comment code
Plug 'tpope/vim-surround'      " surrounding text in quotes, brackets, tags, etc
Plug 'jiangmiao/auto-pairs'    " auto closes brackets
Plug 'honza/vim-snippets'

" IDE Theme/Colorschemes
Plug 'mhinz/vim-startify'

"	Git Pluging
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Vim tools
Plug 'bling/vim-airline'

call plug#end()

source /nvim/config/base.vim
source /nvim/config/keybindings.vim
source /nvim/config/spellchecker.vim
source /nvim/config/general-language.vim
source /nvim/config/netrw.vim
source /nvim/config/autocmds.vim
source /nvim/config/LanguageClient-neovim.vim
source /nvim/config/vim-ruby.vim
source /nvim/config/coc.vim
source /nvim/config/go.vim

