" default config (on ArchLinux) is in /usr/share/vim/vimfiles
" call feedkeys(":quit\<CR>")
set encoding=UTF-8
syntax on
filetype plugin on
filetype indent on
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set linebreak " don't break in the middle on a word
set viminfo='20,<100,:100,%
"'q  : q, number of edited file remembered
"<m  : m, number of lines saved for each register
":p  : p, number of history cmd lines remembered
"%   : saves and restores the buffer list

set incsearch " highlight search

"call plug#begin()
"Plug 'tpope/vim-sensible'
"call plug#end()

colorscheme habamax " other cool scheme: slate

" netwr (file broswer)
let g:netrw_liststyle = 3 " tree
let g:netrw_banner = 0
let g:netrw_broswe_split = 2 " open file in new vertical split
let g:netrw_winsize = 15 " only take 20% of screen in split mode
"autocmd VimEnter * :Vexplore | wincmd p " open automaticly

" auto-pairs https://github.com/jiangmiao/auto-pairs
au FileType ocaml    let b:AutoPairs = AutoPairsDefine({'begin': 'end//n]'})
au FileType rust     let b:AutoPairs = AutoPairsDefine({"\w\zs'": ""})
au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
