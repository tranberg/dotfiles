"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file contains my personal configuration of vim.
" It is optimized for Python and LaTeX using Danish keyboard layout.
"
" Author: Bo Tranberg
" Contact: http://tberg.dk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load plugins
source ~/.vim/plugins.vim

" Basics
set spell           " Spell check
set spelllang=en_us " American English
set nocp            " Enables a lot of features
set number          " Show line numbers
set textwidth=80    " Define point of line break
set ruler           " Shows ruler for cursor
set sc              " Show command
set wildmenu        " Show the wild menu
set showmatch       " Show matching brackets


" Colors!
set t_Co=256        " 265 colors
syntax enable       " Enable syntax highlighting
colo gruvbox        " Color scheme
" Requires installation of gruvbox, see: https://github.com/morhetz/gruvbox
" Type :colo <tab> for a selection of built-in color schemes.

" Fixing colors in gruvbox
if !has("gui_running")
   let g:gruvbox_italic=0
endif
set background=dark " dark background


" Indentation and stuff
filetype indent on  " Automatic indentation
set tabstop=4       " Size of tab
set expandtab       " Insert space in stead of tab
set shiftwidth=4    " Indentation of text

" Special indentation
autocmd BufRead *.yml set tabstop=2 shiftwidth=2
autocmd BufRead *.tf set tabstop=2 shiftwidth=2


" Python stuff
" Indentation for Python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Disable spelling in .py files
autocmd BufRead *.py set nospell


" LaTeX stuff
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


" Key mappings
" Go to first tab on tg, like gt goes to next tab
:nmap tg :tabprevious<Enter>
" Jump by paragraph with a Danish keyboard layout
:nmap å {
:nmap ø }

" Jump by word in insert mode
:inoremap <C-H> <C-\><C-O>b
:inoremap <C-L> <C-\><C-O>w

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Remove trailing whitespaces on saving
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
