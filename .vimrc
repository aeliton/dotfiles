set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

Plugin 'bufexplorer.zip'
Plugin 'taglist-plus'
Plugin 'SuperTab'
Plugin 'DrawIt'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "SirVer/ultisnips"
" Optional:
Bundle "honza/vim-snippets"

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle "Chiel92/vim-autoformat"
Bundle "klen/python-mode"
Bundle "tpope/vim-surround"


Bundle "elixir-lang/vim-elixir"

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

set ts=4
set sw=4
set expandtab
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
set listchars=tab:▸\ ,eol:¬



"FuzzyFinder maps
"nnoremap <C-t> :<C-u>FufFile **/<CR> 

nnoremap <F4> :NERDTree<CR> 

"Doxgem comments structure
nmap <F6> :Dox <CR>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp         setlocal ts=4 sts=4 expandtab sw=4

nmap <leader>l :set list!<CR>

let g:formatprg_python = "autopep8"
let g:formatprg_python = "-s"
let g:formatprg_c = "astyle"
let g:formatprg_args_c = "--style=knf -s"


" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

set mouse=a
