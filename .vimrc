" Preamble -----------------------------------------------------------------------{{{

set nocompatible " be iMproved
filetype off     " required! for vundle
filetype plugin on " Enable file type-specific plugins

runtime macros/matchit.vim " enable better matching for % command

set runtimepath+=~/.vim/bundle/vundle/ " add vundle to runtime path
call vundle#rc()

let g:vundle_default_git_proto = 'git' " use git protocol instead of https when building absolute repo URIs

" My bundles
Bundle 'Raimondi/delimitMate'
Bundle 'benmills/vimux'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'jpalardy/vim-slime'
Bundle 'kien/ctrlp.vim'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'matthias-guenther/tocdown'
Bundle 'matthias-guenther/tocdown'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'othree/html5-syntax.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/JSON.vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/vis'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-shell'
Bundle 'zaiste/tmux.vim'

" --------------------------------------------------------------------------------}}}
" File type detection ------------------------------------------------------------{{{

syntax on          " Enable syntax highlighting
filetype on        " Enable file type detection
filetype indent on " Enable file type-specific indenting

" turn on Omni completion - this option file specific completion {{{

set omnifunc=syntaxcomplete#Complete

" }}}
" -------------------------------------------------------------------------------}}}
" General settings ---------------------------------------------------------------{{{

set encoding=utf-8                          " terminal encoding
set modeline                                " don't look how many lines are the beginning and the end of the file
set autoindent                              " Copy indent from current line when starting a new line
set autoread                                " automatically read a file that has changed on disk
set showmode                                " show the current modal mode
set showcmd                                 " show (partial) command in the last line of the screen
set noerrorbells                            " don't make noise on error messages
set ttyfast                                 " fast terminal connection, more characters will be sent to the screen
set ruler                                   " show the line and column number of the cursor position
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set nonumber                                " don't display line numbers (takes too much space)
set numberwidth=2                           " using only 2 column for numberline presentation
set ch=1                                    " height of the command line at the bottom
set history=5000                            " keep 5000 lines of command line history
set shell=/bin/bash                         " defines the Shell I want to use for external commands
set lazyredraw                              " don't update the display while executing macros, registers, etc.
set showbreak=↪                             " show the symbol for wrapped lines
set splitbelow                              " splitting a window will put the new window below the current one
set splitright                              " splitting a window will put the new window right the current one
set fileencodings=utf-8,default,latin1      " the order of file encodings to try.
set lines=999 columns=999                   " full screen when starting Gvim (it's a hack)
set nomodeline                              " frequent security hole
set nowarn                                  " do not warn, when shell command update the file you edit in Vim
set shell=/bin/bash                         " always use sh when executing commands with :!
set synmaxcol=200                           " better scrolling for long lines
set spelllang=en_us                         " default language for spell checker
set spellfile=$HOME/.vim/spell/en.utf-8.add " spell file for additional correct English words
set spellsuggest=best,10                    " only display the 10 best suggestions
set suffixesadd=.rb                         " are used when searching for files to open with 'gf'
set title                                   " show title in console title
set viminfo='1000000,f1                     " save marks for 1 million files ('1000000), save global marks
set ignorecase                              " ignore upper- and lowercase letters during a search
set hlsearch                                " highlight all finding for a search
set incsearch                               " do incremental searching, that means search after the string when you begin writing
set shortmess+=I                            " don't show startup message when opening Vim without a file
set noautochdir                             " don't change the current working directory when opening a new file

let &scrolloff=999-&scrolloff " current view is always centered

" when switching between windows, automatically write all buffers
autocmd FocusLost * :silent! wall

" Resize splits when the window is resized
autocmd VimResized * :wincmd =
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif " move tabs to the end for new, single buffers (exclude splits)

set fillchars="" " get rid of silly characters in separators in the CMD

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions+=$

" Cursorline {{{

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" }}}
" Trailing whitespace {{{

" only shown when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
" Wildmenu completion {{{

