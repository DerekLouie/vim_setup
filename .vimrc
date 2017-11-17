set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Your Vundle plugins go here.
" My plugins
Plugin 'jellybeans.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/mru.vim'
Plugin 'troydm/easybuffer.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tpope/vim-abolish'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
"Highlight matching tags
Plugin 'gregsexton/MatchTag'
"% goes to closing tag
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-repeat'
call vundle#end()

" All of your plugins must be added before the following line.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
"filetype plugin indent on
syntax on

augroup autoformat_settings
    au FileType less setl sw=2 sts=2 et
augroup END

    autocmd!
    syntax on                                               " Syntax Highlighting
    set mouse=a                                             " Use mouse and scrolling
    set nowrap                                              " No line wrapping
    set number                                              " Show line numbers
    set hlsearch                                            " Set highlighting when searching

    set clipboard=unnamedplus                               " Use os level copy-paste buffer
    nnoremap y "+y
    vnoremap y "+y
    set wildmode=longest:full,full                          " On tab wildmenu shows up

    set ruler                                               " Setting thing that shows the column number.
    set t_Co=256                                            " Set color limit to 256
    set wrap                                                " Setting wrapping: http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
    set linebreak
    "set viminfo^=%                                          " Remember info about open buffers on close
    set exrc                                                " enable per-directory .vimrc files
    set secure                                              " disable unsafe commands in local .vimrc files
    "set viminfo^=%                                          " Remember info about open buffers on close
    " Working Dir Is Always Current File Path
    autocmd BufEnter * lcd %:p:h

    function SwitchToLastBuffer()
      b#
    endfunction

    nmap # :call SwitchToLastBuffer()<CR>

    " Set mapleader, in case plug-ins use it.
    let g:mapleader = "\<space>"
    let mapleader = g:mapleader

    cnoreabbrev <silent> Q q
    cnoreabbrev <silent> wq wa<bar>q
    cnoreabbrev <silent> WQ wa<bar>q

    noremap <C-H> <C-W>h
    noremap <C-J> <C-W>j
    noremap <C-K> <C-W>k
    noremap <C-L> <C-W>l

    "nooping pesky u lowercasing everything
    vnoremap u <Esc>u

    nnoremap ; :

    " Visual mode pressing * (for forward search)  or # (for backward search) searches for the current selection
    vnoremap <silent> * :<C-U>
          \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
          \gvy/<C-R><C-R>=substitute(
          \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
          \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <silent> # :<C-U>
          \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
          \gvy?<C-R><C-R>=substitute(
          \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
          \gV:call setreg('"', old_reg, old_regtype)<CR>

    " Clear all trailing spaces in all open buffers
    nmap <leader>\\ <esc>:bufdo %s/\s\+$//e<CR>

    "set undofile
    "silent !mkdir ~/vimHistory > /dev/null 2>&1
    "set undodir=~/vimHistory

    set splitright

    " Makes search act like search in modern browsers
    set incsearch
    " Show matching brackets when text indicator is over them
    set showmatch
    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
    " Use Unix as the standard file type
    set ffs=unix,dos,mac
    " Hide buffers from :ls when closed
    set hid

    color jellybeans

    " ------------------------------------------------------------------------- "
    " MRU
    let MRU_Max_Entries = 1000
    " silent !touch ~/.vim/sessions/MRU > /dev/null 2>&1
    " let MRU_File = '~/.vim/sessions/MRU'
    " MRU does not close after you open a file (want to make this
    " functionality work with the vimgrep stuff)
    " let MRU_Auto_Close = 0
    map <c-i> <esc>:MRU<cr>
    " ------------------------------------------------------------------------- "

    " Press space twice to comment current/selected line(s)
    map <leader><Space> <plug>NERDCommenterToggle

    map <leader>ls <esc>:EasyBuffer<CR>

    " ------------------------------------------------------------------------- "


    map <C-n> <ESC>:NERDTreeToggle<CR>

    " Run whatever is in the buffer in vim:
    ":w !sh

    let NERDTreeShowBookmarks=1


    " Indentation
    set backspace=eol,start,indent
        set tabstop=4
        set shiftwidth=5
        set smarttab
        set expandtab
        set smartindent
        set softtabstop=5
        set autoindent

    "replace tabs with spaces:  :%s/\t/  /g
