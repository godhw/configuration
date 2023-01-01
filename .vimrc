set nocompatible                                    " Using Vim default

" plug-in setting
" Using Vim-Plug
call plug#begin('~/.vim/plugged')

" plug-in
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " autocomplete
Plug 'preservim/nerdtree'                           " file explorer
Plug 'preservim/tagbar'                             " ctags
Plug 'vim-airline/vim-airline'                      " status/tabline
Plug 'ctrlpvim/ctrlp.vim'                           " finder for Vim
Plug 'nathanaelkane/vim-indent-guides'              " visually indent levels
Plug 'sheerun/vim-polyglot'                         " language pack
Plug 'rhysd/vim-clang-format'                       " clang formatter

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""


" set cursor in last modified point
au BufReadPost * 
\ if line("'\"") > 0 && line("'\"") <= line("$") | 
\ exe "norm g`\"" | 
\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim indent guides
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim airline smarter tab line
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-clang-format
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#detect_style_file = 1

" tag file
set tags=tags

""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""Editor"""""""""""""""""""""""
" Author:
"     Heewon Shin - @godhw
"
" Update:
"     221231
" 
" Reference:
"     https://github.com/amix/vimrc
" 
" Parts:
"     * General
"     * VIM user interface
"     * Colors, Syntax and Fonts
"     * Files and Backups
"     * Text, tab and indent related
"     * Visual mode related
"     * Moving around, tabs and buffers
"     * Status line
"     * Editing mappings
"     * Spell checking
"     * Misc
"     * Helper functions
"     * Cscope
"
" Tips:
"     au [] * ()
"         [] : situation
"         () : command
"     <leader>: default '/'
""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - General
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of VIM has to remember
set history=1000

" Enable filetype plugin and indent
filetype plugin indent on

" Set to auto read when changed from outside
set autoread
au FocusGained,BufEnter * checktime

" :W sudo saves the file(for permission-denied)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!



""""""""""""""""""""""""""""""""""""""""""""""""""""
" - VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set lines to the cursor, Cursor scroll offset
set scrolloff=5

" Avoid garbled characters in Windows
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Enable command-line autocomplete extension
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" set cursor
" ru: Info for cursor position
" cul: cursor line highlight
set ruler
set cursorline

" Height of the command bar
set cmdheight=1

" For using buffers easily.(For E37: No write ...)
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Move to next/prev line
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Find exact string when search including upper
set smartcase

" Highlighting search results
set hlsearch

" Searching when a char is entered
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expressions
set magic

" Highlight matching parenthesis
" mat: Set highlight times 3==0.3sec
set showmatch
set mat=3

" Disable annoying beeping
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Fold range info to 1 line
set foldcolumn=1

" Show entered command in NORMAL mode
set showcmd

" Set scroll by mouse
set mouse=a

" numbering line
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd InsertLeave * set relativenumber
    autocmd InsertEnter * set norelativenumber
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Colors, Syntax and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
if has("syntax")
  syntax on
endif

" Set regular expression engine automatically
set regexpengine=0

" Enable 256 colors palette
set t_Co=256

" jellybeans.vim
try
    colorscheme jellybeans
catch
endtry

set background=dark
" set termguicolors
"
" If error in Theme
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Use an encoding that supports unicode
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Color line for char limit
" set colorcolumn=100
" highlight ColorColumn ctermbg=darkgray guibg=darkgray


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Files and Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable backup, for git
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab to space
set expandtab

" Delete space like tab
set smarttab

" Tab to space
set tabstop=2

" >> << to space
set shiftwidth=2

" Delete 2 space (recongize 2 space = 1 tab)
set softtabstop=2

" New lines inherit the indentation of previous lines
set autoindent

" C auto indent
set cindent

" Auto indent consider language syntax
set smartindent

" Wrap lines
" linebreak: Break the line in word
" tw: Linebreak length
" showbreak: Highlight the break line
set wrap
set linebreak
set tw=120
set showbreak=+++\


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * 
    if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always display the status bar
set laststatus=2

" status line config
" set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out  
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set nocscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