if has("wildmenu")
    set wildmenu " enable a navigable list of suggestions
    set wildmode=full " zsh full-match, starts over with first match after last match reached
    set wildignore+=.git,.hg,.svn                 " version control
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png " images
    set wildignore+=*.aux,*.out,*.toc             " LaTeX intermediate files
    set wildignore+=.DS_Store                     " fucking Mac-Stuff
    set wildignore+=*~,*.swp,*.tmp                " tmp and backup files
endif

" }}}
" Insert mode completion {{{

set completeopt=longest,menuone,preview

" }}}
" backups {{{

set backupext=~                 " backup file extension
set backupdir=$HOME/.vim/backup " backups are written to $HOME/.backup
set backupcopy=yes              " keep attributes of the original file
set backup                      " save files after close
set writebackup                 " make a backup of the original file when writing
set noswapfile                  " don't save swap files
set updatetime=2000             " Write swap files after 2 seconds of inactivity.

" }}}
" Line return {{{

" When editing a file, always jump to the last known cursor position.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Tabs, wraps, spacing {{{

set tabstop=2      " how many columns a tab counts
set shiftwidth=2   " how many columns text is indented with the indent operations (<< and >>)
set softtabstop=2  " how many columns
set expandtab      " hitting tab in insert mode will produce number in spaces instead of tabs
set wrap           " when lines are longer the the width of the window they will wrapped
set textwidth=100  " maximum of text that is being inserted

" }}}
" Leader {{{

let mapleader = "," " change the leader to be a comma vs. backslash if not given

" }}}
" Color scheme {{{

set background=dark
colorscheme badwolf

" }}}
" Statusline {{{

" always display the statusline
set laststatus=2

