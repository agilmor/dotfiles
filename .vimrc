""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Summary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"
" Full Operators
" --------------
"
" y                : yank
" d                : delete
" x                : cut
" r                : replace
" c                : change
" e                : exchange
" q                : comment
"
" > / >>           : align (C-x for generic separator)
" < <Left>/<Right> : indent left / right
"
" (y,d,c)s         : surrounding operators
"
"
" Semi Operators
" --------------
"
" g(c)w / g(c)* : grep (and change) current word / only current word
" C(u,s,c,m)    : case naming convention UPPER_STYLE, snake_style, CamelStyle, mixedStyle
" d<Space>      : remove trailing whitespaces on current line or the visual selected lines (:StripWhitespace)
" z<Arrows>     : in Visual moves/drags the selection following the arrows (dragvisuals)
"
" Text Objects
" ------------
"
" av/iv : a segment of a Variable name in UPPER_STYLE, snake_style, CamelStyle or mixedStyle
" af/if : a Function (doesn't work in functions inside a class?)
" aa/ia : funtion Arguments, with or without argument separator (auto-seek and [count]+ai+nN+obj)
" at/it : object in a <Tag>obj</Tag> (auto-seek and [count]+ai+nN+obj)
" a,/i, : elements in a list, with or separators (auto-seek and [count]+ai+nN+obj)
" aq/iq : a comment segment
" au/iu : URIs as textobj
" al/il : whole Line, with or without trailing and leading white spaces
" ae/ie : Entire file, with or without trailing and leading empty lines
" ip    : Last pasted as text-obj
"
" Semi Text Objects
" -----------------
"
" x                          : single letter/character
" b<Up/Down>                 : between two lines (easy motions) (only yank, change and delete)
" b<Left/Right>(char1 char2) : between two chars at any line (easy motions) (only yank, change and delete)
"
" Switching Modes
" ---------------
"
" ax(char/arros) : add single 'char' before cursor, add a single line up or down, or add space before or after current pos
" a<Arrows>      : go insert mode in line above, below, and begin and end of the line
"
" <S-Arrows>     : block selection
" zz             : expand selection
" z<Up/Down>     : line selection
" z<left/Right>  : normal selection
"
" Navigation
" ----------
"
" , : previous
" - : next
" ; : special previous
" _ : special next
"
" Project
" -------
"
" vim --servername sessionname : to open a saved session (vim-session)
"
" Browsing (s)
" ------------
"
" - sh           : see header
" - st           : see test
" - sq           : see quickfixlist
" - sqq          : see quickfixlist
" - sq<Up>       : see prev line in the quickfixlist
" - sq<Down>     : see next line in the quickfixlist
" - sq<PageUp>   : see prev quickfixlist
" - sq<PageDown> : see next quickfixlist
" -  z<Up>       : see prev line in the quickfixlist
" -  z<Down>     : see next line in the quickfixlist
" -  z<PageUp>   : see prev quickfixlist
" -  z<PageDown> : see next quickfixlist
" - sqe          : see quickfixlist filtering only errors
"
" - se           : see exploring window (NerdTree)
" - so           : see outline (ctag)
" - sr           : see registers
" - sm           : see marks
" - sc           : see changes
" - sj           : see jumps
" - sy           : see yanks
" - su           : see undo-tree
"
" - s<Up>        : see prev jump
" - s<Down>      : see next jump
" - s<Left>      : see prev change
" - s<Right>     : see next change
"
" - sb           : see buffers (list)
" - sab          : see buffers (open all)
"
" - sf           : see file
" - svf          : see file (vertical split)
" - stf          : see file (tab split)
"
" - swm          : see windom marks
"
" - sss          : lists symbol occurrences to quicklist (cscope)
" - ss<Left>     : lists symbol occurrences to quicklist (cscope)
" - ssg          : goes to symbol definition (global) (cscope)
" - ss<Right>    : goes to symbol definition (global) (cscope)
" - ssc          : lists who calls this function to quicklist (cscope)
" - ss<Up>       : lists who calls this function to quicklist (cscope)
" - ssd          : lists function called by me to quicklist (cscope)
" - ss<Down>     : lists function called by me to quicklist (cscope)
" - ssi          : lists files including this to quicklist (cscope)
" - ssh          : lists files including this to quicklist (cscope)
" - ss<PageUp>   : lists files including this to quicklist (cscope)
" - sst          : lists text occurrences to quicklist (cscope)
" - ss<PageDown> : lists text occurrences to quicklist (cscope)
" - ssf          : lists file occurrences to quicklist (cscope)
"
" - s<RePag> : go to begin of file
" - s<AvPag> : go to the end of file
"
" - svim : see ~/.vimrc
" - sprj : see $PWD/.vimprj
"
" - FO : fold open all
" - FC : fold close all
" - FF : fold toogle current
"
" <F> Keys
" --------
" - F1            : paste mode for new pastes  (pastetoggle)
" - F2  / ñp      : paste mode for just pasted (EasyClipToggleFormattedPaste)
" - F12 / ÑP      : toggle paste autoformat    (g:EasyClipAutoFormat)
" - F3  / ñd      : window decorations         (SwitchDecorations)
" - F4            : toggle autopairs           (AutoPairsToggle)
" - F5            : refresh file
" - F6            : refresh vimrc
" - F7 / ñs       : toggle autosave            (AutoSaveToggle)
" - F8 / ñ<Space> : toggle whitestaces         (ToggleWhitespace)
" - F10/11        : to disable default maps of UltiSnips (ExpandTrigger / ListSnippets)
"
" More
" ----
"
" - [Visual Select Column]+ : Increment selected column
" - [Visual Select Column]- : Decrement selected column
"
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       General options (set)
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
set textwidth=120                  " desired width limit
set colorcolumn=0                  " to see a line to the text limit (see "Coloring", SwitchDecorations) (disabled)
set nocursorline nocursorcolumn    " cursor column and line non visible by default
set autoindent                     " autoindent
set foldmethod=syntax              " use the syntax to decide folding
set nofoldenable                   " disable folding by default (using tagbar is much better)
set pastetoggle=<F1>               " remove all auto* features when pasting from X
set scrolloff=10                   " to scroll before first/last line
set sidescrolloff=10               " to scroll before first/last character in a line
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
" set keywordprg=                    " used by 'K' (man -s),
set grepprg=grep\ -n\ --exclude-dir=.svn\ $*\ /dev/null " to exclude svn/git results from search results

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  General options (non-set)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

let mapleader='º'                  " maybe, because the remaps, I can just use the default...?
runtime ftplugin/man.vim           " to be able to render man pages
runtime ftplugin/vim.vim           " to use the vim help
source $VIMRUNTIME/menu.vim        " just to have some fancy (useless?) menus with (:emenu<space><tab>)

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
Plugin 'tpope/vim-repeat'                    " needed dependency (surround, abolish, and easy-clip)
Plugin 'vim-scripts/visualrepeat'            " used by easy-align
Plugin '907th/vim-auto-save'                 " auto save
" Plugin 'AsyncCommand'                        " background/async builds (needs vim --servername)

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
Plugin 'dkprice/vim-easygrep'                " to search and replace for the whole project
" Plugin 'milkypostman/vim-togglelist'         " toggle quickfix list (see ToggleQuickfixList) (ql with Copen for disapth)
Plugin 'romainl/vim-qf'                      " improving quickfix list: toggle, :Keep :Reject
Plugin 'yssl/QFEnter'                        " improving quickfix list: selecting where the results are open
Plugin 'vcscommand.vim'                      " version control git+svn together
Plugin 'mhinz/vim-signify'                   " decorations for git+svn together
Plugin 'xolox/vim-misc'                      " needed by vim-session
Plugin 'xolox/vim-session'                   " save / restore sessions
Plugin 'tpope/vim-fugitive'                  " version control git

Plugin 'Shougo/vimproc.vim'                  " dependency for vim-vebugger
Plugin 'idanarye/vim-vebugger'               " GDB integration

" Plugin 'vim-scripts/indexer.tar.gz'          " to generate ctags (needs servername -> done manually with .vimprj + vim-dispatch)
" Plugin 'vim-scripts/ConflictMotions'         " never tried! maybe its a good option!
" Plugin 'vitra'                               " trac integration (TTOpen) (removed to avoid loading problems with EMCommand)
" Plugin 'Align'                               " used by vitra
" Plugin 'tracwiki'                            " used by vitra

" Auto completion
Plugin 'Valloric/YouCompleteMe'              " A complete autocomplete plugin (based on compilation databases for clang)
Plugin 'SirVer/ultisnips'                    " to get snippet feature
Plugin 'honza/vim-snippets'                  " standard snippets? (my own on .vim/snippets)
Plugin 'agilmor/delimitMate'                 " better autoclose of pairs (fork to aviod problems with the non-default cursor position when leaving insert mode)
Plugin 'matchit.zip'                         " improves surroundings with more than simple characters
                                             " maybe we should use 'runtime macros/matchit.vim' instead of a plugin?
