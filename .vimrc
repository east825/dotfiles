" Pathogen initialization

execute pathogen#infect()

" ## Miscellaneous settings ##

set nocompatible
syntax on
set number
filetype plugin indent on
set showcmd
set showmode    " show the current mode
set cursorline  " highlight current line
set visualbell  " turn off nasty beep
set hidden      " allow to switch buffers in window without saving
set noswapfile  " it usually just mess me
set autochdir   " always switch to the current file directory
set backspace=indent,eol,start 
set virtualedit=block
" selection mode settings
set keymodel=startsel,stopsel
set selectmode=key
set nrformats-=octal
set autoread
set scrolloff=1
set go=em

" ## Clipboard ##

" see help topics: gui-clipboard, x11-selections and manual 09.3 section
if has('win_32')
    set clipboard^=unnamed
elseif has('unix')
    set go+=a   " enable autoselect in vim
    set clipboard^=unnamedplus
endif

" ## Status line ##

set laststatus=2 "always show status line

" helper function for displaying current keymap
function! ChangeLang()
    if &iminsert == 0
        " hi StatusLine guifg=White guibg=#4e4e4e
        return 'ENG'
    else
        " hi StatusLine guifg=#005f87 guibg=#afdfff
        return 'LANG'
    endif
endfunction

set statusline=
set stl+=%f\ %r%m%y
set stl+=[%{(empty(&fenc)?&enc:&fenc).(&bomb?\",BOM\":\"\")}]           " encoding detection
set stl+=[#%n]                                                          " buffer number
set stl+=%=                                                             " alignement delimeter
set stl+=Line:\ %4l\ of\ %L(%P)\                                        " line number
set stl+=Col:%4c\ 
set stl+=Char:0x%B\                                                     " character code
" set stl+=Lang:%k
set stl+=Lang:\ %{ChangeLang()}\                                        " language layout

" ## Searching ##

set incsearch
set ignorecase
set smartcase
set hlsearch
nohlsearch

" ## Indentation and tabs ##

set autoindent      " turn on autoindent
set smartindent     " c-like indents
set tabstop=8       " size of exisiting tabs
set shiftwidth=4    " size of indents (>> and << operations and tabs if 'smarttab' is on)
set smarttab
set softtabstop=4
set expandtab

" ## Wild menu ##

set wildmenu
set wildignore=*.o,*.obj,*.pyc,*swp

" ## Nonprintable characters mode ##

set nolist      " disable hidden charactes display at startup
set listchars=tab:->,trail:-,eol:$,nbsp:.,precedes:<,extends:>
set showbreak=>>

" ## Keymap ##

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" ## Color and fonts

if has('gui_running')
    if has('gui_win32')
        " use ":set guifont=*" to choose another one
        set guifont=Consolas:h11:cRUSSIAN
    elseif has('gui_gtk2')
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

colorscheme Tomorrow-Night

" ################# Mappings #################

let mapleader = ','

map Y y$
nnoremap & :&&<CR>
xnoremap & :&&<CR>
noremap ,n<Space> :NERDTreeToggle<CR>
noremap ,t<Space> :TlistToggle<CR>
noremap ,cd :cd %:p:h<CR>:pwd<CR>

" resize windows
nnoremap <C-A-right> :vertical resize +5<cr>
nnoremap <C-A-left> :vertical resize -5<cr>


"Derek Wyatt's shorcuts:
" edit .vimrc 
noremap <silent> ,ev :e ~/.vimrc<CR>
" source .vimrc
noremap <silent> ,sv :so ~/.vimrc<CR>

" name of current buffer
map <silent> ,gn :let @*=expand("%")<CR>
" full path to current buffer
map <silent> ,gp :let @*=expand("%:p")<CR>
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" toggle hidden characters mode
map <silent> <F3> :if &list <Bar>
                \set nolist <Bar>
            \else <Bar>
                \set list <Bar>
            \endif<CR>

" ############# Abbreviations #############

" type ":abbreviate" to see all defined abbreviations
" and ":unabbreviate" to delete specified one
" "noreabbrev" is useful too (see help for details)

iabbrev lenght length

" ############# Plugins settings #############

" ## NERDTree ##

" change cwd according to NERDTree's one
let NERDTreeChDirMode = 2
" highlighting on
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" show bookmarks table at startup
let NERDTreeShowBookmarks = 1
" and files
let NERDTreeShowFiles = 1

" ## NERDCommenter ##
let g:NERDSpaceDelims = 1

" ## Syntastic ##

let g:syntastic_mode_map =  { 'mode': 'active',
                            \ 'passive_filetypes': ['java'] }