"Set the status line the way i like it
set statusline=%f                            " name of the current file
set statusline+=\ %y                         " Filetype of the file
set statusline+=\ %m                         " show, if the file was modified
set statusline+=\ %r%{fugitive#statusline()} " show the current git branch
set statusline+=\ Line:%l/%L[%p%%]           " l .. show the current line, L .. total line number, p ..  percentage
set statusline+=\ Col:%v                     " show the current column
set statusline+=\ Buf:#%n                    " show the current buffer

" }}}
" List char {{{

set list " enable list mode - symbols for tabs, trails, ...
" extends shows when a file name goes out the view (you have to scroll like in NERDTree)
" trails - whitespaces
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·

" }}}
" --------------------------------------------------------------------------------}}}
" Convenience mappings -----------------------------------------------------------{{{

" Instead of using help F1 will toogle between fullscreen
if has('mac')
  noremap  <F12> :set invfullscreen<CR>
  inoremap  <F12> :set invfullscreen<CR>
elseif has('unix')
  noremap  <F12> :Fullscreen<CR>
  inoremap <F12> <ESC>:Fullscreen<CR>
endif

" reformat current paragraph
noremap Q gq

" Tab/Shift+Tab indent/unindent the highlighted block
" <Tab> perform > and <Shift-Tab> performs <
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" emulate ESC with jk
inoremap jk <ESC>
cnoremap jk <C-C>

" Quickediting
nnoremap <silent>,ev :split $MYVIMRC<CR>
nnoremap <leader>ba :split ~/.vim/archive.md<CR>
nnoremap <leader>bm :split ~/.vim/mappings.md<CR>
nnoremap <leader>br :split ~/.vim/README.md<CR>

" comment in visual mode press ,c (for uncomment ,u)
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

" Press \cd to change the pwd to the current file you are in
nnoremap \cd :lcd %:h<CR>

" Use hjkl in wrapped-lined files
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


" needed by for files with wrapped-lines
function! ScreenMovement(movement)
  if &wrap
    return "g" . a:movement
  else
    return a:movement
  endif
endfunction

" Insert date in the form yyyy-mm-dd at the end of a line
function! InsertSpaceDate()
  let @x = " "
  let @x = @x . strftime("%Y-%m-%d")
  normal! "xp
endfunction

" Press F5 to insert the current date at the end of the line
noremap <silent> <F5> $:call InsertSpaceDate()<CR>

" Spellchecker: press ,s to toogle between spellchecker
nnoremap <silent> <leader>s :set spell!<CR>

" Whitespace jumping
nnoremap <leader>f f<space>
nnoremap <leader>F F<space>

" Folding Toggling with <space>
nnoremap <space> za

" Char replacement (good for creating vocabularly)
noremap <leader>bldots :%s/=/\& \\ldots \&/g<CR> " replace = through & \ldots &
noremap <leader>bendbackslashes :%s/$/ \\\\/<CR> " will add \\ to the end of each line
noremap <leader>_ :%s/_//g<CR>                   " delete all _
noremap <leader>rt :%s/\\t/  /g<CR>

" Buffer changing
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Copy/paste clipboard {{{

if has('unix')
  vnoremap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
  noremap <leader><C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
elseif has('mac')
  vnoremap <C-c> y:call system("pbcopy", getreg("\""))<CR>
  noremap <leader><C-v> :call setreg("\"",system("pbpaste"))<CR>p
endif

" }}}

" Insert file names of the current directory when you are in insert mode
inoremap <C-f> <C-x><C-f>

" ---------------------------------------------------------------------------------}}}
" Command line mappings ----------------------------------------------------------{{{
" go to the beginning of the line
cnoremap <C-a> <Home>
" go to the end of the command line
cnoremap <C-e> <End>
" go one word to the left
cnoremap <C-b> <Left>
" go one word to the right
cnoremap <C-f> <Right>
" move back in the command history
cnoremap <C-p> <Up>
" move forward in the command history
cnoremap <C-n> <Down>

" --------------------------------------------------------------------------------}}}
" Timeout setting ----------------------------------------------------------------{{{

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
" "," key and the "d" key. If the "d" key isn't pressed before the
" timeout expires, one of two things happens: The "," command is executed
" if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" --------------------------------------------------------------------------------}}}
" C-Up/C-Down to move selected lines up and down ---------------------------------{{{

" Based on http://vim.wikia.com/wiki/VimTip646
" Define maps for Normal and Visual modes, then re-use
" them for Insert and Select.
"

" Normal mode
nnoremap <silent> <C-Up> :move -2<CR>
nnoremap <silent> <C-Down> :move +<CR>

" Visual mode (only; does not include Select mode)
xnoremap <silent> <C-Up> :move '<-2<CR>gv
xnoremap <silent> <C-Down> :move '>+<CR>gv

" Insert mode
imap <silent> <C-Up> <C-O><C-Up>
imap <silent> <C-Down> <C-O><C-Down>

" Select mode
smap <silent> <C-Up> <C-G><C-Up><C-G>
smap <silent> <C-Down> <C-G><C-Down><C-G>

" --------------------------------------------------------------------------------}}}
" Keyword completion -------------------------------------------------------------{{{

set complete=. " the current buffer set complete+=w " scan the buffer from other windows
set complete+=b " scan other loaded buffers that are in the buffer list
set complete+=t " tag completion
set showfulltag " when completing by tag, show the whole tag, not just the function name

" --------------------------------------------------------------------------------}}}
" Filetype detecion --------------------------------------------------------------{{{

au! BufRead,BufNewFile *.erb set filetype=eruby
au! BufRead,BufNewFile *.haml set filetype=haml
au! BufRead,BufNewFile *.js set filetype=javascript
au! BufRead,BufNewFile *.json set filetype=json
au! BufRead,BufNewFile *.rb set filetype=ruby
au! BufRead,BufNewFile *.sass,*.scss set filetype=scss
au! BufRead,BufNewFile *.tex,*.latex set filetype=tex
au! BufRead,BufNewFile *.textile set filetype=textile
au! BufRead,BufNewFile *.tmux.conf set filetype=tmux
au! BufRead,BufNewFile *.yml set filetype=yaml

" --------------------------------------------------------------------------------}}}
" Filetype specific --------------------------------------------------------------{{{
" Bash {{{

augroup filetype_bash
  au!
  au FileType sh setlocal foldmethod=marker
  au FileType sh setlocal ts=2 sts=2 sw=2 expandtab textwidth=5000
augroup END

" }}}
" Conf {{{

augroup filetype_conf
  au!
  au FileType conf setlocal foldmethod=marker
  au FileType conf let b:comment_leader = '# '
augroup END

" }}}
" Eruby {{{

augroup filetype_eruby
  au!
  au FileType eruby setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
augroup END

" }}}
" Haml {{{

augroup filetype_haml
  au!
  au FileType haml setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
  au FileType haml let b:comment_leader = '// '
augroup END

" }}}
" Html {{{

augroup filetype_html
  au!
  au FileType html setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
augroup END

" }}}
" Javascript {{{

augroup filetype_javascript
  au!
  au FileType javascript setlocal ts=4 sts=4 sw=4 expandtab textwidth=500
  au FileType javascript let b:comment_leader = '/ '
augroup END

" }}}
" Markdown {{{

augroup filetype_markdown
  au!
  au BufNewFile,BufRead *.m*down setlocal filetype=markdown
  au FileType markdown setlocal ts=2 sts=2 sw=2 expandtab textwidth=130
augroup END

" }}}
" Notes {{{
augroup filetype_notes
  au!
  au FileType notes setlocal ts=2 sts=2 sw=2 expandtab textwidth=5000
augroup END

" }}}
" Quickfix {{{

augroup filetype_quickfix
  au!
  au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0

" }}}
" Ruby {{{

augroup filetype_ruby
  au!
  au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab textwidth=500 foldmethod=syntax

  " Press F11 to compile the actual file
  au FileType ruby map <F11> :!ruby "%:p"<CR>
  au FileType ruby let b:comment_leader = '# '
augroup END

" }}}
" Sass {{{

augroup filetype_sass
  au!
  au FileType sass setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
  au FileType sass let b:comment_leader = '// '
augroup END

" }}}
" Shell {{{

augroup filetype_sh
  au!
  au FileType sh setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
  au FileType sh let b:comment_leader = '# '
augroup END

" }}}
" Text {{{

augroup filetype_txt
  au!
  au FileType text setlocal foldmethod=marker
  au FileType text setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
augroup END

" }}}
" Tex {{{

augroup filetype_tex
  au!
  autocmd FileType tex setlocal ts=2 sts=2 sw=2 expandtab textwidth=100
  au FileType tex let b:comment_leader = '% '
augroup END

" }}}
" Tmux {{{

augroup filetype_tmux
  au!
  au FileType tmux setlocal foldmethod=marker ts=2 sts=2 sw=2 expandtab textwidth=500
  au FileType tmux let b:comment_leader = '# '
augroup END

" }}}
" Vim {{{

augroup filetype_vim
  au!
  au FileType vim setlocal foldmethod=marker
  au Filetype help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
  au FileType vim let b:comment_leader = '" '
augroup END

" }}}
" Yaml {{{

augroup filetype_yaml
  au!
  au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab textwidth=500
  au FileType yaml let b:comment_leader = '# '
augroup END

" }}}
" Zsh {{{

augroup filetype_zsh
  au!
  au FileType zsh setlocal foldmethod=marker
  au FileType zsh let b:comment_leader = '# '
augroup END

" }}}
" --------------------------------------------------------------------------------}}}
" Plugin settings ----------------------------------------------------------------{{{
" CtrlP {{{

let g:ctrlp_working_path_mode     = 2 " the nearest ancestor containing .git, .hg, .svn for searching
let g:ctrlp_extensions            = ['tag'] " specifiy extensions for further search paths
let g:ctrlp_match_window_bottom   = 1 " show the match window at the bottom
let g:ctrlp_match_window_reversed = 0 " show matching files from top to bottom
let g:ctrlp_working_path_mode     = 'a' " local start directory is where the .git, .hg, .svn, .bzr is
let g:ctrlp_max_height            = 10 " Specify the height of the match window
let g:ctrlp_max_files             = 0 " scan an unlimited amount of files
let g:ctrlp_dotfiles              = 0 " Don't search for dotfiles and dotdirectories
let g:ctrlp_custom_ignore         = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|_site$\|assets$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.DS$\|\.bak$\|\.orig$\|\.swp$\|\.jpg$\|\.JPG$\|\.png$\|\.PNG$'
  \ }