" Plugin 'jiangmiao/auto-pairs'                " (annoying and snippets and surroundings is a better higher level approach) to autoclose pairs
" Plugin 'vim-scripts/OmniCppComplete'         " (moving to YCM) simpler, it uses ctags (not works in auto mode for unscoped vars)
" Plugin 'mbbill/code_complete'                " (moving to YCM) for arguments and snippets (CodeComplete)
" Plugin 'Shougo/neocomplete.vim'              " not semantics -> use clan_complete (see fix in advanced setup)
" Plugin 'Rip-Rip/clang_complete'              " (moving to YCM) only works for C/C++... but works great!
" Plugin 'vim-scripts/AutoComplPop'            " (moving to YCM) used for unescoped vars (works in automode forunscoped
" Plugin 'ervandew/supertab'                   " (moving to YCM) to complex, homade function is simpler and enough
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
Plugin 'Yggdroot/indentLine'                 " to visualize indentation lines (wl)
Plugin 'ntpeters/vim-better-whitespace'      " visualize and remove (ToggleWhitespace and StripWhitespace) trailing whitespace
Plugin 'tmux-plugins/vim-tmux-focus-events'  " to be able to have FocusLost and FocusGained in terminal (on tmux with set-g focus-event on) (it fires some errors?)
" Plugin 'blueyed/vim-diminactive'             " to dim the inactive window
" Plugin 'nathanaelkane/vim-indent-guides'     " visualize vertical indent lines (Yggdroot/indentLine seems better?)
" Plugin 'bling/vim-airline'                   " too fancy for me? I'll give it a second chance in a while...

" Text objects
Plugin 'terryma/vim-expand-region'           " expand mode for visual selection
Plugin 'kana/vim-textobj-user'               " to create custom text objects
Plugin 'kana/vim-textobj-line'               " a (l)ine
Plugin 'kana/vim-textobj-entire'             " a (e)ntire file
Plugin 'kana/vim-textobj-function'           " a (f)unction
Plugin 'kana/vim-textobj-indent'             " a group of similar (i)ndented lines
" Plugin 'kana/vim-textobj-lastpat'            " the obj that matches (n) and (N) searches (last pattern searched)
Plugin 'wellle/targets.vim'                  " arguments objects and a lot of objects!! also auto seek ()(n)ext and (l)ast text objects
Plugin 'Julian/vim-textobj-variable-segment' " snake_case, CamelCase, mixedCase and UPPER_CASE segments (iv/av)
Plugin 'glts/vim-textobj-comment'            " commented text as an object text (ac/ic)
Plugin 'saaguero/vim-textobj-pastedtext'     " last (ip)asted text becomes a text-obj
Plugin 'jceb/vim-textobj-uri'                " (u)RIs as textobj
" Plugin 'deathlyfrantic/vim-textobj-blanklines' " a group of blank lines

" Operators
Plugin 'svermeulen/vim-easyclip'             " much better yank, cut, delete and rotating paste operators
Plugin 'tpope/vim-surround'                  " defines surroundings as text objects (yank surroundings mean 'add' them)
Plugin 'tpope/vim-abolish'                   " adding snake/camel/mixed/upper case control in the iw and with :S
Plugin 'tommcdo/vim-exchange'                " to add the (e)xchange operator
Plugin 'tomtom/tcomment_vim'                 " add the comment action (q) for motions and text objects
Plugin 'junegunn/vim-easy-align'             " adding the align operator (al)
" Plugin 'tpope/vim-commentary'                " I don't like the commenting style for C/C++, and only works for lines
" Plugin 'vim-scripts/yate'                    " much slower than simple :*tag
" Plugin 'vim-scripts/YankRing.vim'            " replaced by easyclip?
" Plugin 'tommcdo/vim-lion'                    " cannot right-align the first column?

" Extras
Plugin 'shinokada/dragvisuals.vim'           " drag visually selected code (<+<arrows>)
Plugin 'szw/vim-g'                           " :Google (gs)
" Plugin 'm42e/vim-gcov-marker'                " test coverage
" Plugin 'vim-scripts/gcov.vim'                " test coverage

" File plugins
Plugin 'ekalinin/Dockerfile.vim'             " dockerfile syntax
Plugin 'martinda/Jenkinsfile-vim-syntax'     " jenkinsfile syntax
" Plugin 'rhysd/open-pdf.vim'                  " pdfs (not very useful, but...)

call vundle#end()                            " required

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        File Types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

filetype plugin indent on " Enable file type detection.
                          " Use the default filetype settings, so that mail gets 'tw' set to 72,
                          " 'cindent' is on in C files, etc.
                          " Also load indent files, to automatically do language-dependent indenting.

au FileType help wincmd L              " forcing help to be vertical splitted
au FileType man  wincmd L              " forcing man to be vertical splitted

au FileType vim  set foldmethod=marker " using markers in vim files

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
" Matchit is not working properly on my setup for C/C++?
" (should be in share/.../ftplugin/c.vim)
"
au FileType c,cpp let b:match_words='\%(\<else\s\+\)\@<!\<if\>:\<else\s\+if\>:\<else\%(\s\+if\)\@!\>,\<switch\>:\<case\>:\<default\>'

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              Coloring
"
" Issues
" - should I use guicolorscheme or CSApprox?
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

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" better-whitespace
let g:better_whitespace_enabled = 1
let g:better_whitespace_verbosity=1
nmap d<Space> :.StripWhitespace<CR>
" vmap d<Space> :StripWhitespace<CR> " removed to faster delete in visual mode

nmap <F8>     :ToggleWhitespace<CR>
nmap ñ<Space> :ToggleWhitespace<CR>

" indent guides
let g:indent_guides_guide_size            = 1
let g:indent_guides_space_guides          = 1
let g:indent_guides_tab_guides            = 0
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_default_mapping       = 0

"
" tcomment
"
let g:tcommentMapLeaderOp1 = 'q'         " use 'q' for the comment action
let g:tcommentOptions      = {'col': 1}  " line comments on the first column

"
" NERDTree
"
let g:NERDTreeCaseSensitiveSort=0       " don't use case to sort
let g:NERDTreeChDirMode=0               " never change CWD
let g:NERDTreeHighlightCursorline=1     " to highlight the current cursor line
let g:NERDTreeHijackNetrw=0             " to avoid conflicts between VCSStatus and NeerdTree
let g:NERDTreeQuitOnOpen=1              " quit after open a file
let g:NERDTreeShowHidden=1              " show hidden files by default
let g:NERDTreeShowLineNumbers=0         " don't show lines
let g:NERDTreeWinPos="left"             " show files explorer at the left
let g:NERDTreeWinSize=31                " window size

"
" Signature
"
let g:SignatureEnabledAtStartup = 0  " not showing marks by default

"
" Auto Save (:AutoSaveToggle)
"
nmap <F7> :AutoSaveToggle<CR>
nmap ñs   :AutoSaveToggle<CR>
let g:auto_save                   = 1                               " enable AutoSave on Vim startup
let g:auto_save_silent            = 0                               " display the auto-save notification
let g:auto_save_write_all_buffers = 1                               " write all open buffers as if you would use :wa
" let g:auto_save_postsave_hook     = 'TagsGenerate'                  " this will run :TagsGenerate after each save
" let g:auto_save_presave_hook      = 'call AbortIfNotGitDirectory()' " this will run AbortIfNotGitDirectory function before each save
let g:auto_save_events            = ["CursorHold"]                  " other possible events: InsertLeave, TextChanged, TextChangedI,
                                                                    "                        CursorHold, CursorHoldI, CompleteDone


"
" CtrlP
"
" let g:ctrlp_working_path_mode = 'a'     " to search on the current directory
" let g:ctrlp_working_path_mode = 'ar'

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                         Tab Completion, OmniCppComplete and Surrounding
"
" - AutorPairs works with "", '', {}, [], () in insert mode
"   - Open pairs wirtes both
"   - Closing pairs flies to end of that closing pair
"   - <Space> and <Return> inside pairs expand both sides
" - In normal mode:
"   - Open pairs search for previews open pair
"   - Closing pairs search for next closing pair
"   - s+pair flies to current open/close pair
" - See Text Objects for next/last inner/outer pairs
" - yank surrounding is add surround -> ys == as
" - using omnicomplete with tags and cscope
" - Tab is context aware:
"   - filename if '/' if is found
"   - omnicomplete if '.','->' or '::' is found
"   - arguments completion if in parenthesis
"     - <S-Tab> to loop arguments
"   - normal compete if none of the previous
"   - normal tab if no word already typed
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " to avoid waring message
let g:ycm_always_populate_location_list                 = 1                        " to always fill up location list with diagnosis
let g:ycm_max_num_candidates                            = 50                       " 0 is no limit, but >100 could be bad for performance?
let g:ycm_min_num_of_chars_for_completion               = 1                        " autocomplete as soon as possible (a big number is a 'disable' of non-semantic completions
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

" TODO add more mapping for GoTo functions!
nmap <Leader><Leader> :YcmCompleter FixIt<cr>

" UltiSnips
set rtp^=~/.vim/snippets/                                             " my own snippets should be preened in runtime paths
let g:UltiSnipsSnippetsDir              = '~/.vim/snippets/UltiSnips' " my own snippets
let g:UltiSnipsSnippetDirectories       = ['UltiSnips']               " just the default to be able to use standard packages
let g:UltiSnipsEnableSnipMate           = 0                           " too many unknown snippets? maybe I should give them a try?
let g:UltiSnipsExpandTrigger            = "<Insert>"                  " <Tab> is used by YCM
let g:UltiSnipsListSnippets             = "<F11>"                     " to avoid conflicts with CodeComplete... but <S-Tab> is actually the one I'm using!)
let g:UltiSnipsJumpForwardTrigger       = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger      = "<S-Tab>"
let g:UltiSnipsEditSplit                = "vertical"                  " it should be nice if I can do it as svim or sprj....
let g:UltiSnipsRemoveSelectModeMappings = 1                           " yes, printable characters shouldn't be mapped in select mode...

nmap <Insert> O<F11>

let delimitMate_autoclose            = 1 " basic functionality
let delimitMate_expand_cr            = 1 " expand with <Return>, but keep current text if any
let delimitMate_expand_space         = 1 " expand with <Space>
let delimitMate_expand_inside_quotes = 1 " also expand in quotes
let delimitMate_jump_expansion       = 0 " better use my JumpBracket
let delimitMate_balance_matchpairs   = 1 " non-sense if autoclose if disabled
let delimitMate_excluded_regions     = "" " always auto close, event in Comments or String
" au FileType c,cpp,perl let b:delimitMate_eol_marker = ";"       " not smart enought..
" au FileType c,cpp,perl let b:delimitMate_insert_eol_marker = 1

" Pairs navigation in normal mode
" nnoremap s( [(
" nnoremap s{ [{
" " nnoremap [ [[
" nnoremap s) ])
" nnoremap s} ]}
" " nnoremap ] ]]

nnoremap ( :call JumpBracket('(', 'h')<CR>
nnoremap { :call JumpBracket('{', 'h')<CR>
nnoremap [ :call JumpBracket('[', 'h')<CR>
nnoremap ) :call JumpBracket(')', 'l')<CR>
nnoremap } :call JumpBracket('}', 'l')<CR>
nnoremap ] :call JumpBracket(']', 'l')<CR>

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

" yank surround is add surround
nmap as ys
vmap as S
vmap  s S

" to add missing ; at the end of the line (and return to begin of line)
nnoremap ;; A;<Esc>^

" Options
set completeopt=menuone,longest    " preview discarded, menuone to keep as much as possible menu (to read params)

" Automands: select the correct omnifunc
" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.test set omnifunc=omni#cpp#complete#Main " (moving to YCM)

" OmniCpp Options
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

" CodeComplete
let g:completekey = '<C-q>'             " code_complete: to avoid conflicts with normal omnicomplete with tab
let g:completekey = '<S-Tab>'           " code_complete: to avoid conflicts with normal omnicomplete with tab
" let g:completekey = '<C-a>'
let g:rs = '< '                         " arguments separators
let g:re = ' >'

"
" Tab mappings to autocompletion
" Note that indentation is done by operators < and > (with easy motions and arrows to avoid shift, see easymotions section)
"
" In visual mode autocompletion is only for snippets
" In normal mode Tab enters to insert mode and call TabComplete
" In insert mode TabComplete():
"   - just a tab if no previous word
"   - filename completion if has /
"   - omnicomplete if has . or ->
"   - CodeComplete if has (
"   - Snippets if none of the above
"   - Normal complete if no snippets
"
" Moving to YCM
" xnoremap <Tab>   :call UltiSnips#SaveLastVisualSelection()<CR>gvs
" inoremap <Tab>   <C-r>=TabComplete()<CR>
" nmap     <Tab>   i<C-r>=TabComplete()<CR>
" nmap     <S-Tab> :call UltiSnips#ListSnippets()<CR>

" * <Esc>:call UltiSnips#ListSnippets()<CR>

" Functions
" function! TabComplete()
"
"     let line = getline('.')                       " current line
"     let substr = strpart(line, -1, col('.'))      " from the start of the current
"     " line to one character right
"     " of the cursor
"     "  return substr
"     let substr = matchstr(substr, "[^ \t]*$")     " word till cursor
"     if (strlen(substr)==0)                        " nothing to match on empty string
"         return "\<tab>"
"     endif
"     let has_word   = strlen(substr)      !=  0
"     let has_period = match(substr, '\.') != -1    " position of period, if any
"     let has_arrow  = match(substr, '->') != -1    " position of arrow, if any
"     let has_slash  = match(substr, '\/') != -1    " position of slash, if any
"     let has_parent = match(substr, '(')  != -1    " position of open parenthesis, if any
"     if (has_word)
"         if     ( has_slash )
"             return "\<C-X>\<C-F>"                 " file completion
"         elseif ( has_period || has_arrow )
"             return "\<C-X>\<C-O>"                 " omni-complete
"         elseif ( has_parent )
" "             return g:completekey         " arguments completion (not working?)
" "             let code_comp = CodeComplete() . "\<C-r>=".SwitchRegion()
" "             let code_comp = CodeComplete() . SwitchRegion()
"             let code_comp = CodeComplete()
"             return code_comp
"         else
"             let g:ulti_expand_or_jump_res = 0
"             call UltiSnips#ExpandSnippetOrJump()
"             if ( g:ulti_expand_or_jump_res == 0 )
" "                 return "\<C-X>\<C-P>"                 " existing text completion
"                 return "\<C-P>"                  " existing text completion (not using <c-x> to be able to use spell completion when spell is enabled)
"             else
"                 return ""                           " if not a character is added to the the snipet?
"             endif
"         endif
"     else
"         return "\<tab>"                           " no-completion, just a tab
"     endif
" endfunction

"
" Deprecated
"
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " auto open/close the popup menu/preview windows
"
" To use autopairs fly also in normal mode (not properly working?)
" nnoremap ) v"_c)<Esc>
" nnoremap ) i<C-R>=AutoPairsInsert('")"')<CR><Esc>
" nmap ) i)<Esc>
" nmap } i}<Esc>
" nmap ] i]<Esc>
" nmap ) :call JumpBracket(')', 'l')<CR>
" nmap } :call JumpBracket('}', 'l')<CR>
" nmap ] :call JumpBracket(']', 'l')<CR>

