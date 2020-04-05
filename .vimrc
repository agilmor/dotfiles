""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Readme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"
" Full Operators
" --------------
"
" y                : Yank
" d                : Delete
" x                : cut
" r                : Replace
" c                : Change
" e                : Exchange (eq to quit current exchange)
" q                : Qomment
"
" >                : Align (C-x for generic separator) (EasyAlign)
" < <Left>/<Right> : Indent left / right
"
" Pseudo Operators
" ----------------
"
" ys<obj><brç>     : Add open/close <brç> surrounding <obj>
" ds<brç>          : Delete open/close surrounding <brç>
" cs<brç1><brç2>   : Change open/close surrounding <brç1> by <brç2>
"
" C(u,s,c,m)       : Change-Case style of current word to (U)PPER_STYLE, (s)nake_style, (C)amelStyle, (m)ixedStyle (Abolish)
" d<Space>         : Delete trailing whitespaces on current line or the visual selected lines (:StripWhitespace)
" yp / YP          : cpen Yanked list and paste the selected one
" <p / >P          : Rotate last Pasted
" <y / >Y          : Rotate Yanked list
" ñp / <F2>        : Toggle autoformat of last pasted
" [Vis Sel Col]+   : Increment selected column
" [Vis Sel Col]-   : Decrement selected column
"
" Text Objects
" ------------
"
" av/iv : in/a Variable-Segment based on UPPER_STYLE, snake_style, CamelStyle or mixedStyle
" af/if : in/a Function (doesn't work in functions inside a class?)
" aa/ia : in/a Argument of a function, with or without argument separator (auto-seek and [count]+ai+nN+obj)
" at/it : in/a <Tag>obj</Tag> (auto-seek and [count]+ai+nN+obj)
" a,/i, : in/a elements between , or separators (auto-seek and [count]+ai+nN+obj)
" aq/iq : in/a Qomment segment
" au/iu : in/a URIs as textobj
" an/in : in/a Next serach match (gn) (works as motion in visual mode)
" aN/iN : in/a prev serach match (gN) (works as motion in visual mode)
" al/il : in/a Line, with or without trailing and leading white spaces
" ae/ie : in/a Entire file, with or without trailing and leading empty lines
" ip    : in the last Pasted
"
" Pseudo Text Objects
" -------------------
"
" x                           : single Xaracter
" b<Up/Down>                  : Between two lines (easy motions) (only yank, change and delete)
" b<Left/Right><char1><char2> : Between two chars at any line (easy motions) (only yank, change and delete)
" <Arrow><target char>        : easymotions
" m<char>                     : from current position to Mark<char>
" <S-Arrows>                  : direct visual-block selection
"
" Nav/See (s), Search (ss) and Quickfix (z)
" -----------------------------------------
"
" s<Up>           : See prev jump (<C-o>)
" s<Down>         : See next jump (<C-i>)
" s<Left>         : See prev change (g;)
" s<Right>        : See next change (g,)
" s<S-Up/Left>    : See beging last changed or pasted (`[)
" s<S-Down/Right> : See end    last changed or pasted (`])
"
" ç               : see matching braÇet and others (matchit.zip)
" M<char>         : Mark current position as <char>
" m<char>         : Move to position Marked as <char>
" MM / mm         : quick Mark and see
" dM<char><cr>    : Delete Mark <char>
"
" se              : See Explorer window (NerdTree)
" so              : See Outline (ctag)
" sm              : See Marks
" swm             : See Windom marks
" sc              : See Changes
" sj              : See Jumps
" su              : See Undo-tree
" sy              : See Yanks
" sr              : See Registers (unused because of yanks list / easyclip)
"
" sb              : See Buffers
" sab             : See (and open) All Buffers
" bb              : open last Buffer
"
" sf              : See File under cursor
" svf             : See File under cursor in a Vertical split
" stf             : See File under cursor in a Tab split
"
" svim            : See ~/.vimrc
" sprj            : See $PWD/.vimprj
"
" In general search results go to quickfix:
"
" ss<Left>        : Search symbol occurrences (cscope)
" ss<S-Left>      : Search symbol occurrences (easygrep)
" ss<Right>       : Search symbol definition (cscope)
" ss<S-Right>     : Search symbol declaration (YCM)
" ss<Up>          : Search function callers (cscope)
" ss<S-Up>        : Search functions called (cscope)
" ss<Down>        : Search text occurrences (cscope)
" ss<PageUp>      : Search files including this (cscope)
" ssh             : Search Header
" sst             : Search Test
" ssl             : Search Link (normal vim jump)
"
" zz              : show / hide current quickfix
" z<Up>           : open prev line in the quickfix
" z<Down>         : open next line in the quickfix
" z<PageUp>       : open prev 10 line in the quickfix
" z<PageDown>     : open next 10 line in the quickfix
" z<Left>         : open prev quickfix
" z<Right>        : open next quickfix
" ze              : show error only in quickfix (remove warnings)
"
" Edit, Autocomplete and Snippets (<Insert>)
" ------------------------------------------
"
" In Normal Mode:
"
" a<Arrows>   : add a line above or below, or go to begin and end of line insert mode
" ax<Arrow>   : add a single line up or down, or space before or after cursor
" ax(char)    : add single 'char' on/before cursor
" ;;          : add ending ;
"
" <Insert><Insert> : list and inserts snippet (Ultisnips)
" <Insert>{   : Add pairs {} at the of end of the line above and on the line below
" d<Insert>{  : Delete pairs {} at the of end of the line above and on the line below
"
" TODO: Search/Replace :Replace (grw: Grep and Replace Word (for all PWD, not option for current file only)
"
" In Insert Mode:
"
" <C-v>       : paste (also works on command mode)
" <C-u>       : next key will be inserted as raw (with escape characters)
" <Insert>    : launch/list snippets in insert/normal modes (Ultisnips)
" if<Insert>  : if
" el<Insert>  : else
" ife<Insert> : if/else
" for<Insert> : for
" wh<Insert>  : while
" fun<Insert> : function
" fund<Insert>: function declaration
"
" ñycm / <F4> : toggle autocomplete (SwitchYCM)
"
" Windows (w) and Buffers (b)
" ---------------------------
"
" <S-PageUp>  : Move   Up   to the begin of file
" <S-PageDown>: Move   Down to the end   of file
" <C-PageUp>  : Scroll Up
" <C-PageDown>: Scroll Down
"
" w<Arrow>    : Select neighbour window (also <M-Arrow> if tmux on correct tmux)
" w<PageUp>   : Select prev tab (also <M-PageUp>)
" w<PageDown> : Select next tab (also <M-PageDown>)
" w<S-Left>   : Move current tab to the left
" w<S-Right>  : Move current tab to the right
" w<Tab><Tab> : :vsplit (also w|)
" w<Tab><L/R> : :vsplit current to (existing) Left/Right window
" w<Tab><Up>  : Open new tab with current buffer (keeping prev tab untouched) (also wt)
" w<Tab><Down>: Close tab
" wb          : Break in a new tab
" wq          : Quit current window
"
" ww          : Maximize / Restore window
" w=          : Resize all windows to the same size
" wm          : Mark Window
" ws          : Swap with marked window
" wj          : Join with marked window
" wn          : toggle line Numbers on window
" ñw / <F3>   : toggle window decorations
"
" tt          : Select last Tab
" bb          : Select last Buffer
" b<Up>       : See next Buffer in buffers list
" b<Down>     : See prev Buffer in buffers list
" sb          : See Buffers
" sab         : See (and open) All Buffers
"
" TODO: Folding
"
" Version Control (wd)
" --------------------
"
" wd / wdd    : WimDiff current file in a new tab (:Gdiff)
" wda         : WimDiff All files in the repo in a new vim with a tab per file
" wdu         : WimDff (:diffupdate)
" wds         : git Status in new tab (:Gstatus (D: diff, -: add/reset, U: checkout, cc/ca: commit/amend, r: reload)
" wdc         : git Commit in new tab (:Gstatus and cc)
" wdb         : git Blame in new tab (:Gblame)
" wdp         : git Push (:Gpush)
" wdo         : git One (:Git one)
" wde         : Edit last repo version (:Gedit)
" wd<Up>      : WimDiff prev change
" wd<Down>    : WimDiff next change
" wd<Right>   : Diff get (assuming being in right-pane of vimdiff)
" wd<Right>   : Diff put (assuming being in right-pane of vimdiff)
" dp          : Diff Put
" dg          : Diff Get
" do / dl     : Diff Obtain Line Only
"
" TODO: :Glog
" TODO: :Git rebase
"
" Project
" -------
"
" .vimprj /srpj     : in the root directory of a project to set custom options
" <C-b>             : builds the project async (:Make)
" :OpenSession<tab> : list and open sessions
" vim --servername sessionname : to open a saved session (vim-session)
"
" TODO: Debug
"
" Options/Toggles and <F>Keys
" ----------------------------
"     / ñg      : EasyGrep options
" F1            : paste mode for new pastes  (pastetoggle)
" F2  / ñp      : paste mode for just pasted (EasyClipToggleFormattedPaste)
" F12 / ÑP      : toggle paste autoformat    (g:EasyClipAutoFormat)
" F3  / ñw      : toggle window decorations  (SwitchDecorations)
" F4  / ñycm    : toggle autocomplete        (SwitchYCM)
" F5            : reload file (:e)
" F6            : reload vimrc
" F7 / ñs       : toggle autosave            (AutoSaveToggle)
" F8 / ñ<Space> : toggle whitestaces         (ToggleWhitespace)
" F10/11        : to disable default maps of UltiSnips (ExpandTrigger / ListSnippets)
"
" More
" ----
"
" Mapleader is º
" :PluginInstall to regenerate tags
" <C-s> saves the file
" :W!! sudo write
" <C-k> : normal mode in command line (cedit)
"
" TODO:
" - test https://github.com/Olical/vim-enmasse
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign Details
" -----------------
" - <Enter> to switch right/left/center alignment *before* the operator
" - <Right>/<Left> to add/remove spaces before the delimiter
" - <Down> /<Up>   to remove/add spaces after the delimiter
" - ** to alternate left-right alignment
" - 1,2... or * to specify which delimiters we want to align
" - <C-x> to use regular expression as delimiter instead of single character (<C-x> again to save the align)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                          Merge conflicts
" Config git:
" - git config merge.tool          vimdiff
" - git config merge.conflictstyle diff3
" - git config mergetool.prompt    false
"
" Run git to open vim:
" $ git mergetool [filename]
"
" LOCAL  – this is file from the current branch
" BASE   – common ancestor, how file looked before both changes
" REMOTE – file you are merging into your branch
" MERGED – merge result, this is what gets saved in the repo
"
" In MERGED:
" :diffg RE  " get from REMOTE
" :diffg BA  " get from BASE
" :diffg LO  " get from LOCAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       General options (set)
"
" See SetMainDefaults for more default options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

