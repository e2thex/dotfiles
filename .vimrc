" awwaiid's .vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set vb                  " I hate the beeping
set aw                  " Auto-write when doing certain things. I added
                        "   this so I could switch buffers more easily.
set sbr=-->\            " Use "-->" to show line wrapping
set lbr                 " wrap lines to a whole word when convenient
set sw=2                " Width to shift and indent things
set ts=2                " Set tabsize to 4 (to view other people's crap)
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set et                  " Use spaces, not tabs. tabs are the devil.
set bg=dark             " We are using a dark background
"set backup              " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        "   than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time


let php_folding=1       "have folding in php

set formatoptions+=r    " Insert comment-header on enter (auto-comment)
set formatoptions+=o    " Insert comment-header on 'o'
set formatoptions+=q    " Format comments with gq
set formatoptions+=c    " For most things don't auto-break comments
" Auto-break paragraphs (don't be scared -- this is OK)
"au FileType tex set formatoptions+=a
"au FileType tex set formatoptions-=c " For TeX documents auto-break
"everything au FileType tex set formatoptions+=t " For TeX documents
"auto-break everything

" set formatoptions+=n    " Auto-number. I'm not sure I'll like this. No... I
                          " don't like this at all.

" Add the dash ('-'), the dot ('.'), and the '@' as "letters" to "words".
" This makes it possible to expand email and html addresses,
" eg guckes-www@vim.org and http://www.vim.org/
set iskeyword=@,48-57,_,192-255,-,.,:,/,@-@

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set wildmenu " Shows possible command completions!

"complete things with slases and colons in html mode
au FileType html set isk+=:,/,~

" Detect Perl-asp
au BufNewFile,BufRead *.inc,*.pl
    \ if getline(1) . getline(2) . getline(3) =~ "<%" |
    \    set syntax=aspperl |
    \ endif

" I like to insert time stamps - these are macros to do it
iab Ydtime <c-r>=strftime("%Y.%m.%d.%H.%M")<cr>
iab Ydate <c-r>=strftime("%Y.%m.%d")<cr>
iab Yldate <c-r>=strftime("$%Y\\cdot%m\\cdot%d$")<cr>

" LaTeX documents are fun, but lets preview them
" The commented ones need tuning
" com! Mkdoc Mkpdf | Mkps
com! Mkpdf :w | !~/bin/Mkpdf '%'
com! Mkslideshow :w | !~/bin/Mkslideshow '%'
" com! Mkps :w | !latex '%' ; dvips %
"com! PreviewPdf :w | !pdflatex "%" ; gv "%<.pdf"
" com! PreviewPs  :w | !pslatex  "%" ; gv "%<.ps"

" Enough of this stuff. I wrote a script named mdoc to do it
com! Mdoc :w | !~/bin/mdoc '%'
com! Preview :w | !~/bin/mdoc '%' ; gv '%<.ps'
com! PHP :set syntax=php
com! PY :set foldmethod=indent

" Spell checking is usefull for all sorts of things
com! Spellcheck :execute '!aspell -c "%"' | edit
com! GSpellcheck :execute '!gaspell %' | edit

" For doing email hard-wrapping text is nice. These work in normal mode
" ^F = format whole document
map <c-f> gggqG
" f = format this paragraph
map f gqap

" For editing my essays I like to move up/down single screen lines (wrapped)
map <up> gk
imap <up> <c-o>gk
map <down> gj
imap <down> <c-o>gj

" These are for dvorak and qwerty switching during insert mode
" Just for fun ;)
"map ,d :source ~/.vim/dvorak.vim
"map ,q :source ~/.vim/qwerty.vom

" source ~/.vim/SuperTab.vim
" source ~/.vim/vimspell.vim

" Bracket highlighting
" so ~/.vim/himtchbrkt.vim

set nocindent           " turn off the cindent, just in case it's on
colorscheme blackdust
