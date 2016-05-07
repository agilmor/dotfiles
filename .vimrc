""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       General options (set)                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                   " Use Vim settings, rather than Vi settings (much better!).
                                   " This must be first, because it changes other options as a side effect.

set encoding=utf-8                 " to avoid problems woth listchars
set backspace=indent,eol,start     " allow backspacing over everything in insert mode
set backup                         " keep a backup file
set history=100                    " keep 100 lines of command line history
set ruler                          " show the cursor position all the time
set showcmd                        " show still incomplete cmdline (eg. commands in visual mode)
set incsearch                      " show first match while typing the pattern
set mouse=a                        " use mouse
set ttymouse=sgr                   " to be able to use mouse on vim borders when vim is run over tmux
set nowrap                         " avoid wrapping
set virtualedit=onemore            " really go to EOL (see "Cursor Position" to avoid moving left when leaving insert mode)
set splitright                     " vsplit on right
set splitbelow                     " split below
set autowrite                      " automatically save changes (build without save)
set laststatus=2                   " always see the status bar (see "Coloring" to use the bar to highlight the current mode)
set showtabline=2                  " always see the tab bar (see "Coloring" to use the bar to highlight the current mode)
set textwidth=120                  " desired width limit
set colorcolumn=+1                 " to see a line to the text limit (see "Coloring", line must be almost non visible)
set nocursorline nocursorcolumn    " cursor colum and line non visible by default
set autoindent                     " autoindent
set foldmethod=syntax              " use the syntax to decide folding 
set nofoldenable                   " disable folding by default (using tagbar is much better)
set pastetoggle=<F1>               " remove all auto* features when pasting from X
set scrolloff=15                   " to scroll before first/last line
set sidescrolloff=10               " to scroll before first/last character in a line
set sidescroll=1                   " to scroll a signle character horizontally
set wildmode=longest:list          " use cmdline completion (tab) as a normal shell completion
set completeopt=menu,longest       " preview and menuone discarted
set noswapfile                     " swap files are annoying for the "wds" and "wdg"" commands, they open a new vim instance.
set autoread                       " file is reloaded if changed in a cmdline (:! whatever), very useful for "wds" and "wdg" commands
set undofile                       " for persistent undo
set ignorecase                     " to search case insesitive
set smartcase                      " to search case insesitive, unless using an upper case
set listchars=tab:>·,trail:·,eol:· " special characters
set nolist                         " to not visualize special special characters (see 'listchars'), use <F3> to toggle
set whichwrap=b,s,<,>,[,]          " to move line up/down with left/right at the begin/end of a line
set nobackup                       " no backup files, we should use git/svn always, and we have the persistent undo
set noswapfile                     " no swap files, we should use git/svn always, and we have the persistent undo
set undodir=~/.vim/tmp/            " location of the undo directory
"set keywordprg=                   " used by 'K' (man -s), 
set grepprg=grep\ -n\ --exclude-dir=.svn\ $*\ /dev/null " to exclude svn/git results from search results

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  General options (non-set) and annoyances                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let &colorcolumn=join(range(91,999),",") " all the columns from the textwidth are colored as the limiting colum (how to use textwidth var?)
let mapleader=','                  " maybe, because the remaps, I can just use the default...?
runtime ftplugin/man.vim           " to be able to render man pages
runtime ftplugin/vim.vim           " to use the vim help
source $VIMRUNTIME/menu.vim        " just to have some fancy (useless?) menus with (:emenu<space><tab>)

let g:lasttab = 1                         " Code to be able to go to 
au TabLeave * let g:lasttab = tabpagenr() " last active tab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins list (vundle)                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off                                 " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim            " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'                " let Vundle manage Vundle, required

" Browsing
Plugin 'scrooloose/nerdtree.git'             " file browser (not really useful... ctrlp/unite and wildmode are better?)
Plugin 'ctrlp.vim'
Plugin 'majutsushi/tagbar'                   " outline window (uses its own ctag of current file only)
Plugin 'mbbill/undotree'                     " visualization of the undotree as a version control (F5 -> :UndotreeToggle)
Plugin 'bufexplorer.zip'                     " visualization of the buffers list
" Plugin 'derekwyatt/vim-fswitch'            " (not tested, using manual setup with sh+st)

" Version Control and Project Management
Plugin 'vcscommand.vim'                      " version control git+svn together
" Plugin 'vitra'                               " trac integration (TTOpen) (removed to avoid loading problems with EMCommand)
Plugin 'Align'                               " used by vitra
Plugin 'tracwiki'                            " used by vitra