set nocompatible                   " Use Vim settings, rather than Vi settings (much better!).
                                   " This must be first, because it changes other options as a side effect.

set encoding=utf-8                 " to avoid problems with listchars
set backspace=indent,eol,start     " allow backspacing over everything in insert mode
set history=100                    " keep 100 lines of command line history
set ruler                          " show the cursor position all the time
set showcmd                        " show still incomplete cmdline (eg. commands in visual mode)
set incsearch                      " show first match while typing the pattern
set mouse=a                        " use mouse
set ttymouse=sgr                   " to be able to use mouse on vim borders when vim is run over tmux
set nowrap                         " avoid wrapping
set diffopt+=vertical              " to force vertical difffs by default
set virtualedit=onemore            " really go to EOL (see "Cursor Position" to avoid moving left when leaving insert mode)
set splitright                     " vsplit on right
set splitbelow                     " split below
set autowrite                      " automatically save changes (build without save)
set laststatus=2                   " always see the status bar (see "Coloring" to use the bar to highlight the current mode)
set showtabline=2                  " always see the tab bar (see "Coloring" to use the bar to highlight the current mode)
set colorcolumn=0                  " to see a line to the text limit (see "Coloring", SwitchDecorations) (disabled)
set nocursorline nocursorcolumn    " cursor column and line non visible by default
set autoindent                     " autoindent
set foldmethod=syntax              " use the syntax to decide folding
set nofoldenable                   " disable folding by default (using tagbar is much better)
set pastetoggle=<F1>               " remove all auto* features when pasting from X
set scrolloff=10                   " to scroll before first/last line
set sidescrolloff=0                " to scroll before first/last character in a line (0 to work with exactly 80 cols)
set sidescroll=1                   " to scroll a single character horizontally
set wildmode=longest:list          " use cmdline completion (tab) as a normal shell completion
set complete+=kspell               " to be able to use autocomplete with the spell dictionary, only when set spell is enabled
set autoread                       " file is reloaded if changed in a cmdline (:! whatever), very useful for "wds" and "wdg" commands
set undofile                       " for persistent undo
set ignorecase                     " to search case insensitive
set smartcase                      " to search case insensitive, unless using an upper case
set listchars=tab:>·,eol:·         " special characters (using vim-better-whitespace instead of "trail:·")
set nolist                         " to not visualize special special characters (see 'listchars'), use <F3> to toggle (see SwitchDecorations)
set whichwrap=b,s,<,>,[,]          " to move line up/down with left/right at the begin/end of a line
set nobackup                       " no backup files, we should use git/svn always, and we have the persistent undo
set noswapfile                     " no swap files, we should use git/svn always, and we have the persistent undo
set undodir=~/.vim/tmp/            " location of the undo directory
set completeopt=menuone,longest    " preview discarded, menuone to keep as much as possible menu (to read params)
set clipboard^=unnamedplus         " unamedplus is more keyboard-centric (ctrl-c)... like vim is
                                   " but anyway, the important part is that we should match tmux:
                                   " unnamed     -> xclip -selection primary (conflict ith EasyClip and unnecessary?)
                                   " unnamedplus -> xclip -selection clipboard
set termwinkey=º                   " should be the <Leader> (for term and termdebug)
set timeoutlen=1000 ttimeoutlen=0  " to reduce the return of normal mode faster
set cedit=<C-k>                    " edit mode in cmode, see other <C-k> maps
set nrformats=bin,octal,hex,alpha  " for column incrementing
set wmh=0                          " to fully maximize in height
set wmw=0                          " to fully maximize in width
set cscopetag                      " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set csto=0                         " check cscope for definition of a symbol before checking ctags: set to 1
                                   " if you want the reverse search order.
set cscopequickfix=s-,g-,c-,d-,i-,t-,e- " all cscope results are placed in quickfix

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal " save everything on a session
set grepprg=grep\ -n\ --exclude-dir=.svn\ --exclude=.vimprj.cscope\ $*\ /dev/null    " to exclude svn/git results from search results
" set keywordprg=                    " used by 'K' (man -s),