" }}}
" Dbext {{{

let g:dbext_default_profile_sqlite0='type=SQLITE:SQLITE_bin=/usr/bin/sqlite3:dbname=$HOME/Downloads/sqlite.db'

" }}}
" Delimate {{{
"
au FileType vim let b:loaded_delimitMate = 0 "no autoclose brackets for Vim files

" }}}
" Easytags {{{

set tags=./tags;                  " name of the tags files which is relative to the project
let g:easytags_dynamic_files = 1  " write first existing seen tag file by Vim (refer to echo &tags)
let g:easytags_on_cursorhold = 0  " disable automatic update
let g:easytags_auto_update = 0    " don't update the text, when stop working
let g:easytags_auto_highlight = 0 " don't highlight the text, when stop working
let g:easytags_autorecurse = 1    " updating files below all directories of the current one
let g:easytags_resolve_links = 1  " resolve symbolic links with pathnames
let g:easytags_python_enabled = 1 " use Python script for dynamic syntax highlighting (is faster)

" }}}
" Gundo {{{

let g:gundo_width           = 45 " horizontal width
let g:gundo_preview_height  = 15 " vertical height
let g:gundo_help            = 1  " show the help in gundo window
let g:gundo_close_on_revert = 0  " don't close gundo after a version is selected
let g:gundo_right           = 0  " display gundo on the left site

