" pathogen
execute pathogen#infect()

" setting colors/syntax
set t_Co=256 " set before colorscheme
syntax enable
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
colorscheme solarized
set nu
filetype indent off

" setting tabs
set tabstop=4
set softtabstop=4
set expandtab

" setting search
set incsearch
set hlsearch

" setting silver searcher
nnoremap <c-a> :Ag

" setting CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb' " order
let g:ctrlp_switch_buffer = 0 " open in new buffer
let g:ctrlp_working_path_mode = 0 " respect changes in working directory
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " use ag