set statusline=
set statusline+=%y%h%q%w                          " file and buffer type
set statusline+=%m%r                              " status flags
set statusline+=\[%f\:%l\:%c%V\]                  " filename:line:column
set statusline+=\ %{tagbar#currenttag('[%s]','')} " tag/function (tagbar plugin)
set statusline+=%=                                " right align remainder
set statusline+=\[char\=0x%B\]                    " character value
set statusline+=\ \[%p%%\ of\ %L\]                " file position

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  General options (non-set)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

let g:netrw_dirhistmax=0           " to avoid .netrwhist creation
let mapleader='º'                  " maybe, because the remaps, I can just use the default...?
runtime ftplugin/man.vim           " to be able to render man pages
runtime ftplugin/vim.vim           " to use the vim help
packadd termdebug                  " enable TerminalDebug
" source $VIMRUNTIME/menu.vim        " just to have some fancy (useless?) menus with (:emenu<space><tab>)

"let &colorcolumn=join(range(91,999),",") " all the columns from the textwidth are colored as the limiting column (how to use textwidth var?) (see SwitchDecorations)

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins list (vundle)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

filetype off                                 " required by vundle
set rtp+=~/.vim/bundle/Vundle.vim            " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'                " let Vundle manage Vundle, required

" Core features
Plugin 'tpope/vim-dispatch.git'              " background/async builds (how to use it for grep?)
Plugin '907th/vim-auto-save'                 " auto save
Plugin 'tpope/vim-repeat'                    " needed dependency (surround, abolish, and easyclip)
Plugin 'vim-scripts/visualrepeat'            " used by easy-align
Plugin 'inkarkat/vim-ingo-library'           " dependency for visualrepeat (visual block)
Plugin 'agilmor/smarttab.vim'                " tabs for indent and spaces for align (very old, copyindent, forked to avoid conflicts with ycm_key_list_stop_completion)

" Browsing
Plugin 'szw/vim-maximizer'                   " :MaximizerToggle works nice
Plugin 'scrooloose/nerdtree.git'             " file browser (not really useful... ctrlp/unite and wildmode are better?)
Plugin 'majutsushi/tagbar'                   " outline window (uses its own ctag of current file only)
Plugin 'mbbill/undotree'                     " visualization of the undotree as a version control
Plugin 'bufexplorer.zip'                     " visualization of the buffers list
Plugin 'christoomey/vim-tmux-navigator'      " same keys to move between panes on tmux and vim (only on 'local' vim)
Plugin 'kopischke/vim-fetch'                 " to open files with :line:col suffix
" Plugin 'ctrlp.vim'                           " I'm just not using it...?
" Plugin 'derekwyatt/vim-fswitch'              " (not tested, using manual setup with sh+st)

" Version Control and Project Management
Plugin 'vim-scripts/DfrankUtil'              " needed by vimprj
Plugin 'vim-scripts/vimprj'                  " .vimprj directory is source
Plugin 'dkprice/vim-easygrep'                " to search and replace for the whole project (unused...)
Plugin 'romainl/vim-qf'                      " improving quickfix list: toggle, :Keep :Reject
Plugin 'yssl/QFEnter'                        " improving quickfix list: selecting where the results are open
Plugin 'vcscommand.vim'                      " version control git+svn together
Plugin 'mhinz/vim-signify'                   " decorations for git+svn together
Plugin 'xolox/vim-misc'                      " needed by vim-session
Plugin 'xolox/vim-session'                   " save / restore sessions
Plugin 'tpope/vim-fugitive'                  " version control git
Plugin 'vimwiki/vimwiki'                     " vimwiki for markdown and task management directly on vim
" Plugin 'itchyny/calendar.vim'                " calendar and todo list integrated with google
" Plugin 'milkypostman/vim-togglelist'         " toggle quickfix list (see ToggleQuickfixList) (ql with Copen for disapth)
" Plugin 'vitra'                               " trac integration (TTOpen) (removed to avoid loading problems with EMCommand)
" Plugin 'Align'                               " used by vitra
" Plugin 'tracwiki'                            " used by vitra

" Auto completion
Plugin 'Valloric/YouCompleteMe'              " A complete autocomplete plugin (based on compilation databases for clang)
Plugin 'SirVer/ultisnips'                    " to get snippet feature
Plugin 'honza/vim-snippets'                  " standard snippets? (my own on .vim/snippets)
" Plugin 'agilmor/delimitMate'                 " better autoclose of pairs (fork to aviod problems with the non-default cursor position when leaving insert mode)
"                                              " conflicts with YCM and smarttab.vim
Plugin 'matchit.zip'                         " improves surroundings with more than simple characters
                                             " maybe we should use 'runtime macros/matchit.vim' instead of a plugin?
" Plugin 'jiangmiao/auto-pairs'                " (annoying and snippets and surroundings is a better higher level approach) to autoclose pairs
" Plugin 'AutoClose'                           " autoclosing the surroundings (not necessary with code_complete?)
                                               " it closes the preview if line 162 (pclose) is not commented

" Easy motions
Plugin 'easymotion/vim-easymotion'           " best motions ever!
Plugin 'haya14busa/vim-easyoperator-line'    " use 2 easymotions to define a range of lines (y,d,v operators only)
Plugin 'haya14busa/vim-easyoperator-phrase'  " use 2 easymotions to define a range between chars (y,d,v only)
Plugin 'haya14busa/incsearch.vim'            " necessary dependency
Plugin 'haya14busa/incsearch-easymotion.vim' " necessary dependency
Plugin 'haya14busa/incsearch-fuzzy.vim'      " fuzzy motion

" Window decorations
Plugin 'kshenoy/vim-signature'               " to visualize marks (smm)
Plugin 'Yggdroot/indentLine'                 " to visualize indentation lines (with |)
Plugin 'ntpeters/vim-better-whitespace'      " visualize and remove (ToggleWhitespace and StripWhitespace) trailing whitespace
Plugin 'tmux-plugins/vim-tmux-focus-events'  " to be able to have FocusLost and FocusGained in terminal (on tmux with set-g focus-event on) (it fires some errors?)
" Plugin 'chrisbra/Colorizer'                  " to read terminal colors :ColorsHighlight :ColorToggle (never used)
" Plugin 'bling/vim-airline'                   " too fancy for me? I'll give it a second chance in a while...

" Text objects
Plugin 'kana/vim-textobj-user'               " to create custom text objects
Plugin 'kana/vim-textobj-line'               " a (l)ine
Plugin 'kana/vim-textobj-entire'             " a (e)ntire file
Plugin 'kana/vim-textobj-function'           " a (f)unction
Plugin 'kana/vim-textobj-indent'             " a group of similar (i)ndented lines
Plugin 'wellle/targets.vim'                  " arguments objects and a lot of objects!! also auto seek ()(n)ext and (l)ast text objects
Plugin 'Julian/vim-textobj-variable-segment' " snake_case, CamelCase, mixedCase and UPPER_CASE segments (iv/av)
Plugin 'glts/vim-textobj-comment'            " commented text as an object text (ac/ic)
Plugin 'saaguero/vim-textobj-pastedtext'     " last (ip)asted text becomes a text-obj
Plugin 'jceb/vim-textobj-uri'                " (u)RIs as textobj
" Plugin 'deathlyfrantic/vim-textobj-blanklines' " a group of blank lines
" Plugin 'kana/vim-textobj-lastpat'            " the obj that matches (n) and (N) searches (last pattern searched)

" Operators
Plugin 'svermeulen/vim-easyclip'             " much better yank, cut, delete and rotating paste operators
Plugin 'tpope/vim-surround'                  " defines surroundings as text objects (yank surroundings mean 'add' them)
Plugin 'tpope/vim-abolish'                   " edit snake/camel/mixed/upper case control in the iw and with :S
Plugin 'tommcdo/vim-exchange'                " to add the (e)xchange operator
Plugin 'tomtom/tcomment_vim'                 " add the comment action (q) for motions and text objects
Plugin 'junegunn/vim-easy-align'             " adding the align operator (al)
" Plugin 'tpope/vim-commentary'                " I don't like the commenting style for C/C++, and only works for lines

" Extras
" Plugin 'm42e/vim-gcov-marker'                " test coverage
" Plugin 'vim-scripts/gcov.vim'                " test coverage

" File plugins
Plugin 'ekalinin/Dockerfile.vim'             " dockerfile syntax
Plugin 'martinda/Jenkinsfile-vim-syntax'     " jenkinsfile syntax
Plugin 'fedorenchik/qt-support.vim'          " Qt files: qml, qmake/pro, qrc, ui..

call vundle#end()                            " required
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Basic FileType Configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
filetype plugin indent on              " Enable file type detection.
                                       " Use the default filetype settings, so that mail gets 'tw' set to 72,
                                       " 'cindent' is on in C files, etc.
                                       " Also load indent files, to automatically do language-dependent indenting.
"
" Known extensions
"
au BufRead,BufNewFile .vimprj   set filetype=vim
au BufRead,BufNewFile *.build   set filetype=python
au BufRead,BufNewFile *.scons   set filetype=python
au BufRead,BufNewFile *onstruct set filetype=python
au BufRead,BufNewFile *.hpp     set filetype=cpp.doxygen
au BufRead,BufNewFile *.test    set filetype=cpp.doxygen
au BufRead,BufNewFile *.launch  set filetype=xml

"
" FileType Configs
"
au FileType help wincmd L              " forcing help to be vertical splitted
au FileType man  wincmd L              " forcing man to be vertical splitted
au FileType qf   wincmd J              " forcing quickfix to be full width
au FileType vim  set foldmethod=marker " using markers in vim files

"
" Matchit is not working properly on my setup for C/C++?
" (should be in share/.../ftplugin/c.vim)
"
au FileType c,cpp let b:match_words='\%(\<else\s\+\)\@<!\<if\>:\<else\s\+if\>:\<else\%(\s\+if\)\@!\>,\<switch\>:\<case\>:\<default\>'

"
" Reload .vimprj just after writing it
"
autocmd BufWritePost .vimprj source .vimprj

"
" Switching header / source / test
"
au BufRead,BufNewFile,WinEnter *.h    nmap ssh :call SeeHeader( g:source_ext, 'l')<cr>
au BufRead,BufNewFile,WinEnter *.hpp  nmap ssh :call SeeHeader( g:source_ext, 'l')<cr>
au BufRead,BufNewFile,WinEnter *.c    nmap ssh :call SeeHeader( g:header_ext, 'l')<cr>
au BufRead,BufNewFile,WinEnter *.cpp  nmap ssh :call SeeHeader( g:header_ext, 'l')<cr>
au BufRead,BufNewFile,WinEnter *.test nmap ssh :call SeeHeader( g:header_ext, 'l')<cr>

au BufRead,BufNewFile,WinEnter *.h    nmap sst :call SeeHeader( g:test_ext  , 'l')<cr>
au BufRead,BufNewFile,WinEnter *.hpp  nmap sst :call SeeHeader( g:test_ext  , 'l')<cr>
au BufRead,BufNewFile,WinEnter *.c    nmap sst :call SeeHeader( g:test_ext  , 'l')<cr>
au BufRead,BufNewFile,WinEnter *.cpp  nmap sst :call SeeHeader( g:test_ext  , 'l')<cr>
au BufRead,BufNewFile,WinEnter *.test nmap sst :call SeeHeader( g:header_ext, 'l')<cr>

" Fixing integration between YCM and smarttab.vim (align+indent) (unnecessary?)
" let ft_smart_indent = ['c', 'cpp', 'py']
" autocmd FileType *      if index(ft_smart_indent, &ft) < 0 | autocmd BufEnter <buffer> inoremap <CR> <CR>
" autocmd FileType c,cpp  inoremap <buffer> <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-R>=CSmartIndent()<CR>"
" autocmd FileType python inoremap <buffer> <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-R>=PySmartIndent()<CR>"
"
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"
" ntpeters/vim-better-whitespace
"
let g:better_whitespace_enabled = 1
let g:better_whitespace_verbosity=1

"
" tomtom/tcomment_vim
"
let g:tcommentMapLeaderOp1 = 'q'         " use 'q' for the comment action
let g:tcommentOptions      = {'col': 1}  " line comments on the first column

"
" scrooloose/nerdtree.git
"
let g:NERDTreeCaseSensitiveSort   = 0      " don't use case to sort
let g:NERDTreeChDirMode           = 0      " never change CWD
let g:NERDTreeHighlightCursorline = 1      " to highlight the current cursor line
let g:NERDTreeHijackNetrw         = 0      " to avoid conflicts between VCSStatus and NeerdTree
let g:NERDTreeQuitOnOpen          = 1      " quit after open a file
let g:NERDTreeShowHidden          = 1      " show hidden files by default
let g:NERDTreeShowLineNumbers     = 0      " don't show lines
let g:NERDTreeWinPos              = "left" " show files explorer at the left
let g:NERDTreeWinSize             = 31     " window size

"
" kshenoy/vim-signature
"
let g:SignatureEnabledAtStartup = 0  " not showing marks by default

"
" Auto Save (:AutoSaveToggle)
"
nmap <F7> :AutoSaveToggle<CR>
nmap ñs   :AutoSaveToggle<CR>
let g:auto_save                   = 1               " enable AutoSave on Vim startup
let g:auto_save_silent            = 0               " display the auto-save notification
let g:auto_save_write_all_buffers = 1               " write all open buffers as if you would use :wa
let g:auto_save_events            = ["CursorHold"]  " other possible events: InsertLeave, TextChanged, TextChangedI,
                                                    "                        CursorHold, CursorHoldI, CompleteDone
" let g:auto_save_postsave_hook     = 'TagsGenerate'                  " this will run :TagsGenerate after each save
" let g:auto_save_presave_hook      = 'call AbortIfNotGitDirectory()' " this will run AbortIfNotGitDirectory function before each save
"
" Vimwiki
"
" See ~/.vim/after/ftplugin/vimwiki.vim for autocommands to auto pull/push vimwiki pages
"
let g:vimwiki_list = [{'path':      '~/workspace/wiki/',
                     \ 'syntax':    'markdown',
                     \ 'ext':       '.md',
                     \ 'index':     'Home',
                     \ 'auto_toc':  1,
                     \ 'auto_tags': 1}]
let g:vimwiki_list += [{'path':     '$PWD/doc/wiki/',
                      \ 'syntax':   'markdown',
                      \ 'ext':      '.md',
                      \ 'index':    'Home',
                      \ 'auto_toc':  1,
                      \ 'auto_tags': 1}]
let g:vimwiki_global_ext          =  0 " avoid messing with registered wikis
let g:vimwiki_hl_headers          =  1 " highlight headers
let g:vimwiki_hl_cb_checked       =  2 " highlight done/todo items
let g:vimwiki_use_mouse           =  1 " enable mouse control
let g:vimwiki_list_ignore_newline =  0 " multiline list items converted to <br />
let g:vimwiki_text_ignore_newline =  0 " multiline text paragraph converted to <br />
let g:vimwiki_use_calendar        =  0 " disable calendar
let g:vimwiki_url_maxsave         = 30 " size of URL before being reduced
let g:vimwiki_key_mappings        =
                                  \ {
                                  \ 'table_format': 0,
                                  \ 'links'       : 0,
                                  \ }   " to keep <M-Left/Right> and <BS>

"
" YouCompleteMe
"
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " to avoid waring message
let g:ycm_always_populate_location_list                 = 1                        " to always fill up location list with diagnosis
let g:ycm_max_num_candidates                            = 50                       " 0 is no limit, but >100 could be bad for performance?
let g:ycm_min_num_of_chars_for_completion               = 3                        " autocomplete as soon as possible (a big number is a 'disable' of non-semantic completions
let g:ycm_auto_trigger                                  = 1                        " no need to press any key to receive suggestions
let g:ycm_filetype_whitelist                            = { '*': 1 }               " always enabled (using also the default 'ycm_filetype_blacklist' and 'ycm_filetype_specific_completion_to_disable'
let g:ycm_error_symbol                                  = '>'
let g:ycm_warning_symbol                                = '>'
let g:ycm_enable_diagnostic_signs                       = 0                        " not adding gutter by default, but falling back into g:syntastic_enable_signs (no syntastic installed!)
let g:ycm_enable_diagnostic_highlighting                = 1                        " highlight diagnostics (not in gutter)
let g:ycm_echo_current_diagnostic                       = 1                        " show the diagnostic in the menu
let g:ycm_open_loclist_on_ycm_diags                     = 1                        " open locationlist after run :YcmDiags
let g:ycm_complete_in_comments                          = 1                        " yeah! complete also in comments...
let g:ycm_complete_in_strings                           = 1                        " useful for filenames
let g:ycm_use_ultisnips_completer                       = 1                        " ultisnips integration
let g:ycm_goto_buffer_command                           = 'same-buffer'            " open GoTo results in the same buffer ('same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab')
let g:ycm_key_list_select_completion                    = ['<Tab>'  , '<Down>' ]
let g:ycm_key_list_previous_completion                  = ['<S-Tab>', '<Up>'   ]
let g:ycm_key_list_stop_completion                      = ['<C-y>'  , '<Return>' ] " Return used to trigger ultisnips... could be nice to used for both?
let g:ycm_collect_identifiers_from_comments_and_strings = 0                        " too crazy to enable it..
let g:ycm_collect_identifiers_from_tags_files           = 0                        " maybe is useful to work again with ctags?
let g:ycm_add_preview_to_completeopt                    = 0                        " preview is too annoying...
let g:ycm_autoclose_preview_window_after_insertion      = 1                        " ...but at least close it when leaving the insertion mode
let g:ycm_autoclose_preview_window_after_completion     = 0                        " ...but keep it after completion is done?

"
" UltiSnips
"
set rtp^=~/.vim/snippets/                                             " my own snippets should be preened in runtime paths
let g:UltiSnipsSnippetsDir              = '~/.vim/snippets/UltiSnips' " my own snippets
let g:UltiSnipsSnippetDirectories       = ['UltiSnips']               " just the default to be able to use standard packages
let g:UltiSnipsEnableSnipMate           = 1                           " too many unknown snippets? maybe I should give them a try?
let g:UltiSnipsExpandTrigger            = "<Insert>"                  " <Tab> is used by YCM
let g:UltiSnipsListSnippets             = "<F11>"                     " to avoid conflicts with CodeComplete... but <S-Tab> is actually the one I'm using!)
let g:UltiSnipsJumpForwardTrigger       = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger      = "<S-Tab>"
let g:UltiSnipsEditSplit                = "vertical"                  " it should be nice if I can do it as svim or sprj....
let g:UltiSnipsRemoveSelectModeMappings = 1                           " yes, printable characters shouldn't be mapped in select mode...

" TODO: using these two?
let g:rs = '< '                         " arguments separators
let g:re = ' >'

"
" svermeulen/vim-easyclip
"
let g:EasyClipUseGlobalPasteToggle            =   0 " to be able to use my maps (<F1>)
let g:EasyClipUsePasteToggleDefaults          =   0 " to be able to use my maps (,y and -y)
let g:EasyClipUseCutDefaults                  =   0 " to be able to use my maps (x)
let g:EasyClipUseSubstituteDefaults           =   0 " to be able to use my maps (r)
let g:EasyClipUseYankDefaults                 =   1 " default yanks are ok (y)
let g:EasyClipUsePasteDefaults                =   1 " default paste are ok (p)
let g:EasyClipAlwaysMoveCursorToEndOfPaste    =   1 " to move to end of paste (,j to go back)
let g:EasyClipAutoFormat                      =   1 " to enable auto-format (EasyClipToggleFormattedPaste to remove format) (<F12> to toggle this variable)
let g:EasyClipShareYanks                      =   1 " probably not a good option to enable...?
let g:EasyClipCopyExplicitRegisterToDefault   =   1 " paste last yanked even if it was saved to a register
let g:EasyClipPreserveCursorPositionAfterYank =   1 " not move my cursor!
let g:EasyClipShowYanksWidth                  = 120 " we have bigger screens!
let g:EasyOperator_phrase_do_mapping          =   0 " to be able to have fuzzysearch

"
" tommcdo/vim-exchange
"
let g:exchange_no_mappings = 1 " to avoid cx auto mappings
" let g:exchange_indent = '=='   " to exchange indentation?

"
" EasyMotion - Options
"
let g:EasyMotion_enter_jump_first = 1                            " quick selection
let g:EasyMotion_space_jump_first = 0                            " to be able to use space as target key
let g:EasyMotion_use_upper        = 1                            " for better readability
let g:EasyMotion_keys             = 'asdfqwertzxcvbglokijmnp '   " only left hand keys, and last for the right
let g:EasyMotion_startofline      = 0                            " to be able to move to eol and sol
" let g:EasyMotion_smartcase = 1                                 " case insensitive (using normal ignorecase+smartcase)

"
" junegunn/vim-easy-align
"
let g:easy_align_ignore_groups = [] " 'Comments' and 'Strings' can be aligned...

"
" mhinz/vim-signify
"
let g:signify_disable_by_default = 1 " Use :SignifyToggle
let g:signify_sign_change        = 'M'

"
" vim-scripts/vimprj
"
let g:vimprj_changeCurDirIfVimprjFound = 1  " always change the current dir to the dir where the .vimprj file is
let g:header_ext='hpp'                      " each project should define its headers extension (.h or .hpp)
let g:source_ext='cpp'                      " each project should define its source extension (.c or .cpp)
let g:test_ext='test'                       " each project should define its test extension (eg .test)

"
" xolox/vim-session
"
let g:session_directory         = '~/.vim-sessions'                         " to save sessions locally, out of dotfiles
let g:session_lock_enabled      = 0                                         " to avoid annoying locked sessions
let g:session_autoload          = 'prompt'                                  " used when starting vim without anyfile
let g:session_autosave          = 'yes'                                     " is a session is open and vim closes
let g:session_autosave_periodic = 1                                         " save the session every minute (only if one is open, right?)
let g:session_autosave_silent   = 0                                         " should be 1, but I still want to see how the plugin works...
let g:session_command_aliases   = 1                                         " all commands have the alias 'Session*' (useful for <Tab> completion)

"
" dkprice/vim-easygrep
"
let g:EasyGrepMode                 = 0       " 0 all files / 2 - based on files extension
let g:EasyGrepCommand              = 1       " 0 vimgrep / 1 grep
let g:EasyGrepRoot                 = "cwd"   " use current dir... maybe .vimprj or .git could be alternatives?
let g:EasyGrepRecursive            = 1       " recursive files search
let g:EasyGrepIgnoreCase           = 0       " use case
let g:EasyGrepHidden               = 0       " not hidden
let g:EasyGrepFilesToExclude       = "*bkp*" " files to exclude (not working with vimgrep)
let g:EasyGrepAllOptionsInExplorer = 1       " to show all options in the menu
let g:EasyGrepOpenWindowOnMatch    = 1       " automatically opens the quickfix window
let g:EasyGrepWindow               = 0       " Use Quickfix (not Location)
let g:EasyGrepEveryMatch           = 1       " disable multiple matches in same line
let g:EasyGrepJumpToMatch          = 0       " not autojumping
let g:EasyGrepReplaceAllPerFile    = 1       " less global replace
let g:EasyGrepReplaceWindowMode    = 2       " not open tab or splits (autowrite modified file when switching to anothe file)

"
" wellle/targets.vim
"
let g:targets_aiAI = 'aIAi' " to ignore whitespaces with 'i' and add them with 'I'
let g:targets_nl   = 'Ññ'   " to be able to use il/al for 'lines' and in/an/iN/aN for next serch match

"
" saaguero/vim-textobj-pastedtext
"
let g:pastedtext_select_key = 'ip' " using ip instead of gb as last pasted text-obj

"
" glts/vim-textobj-comment
"
let g:textobj_comment_no_default_key_mappings = 1 " textobj-comment: (aq) (iq) (aQ)

"
" christoomey/vim-tmux-navigator
"
let g:tmux_navigator_no_mappings         = 1
let g:tmux_navigator_disable_when_zoomed = 1 " Avoid vim to be unzoom

"
" szw/vim-maximizer
"
let g:maximizer_restore_on_winleave = 1     " to force restore when leaving maximized window (tmux like)
let g:maximizer_set_default_mapping = 0     " to be able to use <F3> for other usage

"
" bufexplorer.zip
"
let g:bufExplorerDefaultHelp              = 1     " Show default help.
let g:bufExplorerDetailedHelp             = 0     " Do not show detailed help.
let g:bufExplorerDisableDefaultKeyMapping = 0     " Do not disable mapping.
let g:bufExplorerFindActive               = 1     " Go to active window.
let g:bufExplorerReverseSort              = 0     " Do not sort in reverse order.
let g:bufExplorerShowDirectories          = 1     " Show directories.
let g:bufExplorerShowNoName               = 0     " Do not 'No Name' buffers.
let g:bufExplorerShowRelativePath         = 1     " Show relative paths.
let g:bufExplorerShowTabBuffer            = 0     " No.
let g:bufExplorerShowUnlisted             = 0     " Do not show unlisted buffers.
let g:bufExplorerSortBy                   = 'mru' " Sort by most recently used ('extension''fullpath''name''number').
let g:bufExplorerVertSize                 = 0     " New split windows size set by Vim.

"
" Yggdroot/indentLine
"
let g:indentLine_enabled              = 0   " indentation lines disabled by default (integrated with Switch decorations)
let g:indentLine_leadingSpaceEnabled  = 0
let g:indentLine_char                 = "|"
let g:indentLine_first_char           = "|"
let g:indentLine_indentLevel          = 10
let g:indentLine_showFirstIndentLevel = 1

"
" majutsushi/tagbar
"
let g:tagbar_autoclose = 1              " autoclose the outline/tagbar when a selection is done

"
" romainl/vim-qf
"
let g:qf_auto_open_quickfix = 1
let g:qf_window_bottom      = 1  " quickfix at the bottom
let g:qf_auto_quit          = 1  " when qf is the last window
let g:qf_save_win_view      = 1  " Save the view of the current window when toggling location/quickfix window.
let g:qf_nowrap             = 1  " no wrapping in qf
let g:qf_auto_resize        = 0  " no resizing less than qf size
let g:qf_mapping_ack_style  = 1  " s - open entry in a new horizontal window
                                 " v - open entry in a new vertical window
                                 " t - open entry in a new tab
                                 " o - open entry and come back
                                 " O - open entry and close the location/quickfix window
                                 " p - open entry in a preview window
" let g:qf_statusline = {}
" let g:qf_statusline.before = '%<\ '
" let g:qf_statusline.after = '\ %f%=%l\/%-6L\ \ \ \ \ '

"
" QFEnter
"
let g:qfenter_keymap = {}
let g:qfenter_keymap.open  = ['<CR>', '<2-LeftMouse>']
let g:qfenter_keymap.vopen = ['<Space>']
let g:qfenter_keymap.hopen = ['<Leader><CR>']
let g:qfenter_keymap.topen = ['<Leader><Tab>']

" OmniCpp Options
" let OmniCpp_NamespaceSearch     = 1
" let OmniCpp_GlobalScopeSearch   = 1
" let OmniCpp_ShowAccess          = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot      = 0 " autocomplete after .
" let OmniCpp_MayCompleteArrow    = 0 " autocomplete after ->
" let OmniCpp_MayCompleteScope    = 0 " autocomplete after ::
" let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

" CodeComplete
" let g:completekey = '<C-q>'             " code_complete: to avoid conflicts with normal omnicomplete with tab
" let g:completekey = '<S-Tab>'           " code_complete: to avoid conflicts with normal omnicomplete with tab

"
" chrisbra/Colorizer
"
" let g:colorizer_disable_bufleave = 1 " keep terminal coloring when leaving the buffer
" let g:colorizer_auto_map         = 0 " no automapping for :ColorToogle and :ColorHighlight

" AutoPairs in insert mode
" let g:AutoPairsShortcutToggle     = '<F4>'  " Enable/Disable AutoPairs
" let g:AutoPairsFlyMode            = 0       " to fly several brackets when pressing the closing bracket
" let g:AutoPairsShortcutBackInsert = '<C-l>' " to disable just pressed fly bracket (alternative: <C-v> in imode forces direct input)
" let g:AutoPairsShortcutJump       = '<C-j>' " jump to next closed pair (pressing closing pair in insert also jumps)
" let g:AutoPairsMapBS              = 1       " map <Backspace> to remove in pairs
" let g:AutoPairsMapCh              = 1       " to remove brackets in pairs
" let g:AutoPairsMapCR              = 1       " to map <Return>
" let g:AutoPairsCenterLine         = 1       " center current line after <Return>
" let g:AutoPairsMapSpace           = 1       " to map <Space>
" let g:AutoPairsMultilineClose     = 1       " to change line after closing bracket

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Normal, Visual and Insert Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
nnoremap a<Up>             O
nnoremap a<Down>           o
nnoremap a<Left>           I
nnoremap a<Right>          A
nnoremap ax                :<c-u>call MyRepeatChar("i")<CR>
nnoremap ax<Return>        :<c-u>call MyRepeatChar("i")<CR><CR>^
nnoremap AX                :<c-u>call MyRepeatChar("a")<CR>
nnoremap AX<Return>        :<c-u>call MyRepeatChar("a")<CR><CR>^
nnoremap ax<Up>            O<Esc>
nnoremap ax<Down>          o<Esc>
nnoremap ax<Left>          i<Space><Esc>
nnoremap ax<Right>         a<Space><Esc>

nnoremap bb                :b#<cr>
nmap     bd                <Plug>Kwbd
nnoremap b<Up>             :bnext<cr>
nnoremap b<Down>           :bprevious<cr>
" map  b                       <Plug>(easymotion-bd-w)
" map  bb                      <Plug>(easymotion-bd-w)
" map  b<Right>                <Plug>(easymotion-w)
" map  b<Left>                 <Plug>(easymotion-b)

nnoremap cx                s
nnoremap Cx                ~
nnoremap CX                ~
nmap     Cs                crs
nmap     Cc                crm
nmap     Cm                crc
nmap     Cu                cru
xnoremap C                 ~

nmap     d<Insert>{        }dd{<Left>d<End>
nmap     d<Space>          :.StripWhitespace<CR>
nmap     db<Up>            <Plug>(easyoperator-line-delete)
nmap     db<Down>          <Plug>(easyoperator-line-delete)
nmap     db<Left>          <Plug>(easyoperator-phrase-delete)
nmap     db<Right>         <Plug>(easyoperator-phrase-delete)
nmap     DD                dd<Up>
nnoremap dM                :delmarks
nnoremap dm                d`
nnoremap dmm               d`M
nnoremap dx                x

nmap     e                 <Plug>(Exchange)
xmap     e                 <Plug>(Exchange)
nmap     ee                <Plug>(ExchangeLine)
nmap     ec                <Plug>(ExchangeClear)
nmap     eq                <Plug>(ExchangeClear)
nmap     ex                v<Plug>(Exchange)
" map  e                      <Plug>(easymotion-bd-e)
" map  ee                     <Plug>(easymotion-bd-e)
" map  e<Right>               <Plug>(easymotion-e)
" map  e<Left>                <Plug>(easymotion-ge)

nnoremap FF                za
nnoremap FO                zR
nnoremap FC                zM
nnoremap Fo                zr
nnoremap Fc                zm

map      gw                <leader>vv
map      g*                <leader>vV
map      gOj             <leader>vV
map      grw               <leader>vr
map      gr*               <leader>vR
map      grOj            <leader>vR
map      gcw               <leader>vr
map      gc*               <leader>vR
map      gcOj            <leader>vR

vmap     gw                <leader>vv
vmap     g*                <leader>vV
vmap     gOj             <leader>vV
vmap     grw               <leader>vr
vmap     gr*               <leader>vR
vmap     grOj            <leader>vR
vmap     gcw               <leader>vr
vmap     gc*               <leader>vR
vmap     gcOj            <leader>vR

nmap     go                :GrepOptions<CR>

nmap     <Insert><Insert>  O<F11>
nmap     <Insert>{         <Up><End><Right>v<End><Down><Left><Insert>sl2mlbr<Insert><Esc>dd

nnoremap  M                m
nnoremap  m                `
onoremap  m                `
vnoremap  m                `
nnoremap  MM               mM
nnoremap  mm               `M
onoremap  mm               `M
vnoremap  mm               `M

map       n                <Plug>(easymotion-next)
map       N                <Plug>(easymotion-prev)

nmap      qq               qc

nmap      r                <Plug>SubstituteOverMotionMap
xmap      r                <Plug>XEasyClipPaste
nmap      rr               <Plug>SubstituteLine
nmap      rx               v<Plug>XEasyClipPaste
nnoremap  R                "
vnoremap  R                "

" normal: disabling s (substitute character) to avoid undesired substitutes (use cx instead)
" visual: surrounding
nnoremap  s                <Esc>
vmap      s                S
nnoremap  sb               :BufExplorer<cr>
nnoremap  sab              :vertical ba<cr>
noremap   sf               gf
nmap      sj               :call GotoJump()<CR>
noremap   sc               :changes<cr>
nnoremap  se               :NERDTreeToggle<cr>
nnoremap  sm               :SignatureListMarks<cr>
nnoremap  so               :TagbarToggle<cr>
noremap   sr               :registers<cr>
nnoremap  su               :UndotreeToggle<cr>
nmap      sy               :Yanks<cr>
noremap   sprj             :let mypwd=$PWD<CR>:wincmd l<CR>:exe ':e '.mypwd.'/.vimprj'<cr>
noremap   svim             :wincmd l<CR>:e ~/.dotfiles/.vimrc<cr>
nnoremap  s<Up>            <C-o>
nnoremap  s<Down>          <C-i>
nnoremap  s<Left>          g;
nnoremap  s<Right>         g,
nnoremap  s<S-Up>          `[
onoremap  s<S-Up>          `[
vnoremap  s<S-Up>          `[
nnoremap  s<S-Down>        `]
onoremap  s<S-Down>        `]
vnoremap  s<S-Down>        `]
nnoremap  s<S-Left>        `[
onoremap  s<S-Left>        `[
vnoremap  s<S-Left>        `[
nnoremap  s<S-Right>       `]
onoremap  s<S-Right>       `]
vnoremap  s<S-Right>       `]
" nmap     swm             :SignatureToggleSigns<cr>

nmap      ss<Left>         :cs find s  <C-R>=expand("<cword>")<CR><CR>
nmap      ss<S-Left>       <leader>vv
nmap      ssr              <leader>vr
nmap      ss<Right>        :cs find g  <C-R>=expand("<cword>")<CR><CR>
nmap      ss<S-Right>      :YcmCompleter GoToDeclaration<cr>
nmap      ss<Up>           :cs find c  <C-R>=expand("<cword>")<CR><CR>
nmap      ss<S-Up>         :cs find d  <C-R>=expand("<cword>")<CR><CR>
nmap      ss<Down>         :cs find t  <C-R>=expand("<cword>")<CR><CR>
nmap      ss<PageUp>       :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap  ss<Return>       gd
nmap      sse              :cs find e  <C-R>=expand("<cword>")<CR><CR>
nmap      ssf              :cs find f  <C-R>=expand("<cfile>")<CR><CR>
noremap   ssl              <C-]>
" nnoremap ss{      [[
" nnoremap ss}      [m