" nmap ( %
" nmap ( :call JumpBracket('(', 'h')<CR>
" nmap { %
" nmap [ %


" vnoremap <Tab>   >gv
" vnoremap <S-Tab> <gv
" nnoremap <Tab>   >>
" nnoremap <S-Tab> <<

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
"                                            EasyClip and Exchange
"
" - three new operators: cut (x), replace (r) and exchange (e)
"   - (e) doesn't work with previous yank, but two consecutive (e) must be executed
" - action after pasting: rotate yanks (,yy) (.yy) (not persistent for next pastes)
" - action before pasting: rotate yanks (,yr) and (.yr) (persistent)
" - interactive pasting: (yp) and (YP)
" - toggle auto-format after paste (F2) or (,yf)
" - paste on insert and command modes with <C-v> (see EMCommandLineNoreMap for search mode)
" - see the list of available yanks (sy)
" - AutoFormat sometimes is not good... <F2> after paste to toogle it
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Direct paste from clipboard not working
set clipboard^=unnamedplus " unamedplus is more keyboard-centric (ctrl-c)... like vim is
                           " but anyway, the important part is that we should match tmux:
                           " unnamed     -> xclip -selection primary
                           " unnamedplus -> xclip -selection clipboard
" set clipboard=unnamedplus  " conflict with YankRing?
" set clipboard+=unnamed     " conflict ith EasyClip and unnecessary?

"
" EasyClip - Options
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
" Exchange
"
let g:exchange_no_mappings = 1 " to avoid cx auto mappings
" let g:exchange_indent = '=='   " to exchange indentation?

nmap e  <Plug>(Exchange)
xmap e  <Plug>(Exchange)
nmap ee <Plug>(ExchangeLine)
nmap ec <Plug>(ExchangeClear)
nmap eq <Plug>(ExchangeClear)

"
" EasyClip - Maps
"
nmap x     <Plug>MoveMotionPlug
xmap x     <Plug>MoveMotionXPlug
nmap xx    <Plug>MoveMotionLinePlug

nmap r     <Plug>SubstituteOverMotionMap
xmap r     <Plug>XEasyClipPaste
nmap rr    <Plug>SubstituteLine

nmap ,y    <Plug>EasyClipSwapPasteForward
nmap -y    <Plug>EasyClipSwapPasteBackwards
nmap ,p    <Plug>EasyClipSwapPasteForward
nmap -p    <Plug>EasyClipSwapPasteBackwards

nmap ,,y   <Plug>EasyClipRotateYanksForward
nmap --y   <Plug>EasyClipRotateYanksBackward
nmap ;y    <Plug>EasyClipRotateYanksForward
nmap _y    <Plug>EasyClipRotateYanksBackward

