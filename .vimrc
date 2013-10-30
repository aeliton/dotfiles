filetype on
filetype plugin on
filetype indent on
set ts=4
set sw=4
set noexpandtab
set nocompatible
set sw=4
set smarttab
set ai
set nonumber

syn on
colorscheme desert

set numberwidth=5
set number
set background=dark 
set hlsearch
set incsearch
set hlsearch

nmap <silent> <space> :nohlsearch<CR>

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

"FuzzyFinder maps
nnoremap <C-t> :<C-u>FufFile **/<CR> 

nnoremap <F4> :NERDTree<CR> 

"Doxgem comments structure
nmap <F6> :Dox <CR>

let Tlist_Use_Right_Window = 1

set ofu=syntaxcomplete#Complete
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType ruby,tex,plaintex set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType java set tags+=~/.tags/java_tags
autocmd FileType java set tags+=~/.tags/android_tags

set runtimepath+=/home/aeliton/.vim/vim-addons/vim-addon-manager
call vam#ActivateAddons(["bufexplorer.zip", "vim-snippets", "SuperTab%182", "The_NERD_Commenter", "The_NERD_tree", "FuzzyFinder", "fugitive", "rails", "LaTeX-Suite_aka_Vim-LaTeX", "Tabular"], {'auto_install' : 0})


  