" Less typing
" Plugin 'Valloric/YouCompleteMe'            " too requieriments to be build?
" Plugin 'Shougo/neocomplete.vim'            " not semantics -> use clan_complete (see fix in advanced setup)
" Plugin 'Rip-Rip/clang_complete'            " only works for C/C++... but works great!
Plugin 'vim-scripts/OmniCppComplete'         " simpler, it uses ctags (not works in auto mode for unscoped vars)
Plugin 'mbbill/code_complete'                " for arguments and snippets
" Plugin 'vim-scripts/AutoComplPop'          " used for unescoped vars (works in automode forunscoped
" Plugin 'ervandew/supertab'                 " to complex, homade function is simpler and enough
Plugin 'matchit.zip'                         " improves surroundings with more than simple characters
                                             " maybe we should use 'runtime macros/matchit.vim' instead of a plugin?
" Plugin 'AutoClose'                         " autoclosing the surroundings (not necessary with code_complete?)
                                             " it closes the preview if line 162 (pclose) is not commented

" Plugin 'tpope/vim-commentary'              " I don't like the commenting style for C/C++, and only works for lines
Plugin 'tomtom/tcomment_vim'                 " add the comment action (gc -> cm) for motions and text objects

" Async commands
Plugin 'tpope/vim-dispatch.git'              " background/async builds (how to use it for grep?)
" Plugin 'AsyncCommand'                      " background/async builds (needs vim --servername)

" Project management
Plugin 'vim-scripts/DfrankUtil'              " needed by vimprj
Plugin 'vim-scripts/vimprj'                  " .vimprj directory is source
" Plugin 'vim-scripts/indexer.tar.gz'        " to generate ctags (needs servername -> done manually with .vimprj + vim-dispatch)

" More
Plugin 'milkypostman/vim-togglelist'         " toggle quickfix list (ql with Copen for disapth)

" Easy motions
Plugin 'easymotion/vim-easymotion'           " best motion ever!
Plugin 'haya14busa/vim-easyoperator-line'    " use 2 easymotions to define a range of lines (y,d,v operators only)
Plugin 'haya14busa/vim-easyoperator-phrase'  " use 2 easymotions to define a range between chars (y,d,v only)
Plugin 'haya14busa/incsearch.vim'            " necessary dependency
Plugin 'haya14busa/incsearch-easymotion.vim' " necessary dependency
Plugin 'haya14busa/incsearch-fuzzy.vim'      " fuzzy motion (only for 'around' mode)

" Plugin 'rhysd/open-pdf.vim'                " pdfs (not very useful, but...)
Plugin 'kshenoy/vim-signature'               " tu visualitze marks (smm)
" Plugin 'vim-scripts/yate'                  " much slower than simple :*tag
" Plugin 'bling/vim-airline'                 " too fancy for me? I'll give it a second chance in a while...
" Plugin 'vim-scripts/YankRing.vim'  "replaced by easyclip?
Plugin 'tpope/vim-repeat'                    " needed dependency (surround, abolish, and easy-clip)
Plugin 'svermeulen/vim-easyclip'             " much better yank, cut, delete and rotating paste

Plugin 'tpope/vim-surround'                  " defines surroundings as text objects (yank surroundings mean 'add' them)

" Languages
Plugin 'ekalinin/Dockerfile.vim'             " dockerfile syntax

Plugin 'blueyed/vim-diminactive'             " to dim the inactive window
" Plugin 'vim-scripts/ZoomWin'               " to zoom in/out a window (buggy?)
" Plugin 'tmux-plugins/vim-tmux-focus-events' " it fires some error...?

" Plugin 'vim-scripts/visualrepeat'            " used easy-align
Plugin 'junegunn/vim-easy-align'             " adding the align operator (al)
" Plugin 'tommcdo/vim-lion'                  " cannot right-align the first column?

Plugin 'tpope/vim-abolish'                   " adding snake/camel/mixed/upper case control in the iw and with :S
Plugin 'tommcdo/vim-exchange'                " to add the cx operator

call vundle#end()                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        File Types                                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType qf   wincmd J " forcing quickfix to be full width
au FileType help wincmd L " forcing help to be vertical splitted
au FileType man  wincmd L " forcing man to be vertical splitted

filetype plugin indent on " Enable file type detection.
                          " Use the default filetype settings, so that mail gets 'tw' set to 72,
                          " 'cindent' is on in C files, etc.
                          " Also load indent files, to automatically do language-dependent indenting.

"
" Known extensions
"
au BufRead,BufNewFile .vimprj		set filetype=vim 
au BufRead,BufNewFile *.build		set filetype=python
au BufRead,BufNewFile *.scons		set filetype=python
au BufRead,BufNewFile *onstruct     set filetype=python
au BufRead,BufNewFile *.hpp 		set filetype=cpp.doxygen
au BufRead,BufNewFile *.test		set filetype=cpp.doxygen

"
" Matchit is not working properly on my setup for C/C++?
" (should be in share/.../ftplugin/c.vim)
"
au FileType c,cpp let b:match_words='\%(\<else\s\+\)\@<!\<if\>:\<else\s\+if\>:\<else\%(\s\+if\)\@!\>,\<switch\>:\<case\>:\<default\>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins configuration                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" tcomment
"
let g:tcommentMapLeaderOp1 = 'cm'        " use 'cm' instead of 'gc'
let g:tcommentOptions      = {'col': 1}  " line comments on the first column

"
" NERDTree
"
let g:NERDTreeHijackNetrw=0             " to avoid conflicts between VCSStatus and NeerdTree

"
" ToggleList
"
" let g:toggle_list_copen_command='Copen' " to use Copen instead of copen when toggling...
let g:toggle_list_copen_command='copen' " ...or keep using :copen to avoid overwriting :grep results

"
" Tagbar
"
let g:tagbar_autoclose = 1              " autoclose the outline/tagbar when a selection is done

"
" OmniComplete
"
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.test set omnifunc=omni#cpp#complete#Main " select the correct omnifunc

let g:completekey = '<S-Tab>'           " code_complete: to avoid conflicts with normal omnicomplete with tab
" let g:completekey = '<C-a>'
let g:rs = '·<'                         " arguments separators
let g:re = '>·'

"
" CtrlP
"
let g:ctrlp_working_path_mode = 'a'     " to search on the ecurrent directory
" let g:ctrlp_working_path_mode = 'ar'

"
" Signature
"
let g:SignatureEnabledAtStartup = 0  " not showing marks by default


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           OmniCppComplete                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " auto open/close the popup menu/preview windows

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                            EasyClip                                                                  "
"                                                                                                                      "
" - two new operators: cut (x) and replace (r)                                                                         "
" - action after pasting: rotate yanks (,y) (.y) (not persistent)                                                      "
" - action before pasting: rotate yanks (,ry) and (.ry) (persistent)                                                   "
" - interactive pasting: (yp) and (YP)                                                                                 "
" - toggle auto-format after paste (F2) or (,yf)                                                                       "
" - paste on insert and command modes with <C-v> (see EMCommandLineNoreMap for search mode)                            "
" - see the list of available yanks (sy)                                                                               "
"                                                                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" EasyClip - Options
"
let g:EasyClipUseGlobalPasteToggle            =   0 " to be able to use my maps (<F1>)
let g:EasyClipUsePasteToggleDefaults          =   0 " to be able to use my maps (,y and .y)
let g:EasyClipUseCutDefaults                  =   0 " to be able to use my maps (x)
let g:EasyClipUseSubstituteDefaults           =   0 " to be able to use my maps (r)
let g:EasyClipUseYankDefaults                 =   1 " default yanks are ok (y)
let g:EasyClipUsePasteDefaults                =   1 " default paste are ok (p)
let g:EasyClipAlwaysMoveCursorToEndOfPaste    =   1 " to move to end of paste (C-o or ,j to go back)
let g:EasyClipAutoFormat                      =   1 " to enable auto-format (EasyClipToggleFormattedPaste to remove format)
let g:EasyClipShareYanks                      =   0 " probably not a good option to enable...?
let g:EasyClipCopyExplicitRegisterToDefault   =   1 " paste last yanked even if it was saved to a register
let g:EasyClipPreserveCursorPositionAfterYank =   1 " not move my cursor!
let g:EasyClipShowYanksWidth                  = 120 " we have bigger screens!
let g:EasyOperator_phrase_do_mapping          =   0 " to be able to have fuzzysearch

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
nmap .y    <Plug>EasyClipSwapPasteBackwards

nmap ,ry   <Plug>EasyClipRotateYanksForward
nmap .ry   <Plug>EasyClipRotateYanksBackward

nmap yp    :IPaste<cr>
nmap YP    :IPasteBefore<cr>

nmap <F2>  <Plug>EasyClipToggleFormattedPaste<cr>
nmap ,yf   <Plug>EasyClipToggleFormattedPaste<cr>

imap <C-v> <Plug>EasyClipInsertModePaste
cmap <C-v> <Plug>EasyClipCommandModePaste

nmap sy    :Yanks<cr>

"
" EasyClip - Functions
"
" The following functions are/should be part of the plugin?
" They are used in the fuzzy search map (_)
function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {
                \     "\<CR>": '<Over>(easymotion)'
                \   },
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                            EasyMotions                                                               "
"                                                                                                                      "
" - replacing operators t, f (g), b, e
" - replacing search system / (-), n, N and *
"   - * is added just to be able to use n/N after *
" - replacing <C-Arrows> (word motions) (also in insert mode)                                                          "
" - fast access to easymotions with arrows also for v, x, r, cm, al(i) and cx                                          "
"                                                                                                                      "
" Issues:                                                                                                              "
" - lineforward is not inclusive?                                                                                      "
" - ge includes the current char and the target                                                                        "
" - fuzzy search only works on the visible scrren                                                                      "
" - new * doesn't always go to the next (if not in present in the screen), it needs an extra n keytroke
"                                                                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" EasyMotion - Opetions
"
let g:EasyMotion_enter_jump_first = 1                            " quick selection
let g:EasyMotion_space_jump_first = 0                            " to be able to use space as target key
let g:EasyMotion_use_upper        = 1                            " for better readeability
" let g:EasyMotion_keys             = 'asdghklqwertyuiopzxcvbnmfj' " defaults, without the last ';'
let g:EasyMotion_keys             = 'ASDFQWERTZXCVBGLOKIJMNP '   " only left hand keys, and last for the right
let g:Easymotion_startofline      = 0                            " to be able to move to eol and sol
" let g:EasyMotion_smartcase = 1                                 " case insenitive (using normal ignorecas+smartcase)

"
" EasyMotion - Maps
"
map  t                 <Plug>(easymotion-bd-t)
map  f                 <Plug>(easymotion-bd-f)

map  b                 <Plug>(easymotion-bd-w)
map  bb                <Plug>(easymotion-bd-w)
map  b<Right>          <Plug>(easymotion-w)
map  b<Left>           <Plug>(easymotion-b)

map  e                 <Plug>(easymotion-bd-e)
map  ee                <Plug>(easymotion-bd-e)
map  e<Right>          <Plug>(easymotion-e)
map  e<Left>           <Plug>(easymotion-ge)

map  <expr> _          incsearch#go(<SID>config_easyfuzzymotion())
map  -                 <Plug>(easymotion-sn)
map  /                 <Plug>(easymotion-sn)
map  N                 <Plug>(easymotion-prev)
map  n                 <Plug>(easymotion-next)
nmap *                 yiw<Plug>(easymotion-sn)<C-v><cr><cr>

map  <C-Right>         <Plug>(easymotion-lineforward)
map  <C-Left>          <Plug>(easymotion-linebackward)
map  <C-Up>            <Plug>(easymotion-k)
map  <C-Down>          <Plug>(easymotion-j)
map  <C-Up><C-Up>      <Plug>(easymotion-k)
map  <C-Down><C-Down>  <Plug>(easymotion-j)
map  <C-Up><C-Left>    <Plug>(easymotion-sol-k)
map  <C-Down><C-Left>  <Plug>(easymotion-sol-j)
map  <C-Up><C-Right>   <Plug>(easymotion-eol-k)
map  <C-Down><C-Right> <Plug>(easymotion-eol-j)

imap <C-Right>         <Esc><Plug>(easymotion-lineforward)
imap <C-Left>          <Esc><Plug>(easymotion-linebackward)
imap <C-Up><C-Up>      <Esc><Plug>(easymotion-k)
imap <C-Down><C-Down>  <Esc><Plug>(easymotion-j)
imap <C-Up><C-Left>    <Esc><Plug>(easymotion-sol-k)
imap <C-Down><C-Left>  <Esc><Plug>(easymotion-sol-j)
imap <C-Up><C-Right>   <Esc><Plug>(easymotion-eol-k)
imap <C-Down><C-Right> <Esc><Plug>(easymotion-eol-j)

nmap y<Up>             y<Plug>(easymotion-k)
nmap y<Down>           y<Plug>(easymotion-j)
nmap y<Right>          y<Plug>(easymotion-lineforward)
nmap y<Left>           y<Plug>(easymotion-linebackward)
nmap yr                <Plug>(easyoperator-line-yank)
nmap yb                <Plug>(easyoperator-phrase-yank)

nmap d<Up>             d<Plug>(easymotion-k)
nmap d<Down>           d<Plug>(easymotion-j)
nmap d<Right>          d<Plug>(easymotion-lineforward)
nmap d<Left>           d<Plug>(easymotion-linebackward)
nmap dr                <Plug>(easyoperator-line-delete)
nmap db                <Plug>(easyoperator-phrase-delete)

nmap c<Up>             c<Plug>(easymotion-k)
nmap c<Down>           c<Plug>(easymotion-j)
nmap c<Right>          c<Plug>(easymotion-lineforward)
nmap c<Left>           c<Plug>(easymotion-linebackward)

nmap x<Up>             x<Plug>(easymotion-k)
nmap x<Down>           x<Plug>(easymotion-j)
nmap x<Right>          x<Plug>(easymotion-lineforward)
nmap x<Left>           x<Plug>(easymotion-linebackward)

nmap cx<Up>            cx<Plug>(easymotion-k)
nmap cx<Down>          cx<Plug>(easymotion-j)
nmap cx<Right>         cx<Plug>(easymotion-lineforward)
nmap cx<Left>          cx<Plug>(easymotion-linebackward)

nmap r<Up>             r<Plug>(easymotion-k)
nmap r<Down>           r<Plug>(easymotion-j)
nmap r<Right>          r<Plug>(easymotion-lineforward)
nmap r<Left>           r<Plug>(easymotion-linebackward)

nmap v<Up>             v<Plug>(easymotion-k)
nmap v<Down>           v<Plug>(easymotion-j)
nmap v<Right>          v<Plug>(easymotion-lineforward)
nmap v<Left>           v<Plug>(easymotion-linebackward)
nmap vr                <Plug>(easyoperator-line-select)
nmap vb                <Plug>(easyoperator-phrase-select)

nmap cm<Up>            cm<Plug>(easymotion-k)
nmap cm<Down>          cm<Plug>(easymotion-j)
nmap cm<Right>         cm<Plug>(easymotion-lineforward)
nmap cm<Left>          cm<Plug>(easymotion-linebackward)
nmap cmm               cmc

nmap al<Up>            al<Plug>(easymotion-k)
nmap al<Down>          al<Plug>(easymotion-j)
nmap al<Right>         al<Plug>(easymotion-lineforward)
nmap al<Left>          al<Plug>(easymotion-linebackward)

nmap ali<Up>           al<Plug>(easymotion-k)
nmap ali<Down>         al<Plug>(easymotion-j)
nmap ali<Right>        al<Plug>(easymotion-lineforward)
nmap ali<Left>         al<Plug>(easymotion-linebackward)

" nmap       fwl         :DimInactiveOff<cr><Plug>(easymotion-overwin-line)
" nmap       fwa         :DimInactiveOff<cr><Plug>(easymotion-overwin-w)

"
" EasyMotion - AutoCommands
"
au VimEnter,BufEnter * :EMCommandLineNoreMap <C-v> <C-r>0 " to be able to paste on easymotion command with <C-v>
                                                          " as we do on imap and cmap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   EasyAlign                                                          "
" - new al{opts}{delimiter} operator
"   - opts are:
"     - <Enter> to switch right/left/center alignment *before* the operator
"     - 1,2... or * to specify which delimiters we want to align
"     - there are extra options that can be configured with some <C- > keystrokes
"       - :help easy-align-alignment-options-in-interactive-mode
"
" - ali operator is the same, but adds a preview and an extra confirmation of the delimiter
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

xmap al  <Plug>(EasyAlign)
nmap al  <Plug>(EasyAlign)

xmap ali <Plug>(LiveEasyAlign)
nmap ali <Plug>(LiveEasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               VimPrj                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimprj_changeCurDirIfVimprjFound = 1  " always change the current dir to the dir where the .vimprj file is
let g:cpp_header_ext='hpp'                  " each project can define its headers extension (.h or .hpp)

"
" Reload .vimprj just after writing ist
"
autocmd BufWritePost .vimprj source .vimprj

"
" Function to define the dafult options 
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              Coloring                                                                "
"                                                                                                                      "
" Issues                                                                                                               "
" - should I use guicolorscheme or CSApprox?                                                                           "
"                                                                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &t_Co > 2 || has("gui_running")  
    " Also switch on highlighting the last used search pattern.
    syntax on

    set term=xterm-256color                                 " must be also set in tmux!
    set t_ut=''                                             " avoid conflict in with BackgroundColorErase tmux (does it force bg color?)
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

    au InsertEnter * hi StatusLine  term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi VertSplit   term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi TabLineFill term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi TabLineSel  term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi Title       term=reverse ctermbg=Black ctermfg=Red 
    au InsertLeave * hi StatusLine  term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi VertSplit   term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi TabLineFill term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi TabLineSel  term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi Title       term=reverse ctermbg=Black ctermfg=White 


    "    hi link EasyMotionTarget        ErrorMsg
    "    hi link EasyMotionShade         Comment
    "    hi link EasyMotionTarget2First  MatchParen
    "    hi link EasyMotionTarget2Second MatchParen
    hi link EasyMotionMoveHL        Search

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              Tab Completion                                                          "
"                                                                                                                      "
" - visual and normal mode: indentation
" - insert mode: manual selection between normal tab, file completion, omnicomplete and existing text complete         "
"                                                                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
nnoremap <Tab>   >>
nnoremap <S-Tab> <<

inoremap <Tab>   <C-r>=Smart_TabComplete()<CR>

function! Smart_TabComplete()

    let line = getline('.')                       " current line
    let substr = strpart(line, -1, col('.'))      " from the start of the current
    " line to one character right
    " of the cursor
    "  return substr
    let substr = matchstr(substr, "[^ \t]*$")     " word till cursor
    if (strlen(substr)==0)                        " nothing to match on empty string
        return "\<tab>"
    endif
    let has_word   = strlen(substr)      !=  0 
    let has_period = match(substr, '\.') != -1    " position of period, if any
    let has_slash  = match(substr, '\/') != -1    " position of slash, if any
    let has_parent = match(substr, '(')  != -1    " position of open parenthesis, if any
    if (has_word)
        if     ( has_slash )
            return "\<C-X>\<C-F>"                 " file completion
        elseif ( has_period )
            return "\<C-X>\<C-O>"                 " omni-complete
        elseif ( has_parent )
            "        return g:completekey         " arguments completion (not working?)
            "        return "\<S-Tab>"
            "       call CodeComplete() 
            return "\<tab>"                             
        else
            return "\<C-X>\<C-P>"                 " existing text completion
        endif
    else
        return "\<tab>"                           " no-completion, just a tab
    endif

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Indentation                                                                "
"                                                                                                                      "
" - indentations as text objects: (ii) and (ai)                                                                        "
"                                                                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

function! s:IndTxtObj(inner)
    let curline = line(".")
    let lastline = line("$")
    let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
    let i = i < 0 ? 0 : i
    if getline(".") !~ "^\\s*$"
        let p = line(".") - 1
        let nextblank = getline(p) =~ "^\\s*$"
        while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
            -
            let p = line(".") - 1
            let nextblank = getline(p) =~ "^\\s*$"
        endwhile
        normal! 0V
        call cursor(curline, 0)
        let p = line(".") + 1
        let nextblank = getline(p) =~ "^\\s*$"
        while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
            +
            let p = line(".") + 1
            let nextblank = getline(p) =~ "^\\s*$"
        endwhile
        normal! $
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Fixing Annoyances                                                          "
"                                                                                                                      "
" - not moving cursor when leaving insert mode
" - <S+Arrows> to go directly to visual (<C-v>)
"   - as this is the prefered method to go to Visual, remapping z Z <C-Z> as v V <C-V> for convenience in visual mode
" - scrolling with <C-PageUp/Down>
" - direct access to insert mode with space, del, backspace and return                                                 "
" - <C-o> to add empty lines                                                                                           "
"
" Issues
" - <C-O> not working?
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Not moving cursor when leaving insert mode
"
let CursorColumnI = 0                                                               " 
au InsertEnter  * let CursorColumnI = col('.')                                      " Code to avoid moving left when 
au CursorMovedI * let CursorColumnI = col('.')                                      " leaving the insert mode
au InsertLeave  * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif "

"
" Arrows and special keys (home, end, delete, backspace and return)
"
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

" mapping z to v for convenience
vmap z v
vmap Z V
vmap <C-z> <C-v>

"
" scrolling
"
nnoremap <C-PageUp>    <C-Y>
nnoremap <C-PageDown>  <C-E>

"
" Go to insert mode directly
"
" - <Enter> goes to insert mode directly, except in some windows
"
nnoremap <Backspace>         i<Backspace>
nnoremap <Space>             i<Space>
nnoremap <Delete>            i<Delete>
nnoremap <Enter>             i<Enter>

vnoremap <Backspace> <Delete>i
vnoremap <Space>     <Delete>i<Space>
vnoremap <Delete>    <Delete>i
vnoremap <Return>    <Delete>i<Return>
vnoremap i           <Delete>i

au FileType qf,undotree,nerdtree,tagbar au BufEnter <buffer> unmap <Enter>
au FileType qf,undotree,nerdtree,tagbar au BufLeave <buffer> nmap  <Enter> i<Enter>

nnoremap <C-o>               o<Esc>
" nnoremap <C-O>               O<Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Windows/Layout                                                             "
"
" - w in normal mode is <C-w> (using <C-arrows> and easymotion for words-navigation)
" - w<S-Arrows> for changing layout (forcing a window/pane to be on one side)
" - w<C-Arrows> to resize (almonst not used?)
" - w<PageUp/Down> for tab navigation
" - ,w and ,t for previous window and tab
" - ww to zoom on a window
" Issues
" - zoom on a window right now is open it in a new tab
"   - ZoomWin is buggy?
"   - normal resize is also buggy when used for qf or non normal windows/panes?
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Highlight and special characters toggle
"
map        hh         :set hls!<cr>
noremap    <F3>       :set list!<cr>

"
" Windows/Panes
"
nnoremap w           <c-w>
nnoremap ,w          <c-w>p
nnoremap ww          :tab split<cr>
nnoremap w<c-right>  :vertical resize +20<cr>
nnoremap w<c-left>   :vertical resize -20<cr>
nnoremap w<c-up>     :resize          +10<cr>
nnoremap w<c-down>   :resize          -10<cr>
nnoremap w<s-right>  <c-w>l<c-p>
nnoremap w<s-left>   <c-w>h<c-p>
nnoremap w<s-up>     <c-w>k<c-p>
nnoremap w<s-down>   <c-w>j<c-p>
nnoremap w<pagedown> :tabnext<cr>
nnoremap w<pageup>   :tabprevious<cr>

"
" Tabs
"
nnoremap wt          :tabnew<cr>
nnoremap wo          :tabnew<cr>
nnoremap wn          :tabnew<cr>
nnoremap wc          :tabclose<cr>
nnoremap ,t          :exe "tabn ".g:lasttab<CR>

"
" Deprecated
"
"nnoremap   ww         :ZoomWin<cr>
"nnoremap   ww         <C-w><Bar>
" nnoremap   <Bar>      :vspl<cr>
" nnoremap   -          :spl<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   Abolish                                                            "
"                                                                                                                      "
" - adding the pseudo-operator cnc{style} (change-naming-convention)
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

nmap cncs crs
nmap cncc crm
nmap cncm crc
nmap cncu cru

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   See commands                                                       "
"                                                                                                                      "
" - see into files (sf), into a tab (stf) or in a vsplit (svf)
" - jumps (sj) (,j) (.j)
" - changes (sc) (,c) (.c)
" - buffers (sb) (,b) (.b) (sbb) to switch-last (sba) see all
" - marks
"   - using (M) to set a mark (few times) and (m) to jump to it (more times)
"   - using Signature plugin to list marks: (sm) for a interactive list (swm) on the windowa
" - quickfix
"   - jump between next/prev entry (,q .q)
"   - jump between prev/next quickfix list (,sq .sq)
" - file explorer (se), buffers (sb), undo tree (su), and outline pane (so)
" - vimprj (sprj) and vimrc (svim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open files
noremap  sf   gf
noremap  stf  <C-w>gf
noremap  svf  :vertical wincmd f<cr>

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

" nnoremap sj   :jumps<cr>
nmap     sj :call GotoJump()<CR>
nnoremap ,j   <C-o>
nnoremap .j   <C-i>
nnoremap ,s   <C-o>
nnoremap .s   <C-i>

" changes
noremap  sc   :changes<cr>
noremap  ,c   g;
noremap  .c   g,

" marks
nnoremap sm   :SignatureListMarks<cr>
map      swm  :SignatureToggleSigns<cr>
noremap  M    m
noremap  m    `
nnoremap dM   :delmarks

" quick fix
nnoremap sq   :call ToggleQuickfixList()<cr>
nnoremap sqq  :call ToggleQuickfixList()<cr><C-w><Down>
nnoremap ,sq  :cprev<cr>
nnoremap .sq  :cnext<cr>
nnoremap ,q   :colder<cr>
nnoremap .q   :cnewer<cr>

" outline/tagbar
nnoremap so   :TagbarToggle<cr>

" exploring file
nnoremap se   :NERDTreeToggle<cr>

" buffer exploring
nnoremap sb   :BufExplorer<cr>
nnoremap sbb  :b#<cr>
nnoremap sba  :vertical ba<cr>
nnoremap ,b   :bprevious<cr>
nnoremap .b   :bnext<cr>


" vimproj and vimrc
noremap  sp   :vspl .vimprj<cr>
noremap  sprj :vspl .vimprj<cr>
noremap  svim :vspl ~/.vimrc<cr>


" undotree
nnoremap su   :UndotreeToggle<cr>

" registers
noremap  sr   :registers<cr>

" tags/links
noremap    sl         :tjump /<C-r><C-w><cr>
noremap    sll        <C-]>
noremap    swl        :vert :stjump /<C-r><C-w><cr>
noremap    swll       :vsplit<cr><C-]>
"noremap    stt        g<C-]>
noremap    ,l         :tprev<cr>
noremap    .l         :tnext<cr>
noremap    l           <C-]>
noremap    ll          <C-]>
" noremap    wl         :vsplit<cr><C-]>

"
" Switching header / source / test
"
au BufRead,BufNewFile *.h   		nmap  sh :find %:t:r.cpp<cr>
au BufRead,BufNewFile *.hpp 		nmap  sh :find %:t:r.cpp<cr>
au BufRead,BufNewFile *.cpp 		nmap  sh :find %:t:r.<c-r>=g:cpp_header_ext<cr><cr>
au BufRead,BufNewFile *.test 		nmap  sh :find %:t:r.<c-r>=g:cpp_header_ext<cr><cr>

au BufRead,BufNewFile *.h   		nmap  st :find %:t:r.test<cr>
au BufRead,BufNewFile *.hpp 		nmap  st :find %:t:r.test<cr>
au BufRead,BufNewFile *.cpp 		nmap  st :find %:t:r.test<cr>
au BufRead,BufNewFile *.test 		nmap  st :find %:t:r.hpp<cr>

" Deprecated
" map      sm  `
"nnoremap   ll         :call ToggleLocationList()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                          (VCSCommand)                                                               "
" for all the files in the root directori: 
"   1.- open a new vim with the files obtained from git/svn cmdline in tabs (swap file are annoying)
"   2.- run vcsdiff in all tabs (why the nice <C-w><Left>]c cannot be passed to the tabdo?) 
"   3.- edit files freely
"   4.- once edition it's done the forked vim is closed, we return to the original vim and we refresh all our tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open/close win-diff
nnoremap <silent> wd     :VCSVimDiff<cr><C-w><Left>]c
nnoremap <silent> wgd    :! vim -p $(git diff --name-only) -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wsd    :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wdq     <C-w><Right>:q<cr>

" win-diff commands: status, revert, add, commit
nnoremap <silent> wds     :VCSStatus .<cr>
nnoremap          wdr     :VCSRevert<cr>
nnoremap          wda     :VCSAdd<cr>
nnoremap          wdc     :tabnew .<cr>:VCSCommit<cr>i

" get: all current diff
" get-line: 
nnoremap <silent> do     V:diffget<cr>
nnoremap <silent> dl     V:diffget<cr>
nnoremap <silent> dg     :diffget<cr>
nnoremap          ,d     ]c
nnoremap          .d     [c

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
" nnoremap          wd.     ]c
" nnoremap          wd,     [c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Dispatch                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" build directly from any mode
nnoremap <C-b>                :Make<cr>
inoremap <C-b>           <Esc>:Make<cr>
vnoremap <C-b>           <Esc>:Make<cr>
nnoremap <C-d>                :Dispatch!<cr>
inoremap <C-d>           <Esc>:Dispatch!<cr>
vnoremap <C-d>           <Esc>:Dispatch!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Extras                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" to be able to use . in other maps but keep fast repeat
noremap .. .
" to quickly add (delay added by the 'al'ign maps/operator
nnoremap aa a

" sudo write
cmap w!! w !sudo tee % >/dev/null
au VimEnter * vertical ba
noremap    <F6>       :source ~/.vimrc<cr>
nmap k %

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
map    sn          %

" Undos (i'm very lazzy and I never use the original U concept (line undo))
nnoremap   U          <C-r>
nnoremap   <C-u>      U


" registers
nnoremap R "
vnoremap R "


" switching to normal mode (<C-k>)
set cedit=<C-k>
inoremap <C-k>  <C-o>


" Direct paste from clipboard not working
"nnoremap cp "*p 
"set clipboard=unnamedplus " conflict with YankRing?
" set clipboard+=unnamed   " conflict ith EasyClip and unnecessary?


" passwds
if filereadable(glob('~/.vimrc.pass'))
    source ~/.vimrc.pass
"else
"    echo "Not loading vimrc.pass"
endif


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

nnoremap <C-n> :call NumberToggle()<cr>
nnoremap wn    :call NumberToggle()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Deprecated Setup                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! ToggleYCMComplete()
"     if g:ycm_auto_trigger == 1
"         let g:ycm_auto_trigger = 0
"         let g:ycm_show_diagnostics_ui=0
"     else
"         let g:ycm_auto_trigger = 1
"         let g:ycm_show_diagnostics_ui=1
"     endif
" endfunction
" nmap ycm :call ToggleYCMComplete()<cr>

" never used?
" function! ToggleOmniCppComplete()
"     if g:OmniCpp_MayCompleteDot == 1
"         let g:OmniCpp_MayCompleteDot   = 0
"         let g:OmniCpp_MayCompleteArrow = 0
"         let g:OmniCpp_MayCompleteScope = 0
" "        execute "AcpDisable"
"     else
"         let g:OmniCpp_MayCompleteDot   = 1
"         let g:OmniCpp_MayCompleteArrow = 1
"         let g:OmniCpp_MayCompleteScope = 1
" "        execute "AcpEnable"
"     endif
" endfunction
" nmap ba :call ToggleOmniCppComplete()<cr>
"
"call ToggleOmniCppComplete()  " disable autocomplete by default

"
" Commenting blocks of code (replaced by tcomment)
"
" let s:comment_map = {
"     \   "c": '\/\/',
"     \   "cpp": '\/\/',
"     \   "cpp.doxygen": '\/\/',
"     \   "go": '\/\/',
"     \   "java": '\/\/',
"     \   "javascript": '\/\/',
"     \   "php": '\/\/',
"     \   "python": '#',
"     \   "ruby": '#',
"     \   "conf": '#',
"     \   "sh": '#',
"     \   "make": '#',
"     \   "Dockerfile": '#',
"     \   "vim": '"',
"     \ }
"
" Replaced by tcomment to have a new action to work with motions and text objects
" function! ToggleComment()
"     if has_key(s:comment_map, &filetype)
"         let comment_leader = s:comment_map[&filetype]
"         if getline('.') =~ "^" . comment_leader
"             " Uncomment the line
"             execute "silent s/^" . comment_leader . "//"
"         else
"             " Comment the line
"             execute "silent s/^/" . comment_leader . "/"
"         endif
"     else
"         echo "No comment leader found for filetype"
"     end
" endfunction
" nmap cm :call ToggleComment()<cr>
" vmap cm :call ToggleComment()<cr>

" autocomplete
"unmap     <C-a>
"imap     <C-a>           <C-x><C-o>
"imap     <C-a>           <C-r>=CodeComplete()<cr><C-r>=SwitchRegion()<cr>
"imap     <C-a>           <C-r>=CodeComplete()<cr>

" Folding
" nnoremap   zz         :set foldenable!<cr>

" noremap    <F5>       :source .vimprj<cr>

"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

" noremap    s<Left>     ^
" noremap    s<Right>    $<Right>
" map        s<Up>       <Plug>(easymotion-k)
" map        s<Down>     <Plug>(easymotion-j)


" on search commands (too hard to me?)
" cnoremap <C-f>y <CR>:t''<CR>
" cnoremap <C-f>s <CR>:m''<CR>
" cnoremap <C-f>d <CR>:d<CR>''
"
" nnoremap <C-f>y :t''<CR>
" nnoremap <C-f>s :m''<CR>
" nnoremap <C-f>d :d<CR>''

" nnoremap   i          :nohl<cr>i
"nnoremap   /          :set hls<cr>/
" nnoremap   /          /

" <Home> go to first character (^) (/todo)
"t_kh <Home>      ^[[1;*H
" nmap <Home> ^
"imap <Home> ^
" nmap 0      ^
" vmap 0      ^

"ctrl+arrows movements (http://stackoverflow.com/a/6528201/5349914)
" function! <SID>GotoPattern(pattern, dir) range
"     let g:_saved_search_reg = @/
"     let l:flags = "We"
"     if a:dir == "b"
"         let l:flags .= "b"
"     endif
"     for i in range(v:count1)
"         call search(a:pattern, l:flags)
"     endfor
"     let @/ = g:_saved_search_reg
" endfunction
"
" "nnoremap <C-Right> w
" "nnoremap <C-Left>  b
" nnoremap <silent> <C-Right> :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9]', 'f')<cr>
" nnoremap <silent> <C-Left>  :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9]', 'b')<cr>
" vnoremap <silent> <C-Right> :<C-U>let g:_saved_search_reg=@/<cr>gv/\(^\\|\<\)[A-Za-z0-9]<cr>:<C-U>let @/=g:_saved_search_reg<cr>gv
" vnoremap <silent> <C-Left>  :<C-U>let g:_saved_search_reg=@/<cr>gv?\(^\\|\<\)[A-Za-z0-9]<cr>:<C-U>let @/=g:_saved_search_reg<cr>gv

" map <silent> <C-Right><C-Right> <Plug>(easymotion-lineforward)<cr>
" map <silent> <C-Left><C-Left>   <Plug>(easymotion-linebackward)<cr>

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ CTRL-X CTRL-O
"function! s:check_back_space() "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

"function! SuperCleverTab()
"    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        if &omnifunc != ''
"            return "\<C-X>\<C-O>"
"        elseif &dictionary != ''
"            return "\<C-K>"
"        else
"            return "\<C-N>"
"        endif
"    endif
"endfunction
"
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"
" to use TAB for autocomplete
" 
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ neocomplete#start_manual_complete()
"function! s:check_back_space() "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

" to use longest completeopt with supertab
"let g:SuperTabLongestEnhanced = 1

" the (exuberant-)ctags command
"ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src

"
" To avoid conflicts between neocomplete and clang_complete
"
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.c =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:neocomplete#force_omni_input_patterns.objc =
"      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
"let g:neocomplete#force_omni_input_patterns.objcpp =
"      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 0
"let g:clang_default_keymappings = 0
""let g:clang_use_library = 1

" " Airline
" let g:airline_section_y = ''
" "let g:airline#extensions#branch#use_vcscommand = 1
" let g:airline#extensions#tagbar#flags = 's' 
" let g:airline#extensions#wordcount#enabled = 1 
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" let g:airline#extensions#tabline#show_close_button = 0

" yank ring
" let g:yankring_manage_numbered_reg = 1
" "let  g:yankring_default_menu_mode = 3
" let g:yankring_window_use_horiz    = 0  " Use vertical split
" let g:yankring_window_width        = 40
" let g:yankring_replace_n_pkey = '<nul>'
" let g:yankring_replace_n_nkey = '<nul>'

" Remove any trailing whitespace that is in the file
"autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Improving paste
" nmap       sy          :YRShow<cr>
" nmap       y,          :<C-U>YRReplace '-1', P<cr>
" nmap       y.          :<C-U>YRReplace '+1', P<cr>
" " noremap    y<Left>     `[
" " noremap    y<Right>    `]
" nnoremap   S           diw"0P "using easyclip?

