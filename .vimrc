" Global settings for /vim/
 set nu				" set row number
 set nocompatible               " be iMproved
 set cursorline			" highlight the current line
 set showmatch			" show mathced brackets
 set autoindent smartindent	" smart auto-indent
 set foldmethod=indent		" default indent mode
 set showcmd			" show commands that not finished
 set directory=/tmp		" set directory for .swp files
 set autochdir			" automatically change directory
 set incsearch hlsearch ignorecase smartcase " settings for search
 set t_Co=256			" vim color scheme
 autocmd FileType tex setlocal spell spelllang=en_us 
 autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us 
 "set spell spelllang=en_us      " set spell 
 set hls                        " set highlight search
 set noic                       " set no case ignore
 
"set list                " show Line Feed (LF) or End of Line: $ 
"set binary              " show Carriage Return (CR): ^M 
                         " (In bash it could be inserted by C-v C-m)

 " using four blanks to replace TAB
 set expandtab smarttab
 set shiftwidth=4 
 set softtabstop=4 
 
 " color schemes for vim
 if ! has("gui_running")
    " colorscheme grb256 
    " colorscheme freya
    colorscheme lucius 
    LuciusDark
    " LuciusWhite
    " LuciusLight
    " LuciusBlack 
    " let g:lucius_contrast='high'
    " let g:lucius_use_bold=1
    
    " syntax enable
    " colorscheme monokai
 endif
 
 syntax on
 filetype plugin on
 filetype on
 set title			" enable dynamic title

" ----------------------------------------------------------------------------
"  For /GVIM/ 
" ----------------------------------------------------------------------------
if has("gui_running")
    " colorscheme github
    " colorscheme grb256 
    colorscheme lucius
    " LuciusLight
    LuciusDark
    " syntax enable
    " colorscheme monokai
" ---
    set guioptions=a  "remove menus, using clipboard instead of primary
"    set guicursor=a:blinkwait600-blinkoff600-blinkon600 "frequency of cursor's blink 
    set lines=27 columns=80
    set guifont=Monospace\ 9.8 
endif

" --------------------------------------------------------------------------
"  For backup 
" --------------------------------------------------------------------------
set backup
set backupdir=/tmp

" set cursor to the last position 
autocmd BufReadPost * 
    \if line("'\"") > 0 && line("'\"") <= line("$") |
        \exe "normal g`\"" |
    \endif


" --------------------------------------------------------------------------
"  Key maps
" --------------------------------------------------------------------------
" nnoremap <F8> :vertical wincmd gf<CR>
" vnoremap <C-c> "+y
imap <C-A> <Home>
imap <C-E> <End>
imap <C-F> <Right>
imap <C-B> <Left>
imap <C-N> <Down>
imap <C-P> <Up>
imap <C-K> <Esc>d$a


" -------------------------** Vundle **-------------------------------------
" --------------------------------------------------------------------------
" filetype off                   " required!
" ---------------------------------------------------------------
"  For Vundle
" ---------------------------------------------------------------
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 " --------------------------------------------------------------
 " original repos on github
  "Bundle 'gerw/vim-latex-suite' 
   Bundle 'LaTeX-Box-Team/LaTeX-Box'
   Bundle 'djoshea/vim-matlab'
    
 " vim-scripts repos
	"  Bundle 'vim-scripts/cmdalias.vim'
   Bundle 'taglist.vim'
   Bundle 'jamessan/vim-gnupg'
   Bundle 'scrooloose/nerdcommenter'

 " non github repos
 
 " git repos on your local machine (ie. when working on your own plugin) 
 

 " --------------------------------------------------------------

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
" --------------------------------------------------------------------------



" For Latex-Box 
" ----------------------------------


" For TeX-PDF script
" ----------------------------------
"let g:tex_pdf_map_leader_keys = 0


" ---------------------------** TagList **----------------------------------
" For Taglist - Support /LaTeX/
" ----------------------------------
"let Tlist_Inc_Winwidth=60
let Tlist_WinWidth=60
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'
set iskeyword=@,48-57,_,-,:,192-255

let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Updata=1
let Tlist_Show_One_File=0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Use_Left_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'
let Tlist_Use_Right_Window = 1

" For Taglist - Support /MatLab/
" ----------------------------------
let tlist_matlab_settings = 'matlab;f:functions'

" For Taglist - Support /General/
" ----------------------------------
" 'T' opens/closes the TagList window
nmap  T :TlistToggle

" 't' jumps to and from the TagList window
nmap  t :TlistOpen

"au BufRead,BufNewFile *.sire set filetype=sire
"au BufEnter *.tex set nosmartindent
" --------------------------------------------------------------------------