nnoremap <F3> :GundoToggle<CR>

" }}}
" Hammer {{{

noremap <leader>m :Hammer<CR>

" }}}
" Index Search {{{

let g:indexed_search_colors    = 1 " turn of colors for messages
let g:indexed_search_shortmess = 1 " shorter messages

" }}}
" Notes {{{

let g:notes_directory = '~/Dropbox/notes'            " path of main directory
let g:notes_shadowdir = '~/.vim/shadow'              " path for templates creating new notes
let g:notes_suffix = '.txt'                          " default file ending of note files
let g:notes_smart_quotes = 0                         " Don't use special symbols

nnoremap <F7> :Note! collect<CR>

" }}}
" Netrw {{{

" :Explore will look like NERDTree
let g:netrw_liststyle=3

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Toggle Vexplore with F2
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

nnoremap <F2> :call ToggleVExplorer()<CR>

" }}}
" Snipmate {{{

let g:snippets_dir = '~/.vim/snippets' " setting of the snipmate directory

" }}}
" Supertab {{{

let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabLongestHighlight      = 1

" }}}
" Syntastic {{{

let g:syntastic_enable_signs  = 1 " setting signs for errors (arrows)
let g:syntastic_auto_loc_list = 1 " open/close toc of errors
let g:syntastic_auto_jump     = 0 " don't jump to the first error
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['haml', 'javascript', 'ruby', 'css', 'sass'], 'passive_filetypes': ['eruby', 'html', 'php'] }
let tex_no_error = 1                            " underscores are not displayed as syntax errors
let loaded_tex_syntax_checker = 0             " turn of lacheck of the syntastic plugin
let g:syntastic_stl_format = '[%E{%e Errors} %B{, }%W{%w Warnings}]'
set statusline+=%#warningmsg#                 " show warning messages
set statusline+=%{SyntasticStatuslineFlag()}  " show message in quick fix
let g:syntastic_ruby_exec = '/home/helex/.rbenv/shims/ruby' " take the current ruby version specified by rbenv