map       t                <Plug>(easymotion-bd-t)
map       T                <Plug>(easymotion-bd-f)
nnoremap  tt               :exe "tabn ".g:lasttab<CR>

nnoremap  U                <C-r>

nmap      v<Up>            V<Plug>(easymotion-k)
nmap      v<Down>          V<Plug>(easymotion-j)
nmap      v<Right>         v<Plug>(easymotion-lineforward)
nmap      v<Left>          v<Plug>(easymotion-linebackward)
nmap      vb<Up>           <Plug>(easyoperator-line-select)
nmap      vb<Down>         <Plug>(easyoperator-line-select)
nmap      vbb              <Plug>(easyoperator-line-select)
nmap      vb<Left>         <Plug>(easyoperator-phrase-select)
nmap      vb<Right>        <Plug>(easyoperator-phrase-select)

" w is the leader key for all windows and tabs (is <C-w>)
nnoremap  w                <C-w>
nnoremap  w<Bar>           :vsplit<cr>
nnoremap  w<Tab>           :vsplit<cr>
nnoremap  w<Tab><Tab>      :vsplit<cr>
nnoremap  w<Tab><Right>    :let splitBuf = bufnr("%")<cr><c-w>l:exe 'hide buf' splitBuf<cr>
nnoremap  w<Tab><Left>     :let splitBuf = bufnr("%")<cr><c-w>h:exe 'hide buf' splitBuf<cr>
nnoremap  w<Tab><Up>       :tab split<cr>
nnoremap  w<Tab><Down>     :tabclose<cr>
nmap      w<Tab><S-Right>  wmw<Right>ws
nmap      w<Tab><S-Left>   wmw<Left>ws
nmap      w<Tab><S-Up>     wmw<Up>ws
nmap      w<Tab><S-Down>   wmw<Down>ws
nnoremap  wn               :call NumberToggle()<cr>
nnoremap  ww               :MaximizerToggle!<CR>
vnoremap  ww               :MaximizerToggle!<CR>gv
noremap   wt               :tab split<cr>
nnoremap  wb               <C-w>T
vnoremap  wb               <C-w>Tgv
nmap      wm               :call MarkWindowSwap()<CR>
nmap      ws               :call DoWindowSwap()<CR>
nmap      wj               :call DoWindowJoin()<CR>
nnoremap  w<C-Right>       :vertical resize +20<cr>
nnoremap  w<C-Left>        :vertical resize -20<cr>
nnoremap  w<C-Up>          :resize          +10<cr>
nnoremap  w<C-Down>        :resize          -10<cr>
nmap      w<S-Right>       wmw<Right>ws
nmap      w<S-Left>        wmw<Left>ws
nmap      w<S-Up>          wmw<Up>ws
nmap      w<S-Down>        wmw<Down>ws
nnoremap  w<PageDown>      :tabnext<cr>
nnoremap  w<PageUp>        :tabprevious<cr>
" nnoremap w<s-right>       :+tabmove<cr>
" nnoremap w<s-left>        :-tabmove<cr>

