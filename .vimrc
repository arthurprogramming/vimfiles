" vundle bundle script has to be puts here
" Preamble ---------------------------------------------------------------- {{{
exe join(map(split(glob("~/.vim/plugin-settings/vundle_install.vim"), "\n"), '"source " . v:val'), "\n")
" }}}

" File type detection ---------------------- {{{
syntax on          " Enable syntax highlighting
filetype on        " Enable file type detection
filetype indent on " Enable file type-specific indenting
filetype plugin on " Enable file type-specific plugins
" }}}

" General settings ---------------------- {{{
set autoindent                              " following lines should also be intended
set autoread                                " re-read files that changed on disk without asking
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set ch=2                                    " height of the command line at the bottom
set encoding=utf-8                          " the terminal encoding
set expandtab                               " hitting Tab in insert mode will produce umber in spaces tabs instead of tabs
set fileencodings=utf-8,default,latin1      " the order of file encodings to try.
set guioptions-=T                           " turning of the tool bar
set history=5000                            " keep 5000 lines of command line history
set lines=999 columns=999                   " full screen when starting Gvim (it's a hack)
set ls=1                                    " always show status line
set noerrorbells                            " don't make noise on error messages
set nomodeline                              " frequent security hole
set nowarn                                  " do not warn, when shell command update the file you edit in Vim
set number                                  " display line numbers
set numberwidth=2                           " using only 2 column for numberline presentation
set ruler                                   " show the line and column number of the cursor position
set shell=/bin/bash                         " always use sh when executing commands with :!
set shiftwidth=2                            " how many columns text is indented with the indent operations (<< and >>)
set showcmd                                 " show (partial) command in the last line of the screen
set showmode                                " display in the left corner in which modus you are in Vim
set softtabstop=2                           " how many columns
set synmaxcol=200                           " better scrolling for long lines
set spelllang=en_us                         " default language for spell checker
set tabstop=2                               " how many columns a tab counts
set timeout timeoutlen=1000 ttimeoutlen=100 " scroll speed of the editor
set title                                   " show title in console title
set ttyfast                                 " smooth changes and better scrolling
let mapleader = ","                         " change the leader to be a comma vs. backslash if not given
set laststatus=2                            " always hide the status line
set scrolloff=4 " minimal number of screen lines to keep above and below the cursor
set viminfo='1000000,f1 "save marks for 1 million files ('1000000), save global marks
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif " move tabs to the end for new, single buffers (exclude splits)
set ignorecase " ignore upper- and lowercase letters during a search
set hlsearch   " highlight all finding for a search
set incsearch  " do incremental searching, that means search after the string when you begin writing

" ## backup setting
set backup                  " save files after close
set writebackup             " make a backup of the original file when writing
set noswapfile              " don't save swap files
set updatetime=2000         " Write swap files after 2 seconds of inactivity.
set backupext=~             " backup for is ~
set backupdir=~/.vim/backup " backups are written to ~/.backup/ if possible.
set backupcopy=yes          " keep attributes of the original file

au FocusLost * :wa " when switching between windows, automatically save the file, if they have changes

" Wildmenu
if has("wildmenu")
    set wildmenu " enable command-line completion when pressing :e in a nice window
    set wildmode=longest,list
        " longest: match till the common longest string
        " list: display matches in a list instead of tab separated list of up to four parts
        " the files on wildignore will not be displayed
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

" turn off normal arrow keys for navigation
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" display a list of files in the current directory in insert mode
inoremap <C-F> <C-X><C-F>

" turn on Omni completion
filetype plugin on
set ofu=syntaxcomplete#Complete


" ## settings for plugins (start)

" # autoclose
exe join(map(split(glob("~/.vim/plugin-settings/autoclose.vim"), "\n"), '"source " . v:val'), "\n")

" ## autocorrect
source $HOME/.vim/bundle/vim-autocorrect/autocorrect.vim " sourcing the file

" ## colorv
exe join(map(split(glob("~/.vim/plugin-settings/colorv.vim"), "\n"), '"source " . v:val'), "\n")

" ## command-t
exe join(map(split(glob("~/.vim/plugin-settings/command_t.vim"), "\n"), '"source " . v:val'), "\n")

" ## fugitive
exe join(map(split(glob("~/.vim/plugin-settings/fugitive.vim"), "\n"), '"source " . v:val'), "\n")

" ## gist.vim
exe join(map(split(glob("~/.vim/plugin-settings/gist.vim"), "\n"), '"source " . v:val'), "\n")

" ## IndexSearch
exe join(map(split(glob("~/.vim/plugin-settings/index_search.vim"), "\n"), '"source " . v:val'), "\n")

" ## jQuery
exe join(map(split(glob("~/.vim/plugin-settings/jquery.vim"), "\n"), '"source " . v:val'), "\n")

" ## LaTeX-Suite
exe join(map(split(glob("~/.vim/plugin-settings/latex_suite.vim"), "\n"), '"source " . v:val'), "\n")

" ## NERDTree
exe join(map(split(glob("~/.vim/plugin-settings/nerdtree.vim"), "\n"), '"source " . v:val'), "\n")

