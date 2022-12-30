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

""""""""""""""""""""""""""""""""""""""""""""""""""""
" jellybeans.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans

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
" Editor
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
if has("syntax")
  syntax on
endif
 
" new lines inherit the indentation of previous lines
set autoindent
" c auto indent
set cindent
" numbering line
set number relativenumber
" hightlight matching parenthesis
set showmatch
" highlighting search
set hlsearch
" ignore case when searching
set ignorecase
" increase string when searching
set incsearch
" find exact string when search upper
set smartcase
" use an encoding that supports unicode
set encoding=utf-8
" always display the status bar
set laststatus=2
" status line config
" set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" show commend
set showcmd
" Tab to space
set expandtab
" Tab to space = 2
set tabstop=2
" >> << to space = 2
set shiftwidth=2
" delete 2 space (recongize 2 space = 1 tab)
set softtabstop=2
" open files no fold
set nofoldenable
" set cursor
set ruler
set cul
" set scroll by mouse
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope  
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

