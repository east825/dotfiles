"=======================================================
" GLOBALS
"=======================================================

" special variables for the next part of vimrc:

" location of my plugins directory
let $MYVIMFILES = split(&runtimepath, ',')[0]

"=======================================================
" IMPORTS
"=======================================================

" import lot of basic mappings to make vim
" behave like normal editor (a bit)
" source $VIMRUNTIME/mswin.vim

" set up Pathogen power!
execute pathogen#infect()

"=======================================================
" BASIC OPTIONS
"=======================================================

" some stuff
set nocompatible        "nocompatible with vi
" set cpoptions+=$      " show $ sign at end of changing text
set guioptions=cemtg      " just what I want (cause -= doesn't work sometimes)

set visualbell          "turn off nasty beep
set hidden              " allow to switch buffers in window without saving
set noswapfile          " it usually just mess me
set autochdir         "always switch to the current file directory
" set foldcolumn=4
"
" platform specific clipboard settings:
" it's a bit complicated...
if has('win_32')
    " on windows there's only one system clipboard
    " (see 'gui-clipboard' in help system)
    " represented by "* register so let's use it
    set clipboard^=unnamed
    "  now vim use "* as alias for "", e.d.
    " for commands y,p,c,d and so on
elseif has('unix')
    " on unix with X11 however there are two such registers
    " called X selections: PRIMARY ("*) and CLIPBOARD ("+)
    " (see 09.3 in manual or 'x11-selections' topic in help)
    " first store any selected text without any additional 
    " actions, its content then can be accessed with <MiddleMouse> press
    set go+=a   " enable autoselect in vim
    " the second one is used just like above windows clipboard, e.d.
    " when you explicitly yank text and then paste it with
    " standart commands and hotkeys
    " set clipboard^=unnamedplus " now "+ is used instead of ""
    set clipboard^=unnamedplus
endif

set backspace=indent,eol,start 
set virtualedit=block

" selection mode settings
set keymodel=startsel,stopsel
set selectmode=key

" filetype settings

" turn everything on
filetype plugin indent on

" font settings
if has('gui_running')
    if has('gui_win32')
        "use ":set guifont=*" to choose another one
        set guifont=Consolas:h11:cRUSSIAN
    elseif has('gui_gtk2')
        set guifont=DejaVu\ Sans\ Mono\ 9
    endif
endif

" colorscheme
if has("gui_running")
    " for gvim
    set background=dark
    let g:solarized_italic=0
    " let g:solarized_menu=0
    colorscheme solarized
else
    " and for vim in terminal
    colorscheme slate
endif
" set no any characters in windows borders
set fillchars=""
" default vimdiff settings:
set diffopt=filler      " use fill chars to show difference
set diffopt+=vertical   " vertical split for :diffsplit
set diffopt+=context:3  " 3 non differnet lines above and below folds

syntax on           "turn on syntax highlighting
set number          "display numbers

set cursorline      "always mark current line

" characters to be shown in nonprintable (<F3>) mode
set listchars=tab:->,trail:-,eol:$,nbsp:.
set listchars+=precedes:<,extends:>
set showbreak=>>

" statusline options
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
" ------------------------------------------------------------------                                  

set laststatus=2    "always show status line                                                          
set wildmenu        "VERY convenient menu for <Tab>-completion          
" patterns for files which will be ignored in comletion
set wildignore=*.o,*.obj,*.pyc,*swp

set showcmd
set showmode        "show the current mode

" searching settings
set incsearch
set ignorecase
set smartcase
set hlsearch
nohlsearch
" set gdefault

" indentation and tabs behavior 
set autoindent      "turn on autoindent
set smartindent     "c-like indents
set tabstop=8       "tabs width in spaces (refer to tabs inserted by you and already existing)
set shiftwidth=4    "tabs width for indents (refer to >> and << operations and to tabs if 'smarttab' is on)
set softtabstop=4   "virtual tabs (replaced my mix of tabs and spaces if expandtabs is off)
set smarttab        " When on, a <Tab> in front of a line inserts blanks according to shiftWdith
set expandtab       "tabs are converted to whitespaces

" keymap settings
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" encoding settings
" to open utf-8 encoded python modules
set fileencodings=ucs-bom,utf-8,cp1251

" views and sessions settings
set viewdir=$HOME/vimfiles/views 

"=======================================================
" MAPPINGS
"=======================================================
"
" use ":map" to list all defined mappings
" and ":umap (:unmap, :iunmap, :nunmap, :vunmpa etc.)" to delete them
" ":mapclear" allow you to remove them all
" don't insert a comment directly after mapping - write it above or 
" use | character before your comment
" "map-<unique>" allow not to overwrite existing mapping if it is 
" use <SID> for mapping local plugin functions

" I prefer , instead of standart backslash as leader sign in mappings
let mapleader = ','

" yank till the end of line instead of whole line
map Y y$
map <C-c> Y

" [c]lose window [b]elow
noremap ,cb <C-w>j<C-w>c<C-w>p

" plugin stuff
noremap ,n<Space> :NERDTreeToggle<CR>

" [s]urround tail part of assignemnt by [q]uotes
map <silent> ,sq :exec('s/=\zs"\?\([^"]\+\)"\?\ze$/"\1"') \| nohlsearch<CR>
" [c]hange path [d]elimeters to unix ones
map <silent> ,cd :s@\\@/@g \| nohlsearch<CR>
" do both
" map <silent> ,cp      :s/=\zs\"\?\([^"]\+\)"\?\ze$/"\1"<CR> \|
            " \:s@\\@/@g<CR> \|
            " \:nohlsearch <CR>