" ## notes
exe join(map(split(glob("~/.vim/plugin-settings/notes.vim"), "\n"), '"source " . v:val'), "\n")

" ## session
exe join(map(split(glob("~/.vim/plugin-settings/session.vim"), "\n"), '"source " . v:val'), "\n")

" ## snipmate
exe join(map(split(glob("~/.vim/plugin-settings/snipmate.vim"), "\n"), '"source " . v:val'), "\n")

" ## syntastic
exe join(map(split(glob("~/.vim/plugin-settings/syntastic.vim"), "\n"), '"source " . v:val'), "\n")

" ## tagbar
exe join(map(split(glob("~/.vim/plugin-settings/tagbar.vim"), "\n"), '"source " . v:val'), "\n")

" ## yankring
exe join(map(split(glob("~/.vim/plugin-settings/yankring.vim"), "\n"), '"source " . v:val'), "\n")

" ## vim-css-color
exe join(map(split(glob("~/.vim/plugin-settings/vim_css_color.vim"), "\n"), '"source " . v:val'), "\n")

" ## vim-ruby
exe join(map(split(glob("~/.vim/plugin-settings/vim_ruby.vim"), "\n"), '"source " . v:val'), "\n")

" ## vim-shell
exe join(map(split(glob("~/.vim/plugin-settings/vim_shell.vim"), "\n"), '"source " . v:val'), "\n")

" ## vim-NERDTree tabs
exe join(map(split(glob("~/.vim/plugin-settings/nerdtree_tabs.vim"), "\n"), '"source " . v:val'), "\n")

" ## fuzzyfinder
map <leader>f :FufFile **/<CR>

" ## settings for plugins (end)

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/helex/', "~/", "g")
    return curdir
endfunction

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
  au!
  au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Vimscript ruby settings ---------------------- {{{
augroup filetype_ruby
  autocmd!
  " press F1 to compile the current file with ruby
  autocmd FileType ruby map <F1> :!ruby "%:p"<CR>
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
augroup END
" }}}

" ## mappings for ruby (F1 compile current file with ruby, F2 compile current file with RSpec)
autocmd FileType php map <F1> :!php "%:p"<CR>
" ## converting markdown to HTML by pressing ,md
nmap <leader>md :%!$HOME/Dropbox/bin/Markdown.pl --html4tags <cr>


" ## automatically source the vimrc file after saving it changes appear
" without restarting Vim
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif

" ## press SHIFT-q to reformat the selected text
map Q gq

" ## CTRL-q will save the file
nmap <c-q> :w<CR>
imap <c-q> <Esc>:w<CR>a

" ## show invisible symbols for editing
" turn on with ml and off with ,u
nmap <leader>l :set list<CR>
nmap <leader>u :set list!<CR>
set list " List mode: Show tabs as CTRL-I, show end of line with $.
" setting symbols for tabs, trails (whitespaces)
" extends shows when a file name goes out the view (you have to scroll like in NERDTree)
if has('mac')
  set listchars=tab:»\ ,extends:¤,trail:·
else
  set listchars=eol:$,tab:\|\|,extends:>,trail:~
endif

" ## color schemes
colorscheme ir_black " [ir_black, railscasts, badwolf, vividchalk]

" source mappings
exe join(map(split(glob("~/.vim/mappings/*.vim"), "\n"), '"source " . v:val'), "\n")
exe join(map(split(glob("~/.vim/functions/*.vim"), "\n"), '"source " . v:val'), "\n")

" ## function to strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" when file is saved, call the function to remove trailing whitespace
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" ## distinguish between different operation systems and change the text-size
if has('mac')
  " pretty nice font, if working under Mac
  set gfn=Menlo:h14
  " 2. Change the key equivalent to cycle through tabs to CMD-Left/Right: >
  nmap <D-lt> :maca _cycleWindows:<CR>
elseif has('unix')
  " for the ack.vim plugin
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  let g:HAMMER_SILENCE_WARNINGS = 1
"   let g:Hammerquiet = 1
endif

" ## CTRL-SHIFT+arrow nables the mark method for like TextMate
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

" ## custom setting for each file type
if has("autocmd")
  filetype plugin indent on
  augroup filesintendationgroup
      autocmd FileType haml       setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
      autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
      autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab textwidth=500
      autocmd FileType markdown   setlocal ts=2 sts=2 sw=2 expandtab textwidth=100
      autocmd FileType make       setlocal ts=4 sts=4 sw=4 expandtab textwidth=500
      autocmd FileType sass       setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
      autocmd FileType tex        setlocal ts=2 sts=2 sw=2 expandtab textwidth=100
      autocmd FileType txt        setlocal ts=2 sts=2 sw=2 expandtab textwidth=110
      autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
  augroup END
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
endif

" ## comment in visual mode press ,c (for uncomment ,u)
augroup commentgroup
  au FileType haskell,vhdl,ada let b:comment_leader = '-- '
  au FileType vim let b:comment_leader = '" '
  au FileType c,cpp,java,scala,sass,scss let b:comment_leader = '// '
  au FileType apache,sh,make,rb,ruby,php,yaml let b:comment_leader = '# '
  au FileType haml let b:comment_leader = '/ '
  au FileType tex let b:comment_leader = '% '
augroup END