nnoremap  wd               :tabnew %<CR>:Gdiff<cr><C-w><Right>]c
nnoremap  wdd              :tabnew %<CR>:Gdiff<cr><C-w><Right>]c
nnoremap  wda              :! vim -p $(git diff --name-only) -c "tabdo Gdiff" -c "tabdo wincmd h"<cr>
nnoremap  wdq              <C-w><Right>:bd<cr>:wq<cr>
nmap      wds              :tabnew %<CR>:Gstatus<cr>
nmap      wdc              :tabnew %<CR>:Gstatus<cr>cc
nmap      wdb              :tabnew %<CR>:Gblame<cr>
nmap      wdp              :Gpush<cr>
nmap      wde              :Gedit<cr>
nmap      wdu              :diffupdate<cr>
nmap      wdo              :Git log --oneline --decorate --graph<cr>
nnoremap  wd<Up>           [c
nnoremap  wd<Down>         ]c
nnoremap  wd<Left>         :diffput<cr>
nnoremap  wd<Right>        :diffget<cr>
nnoremap  wd<S-Right>      V:diffget<cr>
" nnoremap  do               V:diffget<cr>
" nnoremap  dl               V:diffget<cr>
" nnoremap  dg               :diffget<cr>
" nnoremap  wgd              :! vim -p $(git diff --name-only) -c "tabdo Gdiff" -c "tabdo wincmd h"<cr>
" nnoremap  wsd              :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>

