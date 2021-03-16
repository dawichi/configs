" ┌────────────────────────────────────────────────────────────
" │     1. vim-plug installation
" └────────────────────────────────────────────────────────────
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" ┌────────────────────────────────────────────────────────────
" │     2. run PlugInstall if there are missing plugins
" └────────────────────────────────────────────────────────────
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" ┌────────────────────────────────────────────────────────────
" │     3. vim-plug plugins
" └────────────────────────────────────────────────────────────
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox' " color theme
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim' " super search
Plug 'tpope/vim-fugitive' " git integration
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" ----- python's
" Plug 'vim-scripts/identpython.vim'
" Plug 'Valloric/YouCompleteMe' " Check installation instructions on github
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
" ----- end python's
call plug#end()


" ┌────────────────────────────────────────────────────────────
" │     4. vim configs
" └────────────────────────────────────────────────────────────
set nu
set bg=dark
set splitbelow
set splitright
set clipboard=unnamed
set showmatch

" fonts
set guifont=Iosevka\ Nerd\ Font\ 12
set encoding=UTF-8

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autocomplete
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap < <><Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>0


" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1 " SimpyDold test, probarlo a ver si gusta

" Enable folding with the spacebar
nnoremap <space> za



autocmd vimenter * ++nested colorscheme gruvbox