" TODOs
" - browse/search (ctrlp/unite)
" - nerdtree + git + svn
" - surround?
" - jumps vs buffers (how to use the lists?) (bufexplorer?)
" - ctrl-i == tab
" - ctrl-s/q?
" - autoindent/format with gw or gq (numbered list) 
" - words delimiters (for ctrl+right/left)
" - move to the end of paste -> done with gp
" - ifdef
" - folding -> outline/tagbar is better
" - https://github.com/jimeh/tmuxifier
" NOTES:
" - build in background (using tmux) (vim dispatch)
" - autocomments -> formatoptions
" - autocomplete
"   - test it on ImagePlus
"   - test neocomplete + snippets
"   - test VimCompletesMe (and ctags/exuberant tags?)
"   - gccsense?
" - line numbers (wn toggles)
" - change colors in insert mode -> InsertEnter InsertLeave autocmds
" - spell
" - surrounds % -> gs / gvs (hi MatchParen)
" - gdb?
" - wildmode -> like a shell
" - align code with Tabular(ize), and use t* as remaps
" - autoclose surroundings (AutoClose)
" - outline: tagbar -> autoclose option?
" - using marks (vim-signature vs gm)
" - refactor
" - ctags, indexer (autocomplte)
" - why after . cursor is moved?
" - VimOrganizer for emcas org files?
" - use lmake and lgrep to have several concurrent list? (ie. use location list instead of quickfix list?
"     - this has sense if we add the "project" concept on vim, and we tie each list to a "project"... 
" - I should use ~/.ctags file?
" - marks are shown at startup?
" - ctags < cscope < gtags 
" - integration with R Vim-R-plugin
" - neovim
" - vimcasts.org
"
"
"
" Vimium
"# Home/End/PageUp/PageDown not working?
"
"# unmaps
"unmap t
"
"# arrow keys
"map <Up> scrollUp
"map <Down> scrollDown
"map <Right> nextTab
"map <Left> previousTab
"map <A-Left> moveTabLeft
"map <A-Right> moveTabRight
"map <A-Up> firstTab
"map <A-Down> lastTab
"map <S-Left> moveTabLeft
"map <S-Right> moveTabRight
"
"map s<Up> scrollToTop
"map s<Down> scrollToBottom
"
"# links selection
"map sa LinkHints.activateMode
"map L LinkHints.activateMode
"map l LinkHints.activateModeToOpenInNewTab
"map <A-l> LinkHints.activateModeWithQueue
"
"# marks
"map sm Marks.activateGotoMode
"map , goBack
"map . goForward
"map s, goPrevious
"map s. goNext
"
"# search
"map <C-p> Vomnibar.activate
"#map sw Vomnibar.activate
"map sw Vomnibar.activateInNewTab
"map st Vomnibar.activateTabSelection
"map ss enterFindMode
"
"map su Vomnibar.activateEditUrl
"map sU Vomnibar.activateEditUrlInNewTab
"
"# tabs
"map q removeTab
"map Q restoreTab
"map tp togglePinTab
"map tr restoreTab
"map u restoreTab
"map tn createTab