nmap      x                <Plug>MoveMotionPlug
xmap      x                <Plug>MoveMotionXPlug
nmap      xx               <Plug>MoveMotionLinePlug

nmap      yb<Up>           <Plug>(easyoperator-line-yank)
nmap      yb<Down>         <Plug>(easyoperator-line-yank)
nmap      ybb              <Plug>(easyoperator-line-yank)
nmap      yb<Left>         <Plug>(easyoperator-phrase-yank)
nmap      yb<Right>        <Plug>(easyoperator-phrase-yank)
nmap      yp               :IPaste<cr>
nmap      YP               :IPasteBefore<cr>
nnoremap  yx               vy
nmap      ysx              vS

nmap      z<Up>            <Plug>(qf_qf_previous)
nnoremap  z<PageUp>        :10cprev<cr>
nmap      z<Down>          <Plug>(qf_qf_next)
nnoremap  z<PageDown>      :10cnext<cr>
nnoremap  z<Left>          :colder<cr>
nnoremap  z<Right>         :cnewer<cr>
nmap      zz               <Plug>(qf_qf_toggle)
nnoremap  ze               :call setqflist(filter(getqflist(), 'v:val.type != "W"'), ' ')<cr>

nmap      <p               <Plug>EasyClipSwapPasteForward
nmap      >p               <Plug>EasyClipSwapPasteBackwards
nmap      >P               <Plug>EasyClipSwapPasteBackwards

nmap      <y               <Plug>EasyClipRotateYanksForward
nmap      >y               <Plug>EasyClipRotateYanksBackward
nmap      >Y               <Plug>EasyClipRotateYanksBackward

" I never know if I've to press shift in the spanish keyboard to get < or >...
" ...so replacing < (no shift) + Left/Right to the right < and > operators
" and also the << and >> + Left and Right!
nnoremap  <<Right>         >
nnoremap  <<Left>          <
vnoremap  <<Right>         >gv
vnoremap  <<Left>          <gv

nnoremap  <<<Right>        >>
nnoremap  <<Right><Right>  >>
nnoremap  <<<Left>         <<
nnoremap  <<Left><Left>    <<

xmap      >>               <Plug>(EasyAlign)
nmap      >>               <Plug>(EasyAlign)
xmap      >                <Plug>(LiveEasyAlign)
nmap      >                <Plug>(LiveEasyAlign)

nmap      <F2>             <Plug>EasyClipToggleFormattedPaste<cr>
nmap      ñp               <Plug>EasyClipToggleFormattedPaste<cr>
nmap      <F12>            :call ToggleAutoFormat()<CR>
nmap      ÑP               :call ToggleAutoFormat()<CR>
noremap   <F3>             :call SwitchDecorations()<cr>
noremap   ñw               :call SwitchDecorations()<cr>
noremap   <F4>             :call SwitchYCM()<cr>
noremap   ñycm             :call SwitchYCM()<cr>
noremap   <F5>             :e<cr>
noremap   <F6>             :source ~/.vimrc<cr>
nmap      ñg               :GrepOptions<CR>
nmap      ñgi              <Leader>vyi

"shift+arrow selection
nmap      <S-Up>           <C-v><Up>
nmap      <S-Down>         <C-v><Down>
nmap      <S-Left>         <C-v><Left>
nmap      <S-Right>        <C-v><Right>
nmap      <S-Home>         <C-v><Home>
nmap      <S-End>          <C-v><End>
noremap   <S-PageUp>       gg
noremap   <S-PageDown>     G
" nmap      <S-PageUp>       <C-v><PageUp>
" nmap      <S-PageDown>     <C-v><PageDown>

vmap      <S-Up>           <Up>
vmap      <S-Down>         <Down>
vmap      <S-Left>         <Left>
vmap      <S-Right>        <Right>
vmap      <S-Home>         <Home>
vmap      <S-End>          <End>

imap      <S-Up>           <Esc><C-v><Up>
imap      <S-Down>         <Esc><C-v><Down>
imap      <S-Left>         <Esc><C-v><Left>
imap      <S-Right>        <Esc><C-v><Right>
imap      <S-Home>         <Esc><C-v><Home>
imap      <S-End>          <Esc><C-v><End>

" scroll in normal mode
noremap   <C-Up>           <C-y>
noremap   <C-Down>         <C-e>
nnoremap  <C-PageUp>       10<C-y>
nnoremap  <C-PageDown>     10<C-e>

"ctrl+shift+arrow selection
nmap      <C-S-Up>         <C-v><C-Up>
nmap      <C-S-Down>       <C-v><C-Down>
nmap      <C-S-Left>       <C-v><C-Left>
nmap      <C-S-Right>      <C-v><C-Right>

vmap      <C-S-Up>         <C-Up>
vmap      <C-S-Down>       <C-Down>
vmap      <C-S-Left>       <C-Left>
vmap      <C-S-Right>      <C-Right>

imap      <C-S-Up>         <Esc><C-v><C-Up>
imap      <C-S-Down>       <Esc><C-v><C-Down>
imap      <C-S-Left>       <Esc><C-v><C-Left>
imap      <C-S-Right>      <Esc><C-v><C-Right>

