""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file contains configurations for Vim.
" The setup is optimized for Python and LaTeX.
"
" Author: Bo Tranberg
" Contact: http://tberg.dk
" Last modified: April 17, 2015
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basics
set spell           " spell check
set spelllang=en_us " American English
set nocp            " Enables a lot of features
set number          " show line numbers
set textwidth=80    " line break at 80 characters
set ruler           " Shows ruler for cursor
set sc              " show command
set wildmenu        " Show the wild menu
set showmatch       " show matching brackets

" Colors!
set t_Co=256        " 265 colors
syntax enable       " enable syntax highlighting
colo gruvbox        " color scheme

" Fixing colors in gruvbox
if !has("gui_running")
   let g:gruvbox_italic=0
endif
set background=dark " dark background

" Indentation and stuff
filetype indent on  " automatic indentation
set tabstop=4       " size of tab
set expandtab       " insert space in stead of tab
set shiftwidth=4    " indentation of text

" Indentation for Python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Remove trailing white spaces when saving *.py files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Disable spelling in .py files
autocmd BufRead *.py set nospell

" This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" To install LaTeX-suite:
" aptitude install vim-latexsuite
" sudo vim-addons -w install latex-suite

" Make Latex-Suite compile .tex files to pdf
let g:Tex_DefaultTargetFormat = 'pdf'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" If you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" Disable folding in latex-suite
autocmd Filetype tex setlocal nofoldenable

" Enable wrapping but without linebreak in .tex files
autocmd Filetype tex set wrap linebreak nolist textwidth=0 wrapmargin=0 formatoptions+=l