" map <silent> 
" [f]ind [w]ord - search for word under cursor in right window
map <silent> ,fw yiw :wincmd l \| exec "/" . @" \| wincmd h<CR>
" split [v]ertically for [a]lternate buffer
map <silent> ,va :vert sbuffer #<CR>

" [g]et [n]ame of current buffer
map <silent> ,gn :let @*=expand("%")<CR>
" [g]et full [p]ath to current buffer
map <silent> ,gp :let @*=expand("%:p")<CR>

" some buffer and windows management
" [b]uffer [n]ext
map ,bn :bnext<CR>
map <C-n> :bnext<CR>

" turn off highlighting for current search pattern
map <silent> <F2> :nohlsearch<CR>
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" somethong like 'special characters' mode
map <silent> <F3> :if &list <Bar>
                \set nolist <Bar>
            \else <Bar>
                \set list <Bar>
            \endif<CR>

" not mine actually..
"
" edit .vimrc (mnemonic 'e'dit 'v'imrc)
noremap <silent> ,ev :e $MYVIMRC<CR>
" source .vimrc
noremap <silent> ,sv :so $MYVIMRC<CR>

"change working directory to those of current file
noremap ,cd :cd %:p:h<CR>:pwd<CR>

" return syntax highlighting group
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|:nohls<cr>

" allow command line editing like emacs and any 
" modern terminal emulator...
" CTRL-u and CTRL-w already aviable
cnoremap <C-a>      <Home>
cnoremap <C-b>      <Left>
cnoremap <C-e>      <End>
cnoremap <C-f>      <Right>
cnoremap <C-n>      <End>
cnoremap <C-p>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-b> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-f> <S-Right>
cnoremap <ESC><C-h> <C-W>

"=======================================================
" ABBREVIATIONS
"=======================================================
"
" type ":abbreviate" to see all defined abbreviations
" and ":unabbreviate" to delete specified one
" "noreabbrev" is useful too (see help for details)

iabbrev lenght length


"=======================================================
" AUTOCOMMANDS
"=======================================================

"=======================================================
" COMMANDS
"=======================================================
"
command! W   w
if has('win32')
    command! Saves mksession! $HOME/vimfiles/sessions/session.vim
    command! Loads source $HOME/vimfiles/sessions/session.vim
elseif has('unix')
    command! Saves mksession! $HOME/\.vim/sessions/session.vim
    command! Loads source $HOME/\.vim/sessions/session.vim
endif
" Delete all opened buffers completely
command! Delbufs 1,1000bwipeout!


"=======================================================
" PLUGINS
"=======================================================

" == NERDtree ==

" change cwd according to NERDTree's one
let NERDTreeChDirMode = 2
" highlighting on
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" show bookmarks table at startup
let NERDTreeShowBookmarks = 1
" and files
let NERDTreeShowFiles = 1

" NERDcommenter:

let g:NERDSpaceDelims = 1

" == python-mode ==

" disable rope support for now
let g:pymode_rope = 0

" turn off autofolding
let g:pymode_folding = 0

" disable mccabe checks (it seems that my code always too comples for it :))
let g:pymode_lint_checker = 'pyflakes,pep8'
" let g:pymode_lint_mccabe_complexity=12

" hide cwindow after check (but show marks near linenumbers)
let g:pymode_lint_cwindow = 0

"=======================================================
"-> TIPS
"=======================================================
" :helptags to generate help files for plugin
" 'yiw' means yank inner world
" CTRL-R <buffName> - insert text from specified buffer in insert mode
" @{register_name} - execute script from specified register
" --> about encoding:
" encoding - change the encoding vim uses internally
" termencoding - encoding used in system 
" fileencoding - encoding for file
" use ':edit ++enc=<encoding>' to force encoding" detection
" and ':write ++enc=utf-8 russian.txt' to convert file to another encoding
" :echo globpath(&rtp, "keymap/*.vim")
" '=' in Visual mode - autoformat for c-code
" :promptf[ind] if you don't like '/' searching
" or :promptr[epl] also