" basic keys to start insert mode
nmap      <Backspace>      i<Backspace>
nmap      <Delete>         i<Delete>
nmap      <Space>          i<Space>
vmap      <Backspace>      <Delete>i
vmap      <Delete>         <Delete>i
vmap      <Space>          <Delete><Space>

" Classic <C-*> shortcuts (build, save and paste)
nnoremap  <C-b>                 :Make<cr>
inoremap  <C-b>            <Esc>:Make<cr>
vnoremap  <C-b>            <Esc>:Make<cr>
nmap      <C-s>                 :w<CR>
imap      <C-s>            <Esc>:w<CR>
imap      <C-v>            <Plug>EasyClipInsertModePaste
cmap      <C-v>            <Plug>EasyClipCommandModePaste

" use easy motion for searching too
map       /                <Plug>(easymotion-sn)
map       Oo             <Plug>(easymotion-sn)
map       --               <Plug>(easymotion-sn)
nmap      *                viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-next)
nmap      Oj             viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-next)

" Incement/Decrement columns
vmap      +                g<C-a>
vmap      -                g<C-x>

" move between brackets
nmap      ç                %
nnoremap  (                :call JumpBracket('(', 'h')<CR>
nnoremap  {                :call JumpBracket('{', 'h')<CR>
nnoremap  [                :call JumpBracket('[', 'h')<CR>
nnoremap  )                :call JumpBracket(')', 'l')<CR>
nnoremap  }                :call JumpBracket('}', 'l')<CR>
nnoremap  ]                :call JumpBracket(']', 'l')<CR>
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Special x and o Mappings (text objects)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
xmap      aq               <Plug>(textobj-comment-a)
omap      aq               <Plug>(textobj-comment-a)
xmap      iq               <Plug>(textobj-comment-i)
omap      iq               <Plug>(textobj-comment-i)
xmap      aQ               <Plug>(textobj-comment-big-a)
omap      aQ               <Plug>(textobj-comment-big-a)

xnoremap  an               gn
onoremap  an               gn
xnoremap  in               gn
onoremap  in               gn
xnoremap  aN               gN
onoremap  aN               gN
xnoremap  iN               gN
onoremap  iN               gN

" easymotion also as text object for arrows
omap      <Right>          <Plug>(easymotion-lineforward)
omap      <Left>           <Plug>(easymotion-linebackward)
omap      <Up>             <Plug>(easymotion-k)
omap      <Down>           <Plug>(easymotion-j)

onoremap  ge               :<c-u><c-r>=MyCustomGE()<cr><cr>
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Mappings for Terminal and Debug
"
" <Leader>t                     : Open a terminal (also in visual mode to run the selected text as a command)
" <Leader><Leader>              : Enter to Terminal-Normal mode
" <Leader><Arrows> o <M-Arrows> : Leave the terminal and move to other windows
"
" :Termdebug command [pid]      : Start debug
" (gdb) quit                    : Quit debug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
nnoremap  <Leader>t        :terminal ++noclose<cr>
vnoremap  <Leader>t        :terminal ++noclose<cr>
tnoremap  <Leader><Leader> <Leader>N

nnoremap  <Leader><Del>    :Clear<cr>
nnoremap  <Leader><Left>   :Break<cr>
nnoremap  <Leader><Right>  :Step<cr>
nnoremap  <Leader><Down>   :Over<cr>
nnoremap  <Leader><Up>     :Finish<cr>
nnoremap  <Leader><CR>     :Continue<cr>
nnoremap  <Leader><End>    :Continue<cr>
nnoremap  <Leader><Home>   :Stop<cr>
nnoremap  <Leader><BS>     :Stop<cr>
nnoremap  <Leader><Space>  :Eval<cr>
vnoremap  <Leader><Space>  :Eval<cr>
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Special / equivalent maps for vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
au FileType vimwiki nmap <silent><buffer> ss<Up>    :VimwikiBacklinks<CR>
au FileType vimwiki vmap <silent><buffer> ss<Up>    :VimwikiBacklinks<CR>
au FileType vimwiki nmap <silent><buffer> ss<Right> <Plug>VimwikiFollowLink
au FileType vimwiki vmap <silent><buffer> ss<Right> <Plug>VimwikiNormalizeLinkVisualCR
au FileType vimwiki nmap <silent><buffer> ss<Left>  yiw:VimwikiSearch /<C-v>/<CR>
au FileType vimwiki vmap <silent><buffer> ss<Left>  y:VimwikiSearch /<C-v>/<CR>
au FileType vimwiki nmap <silent><buffer> s<Up>     <Plug>VimwikiGoBackLink
au FileType vimwiki vmap <silent><buffer> s<Up>     <Plug>VimwikiGoBackLink
au FileType vimwiki nmap <silent><buffer> <C-Space> <Plug>VimwikiToggleListItem
au FileType vimwiki vmap <silent><buffer> <C-Space> <Plug>VimwikiToggleListItem
au FileType vimwiki nmap <silent><buffer> <Tab>     <Plug>VimwikiIncreaseLvlWholeItem
au FileType vimwiki vmap <silent><buffer> <Tab>     <Plug>VimwikiIncreaseLvlWholeItem
au FileType vimwiki nmap <silent><buffer> <S-Tab>   <Plug>VimwikiDecreaseLvlWholeItem
au FileType vimwiki vmap <silent><buffer> <S-Tab>   <Plug>VimwikiDecreaseLvlWholeItem
au FileType vimwiki nmap <silent><buffer> --        :VimwikiChangeSymbolTo -<CR>
au FileType vimwiki vmap <silent><buffer> --        :VimwikiChangeSymbolTo -<CR>
au FileType vimwiki nmap <silent><buffer> -3        :VimwikiChangeSymbolTo #<CR>
au FileType vimwiki vmap <silent><buffer> -3        :VimwikiChangeSymbolTo #<CR>
au FileType vimwiki nmap <silent><buffer> -1        :VimwikiChangeSymbolTo 1.<CR>
au FileType vimwiki vmap <silent><buffer> -1        :VimwikiChangeSymbolTo 1.<CR>
au FileType vimwiki nmap <silent><buffer> -a        :VimwikiChangeSymbolTo a)<CR>
au FileType vimwiki vmap <silent><buffer> -a        :VimwikiChangeSymbolTo a)<CR>
au FileType vimwiki nmap <silent><buffer> -A        :VimwikiChangeSymbolTo A)<CR>
au FileType vimwiki vmap <silent><buffer> -A        :VimwikiChangeSymbolTo A)<CR>
au FileType vimwiki nmap <silent><buffer> h         <Plug>VimwikiAddHeaderLevel
au FileType vimwiki vmap <silent><buffer> h         <Plug>VimwikiAddHeaderLevel
au FileType vimwiki nmap <silent><buffer> H         <Plug>VimwikiRemoveHeaderLevel
au FileType vimwiki vmap <silent><buffer> H         <Plug>VimwikiRemoveHeaderLevel
au FileType vimwiki nmap <silent><buffer> <Insert>l :VimwikiGenerateLinks<cr>
au FileType vimwiki vmap <silent><buffer> <Insert>l :VimwikiGenerateLinks<cr>

au FileType vimwiki nmap <silent><buffer> <C-b>     :VimwikiCheckLinks<cr>
au FileType vimwiki imap <silent><buffer> <CR>      <esc>:VimwikiReturn 3 5<cr>
au FileType vimwiki imap <silent><buffer> ç<CR>     <esc>:VimwikiReturn 4 2<cr>
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Handy Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" to add missing ; at the end
nnoremap  ;;              A;<Esc>^

" recover a just closed window (like a web browser)
nmap      <C-S-t>         :vs<bar>:b#<CR>

" sudo write
cmap      W!!             w !sudo tee % >/dev/null

" Avoid typos
map       q:              :q
map       Q               <nop>

" The insertion of raw key moved to <C-u>
inoremap  <C-u>           <C-v>

" <C-k> is cedit (edit mode in commands), ñ to toggle
inoremap  <C-k>           <C-o>
nnoremap  <C-k>           q:
noremap   ñ:              q:
cnoremap  ñ               <C-k>

" <M-Arrows> are tmux keys passed to vim, send them back when needed
nnoremap <silent> <M-Left>     :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down>     :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up>       :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right>    :TmuxNavigateRight<cr>
inoremap <silent> <M-Left>     <c-o>:TmuxNavigateLeft<cr>
inoremap <silent> <M-Down>     <c-o>:TmuxNavigateDown<cr>
inoremap <silent> <M-Up>       <c-o>:TmuxNavigateUp<cr>
inoremap <silent> <M-Right>    <c-o>:TmuxNavigateRight<cr>
tmap     <silent> <M-Left>     <Leader>:TmuxNavigateLeft<cr>
tmap     <silent> <M-Down>     <Leader>:TmuxNavigateDown<cr>
tmap     <silent> <M-Up>       <Leader>:TmuxNavigateUp<cr>
tmap     <silent> <M-Right>    <Leader>:TmuxNavigateRight<cr>
nnoremap          <M-PageDown> :tabnext<cr>
nnoremap          <M-PageUp>   :tabprevious<cr>
" }}}
" {{{
" Deprecated keys
"
" nmap     +        viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-prev)<Plug>(easymotion-prev)
" nmap     Ok     viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-prev)<Plug>(easymotion-prev)
" map      <expr> - incsearch#go(<SID>config_easyfuzzymotion())
" map      _        <Plug>(easymotion-sn)
" nmap       <F8>          :ToggleWhitespace<CR>
" nmap       ñ<Space>      :ToggleWhitespace<CR>
" TODO add more mapping for GoTo functions!
" nmap <Leader><Leader> :YcmCompleter FixIt<cr>

" nnoremap <C-d>      :Dispatch!<cr>
" inoremap <C-d> <Esc>:Dispatch!<cr>
" vnoremap <C-d> <Esc>:Dispatch!<cr>