nmap yp    :IPaste<cr>
nmap YP    :IPasteBefore<cr>

nmap <F2>  <Plug>EasyClipToggleFormattedPaste<cr>
nmap ñp  <Plug>EasyClipToggleFormattedPaste<cr>
" nmap ,yf   <Plug>EasyClipToggleFormattedPaste<cr>

function! ToggleAutoFormat()
    if g:EasyClipAutoFormat == '1'
        let g:EasyClipAutoFormat = '0'
    else
        let g:EasyClipAutoFormat = '1'
    endif
endfunction

nmap <F12> :call ToggleAutoFormat()<CR>
nmap ÑP    :call ToggleAutoFormat()<CR>

imap <C-v> <Plug>EasyClipInsertModePaste
cmap <C-v> <Plug>EasyClipCommandModePaste

inoremap <C-u> <C-v>
" cnoremap <C-u> <C-v>

nmap sy    :Yanks<cr>

" visual selected pasted
noremap vp `[v`]

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                            EasyMotions
"
" - replacing operators t, f (g), b, e
" - replacing search system / (-), n, N and *
"   - * is added just to be able to use n/N after *
"   - (-) is fuzzy and overwin!, (_) is not
" - replacing <C-Arrows> (word motions) (also in insert mode)
" - fast access to easymotions with arrows also for v, x, r, cm, al/L and e
" - (yl),(dl),(vl) and (yr),(dr),(vr) to yank, delete and select lines or ranges from different positions than cursor
"
" Issues:
" - lineforward is not inclusive?
" - ge includes the current char and the target
" - fuzzy search only works on the visible scrren
" - new * doesn't always go to the next (if not in present in the screen), it needs an extra n keystroke
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

"
" EasyMotion - Options
"
let g:EasyMotion_enter_jump_first = 1                            " quick selection
let g:EasyMotion_space_jump_first = 0                            " to be able to use space as target key
let g:EasyMotion_use_upper        = 1                            " for better readability
" let g:EasyMotion_keys             = 'asdghklqwertyuiopzxcvbnmfj' " defaults, without the last ';'
" let g:EasyMotion_keys             = 'ASDFQWERTZXCVBGLOKIJMNP '   " only left hand keys, and last for the right
let g:EasyMotion_keys             = 'asdfqwertzxcvbglokijmnp '   " only left hand keys, and last for the right
let g:EasyMotion_startofline      = 0                            " to be able to move to eol and sol
" let g:EasyMotion_smartcase = 1                                 " case insensitive (using normal ignorecase+smartcase)

"
" EasyMotion - Maps
"
map  t                 <Plug>(easymotion-bd-t)
map  T                 <Plug>(easymotion-bd-f)

" map  b                 <Plug>(easymotion-bd-w)
" map  bb                <Plug>(easymotion-bd-w)
" map  b<Right>          <Plug>(easymotion-w)
" map  b<Left>           <Plug>(easymotion-b)
"
" map  e                 <Plug>(easymotion-bd-e)
" map  ee                <Plug>(easymotion-bd-e)
" map  e<Right>          <Plug>(easymotion-e)
" map  e<Left>           <Plug>(easymotion-ge)

" map  <expr> -          incsearch#go(<SID>config_easyfuzzymotion())
" map  _                 <Plug>(easymotion-sn)
map  /                 <Plug>(easymotion-sn)
map  Oo              <Plug>(easymotion-sn)
map  --                <Plug>(easymotion-sn)
map  ç                 <Plug>(easymotion-sn)
map  N                 <Plug>(easymotion-prev)
map  n                 <Plug>(easymotion-next)

" fixing * and # to be able to use n and N
nmap *                 viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-next)
nmap Oj              viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-next)
nmap +                 viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-prev)<Plug>(easymotion-prev)
nmap Ok              viwy<Plug>(easymotion-sn)<C-v><cr><Esc><Plug>(easymotion-prev)<Plug>(easymotion-prev)
" nnoremap +             #
" nmap *                 viwy<Plug>(easymotion-sn)<C-v><cr><cr>
" map Oj               viwy<Plug>(easymotion-sn)<C-v><cr><cr>

" map  <C-Right>         <Plug>(easymotion-lineforward)
" map  <C-Left>          <Plug>(easymotion-linebackward)
" map  <C-Up>            <Plug>(easymotion-k)
" map  <C-Down>          <Plug>(easymotion-j)
noremap  <C-Up>        <C-y>
noremap  <C-Down>      <C-e>

omap <Right>           <Plug>(easymotion-lineforward)
omap <Left>            <Plug>(easymotion-linebackward)
omap <Up>              <Plug>(easymotion-k)
omap <Down>            <Plug>(easymotion-j)

" imap <C-Right>         <Esc><Plug>(easymotion-lineforward)
" imap <C-Left>          <Esc><Plug>(easymotion-linebackward)
imap <C-Up>            <Esc><Plug>(easymotion-k)
imap <C-Down>          <Esc><Plug>(easymotion-j)

nmap yb<Up>            <Plug>(easyoperator-line-yank)
nmap yb<Down>          <Plug>(easyoperator-line-yank)
nmap ybb               <Plug>(easyoperator-line-yank)
nmap yb<Left>          <Plug>(easyoperator-phrase-yank)
nmap yb<Right>         <Plug>(easyoperator-phrase-yank)

nmap db<Up>            <Plug>(easyoperator-line-delete)
nmap db<Down>          <Plug>(easyoperator-line-delete)
nmap dbb               <Plug>(easyoperator-line-delete)
nmap db<Left>          <Plug>(easyoperator-phrase-delete)
nmap db<Right>         <Plug>(easyoperator-phrase-delete)

nmap v<Up>             V<Plug>(easymotion-k)
nmap v<Down>           V<Plug>(easymotion-j)
nmap v<Right>          v<Plug>(easymotion-lineforward)
nmap v<Left>           v<Plug>(easymotion-linebackward)
nmap vb<Up>            <Plug>(easyoperator-line-select)
nmap vb<Down>          <Plug>(easyoperator-line-select)
nmap vbb               <Plug>(easyoperator-line-select)
nmap vb<Left>          <Plug>(easyoperator-phrase-select)
nmap vb<Right>         <Plug>(easyoperator-phrase-select)

nmap qq               qc

" nmap =<Up>             =<Plug>(easymotion-k)
" nmap =<Down>           =<Plug>(easymotion-j)

" I never know if I've to press shift in the spanish keyboard to get < or >...
" ...so replacing < (no shift) + Left/Right to the right < and > operators
" and also the << and >> + Left and Right!
nnoremap <<Right>        >
nnoremap <<Left>         <
vnoremap <<Right>        >gv
vnoremap <<Left>         <gv

nnoremap <<<Right>       >>
nnoremap <<Right><Right> >>
nnoremap <<<Left>        <<
nnoremap <<Left><Left>   <<

"
" EasyMotion - AutoCommands
"
au VimEnter,BufEnter * :EMCommandLineNoreMap <C-v> <C-r>0 " to be able to paste on easymotion command with <C-v>
                                                          " as we do on imap and cmap


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
" Deprecated
"

