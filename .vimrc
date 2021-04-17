"
"	___  ___              _                     
"	|  \/  |             (_)                    
"	| .  . |_   _  __   ___ _ __ ___  _ __ ___  
"	| |\/| | | | | \ \ / / | '_ ` _ \| '__/ __| 
" 	| |  | | |_| |  \ V /| | | | | | | | | (__  
" 	|_|  |_/\__, | (_)_/ |_|_| |_| |_|_|  \___| 
"	         __/ |                              
"		 |___/
"
"
"
" ┌────────────────────────────────────────────────────────────
" │	1. vim-plug installation
" └────────────────────────────────────────────────────────────
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" ┌────────────────────────────────────────────────────────────
" │	2. run PlugInstall if there are missing plugins
" └────────────────────────────────────────────────────────────
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" ┌────────────────────────────────────────────────────────────
" │	3. vim-plug plugins
" └────────────────────────────────────────────────────────────
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'		" Directory Tree
Plug 'morhetz/gruvbox'			" Color theme
Plug 'ryanoasis/vim-devicons'		" Devicons

Plug 'pangloss/vim-javascript'		" .JS support
Plug 'leafgarland/typescript-vim'	" .TS support

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }	" Autocomplete
Plug 'vim-airline/vim-airline'		" 
Plug 'kien/ctrlp.vim' 			" Super search
Plug 'tpope/vim-fugitive' " git integration
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" ----- python's
" Plug 'vim-scripts/identpython.vim'
" Plug 'Valloric/YouCompleteMe' " Check installation instructions on github
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
" ----- end python's
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" ┌────────────────────────────────────────────────────────────
" │	4. vim base configs
" └────────────────────────────────────────────────────────────
" Basic config
set encoding=utf-8
set clipboard=unnamed		" Use the system clipboard instead of the vim's one
set nocompatible		" Fix possible erros placing the .vimrc in wrong dir
set wrap			" Wraps text avoiding horizontal scroll
set linebreak			" Wraps text at the end of the word, avoid split words in half
set nolist			" Dont display whitespaces as characters
syntax on			" Turn on syntax highlighting
filetype off			" Helps force plugins to load correctly when its turned back on below
filetype plugin indent on	" Helps plugins to load correctly

set backspace=indent,eol,start	" Fix Common backspace problems
set scrolloff=5			" Display 5 lines above/below cursor when scrolling with a mouse
set ttyfast			" Fast scrolling inside vim
set laststatus=2		" Status bar
set showmode			" Display options
set showcmd			" Display options
set matchpairs+=<:>		" Count < and > as matchable characters to jump with %
set hlsearch			" Highlight matching search patterns
set incsearch			" Enable incremental search
set ignorecase			" Include matching uppercase words with lowercase search
set smartcase			" Include only uppercase words with uppercase search
set viminfo='100,<9999,s100	" Store max 100 files, 9999 text lines or 100kb of data. Saves vim to crash with large data


" ┌────────────────────────────────────────────────────────────
" │	5. vim custom options
" └────────────────────────────────────────────────────────────
let mapleader = ','		" Mapleader
set number 			" Number line absolute
set relativenumber		" Number line relative
set bg=dark			" Dark mode
set splitbelow			" Vertical split default
set splitright			" Horizontal split default
set showmatch

" fonts
set guifont=Iosevka\ Nerd\ Font\ 12

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert/normal mode with i/ii
:imap ii <Esc>	

" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


" ┌────────────────────────────────────────────────────────────
" │	6. plugin's confs
" └────────────────────────────────────────────────────────────
noremap cs :CocSearch
let g:airline_powerline_fonts = 1
noremap fs :Files<CR>

autocmd vimenter * ++nested colorscheme gruvbox