" }}}
" Tabularize {{{

" tabular: press ,b= to order indenting = separated terms with different spaces
" example:
"   ab = cd
"   abc = def
" mark the lines in visual mode, then press ,b=
" result:
"  ab  = cd
"  abc = def
" works for all specified chars below
nnoremap <leader>b= :Tabularize /=<CR>
vnoremap <leader>b= :Tabularize /=<CR>
nnoremap <leader>b: :Tabularize /:<CR>
vnoremap <leader>b: :Tabularize /:<CR>
nnoremap <leader>b/ :Tabularize /\/\/<CR>
vnoremap <leader>b/ :Tabularize /\/\/<CR>
nnoremap <leader>b" :Tabularize /"<CR>
vnoremap <leader>b" :Tabularize /"<CR>
nnoremap <leader>bt :Tabularize /& \\ldots &<CR>
vnoremap <leader>bt :Tabularize /& \\ldots &<CR>

" }}}
" Tocdown {{{

nnoremap <F4> :TocdownToggle<CR>

" }}}
" Vim-ruby {{{

let ruby_operators    = 1 " create colors for ruby operators
let ruby_space_errors = 1 " mark whitespace characters

" }}}
" Vim-shell {{{

let g:shell_verify_urls = 1 " handle special URLs with dot at the end

" }}}
" Vim-slime {{{

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" }}}
" Yankring {{{

let g:yankring_max_history = 1000 " save the last 1000 elements
let g:yankring_max_element_length = 0 " no limit for storing entries
let g:yankring_history_dir = '$HOME/.vim' " put the yankring history file in the vim-directory
let g:yankring_history_file = 'yankring_file' " name of the yankring file
let g:yankring_replace_n_pkey = 0 " the <C-p> is used by the ctrlp-plugin

noremap <leader>y :YRShow<CR>

" }}}
" --------------------------------------------------------------------------------}}}
" Text objects -------------------------------------------------------------------{{{

onoremap ir i[
onoremap ar i[
vnoremap ir i[
vnoremap ir i[

" --------------------------------------------------------------------------------}}}
" Removal of trailing whitespace -------------------------------------------------{{{

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

" --------------------------------------------------------------------------------}}}
" Converting markdown to HTML ----------------------------------------------------{{{

noremap <leader>md :%!$HOME/Dropbox/bin/Markdown.pl --html4tags <Cr>

" --------------------------------------------------------------------------------}}}
" Environments (Mac/Unix/GUI/Console ---------------------------------------------{{{

if has ('gui_running')
  " remove all the UI crap
  set guioptions-=T " remove tool bar
  set guioptions-=b " remove horizontal scroll bar
  set guioptions-=l " remove left-hand scrollbar
  set guioptions-=L " remove left-hand if there is a vertical present
  set guioptions-=r " remove right-hand scrollbar
  set guioptions-=R " remove right-hand if there is a vertical present

  " Spellchecker
  highlight Spellbad term=underline gui=undercurl guisp=Orange

  " Different cursors for different modes
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  set guicursor+=i-ci:ver20-iCursor

  " Mac {{{
  if has('mac')
    set gfn=Menlo:h15
    " set guifont=Menlo\ Regular:h12

    " Fullscreen means FULL screen
    set fuoptions=maxhorz,maxvert

    " Cycle between different open MacVim windows
    noremap <D-lt> :maca _cycleWindows:<CR>

    " Nabble marks with TextMate style
    let macvim_hig_shift_movement = 1
  " }}}
  " Unix {{{
  elseif has('unix')
    " for the ack.vim plugin
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"

    set guifont=Inconsolata\ 11
  endif
  " }}}
else
  " Console Vim
endif

" --------------------------------------------------------------------------------}}}