" Pairs navigation in normal mode
" nnoremap s( [(
" nnoremap s{ [{
" " nnoremap [ [[
" nnoremap s) ])
" nnoremap s} ]}
" " nnoremap ] ]]
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Handy Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"
" Not moving cursor when leaving insert mode
"
let CursorColumnI = 0
au InsertEnter  * let CursorColumnI = col('.')
au CursorMovedI * let CursorColumnI = col('.')
au InsertLeave  * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

"
" To be able to paste on easymotion command with <C-v>
" See imap and cmap for <C-v>
"
au VimEnter,BufEnter * :EMCommandLineNoreMap <C-v> <C-r>0

"
" To use dd to remove entries in th qf
"
au FileType qf   map <buffer> dd :RemoveQFItem<cr>
" let ftToIgnore = ['qf']
" autocmd FileType * if index(ftToIgnore, &ft) < 0 | map <buffer> z<Del> <Plug>(qf_qf_switch):RemoveQFItem<cr>


"
" Autoreload files
"
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost                        * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"
" To restore the previous 'view' of the buffer (keep cursor position)
"
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

"
" Code to be able to go to (see tt)
"
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

" leave insert mode after a couple of secconds
" au CursorHoldI * stopinsert
" au InsertEnter * let updaterestore=&updatetime | set updatetime=3000
" au InsertLeave * let &updatetime=updaterestore

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              Coloring
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
if &t_Co > 2 || has("gui_running")
    " Also switch on highlighting the last used search pattern.
    syntax on

    set term=xterm-256color                                 " must be also set in tmux!
    set t_ut=''                                             " avoid conflict in with BackgroundColorErase tmux (does it force bg color?)
    set fillchars+=vert:\                                   " avoid the | character on vertical split bars
    colorscheme ron                                         " other alternatives I liked: koehler delek
    highlight clear Search                                  " Search: matched results
    highlight Search term=reverse cterm=reverse gui=reverse
    highlight clear IncSearch                               " IncSearch: while typing a search pattern
    highlight IncSearch term=bold ctermbg=4 guibg=slateblue
    highlight clear Todo                                    " Todo: Special hi
    highlight Todo term=reverse cterm=reverse gui=reverse
    highlight clear Pmenu                                   " Pmenu: used by Neocomplete/YouCompleteMe
"    highlight Pmenu term=reverse cterm=reverse gui=reverse
    highlight Pmenu term=bold    ctermfg=LightGreen ctermbg=DarkGrey
    highlight clear MatchParen                              " MatchParen: surroundings
    highlight MatchParen term=underline cterm=underline gui=underline

"    highlight CursorColumn
    highlight clear CursorLine
    highlight CursorLine term=reverse ctermbg=242 guibg=Grey40
    highlight clear ColorColumn
    highlight ColorColumn term=reverse ctermbg=242 guibg=Grey40

    highlight clear YcmErrorSection                         " YcmErrorSection: errors detected by YCM
    highlight YcmErrorSection term=reverse cterm=reverse gui=reverse
    highlight clear YcmWarningSection                       " YcmWarningSection: warnings detected by YCM
    highlight YcmWarningSection term=reverse cterm=reverse gui=reverse

    " Diff windows (from http://stackoverflow.com/a/17183382/5349914)
    highlight DiffAdd         cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete      cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange      cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText        cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
    highlight ExtraWhitespace ctermbg=Red

    " Status: White for non-focus, Green for focus, Red when inserting.
    au InsertEnter * hi StatusLine  term=reverse ctermbg=Black ctermfg=Red
    au InsertEnter * hi VertSplit   term=reverse ctermbg=Black ctermfg=Red
    au InsertEnter * hi TabLineFill term=reverse ctermbg=Black ctermfg=Red
    au InsertEnter * hi TabLineSel  term=reverse ctermbg=Black ctermfg=Red
    au InsertEnter * hi Title       term=reverse ctermbg=Black ctermfg=Red
    au InsertLeave * hi StatusLine  term=reverse ctermbg=Black ctermfg=Green
    au InsertLeave * hi VertSplit   term=reverse ctermbg=Black ctermfg=White
    au InsertLeave * hi TabLineFill term=reverse ctermbg=Black ctermfg=White
    au InsertLeave * hi TabLineSel  term=reverse ctermbg=Black ctermfg=White
    au InsertLeave * hi Title       term=reverse ctermbg=Black ctermfg=White

    au BufEnter    * hi StatusLine  term=reverse ctermbg=Black ctermfg=Green
    au BufLeave    * hi StatusLine  term=reverse ctermbg=Black ctermfg=White
    au FocusGained * hi StatusLine  term=reverse ctermbg=Black ctermfg=Green
    au FocusLost   * hi StatusLine  term=reverse ctermbg=Black ctermfg=White

    hi link EasyMotionTarget        EasyMotionIncSearchDefault
"    hi link EasyMotionShade         Comment
"    hi link EasyMotionTarget2First  MatchParen
"    hi link EasyMotionTarget2Second MatchParen
    hi link EasyMotionMoveHL        Search

    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgrey
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"
" ge
"
fu! MyCustomGE()
    return "\<c-u>:norm! ".v:count1."ge "
endfu

"
" EasyMotion - AutoCommands
"
function! JumpBracket(key,dir)
    if a:dir == 'l'
        if search(a:key, 'W')
            " force break the '.' when jump to different line
            return "\<Right>"
        endif
    else
        if search(a:key, 'bW')
            " force break the '.' when jump to different line
            return "\<Left>"
        endif
    endif
endfunc

function! ToggleAutoFormat()
    if g:EasyClipAutoFormat == '1'
        let g:EasyClipAutoFormat = '0'
    else
        let g:EasyClipAutoFormat = '1'
    endif
endfunction

"
" EasyMotion - Functions
"
" The following functions are/should be part of the plugin?
" They are used in the fuzzy search map (_)
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

"
" Function to define the default options
" Called when leaving a project, and now
"
function! <SID>SetMainDefaults()
    "
    " Some format options are filetype based
    "
    " formatoptions help:
    "
    " c: autowrap comments on textwidth
    " r: autoinsert comment leader on <Enter>
    " o: autoinsert comment leader on <o> or <O>
    " q: allow formatting of comments with gq
    " l: long lines are not broken in insert mode
    " n: recognize numbered lists
    " t: autowrap using textwidth
    " j: remove comment leader when joining comment lines
    "
    au FileType gitcommit
        \ set textwidth=76 |
        \ set formatoptions +=t

    au FileType c,cpp
        \ set textwidth=100      |
        \ set formatoptions=ronj

    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab               " using spaces instead of tabs
    set smarttab                " doesn't do anything...?
    set cinoptions=             " no cinoptions
    set copyindent              " keep indent of previous line

    set path=.,/usr/local/include,/usr/include
    compiler gcc

    if exists("b:dispatch")
        unlet b:dispatch
    endif
    if exists("g:myvimprj")
        autocmd! myvimprj FileWritePost *
        autocmd! myvimprj BufWritePost *
        unlet g:myvimprj
    endif

    cscope kill -1
endfunction

call <SID>SetMainDefaults()
call vimprj#init()

function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
    call <SID>SetMainDefaults()
endfunction

function! MyRepeatChar(mode)
    let schar = nr2char(getchar())
    let chars = repeat(schar, v:count1)
    exe "normal ".a:mode.chars
    if a:mode == 'i'
        call cursor(0, col('.')+1)
    endif
endfunction

function! MarkWindowSwap()
    " marked window number
    let g:markedTabNum = tabpagenr()
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
endfunction

function! DoWindowSwap()
    let curTabNum = tabpagenr()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe "tabnext " . g:markedTabNum
    exe g:markedWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' curBufNum

    " Switch focus to current window
    exe "tabnext " . curTabNum
    exe curWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedBufNum
endfunction

function! DoWindowJoin()
    let curTabNum = tabpagenr()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe "tabnext " . g:markedTabNum
    exe g:markedWinNum . "wincmd w"

    " Close the marked window
    close!

    " Switch focus to current window
    exe "tabnext " . curTabNum
    exe curWinNum . "wincmd w"

    " Create a new split and load the marked window
    exe "vsplit"
    exe 'hide buf' g:markedBufNum
endfunction

"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function! s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" Function to toggle autocomplete for YCM
function! SwitchYCM()
    if g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger=0
    else
        let g:ycm_auto_trigger=1
    endif
endfunction

" Function to enable disable decorations (they should be disabled by default)
let g:mydecoration=0
function! SwitchDecorations()
    if g:mydecoration == 1
        set nolist
        set colorcolumn=0
        exe "IndentLinesDisable"
        exe "LeadingSpaceDisable"
        exe "DisableWhitespace"
"         let g:better_whitespace_enabled = 0
        exe "SignifyToggleHighlight"
        exe "SignifyDisable"
        let g:ycm_enable_diagnostic_signs = 0 " it doesn't update?
        let g:mydecoration=0
    else
        set list
        set colorcolumn=+1
        exe "IndentLinesEnable"
        exe "LeadingSpaceEnable"
"         let g:better_whitespace_enabled = 1
        exe "EnableWhitespace"
        exe "SignifyToggleHighlight"
        exe "SignifyEnable"
        let g:ycm_enable_diagnostic_signs = 1 " it doesn't update?
        let g:mydecoration=1
    endif
endfunction

" window numbers
function! NumberToggle()
    if(&relativenumber == 0)
        if(&number == 0)
            set number
            set relativenumber
        else
            set nonumber
        endif
    else
        set norelativenumber
    endif
endfunc

" jumps
function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal! " . j . "\<c-i>"
        else
            execute "normal! " . j . "\<c-o>"
        endif
    endif
endfunction

function! SeeHeader( ext, dir )
"     let var = input( "ext: ".a:ext." dir: ".a:dir )
    let curr_buf = bufnr("%")
    if a:dir != 'none'
"         exe "wincmd ".a:dir
        exe "buf " . curr_buf
    endif
    exe "find %:t:r.".a:ext
endfunction
" }}}

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Extras
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" passwds
" if filereadable(glob('~/.vimrc.pass'))
"     source ~/.vimrc.pass
"else
"    echo "Not loading vimrc.pass"
" endif
" }}}
