"
"	___  ___              _                     
"	|  \/  |             (_)                    
"	| .  . |_   _  __   ___ _ __ ___  _ __ ___  
"	| |\/| | | | | \ \ / / | '_ ` _ \| '__/ __| 
" 	| |  | | |_| |  \ V /| | | | | | | | | (__  
" 	|_|  |_/\__, | (_)_/ |_|_| |_| |_|_|  \___| 
"	         __/ |                              
"		       |___/
"
"
"	Hi! I have spent several months perfecting this file to a level where
"	I am comfortable using vim. I've documented it as much as possible so
"	you can easily customize it! I hope it can help if you are starting
"	with vim and you are not sure what configuration to follow ^^
"	
"		https://github.com/dawichi
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
" basics
Plug 'scrooloose/nerdtree'              " Directory explorer
Plug 'tpope/vim-commentary'		          " Comment with 'gcc' or 'gc' + Arrows
Plug 'morhetz/gruvbox'			            " Color theme
Plug 'ryanoasis/vim-devicons'		        " Devicons - needs a NerdFont installed
Plug 'Raimondi/delimitMate'             " Autoclose for quotes, brackets, etc
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }	" Autocomplete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'			            " Search in files

" statusline
Plug 'vim-airline/vim-airline'          " bottom colored statusline
Plug 'vim-airline/vim-airline-themes'   " Themes

" git
Plug 'tpope/vim-fugitive'		          " Git. Use ':Git [add/commit/diff/etc...]'
Plug 'tpope/vim-rhubarb' 		          " Required by fugitive to :GbrowsE
Plug 'airblade/vim-gitgutter'         " Git. Shows on left col modified or added lines

" others
Plug 'Yggdroot/indentLine'            " Display indention levels 
Plug 'tmhedberg/SimpylFold'		        " Folding code
Plug 'vim-scripts/grep.vim'           " Grep commands
Plug 'vim-scripts/CSApprox'           " Enable colorscheme in terminal-vim
Plug 'majutsushi/tagbar'              " TagbarToggle. Maps the file's function structure in a right panel 
Plug 'dense-analysis/ale'             " Syntax check

" Syntax support
Plug 'mattn/emmet-vim'	    	    	  " emmet
Plug 'tpope/vim-haml'		        	    " .HAML
Plug 'hail2u/vim-css3-syntax'		      " .CSS
Plug 'gko/vim-coloresque'	        	  " color highlighting in CSS/SASS/LESS'
Plug 'pangloss/vim-javascript'	    	" .JS
Plug 'leafgarland/typescript-vim'   	" .TS
Plug 'davidhalter/jedi-vim'		        " .PY
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

call plug#end()


" ┌────────────────────────────────────────────────────────────
" │	4. plugin's confs
" └────────────────────────────────────────────────────────────
noremap cs :CocSearch
let g:airline_powerline_fonts = 1
noremap fs :Files<CR>

autocmd vimenter * ++nested colorscheme gruvbox

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>



" ┌────────────────────────────────────────────────────────────
" │	5. vim base configs - recommended
" └────────────────────────────────────────────────────────────
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Search
set hlsearch			  " Highlight matching search patterns
set incsearch			  " Enable incremental search
set ignorecase			" Include matching uppercase words with lowercase search
set smartcase			  " Include only uppercase words with uppercase search

set backspace=indent,eol,start	" Fix Common backspace problems
set fileformats=unix,dos,mac	  " OS support
set hidden			                " Enable hidden buffers
set clipboard=unnamed		        " Use the system clipboard instead of the vim's one
set nocompatible		            " Fix possible erros placing the .vimrc in wrong dir
set wrap			                  " Wraps text avoiding horizontal scroll
set linebreak			              " Wraps text at the end of the word, avoid split words in half
set nolist			                " Dont display whitespaces as characters
syntax on			                  " Turn on syntax highlighting
filetype off			              " Helps force plugins to load correctly when its turned back on below
filetype plugin indent on	      " Helps plugins to load correctly

set scrolloff=5			            " Display 5 lines above/below cursor when scrolling with a mouse
set ttyfast			                " Fast scrolling inside vim
set laststatus=2		            " Status bar
set showmode			              " Display options
set showcmd			                " Display options
set matchpairs+=<:>		          " Count < and > as matchable characters to jump with %
set viminfo='100,<9999,s100	    " Store max 100 files, 9999 text lines or 100kb of data. Saves vim to crash with large data




" ┌────────────────────────────────────────────────────────────
" │	6. vim custom options - personalized
" └────────────────────────────────────────────────────────────
let mapleader = ','		" Mapleader
set ruler
set number 			      " Number line absolute
set relativenumber		" Number line relative
set bg=dark			      " Dark mode
set splitbelow			  " Vertical split default
set splitright			  " Horizontal split default
set showmatch			    " Matching '"({[< characters

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" fonts
set guifont=Iosevka\ Nerd\ Font\ 12


" insert/normal mode with i/ii
:imap ii <Esc>	

" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let NERDTreeQuitOnOpen=1

" ┌────────────────────────────────────────────────────────────
" │     7. confs copied from vim-bootstrap. 
" └────────────────────────────────────────────────────────────
" I'm not even 100% sure what all they do, but they are useful, just trust xD

" Shell config
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Visual config
let no_buffers_menu=1
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

" Disable cursor blinking
set gcr=a:blinkon0

set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" syntax highlight from start unless 200
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
        
" txt
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
            
" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" functions
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif


"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