" I'm not using overwin...
" function! s:incsearch_config(...) abort
"     return incsearch#util#deepextend(deepcopy({
"                 \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"                 \   'keymap': {
"                 \     "\<CR>": '<Over>(easymotion)'
"                 \   },
"                 \   'is_expr': 0
"                 \ }), get(a:, 1, {}))
" endfunction

" nmap       fwl         :DimInactiveOff<cr><Plug>(easymotion-overwin-line)
" nmap       fwa         :DimInactiveOff<cr><Plug>(easymotion-overwin-w)

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   EasyAlign
" - new al{opts}{delimiter} operator
"   - opts are:
"     - <Enter> to switch right/left/center alignment *before* the operator
"     - <Right>/<Left> to add/remove spaces before the delimiter
"     - <Down> /<Up>   to remove/add spaces after the delimiter
"     - ** to alternate left-right alignment
"     - 1,2... or * to specify which delimiters we want to align
"     - <C-x> to use regular expression as delimiter instead of single character (<C-x> again to save the align)
"     - there are extra options that can be configured with some <C- > keystrokes
"       - :help easy-align-alignment-options-in-interactive-mode
"
" - aL operator is the same, but without the preview and the extra confirmation of the delimiter
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

let g:easy_align_ignore_groups = [] " 'Comments' and 'Strings' can be aligned...

xmap >>  <Plug>(EasyAlign)
nmap >>  <Plug>(EasyAlign)

xmap > <Plug>(LiveEasyAlign)
nmap > <Plug>(LiveEasyAlign)

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               VimPrj, Sessions and VCS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
let g:signify_disable_by_default = 1 " Use :SignifyToggle
let g:signify_sign_change        = 'M'


let g:vimprj_changeCurDirIfVimprjFound = 1  " always change the current dir to the dir where the .vimprj file is
let g:cpp_header_ext='hpp'                  " each project can define its headers extension (.h or .hpp)

"
" Reload .vimprj just after writing it
"
autocmd BufWritePost .vimprj source .vimprj

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize " save everything
let g:session_directory         = '~/.vim-sessions'                         " to save sessions locally, out of dotfiles
let g:session_autoload          = 'prompt'                                  " used when starting vim without anyfile
let g:session_autosave          = 'yes'                                     " is a session is open and vim closes
let g:session_autosave_periodic = 1                                         " save the session every minute (only if one is open, right?)
let g:session_autosave_silent   = 0                                         " should be 1, but I still want to see how the plugin works...
let g:session_command_aliases   = 1                                         " all commands have the alias 'Session*' (useful for <Tab> completion)

"
" Function to define the default options
" Called when leaving a project, and now
"
function! <SID>SetMainDefaults()

    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab               " using spaces instead of tabs
    set smarttab                " doesn't do anything...?
    set formatoptions=ronj      " auto create comment characters/leaders

    set path=.,/usr/local/include,/usr/include
    compiler gcc
    let g:cpp_header_ext='hpp'

    if exists("b:dispatch")
        unlet b:dispatch
    endif
    if exists("g:myvimprj")
        autocmd! myvimprj FileWritePost *
        autocmd! myvimprj BufWritePost *
        unlet g:myvimprj
    endif

endfunction

call <SID>SetMainDefaults()
call vimprj#init()

function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
    call <SID>SetMainDefaults()
endfunction

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           EasyGrep
"
" - (gw) and (g*) to grep current word or only current word and listing results in quickfix
" - (gcw) and (gc*) to grep and change current word
" - :Grep and ':Replace old new'
" - (go) and (ñg) :GrepOptions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

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

map gw     <leader>vv
map g*     <leader>vV
map gOj  <leader>vV
map grw    <leader>vr
map gr*    <leader>vR
map grOj <leader>vR
map gcw    <leader>vr
map gc*    <leader>vR
map gcOj <leader>vR

vmap gw     <leader>vv
vmap g*     <leader>vV
vmap gOj  <leader>vV
vmap grw    <leader>vr
vmap gr*    <leader>vR
vmap grOj <leader>vR
vmap gcw    <leader>vr
vmap gc*    <leader>vR
vmap gcOj <leader>vR

nmap go     :GrepOptions<CR>
nmap ñg     :GrepOptions<CR>
nmap ñgi    <Leader>vyi

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Moving between Modes
"
" - using (zz) and (ZZ) to expand/shrink visual selection (note that <S-Arrows> go directly to <C-v>
"   - also using (z) instead of (v)
" - as I use (s) in several places as 'see whatever' prefix, I'm disabling (s) (substitute character)
"   - using (cx) (change-character) instead
"
" - <S+Arrows> to go directly to visual block (<C-v>)
"   - as this is the preferred method to go to Visual, remapping z Z <C-Z> as v V <C-V> for convenience in visual mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

"shift+arrow selection
nmap <S-Up>           <C-v><Up>
nmap <S-Down>         <C-v><Down>
nmap <S-Left>         <C-v><Left>
nmap <S-Right>        <C-v><Right>
nmap <S-Home>         <C-v><Home>
nmap <S-End>          <C-v><End>
nmap <S-PageUp>       <C-v><PageUp>
nmap <S-PageDown>     <C-v><PageDown>

vmap <S-Up>                <Up>
vmap <S-Down>              <Down>
vmap <S-Left>              <Left>
vmap <S-Right>             <Right>
vmap <S-Home>              <Home>
vmap <S-End>               <End>

imap <S-Up>      <Esc><C-v><Up>
imap <S-Down>    <Esc><C-v><Down>
imap <S-Left>    <Esc><C-v><Left>
imap <S-Right>   <Esc><C-v><Right>
imap <S-Home>    <Esc><C-v><Home>
imap <S-End>     <Esc><C-v><End>

"ctrl+shift+arrow selection
nmap <C-S-Up>         <C-v><C-Up>
nmap <C-S-Down>       <C-v><C-Down>
nmap <C-S-Left>       <C-v><C-Left>
nmap <C-S-Right>      <C-v><C-Right>

vmap <C-S-Up>              <C-Up>
vmap <C-S-Down>            <C-Down>
vmap <C-S-Left>            <C-Left>
vmap <C-S-Right>           <C-Right>

imap <C-S-Up>    <Esc><C-v><C-Up>
imap <C-S-Down>  <Esc><C-v><C-Down>
imap <C-S-Left>  <Esc><C-v><C-Left>
imap <C-S-Right> <Esc><C-v><C-Right>

" as I use (s) in several places as 'see whatever' prefix, I'm disabling (s) (substitute character)
" in visual mode, to switch to select mode
nnoremap s      <Esc>
vnoremap <C-s>  <C-g>
snoremap <C-s>  <C-g>
" vnoremap s  <C-g>

nnoremap ax<Up>      O<Esc>
nnoremap ax<Down>    o<Esc>
nnoremap ax<Left>    i<Space><Esc>
nnoremap ax<Right>   a<Space><Esc>

nnoremap ax          :<c-u>call MyRepeatChar("i")<CR>
nnoremap ax<Return>  :<c-u>call MyRepeatChar("i")<CR><CR>^
nnoremap AX          :<c-u>call MyRepeatChar("a")<CR>
nnoremap AX<Return>  :<c-u>call MyRepeatChar("a")<CR><CR>^

nnoremap a<Up>       O
nnoremap a<Down>     o
nnoremap a<Left>     I
nnoremap a<Right>    A

nmap     DD          dd<Up>

nmap <Backspace> i<Backspace>
nmap <Space>     i<Space>
nmap <Delete>    i<Delete>
" au FileType cpp au BufEnter * :nmap     <buffer> <Return> i<Return>
" au FileType cpp au BufEnter * :nmap     <Return> i<Return>
" au FileType cpp au BufLeave * :nunmap   <Return>
" au FileType cpp au BufLeave * :nunmap <buffer> <Return>

vmap <Backspace> <Delete>i
vmap <Space>     <Delete>i<Space>
vmap <Delete>    <Delete>i
" au FileType cpp au BufEnter * :vmap   <buffer> <Return> <Delete>i<Return>
" au FileType cpp au BufEnter * :vmap     <Return> <Delete>i<Return>
" au FileType cpp au BufLeave * :vunmap   <Return>
" au FileType cpp au BufLeave * :vunmap <buffer> <Return>

nnoremap yx          vy
nnoremap dx          x
nnoremap cx          s
nmap     rx          v<Plug>XEasyClipPaste
nnoremap Cx          ~
nnoremap CX          ~
nmap     ex          v<Plug>(Exchange)
nmap     asx         vS
nmap     ysx         vS

function! MyRepeatChar(mode)
    let schar = nr2char(getchar())
    let chars = repeat(schar, v:count1)
    exe "normal ".a:mode.chars
    if a:mode == 'i'
        call cursor(0, col('.')+1)
    endif
endfunction

" <S-Arrows>    : Block selection
" zz            : Expand selection
" z<up/down>    : line selection
" z<left/right> : normal selection

" z and expand
" nmap     z     v
" nmap     Z     V
" nnoremap <C-z> <C-v>
" map      zz    <Plug>(expand_region_expand)
" map      ZZ    <Plug>(expand_region_shrink)

let g:expand_region_use_select_mode = 0 " 1: Select mode 0: Visual mode

" adding the (ia) text object
let g:expand_region_text_objects = { 'ie' : 0,
                                 \   'ip' : 0,
                                 \   'iw' : 0,
                                 \   'iB' : 1,
                                 \   'il' : 0,
                                 \   'iW' : 0,
                                 \   'i''': 0,
                                 \   'ib' : 1,
                                 \   'i]' : 1,
                                 \   'ia' : 0,
                                 \   'i"' : 0}

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Text objects
"
" - indentations as text objects: (ii) and (ai) -> removed because it conflicts with for(ii=0...)
"   - so, you can (dii), (yai), (vii)...
" - next/last inner/outer objects
"   - cin( will change next inner ()
"   - cil( will change last inner ()
"   - NOTE: al doesn't conflict with align because this is a text object an align is an operator
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" textobj-comment: (aq) (iq) (aQ)
let g:textobj_comment_no_default_key_mappings = 1
xmap aq <Plug>(textobj-comment-a)
omap aq <Plug>(textobj-comment-a)
xmap iq <Plug>(textobj-comment-i)
omap iq <Plug>(textobj-comment-i)
xmap aQ <Plug>(textobj-comment-big-a)
omap aQ <Plug>(textobj-comment-big-a)

" tagets.vin config
let g:targets_aiAI = 'aIAi' " to ignore whitespaces with 'i' and add them with 'I'
let g:targets_nl   = 'nN'   " to be able to use il/al for 'lines'

let g:pastedtext_select_key = 'ip' " using ip instead of gb as last pasted text-obj

" lastpat config:  removed as not used and forces with targets.vim to use (,-) instead of nN
" let g:textobj_lastpat_no_default_key_mappings = 1
" xmap aN <Plug>(textobj-lastpat-N)
" omap aN <Plug>(textobj-lastpat-N)
" xmap iN <Plug>(textobj-lastpat-N)
" omap iN <Plug>(textobj-lastpat-N)
" xmap an <Plug>(textobj-lastpat-n)
" omap an <Plug>(textobj-lastpat-n)
" xmap in <Plug>(textobj-lastpat-n)
" omap in <Plug>(textobj-lastpat-n)


" removed because it conflicts with for(ii=0...) -> because using a plugin!
" onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
" onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
" vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
" vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv
"
" function! s:IndTxtObj(inner)
"     let curline = line(".")
"     let lastline = line("$")
"     let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
"     let i = i < 0 ? 0 : i
"     if getline(".") !~ "^\\s*$"
"         let p = line(".") - 1
"         let nextblank = getline(p) =~ "^\\s*$"
"         while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
"             -
"             let p = line(".") - 1
"             let nextblank = getline(p) =~ "^\\s*$"
"         endwhile
"         normal! 0V
"         call cursor(curline, 0)
"         let p = line(".") + 1
"         let nextblank = getline(p) =~ "^\\s*$"
"         while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
"             +
"             let p = line(".") + 1
"             let nextblank = getline(p) =~ "^\\s*$"
"         endwhile
"         normal! $
"     endif
" endfunction

" Depcretaed due targets.vim plugin
" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
" onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
" xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
" onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
" xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
"
" " removed because it conflicts with al (align) in visual mode
" onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" function! s:NextTextObject(motion, dir)
"     let c = nr2char(getchar())
"
"     if c ==# "b"
"         let c = "("
"     elseif c ==# "B"
"         let c = "{"
"     elseif c ==# "d"
"         let c = "["
"     endif
"
"     exe "normal! ".a:dir.c."v".a:motion.c
" endfunction

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Miscellaneous and Annoyances
"
" - not moving cursor when leaving insert mode
" - (u) to undo and (U) to redo
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" save file with Ctrl-S
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" recover a closed splitted window like in a web browser Ctrl+Shift+T
nmap <C-S-t> :vs<bar>:b#<CR>

"
" Not moving cursor when leaving insert mode
"
let CursorColumnI = 0                                                               "
au InsertEnter  * let CursorColumnI = col('.')                                      " Code to avoid moving left when
au CursorMovedI * let CursorColumnI = col('.')                                      " leaving the insert mode
au InsertLeave  * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif "

" leave insert mode after a couple of secconds
" au CursorHoldI * stopinsert
" au InsertEnter * let updaterestore=&updatetime | set updatetime=3000
" au InsertLeave * let &updatetime=updaterestore

" to reduce the return of normal mode faster
set timeoutlen=1000 ttimeoutlen=0

" for column incrementing
set nrformats=bin,octal,hex,alpha
vmap + g<C-a>
vmap - g<C-x>

" sudo write (never used!? I should use it more!)
cmap W!! w !sudo tee % >/dev/null

" I will not use Ex-Mode! (typo trying the previous quickfix)
map Q <nop>

" refresh vim files
noremap    <F5>       :e<cr>
noremap    <F6>       :source ~/.vimrc<cr>

" move between brackets
nmap  b   %

"
" autoreload files
"
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" spell (see dictionary) (disabled as not used)
" nnoremap sa z=
" nnoremap ,a [s
" nnoremap -a ]s

map gs :Google<cr>

"
" ge
"
fu! MyCustomGE()
    return "\<c-u>:norm! ".v:count1."ge "
endfu
onoremap ge :<c-u><c-r>=MyCustomGE()<cr><cr>

"
" Key bindings
"
" See movements
noremap    s<PageUp>   gg
noremap    s<PageDown> G

" Undos (I'm very lazy and I never use the original U concept (line undo))
nnoremap   U          <C-r>
nnoremap   <C-u>      U

" registers
" - not using registers thanks to EasyClip (YankRing)
" - (r) is used as 'replace' by EasyClip
nnoremap R "
vnoremap R "

" <C-k> used to:
" - open edition in command line (never used?)
" - single normal mode command while in insert mode
inoremap <C-k>  <C-o>
nnoremap <C-k> q:
cnoremap ñ <C-k>
set cedit=<C-k>

" Command line window remaped to avoid my typo
map q: :q
noremap ñ: q:

" Deprecated

" au VimEnter * vertical ba " to open all buffer when entering vim (conflicts with wgd)

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Arrows and special keys (home, end, delete, backspace and return)
"
" - scrolling with <C-PageUp/Down>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"
" scrolling
"
nnoremap <C-PageUp>    <C-Y>
nnoremap <C-PageDown>  <C-E>

"
" Deprecated
"
" nnoremap <Enter>             i<Enter> " I've not being able to unmap/map it for some windows
" vnoremap <Return>    <Delete>i<Return>
" au FileType qf,undotree,nerdtree,tagbar au BufEnter <buffer> unmap <Enter>
" au FileType qf,undotree,nerdtree,tagbar au BufLeave <buffer> nmap  <Enter> i<Enter>

" nnoremap <C-o>               o<Esc>
" vnoremap <C-o>               do<Esc>
" nnoremap <C-S-o>             O<Esc>
" nnoremap <C-O>               O<Esc>

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Windows, Tabs and Buffers
"
" - w in normal mode is the main prefix-leader <C-w>
"   - w<Arrows> move between windows
" - (we) to toggle zoom/expand on a window
" - (wm) to mark a window and (ws) to swap with the marked (works between tabs!)
" - w<S-Arrows> for changing layout (forcing a window/pane to be on one side)
" - w<C-Arrows> to resize (almost not used?)
" - (w,) and (w.) for tab navigation
" - (W;) and (W:) for tab moves
"   - w<PageUp/Down> also for tab navigation
" - (sb), (b,), (b.) and (sbb) for buffers navigation
"   - (sba) see all splitted in current window
"   - (sb) allows to delete buffers with (d)
" - (,w) and (,t) for previous window, tab and buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
" nnoremap <silent> <M-Left> :TmuxNavigatePrevious<cr>

" Leader: w is the leader key for all windows and tabs (is <C-w>)
nnoremap w           <C-w>

" To restore the previous 'view' of the buffer (keep cursor position)
" Very-very useful (with sh)!
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Decoretions
map        wh         :set hls!<cr>
noremap    <F3>       :call SwitchDecorations()<cr>
noremap    ñd         :call SwitchDecorations()<cr>
nnoremap   wn         :call NumberToggle()<cr>

" Maximize (ww) and 'Tabize' (wt)
set wmh=0                                   " to fully maximize in height
set wmw=0                                   " to fully maximize in width
let g:maximizer_restore_on_winleave = 1     " to force restore when leaving maximized window (tmux like)
let g:maximizer_set_default_mapping = 0     " to be able to use <F3> for other usage
let g:maximizer_restore_on_winleave = 1     " to autorestore if moving out of windows (good if not using too much tabs?)

nnoremap ww :MaximizerToggle!<CR>
vnoremap ww :MaximizerToggle!<CR>gv
" nnoremap we :MaximizerToggle!<CR>
" vnoremap we :MaximizerToggle!<CR>gv

nnoremap wt          <C-w>T
vnoremap wt          <C-w>Tgv
" inoremap wt     <C-o><C-w>T<CR>

" Resizes
" nnoremap we          <C-w>=
nnoremap w<c-right>  :vertical resize +20<cr>
nnoremap w<c-left>   :vertical resize -20<cr>
nnoremap w<c-up>     :resize          +10<cr>
nnoremap w<c-down>   :resize          -10<cr>
nnoremap w<s-right>  <c-w>L<c-p>
nnoremap w<s-left>   <c-w>H<c-p>
nnoremap w<s-up>     <c-w>K<c-p>
nnoremap w<s-down>   <c-w>J<c-p>

" Last/Previous Window / Tab
nnoremap ,w          <c-w>p
nnoremap ,t          :exe "tabn ".g:lasttab<CR>
nnoremap wp          <c-w>p
nnoremap tt          :exe "tabn ".g:lasttab<CR>

" Tabs
nnoremap wo          :tabnew<cr>
nnoremap wc          :tabclose<cr>
nnoremap wto         :tabnew<cr>
nnoremap wtq         :tabclose<cr>

nnoremap w<pagedown> :tabnext<cr>
nnoremap w<pageup>   :tabprevious<cr>
nnoremap w-          :tabnext<cr>
nnoremap w,          :tabprevious<cr>
nnoremap w;          :-tabmove<cr>
nnoremap w_          :+tabmove<cr>
nnoremap W;          :-tabmove<cr>
nnoremap W_          :+tabmove<cr>

" buffer exploring
nnoremap sb   :BufExplorer<cr>
" nnoremap sbb  :b#<cr>
nnoremap bb   :b#<cr>
nnoremap sab  :vertical ba<cr>
nnoremap ,b   :bprevious<cr>
nnoremap -b   :bnext<cr>
nnoremap b,   :bprevious<cr>
nnoremap b-   :bnext<cr>
" nnoremap bd   :bdelete<cr> " Using a function to keep the windows layout

let g:bufExplorerDefaultHelp=1              " Show default help.
let g:bufExplorerDetailedHelp=0             " Do not show detailed help.
let g:bufExplorerDisableDefaultKeyMapping=0 " Do not disable mapping.
let g:bufExplorerFindActive=1               " Go to active window.
let g:bufExplorerReverseSort=0              " Do not sort in reverse order.
let g:bufExplorerShowDirectories=1          " Show directories.
let g:bufExplorerShowNoName=0               " Do not 'No Name' buffers.
let g:bufExplorerShowRelativePath=1         " Show relative paths.
let g:bufExplorerShowTabBuffer=0            " No.
let g:bufExplorerShowUnlisted=0             " Do not show unlisted buffers.
let g:bufExplorerSortBy='mru'               " Sort by most recently used ('extension''fullpath''name''number').
let g:bufExplorerVertSize=0                 " New split windows size set by Vim.

" indentation lines disabled by default (integrated with Switch decorations)
let g:indentLine_enabled              = 0
let g:indentLine_leadingSpaceEnabled  = 0
let g:indentLine_char                 = "|"
let g:indentLine_first_char           = "|"
let g:indentLine_indentLevel          = 10
let g:indentLine_showFirstIndentLevel = 1

" folding
nnoremap FF za
nnoremap FO zR
nnoremap FC zM
nnoremap Fo zr
nnoremap Fc zm

"
" Functions
"

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

nmap <silent> wm :call MarkWindowSwap()<CR>
nmap <silent> ws :call DoWindowSwap()<CR>
nmap <silent> wj :call DoWindowJoin()<CR>

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

" Create a mapping (e.g. in your .vimrc) like this:
nmap bd <Plug>Kwbd

nnoremap wb          <C-w>T
vnoremap wb          <C-w>Tgv

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

" last used tab
let g:lasttab = 1                         " Code to be able to go to
au TabLeave * let g:lasttab = tabpagenr() " last active tab


"
" Deprecated
"
"nnoremap   ww         :ZoomWin<cr>
"nnoremap   ww         <C-w><Bar>
" nnoremap   <Bar>      :vspl<cr>
" nnoremap   -          :spl<cr>
" nnoremap wm          :tab split<cr>
" nnoremap ww          <c-w>T
" nnoremap ww          <C-w>_<c-w><Bar>

" function! MarkWindowSwap()
"     let g:markedWinNum = winnr()
" endfunction
"
" function! DoWindowSwap()
"     "Mark destination
"     let curNum = winnr()
"     let curBuf = bufnr( "%" )
"     exe g:markedWinNum . "wincmd w"
"     "Switch to source and shuffle dest->source
"     let markedBuf = bufnr( "%" )
"     "Hide and open so that we aren't prompted and keep history
"     exe 'hide buf' curBuf
"     "Switch to dest and shuffle source->dest
"     exe curNum . "wincmd w"
"     "Hide and open so that we aren't prompted and keep history
"     exe 'hide buf' markedBuf
" endfunction

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Abolish - Naming convention and Search/Replace
"
" - adding the pseudo-operator C{style} (change-naming-convention)
"   - it's not an actual operator:
"     - it doesn't accept any motion/object, only works inner-word
"     - it only works in normal mode
"
" - naming convention styles (I've swapped the original c and m):
"   - s: snake_case
"   - c: CamelCase
"   - m: mixedCase
"   - u: UPPER_CASE
"
" - adding the :S(ubvert) command to improve the built in :s(ubstitute)
"   - support for all naming conventions in search (and repleace)
"   - can be used also for greping?
" - adding the :Abolish command to create abbreviations to be automatically replaced while typing (never used)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

nmap     Cs crs
nmap     Cc crm
nmap     Cm crc
nmap     Cu cru
xnoremap C  ~

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   See and Jump
"
" - see into files (sf), into a tab (stf) or in a vsplit (svf)
" - jumps (sj) (,j) (.j)
" - changes (sc) (,c) (-c)
" - marks
"   - using (M) to set a mark (few times) and (m) to jump to it (more times)
"   - using Signature plugin to list marks: (sm) for a interactive list (swm) on the windows
" - file explorer (se), buffers (sb), undo tree (su), and outline pane (so)
" - vimprj (sprj) and vimrc (svim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" open files
noremap  sf   gf
noremap  stf  <C-w>gf
noremap  svf  :vertical wincmd f<cr>

" nnoremap sj   :jumps<cr>
nmap     sj  :call GotoJump()<CR>
nnoremap ,j  <C-o>
nnoremap -j  <C-i>
nnoremap ,s  <C-o>
nnoremap -s  <C-i>

" changes
noremap  sc   :changes<cr>
noremap  ,c   g;
noremap  -c   g,

nnoremap s<Up>    <C-o>
nnoremap s<Down>  <C-i>
nnoremap s<Left>  g;
nnoremap s<Right> g,

" marks
nnoremap  sm   :SignatureListMarks<cr>
nmap      swm  :SignatureToggleSigns<cr>
nnoremap  M    m
nnoremap  m    '
nnoremap  dM   :delmarks
nnoremap  MM   mM
nnoremap  mm   'M

" exploring file
nnoremap se   :NERDTreeToggle<cr>

" vimproj and vimrc
" noremap  sp   :wincmd l<CR>:e .vimprj<cr>
noremap  sprj :wincmd l<CR>:e .vimprj<cr>
noremap  svim :wincmd l<CR>:e ~/.vimrc<cr>


" undotree
nnoremap su   :UndotreeToggle<cr>

" registers
noremap  sr   :registers<cr>

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

" Deprecated
" map      sm  `

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Tags (cscope, tagbar tjumps, source/header)
"
" - (so) toggle local outline
" - (ls) lists symbol occurrences to quicklist (cscope)
" - (lg) goes to symbol definition (global) (cscope)
" - (lc) lists who calls this function to quicklist (cscope)
" - (lt) lists text occurrences to quicklist (cscope)
" - (lf) lists file occurrences to quicklist (cscope)
" - (li) lists files including this to quicklist (cscope)
" - (ld) lists function called by me to quicklist (cscope)
"
" - (sh) and (st) to switch header and test files
"   - use g:cpp_header_ext in vimprj to specify header extension
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Tagbar (outline)
let g:tagbar_autoclose = 1              " autoclose the outline/tagbar when a selection is done
nnoremap so   :TagbarToggle<cr>

" cscope
" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" all cscope results are placed in quickfix
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-

nmap ls :cs find s  <C-R>=expand("<cword>")<CR><CR>sq
nmap lg :cs find g  <C-R>=expand("<cword>")<CR><CR>
nmap lc :cs find c  <C-R>=expand("<cword>")<CR><CR>sq
nmap lt :cs find t  <C-R>=expand("<cword>")<CR><CR>sq
nmap le :cs find e  <C-R>=expand("<cword>")<CR><CR>sq
nmap lf :cs find f  <C-R>=expand("<cfile>")<CR><CR>sq
nmap li :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>sq
nmap ld :cs find d  <C-R>=expand("<cword>")<CR><CR>sq

nmap sss          :cs find s  <C-R>=expand("<cword>")<CR><CR>
nmap ss<Left>     :cs find s  <C-R>=expand("<cword>")<CR><CR>
nmap ssg          :cs find g  <C-R>=expand("<cword>")<CR><CR>
nmap ss<Right>    :cs find g  <C-R>=expand("<cword>")<CR><CR>
nmap ssc          :cs find c  <C-R>=expand("<cword>")<CR><CR>
nmap ss<Up>       :cs find c  <C-R>=expand("<cword>")<CR><CR>
nmap ssd          :cs find d  <C-R>=expand("<cword>")<CR><CR>
nmap ss<Down>     :cs find d  <C-R>=expand("<cword>")<CR><CR>
nmap ssi          :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ssh          :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ss<PageUp>   :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap sst          :cs find t  <C-R>=expand("<cword>")<CR><CR>
nmap ss<PageDown> :cs find t  <C-R>=expand("<cword>")<CR><CR>
nmap sse          :cs find e  <C-R>=expand("<cword>")<CR><CR>
nmap ssf          :cs find f  <C-R>=expand("<cfile>")<CR><CR>

" tags/links (moved to cscope)
" noremap    sl         :tjump /<C-r><C-w><cr>
" noremap    sll        <C-]>
" noremap    swl        :vert :stjump /<C-r><C-w><cr>
" noremap    swll       :vsplit<cr><C-]>
"noremap    stt        g<C-]>
" noremap    ,l         :tprev<cr>
" noremap    -l         :tnext<cr>
" noremap    l           <C-]>
" noremap    ll          <C-]>

" show in preview (list option if necessary)
noremap    lp          <C-w>g}
" noremap    wl         :vsplit<cr><C-]>

"
" Switching header / source / test
"
" au BufRead,BufNewFile *.h   		nmap  sh :find %:t:r.cpp<cr>
" au BufRead,BufNewFile *.hpp 		nmap  sh :find %:t:r.cpp<cr>
" au BufRead,BufNewFile *.cpp 		nmap  sh :find %:t:r.<c-r>=g:cpp_header_ext<cr><cr>
" au BufRead,BufNewFile *.test 		nmap  sh :find %:t:r.<c-r>=g:cpp_header_ext<cr><cr>
"
" au BufRead,BufNewFile *.h   		nmap  st :find %:t:r.test<cr>
" au BufRead,BufNewFile *.hpp 		nmap  st :find %:t:r.test<cr>
" au BufRead,BufNewFile *.cpp 		nmap  st :find %:t:r.test<cr>
" au BufRead,BufNewFile *.test 		nmap  st :find %:t:r.hpp<cr>

au BufRead,BufNewFile,WinEnter *.h    nmap sh :call SeeHeader( 'cpp', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.hpp  nmap sh :call SeeHeader( 'cpp', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.cpp  nmap sh :call SeeHeader( g:cpp_header_ext, 'l')<cr>
au BufRead,BufNewFile,WinEnter *.test nmap sh :call SeeHeader( g:cpp_header_ext, 'l')<cr>

au BufRead,BufNewFile,WinEnter *.h    nmap st :call SeeHeader( 'test', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.hpp  nmap st :call SeeHeader( 'test', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.cpp  nmap st :call SeeHeader( 'test', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.test nmap st :call SeeHeader( g:cpp_header_ext, 'l')<cr>

function! SeeHeader( ext, dir )
"     let var = input( "ext: ".a:ext." dir: ".a:dir )
    let curr_buf = bufnr("%")
    if a:dir != 'none'
        exe "wincmd ".a:dir
        exe "buf " . curr_buf
    endif
    exe "find %:t:r.".a:ext
endfunction

" Deprecated
"nnoremap   ll         :call ToggleLocationList()<cr>

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Quickfix (with ToogleList.vim)
"
" - (sq) to toggle quickfix, (sqq) to toogle and move to quick fix
" - jump between next/prev entry (,q -q)
"   - (,,q) is used to jump to current error (for convenience, as I don't jump to it automatically)
" - jump between prev/next quickfix list (,sq .sq)
" - (sqe) to create a new quickfix list from the current one, without warnings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" forcing quickfix to be full width
au FileType qf   wincmd J

" let g:qf_statusline = {}
" let g:qf_statusline.before = '%<\ '
" let g:qf_statusline.after = '\ %f%=%l\/%-6L\ \ \ \ \ '
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

let g:qfenter_keymap = {}
let g:qfenter_keymap.open  = ['<CR>', '<2-LeftMouse>']
let g:qfenter_keymap.vopen = ['<Space>']
let g:qfenter_keymap.hopen = ['<Leader><CR>']
let g:qfenter_keymap.topen = ['<Leader><Tab>']

" let g:toggle_list_copen_command = 'Copen'    " to use Copen instead of copen when toggling...
" let g:toggle_list_copen_command   = 'copen'  " ...or keep using :copen to avoid overwriting :grep results
" let g:toggle_list_no_mappings     = 1        " to be able to use ',q' (I want MY mappings! ;-)
"
" nnoremap sq   :call ToggleQuickfixList()<cr>
" nnoremap sqq  :call ToggleQuickfixList()<cr><C-w><Down>
" nnoremap ,sq  :colder<cr>
" nnoremap .sq  :cnewer<cr>
" to remove warings entries
" info/text lines are kept, but ,q and .q will loop on no-warning entries
nnoremap sqe  :call setqflist(filter(getqflist(), 'v:val.type != "W"'), ' ')<cr>

nnoremap ,,q  :cc<cr>
nnoremap ,q   :cprev<cr>
nnoremap -q   :cnext<cr>
nnoremap ;q   :colder<cr>
nnoremap _q   :cnewer<cr>
nnoremap ;Q   :colder<cr>
nnoremap _Q   :cnewer<cr>
" nnoremap q,   :cprev<cr>
" nnoremap q-   :cnext<cr>

nnoremap sq<Up>       :cprev<cr>
nnoremap sq<PageUp>   :10cprev<cr>
nnoremap sq<Down>     :cnext<cr>
nnoremap sq<PageDown> :10cnext<cr>
nnoremap sq<Left>     :colder<cr>
nnoremap sq<Right>    :cnewer<cr>

" nnoremap z<Up>       :cprev<cr>
nmap     z<Up>       <Plug>(qf_qf_previous)
nnoremap z<PageUp>   :10cprev<cr>
" nnoremap z<Down>     :cnext<cr>
nmap     z<Down>     <Plug>(qf_qf_next)
nnoremap z<PageDown> :10cnext<cr>
nnoremap z<Left>     :colder<cr>
nnoremap z<Right>    :cnewer<cr>

nmap zz <Plug>(qf_qf_toggle)

" this automand is not called...? not sure way...
" autocmd QuickfixCmdPost make call setqflist(filter(getqflist(), 'v:val.type == "E"'), 'r')

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                          (VCSCommand)
"
" solving git conglicts (http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool):
" - git config merge.tool          vimdiff
" - git config merge.conflictstyle diff3
" - git config mergetool.prompt    false
"
" Then use "git mergetool [filename]"
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
"
" for all the files in the root directory:
"   1.- open a new vim with the files obtained from git/svn cmdline in tabs (swap file are annoying)
"   2.- run vcsdiff in all tabs (why the nice <C-w><Left>]c cannot be passed to the tabdo?)
"   3.- edit files freely
"   4.- once edition it's done the forked vim is closed, we return to the original vim and we refresh all our tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" open/close win-diff
" nnoremap <silent> wd     :VCSVimDiff<cr><C-w><Left>]c
nnoremap <silent> wd     :tabnew %<CR>:VCSVimDiff<cr><C-w><Left>]c
nnoremap <silent> wgd    :! vim -p $(git diff --name-only) -c "tabdo VCSVimDiff" -c "tabdo wincmd h"<cr>
nnoremap <silent> wsd    :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wdq     <C-w><Right>:bd<cr>:wq<cr>

" win-diff commands: status, revert, add, commit
nnoremap <silent> wds     :VCSStatus .<cr>
nnoremap          wdr     :VCSRevert<cr>
nnoremap          wda     :VCSAdd<cr>
nnoremap          wdc     :tabnew .<cr>:VCSCommit<cr>i

" get: all current diff
" get-line:
nnoremap <silent> do     V:diffget<cr>
nnoremap <silent> dg     :diffget<cr>
nnoremap          ,d     [c
nnoremap          -d     ]c

"
" Up    : Previous change (up)
" Down  : Next change (Down)
" Left  : Restoring original version (also works on line just under the diff)
" Right : Restoring original version, only 1 line
"
nnoremap          wd<Up>    [c
nnoremap          wd<Down>  ]c
nnoremap <silent> wd<Right> V:diffget<cr>
nnoremap <silent> wd<Left>  :diffget<cr>

" nnoremap <silent> swd    :VCSVimDiff<cr><C-w><Left>]c
" nnoremap <silent> wd     :VCSVimDiff<cr><C-w><Left>]c
" " for all the files in the root directori:
" "   1.- open a new vim with the files obtained from git/svn cmdline in tabs (swap file are annoying)
" "   2.- run vcsdiff in all tabs (why the nice <C-w><Left>]c cannot be passed to the tabdo?)
" "   3.- edit files freely
" "   4.- once edition it's done the forked vim is closed, we return to the original vim and we refresh all our tabs
" nnoremap <silent> wgd    :! vim -p $(git diff --name-only) -c "tabdo VCSVimDiff"<cr>
" nnoremap <silent> wsd    :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>
" nnoremap <silent> wds     :VCSStatus .<cr>
" nnoremap <silent> wdo     V:diffget<cr>
" nnoremap <silent> wdg     :diffget<cr>
" nnoremap <silent> wdq     <C-w><Right>:q<cr>
" nnoremap          wdr     :VCSRevert<cr>
" nnoremap          wda     :VCSAdd<cr>
" nnoremap          wdc     :tabnew .<cr>:VCSCommit<cr>i
" nnoremap          wd-     ]c
" nnoremap          wd,     [c

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       Dispatch / Build
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" build directly from any mode
nnoremap <C-b>                :Make<cr>
inoremap <C-b>           <Esc>:Make<cr>
vnoremap <C-b>           <Esc>:Make<cr>
" nnoremap <C-d>                :Dispatch!<cr>
" inoremap <C-d>           <Esc>:Dispatch!<cr>
" vnoremap <C-d>           <Esc>:Dispatch!<cr>

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Extras
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

" Drag visual blocs
vmap  <expr>  z<left>   DVB_Drag('left')
vmap  <expr>  z<right>  DVB_Drag('right')
vmap  <expr>  z<down>   DVB_Drag('down')
vmap  <expr>  z<up>     DVB_Drag('up')
vmap  <expr>  zp        DVB_Duplicate()

" passwds
if filereadable(glob('~/.vimrc.pass'))
    source ~/.vimrc.pass
"else
"    echo "Not loading vimrc.pass"
endif

" }}}
