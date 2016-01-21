"
" General options
"
set nocompatible                         " Use Vim settings, rather than Vi settings (much better!).
                                         " This must be first, because it changes other options as a side effect.

set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set backup                               " keep a backup file
set history=100                          " keep 100 lines of command line history
set ruler                                " show the cursor position all the time
set showcmd                              " show still incomplete cmdline (eg. commands in visual mode)
set incsearch                            " show first match while typing the pattern
set mouse=a                              " use mouse
set nowrap                               " avoid wrapping
set virtualedit=onemore                  " really go to EOL (see "Cursor Position" to avoid moving left when leaving insert mode)
set splitright                           " vsplit on right
set splitbelow                           " split below
set autowrite                            " automatically save changes (build without save)
set laststatus=2                         " always see the status bar (see "Coloring" to use the bar to highlight the current mode)
set showtabline=2                        " always see the tab bar (see "Coloring" to use the bar to highlight the current mode)
set textwidth=90                         " desired width limit
set colorcolumn=+1                       " to see a line to the text limit (see "Coloring", line must be almost non visible)
let &colorcolumn=join(range(91,999),",") " all the columns from the textwidth are colored as the limiting colum (how to use textwidth var?)
set nocursorline nocursorcolumn          " cursor colum and line non visible by default
set autoindent                           " autoindent
set foldmethod=syntax                    " use the syntax to decide folding 
set nofoldenable                         " disable folding by default (using tagbar is much better)
set pastetoggle=<F1>                     " remove all auto* features when pasting from X
set wildmode=longest:list                " use cmdline completion (tab) as a normal shell completion
set completeopt=menu,longest             " preview and menuone discarted
set noswapfile                           " swap files are annoying for the "wds" and "wdg"" commands, they open a new vim instance.
set autoread                             " file is reloaded if changed in a cmdline (:! whatever), very useful for "wds" and "wdg" commands
set undofile                             " for persistent undo
set nolist                               " to show special characters (F2)
set listchars=tab:>·,trail:·,eol:·       " special characters
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/
set undodir=~/.vim/tmp/
set grepprg=grep\ -n\ --exclude-dir=.svn\ $*\ /dev/null " to exclude svn/git results from search results

au FileType qf   wincmd J                " forcing quickfix to be full width 
au FileType help wincmd L                " forcing help to be vertical splitted
au FileType man  wincmd L                " forcing help to be vertical splitted

let mapleader=','                        " maybe, because the remaps, I can just use the default...?
runtime ftplugin/man.vim                 " to be able to render man pages
runtime ftplugin/vim.vim                 " to use the vim help
"set keywordprg=                          " used by 'K' (man -s), 
source $VIMRUNTIME/menu.vim              " just to have some fancy (useless?) menus with (:emenu<space><tab>)

"
" Advanced functions
"

" To be able to go to last active tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()


" Cursor position
" avoid moving to left when leaving insert mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

"
" Plugins (vundle)
"
filetype off                       " required

set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required 

" Browsing
Plugin 'scrooloose/nerdtree.git'    " file browser (not really useful... ctrlp/unite and wildmode are better?)
Plugin 'ctrlp.vim'
Plugin 'majutsushi/tagbar'          " outline window (uses its own ctag of current file only)
Plugin 'mbbill/undotree'            " visualization of the undotree as a version control (F5 -> :UndotreeToggle)
Plugin 'bufexplorer.zip'            " visualization of the buffers list
"Plugin 'vim-scripts/project.tar.gz' " project explorer (works with indexer?)
"Plugin 'vimplugin/project.vim'      " project explorer (works with indexer?) (replaced by vimprj)
"Plugin 'derekwyatt/vim-fswitch'    " (not tested, using manual setup with sh+st)

" Version Control and Project Management
Plugin 'vcscommand.vim'            " version control git+svn together
Plugin 'vitra'                     " trac integration (TTOpen)
Plugin 'Align'                     " used by vitra
Plugin 'tracwiki'                  " used by vitra

" Less typing
"Plugin 'Valloric/YouCompleteMe'     " too requieriments to be build?
"Plugin 'Shougo/neocomplete.vim'     " not semantics -> use clan_complete (see fix in advanced setup)
"Plugin 'Rip-Rip/clang_complete'     " only works for C/C++... but works great! 
Plugin 'vim-scripts/OmniCppComplete' " simpler, it uses ctags (not works in auto mode for unscoped vars)
Plugin 'mbbill/code_complete'        " for arguments and snippets
"Plugin 'vim-scripts/AutoComplPop'   " used for unescoped vars (works in automode forunscoped
"Plugin 'ervandew/supertab'         
Plugin 'matchit.zip'               " improves surroundings with more than simple characters 
                                   " maybe we should use 'runtime macros/matchit.vim' instead of a plugin?
"Plugin 'AutoClose'                " autoclosing the surroundings (not necessary with code_complete?) 
                                   " it closes the preview if line 162 (pclose) is not commented

" Async commands
Plugin 'tpope/vim-dispatch.git'    " background/async builds (how to use it for grep?) 
"Plugin 'AsyncCommand'             " background/async builds (needs vim --servername)

" Project management
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'        " .vimprj directory is source
"Plugin 'vim-scripts/indexer.tar.gz' " to generate ctags (needs servername -> done manually in .vimprj using vim-dispatch)

" More
Plugin 'milkypostman/vim-togglelist' " toggle quickfix list (ql with Copen for disapth)
Plugin 'easymotion/vim-easymotion'   " best motion ever! (see the 'see' commands)
Plugin 'rhysd/open-pdf.vim'          " pdfs (not very useful, but...)
Plugin 'kshenoy/vim-signature'       " tu visualitze marks (m?)
"Plugin 'vim-scripts/yate'           " much slower than simple :*tag
"Plugin 'bling/vim-airline'          " too fancy for me? I'll give it a second chance in a while
Plugin 'vim-scripts/YankRing.vim'

call vundle#end()                  " required
filetype plugin indent on          " restoring
"filetype plugin on                " To ignore plugin indent changes
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"

"
" Plugins Advanced Setup
"

"
" to avoid conflicts between VCSStatus and NeerdTree
"
let g:NERDTreeHijackNetrw=0 

" to use Copen instead of copen when toggling (or keep using :copen to avoid overwriting :grep results)
"let g:toggle_list_copen_command="Copen"
let g:toggle_list_copen_command="copen"

" autoclose the outline/tagbar when a selection is done
let g:tagbar_autoclose = 1

" select the correct omnifunc
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.test set omnifunc=omni#cpp#complete#Main

" to avoid conflicts between code_complete and normal omnicomplete with tab
let g:completekey = "<S-Tab>"
"let g:completekey = "<C-a>"
let g:rs = '·<'
let g:re = '>·'

" to seach on th ecurrent directory
let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_working_path_mode = 'ar'

" easymotion setup
"let g:EasyMotion_move_highlight=0
let g:EasyMotion_keys='asdghklqwertyuiopzxcvbnmfj' " defaults, without the last ';'

" pdf automatic convertion
let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

" Not showing marks by default
let g:SignatureEnabledAtStartup = 0

" Airline
let g:airline_section_y = ''
"let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#tagbar#flags = 's' 
let g:airline#extensions#wordcount#enabled = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#show_close_button = 0

" yank ring
let g:yankring_manage_numbered_reg = 1
"let  g:yankring_default_menu_mode = 3
let g:yankring_window_use_horiz    = 0  " Use vertical split
let g:yankring_window_width        = 40
let g:yankring_replace_n_pkey = '<nul>'
let g:yankring_replace_n_nkey = '<nul>'
nmap c,  :<C-U>YRReplace '-1', P<cr>
nmap c.  :<C-U>YRReplace '+1', P<cr>
nmap y,  :<C-U>YRReplace '-1', P<cr>
nmap y.  :<C-U>YRReplace '+1', P<cr>
nmap r,  :<C-U>YRReplace '-1', P<cr>
nmap r.  :<C-U>YRReplace '+1', P<cr>
nmap sy  :YRShow<cr>

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

"
" Dafult options if no project spacific (called when leaving a project, and now just for convenience)
"
let g:vimprj_changeCurDirIfVimprjFound = 1
"let g:vimprj_dirNameForSearch = '.project.vim'
function! <SID>SetMainDefaults()
 
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab               " using spaces instead of tabs
    set smarttab                " doesn't do anything...?
    set formatoptions=ronj      " auto create comment characters/leaders

    set path=.,/usr/local/include,/usr/include
    set makeprg=make 

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

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

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


function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash  = match(substr, '\/') != -1      " position of slash, if any
  let has_parent = match(substr, '(')  != -1      " position of open parenthesis, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    if ( has_parent )
"        return g:completekey                     " call code_complete for arguments
"        return "\<S-Tab>"
"       call CodeComplete() 
    else
        return "\<C-X>\<C-O>"                     " plugin matching
    endif
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"
" Filetypes
"
au BufRead,BufNewFile .vimprj		set filetype=vim
au BufRead,BufNewFile *.build		set filetype=python
au BufRead,BufNewFile *.scons		set filetype=python
au BufRead,BufNewFile *onstruct     set filetype=python
au BufRead,BufNewFile *.hpp 		set filetype=cpp.doxygen
au BufRead,BufNewFile *.test		set filetype=cpp.doxygen

"
" Coloring
"
if &t_Co > 2 || has("gui_running")  " Switch syntax highlighting on, when the terminal has colors
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
endif

"
" indentation
"
filetype plugin indent on   " Enable file type detection.
                            " Use the default filetype settings, so that mail gets 'tw' set to 72,
                            " 'cindent' is on in C files, etc.
                            " Also load indent files, to automatically do language-dependent indenting.

"
" Arrows and special keys (home, end, delete, backspace and return)
"

"shift+arrow selection
nmap <S-Up>           v<Up>
nmap <S-Down>         v<Down>
nmap <S-Left>         v<Left>
nmap <S-Right>        v<Right>
nmap <S-Home>         v<Home>
nmap <S-End>          v<End>

vmap <S-Up>            <Up>
vmap <S-Down>          <Down>
vmap <S-Left>          <Left>
vmap <S-Right>         <Right>
vmap <S-Home>          <Home>
vmap <S-End>           <End>

imap <S-Up>      <Esc>v<Up>
imap <S-Down>    <Esc>v<Down>
imap <S-Left>    <Esc>v<Left>
imap <S-Right>   <Esc>v<Right>
imap <S-Home>    <Esc>v<Home>
imap <S-End>     <Esc>v<End>

"ctrl+shift+arrow selection
nmap <C-S-Up>         v<C-Up>
nmap <C-S-Down>       v<C-Down>
nmap <C-S-Left>       v<C-Left>
nmap <C-S-Right>      v<C-Right>

vmap <C-S-Up>          <C-Up>
vmap <C-S-Down>        <C-Down>
vmap <C-S-Left>        <C-Left>
vmap <C-S-Right>       <C-Right>

imap <C-S-Up>    <Esc>v<C-Up>
imap <C-S-Down>  <Esc>v<C-Down>
imap <C-S-Left>  <Esc>v<C-Left>
imap <C-S-Right> <Esc>v<C-Right>

"ctrl+arrows movements (/todo)
nnoremap <C-Right> W

" <Home> go to first character (^) (/todo)
"t_kh <Home>      ^[[1;*H
nmap <Home> ^
"imap <Home> ^
nmap 0      ^
vmap 0      ^

" Go to insert mode directly
nnoremap <Backspace>         i<Backspace>
nnoremap <Space>             i<Space>
nnoremap <Delete>            i<Delete>
"nnoremap <Tab>               i<Tab><Esc>
"nnoremap <Return>            i<Return><Esc>
"unmap    <Return>
nnoremap <C-o>               o<Esc>
"nnoremap <C-S-o>             O<Esc>
vnoremap <Backspace> <Delete>i
vnoremap <Space>     <Delete>i<Space>
vnoremap <Delete>    <Delete>i
vnoremap <Return>    <Delete>i<Return>

vnoremap i           <Delete>i

"
" Tab to indent in all modes (and keeping the mode)
" 
"inoremap <S-Tab>     <Esc><<i
vnoremap <Tab>       >gv
vnoremap <S-Tab>     <gv
nnoremap <Tab>       >>
nnoremap <S-Tab>     <<

"
" Key bindings
"

" highlight and special characters toggle
nmap       <C-h>      :set hls!<cr>
nmap       hh         :set hls!<cr>
nnoremap   i          :nohl<cr>i
nnoremap   /          :set hls<cr>/
noremap    <F2>       :set list!<cr>

" windows & tabs
nnoremap   tn         :tabnew<cr>
nnoremap   tc         :tabclose<cr>
nnoremap   t<Right>   :tabnext<cr>
nnoremap   t<Left>    :tabprevious<cr>
nnoremap   <C-Down>   :tabnext<cr>
nnoremap   <C-Up>     :tabprevious<cr>
nnoremap   tt         :exe "tabn ".g:lasttab<CR>
nnoremap   w          <C-w>
nnoremap   w,         <C-w><Left>
nnoremap   w.         <C-w><Right>
"nnoremap   ww         <C-w><Bar>
nnoremap   ww         :tab split<cr>
nnoremap   w<C-Right> :vertical resize +20<cr>
nnoremap   w<C-Left>  :vertical resize -20<cr>
nnoremap   w<C-Up>    :resize          +10<cr>
nnoremap   w<C-Down>  :resize          -10<cr>
nnoremap   W<S-Right> <C-w>L<C-p>
nnoremap   W<S-Left>  <C-w>H<C-p>
nnoremap   W<S-Up>    <C-w>K<C-p>
nnoremap   W<S-Down>  <C-w>J<C-p>
nnoremap   w<S-Right> <C-w>L<C-p>
nnoremap   w<S-Left>  <C-w>H<C-p>
nnoremap   w<S-Up>    <C-w>K<C-p>
nnoremap   w<S-Down>  <C-w>J<C-p>
nnoremap   <Bar>      :vspl<cr>
nnoremap   -          :spl<cr>
nnoremap   ts         :tab split<cr>
nnoremap   wt         :tab split<cr>

" Motions ("see" commands)
map        s           :set hls<cr><Plug>(easymotion-sn)
map        ss          :set hls<cr><Plug>(easymotion-sn)
noremap    sf          gf
noremap    stf         <C-w>gf
noremap    svf         :vertical wincmd f<cr>
nnoremap   s,          <C-o>
nnoremap   s.          <C-i>
noremap    s<Left>     ^
noremap    s<Right>    $<Right>
map        s<Up>       <Plug>(easymotion-k)
map        s<Down>     <Plug>(easymotion-j)
noremap    s<PageUp>   gg
noremap    s<PageDown> G
noremap    sn          %
map        sl          <Plug>(easymotion-lineanywhere)
map        sa          <Plug>(easymotion-jumptoanywhere)
noremap    sc          `]
noremap    scc         `]
noremap    sc<Up>      `[
noremap    sc<Left>    `[
noremap    sc<Down>    `]
noremap    sc<Right>   `]
noremap    sc,         g;
noremap    sc.         g,
"map        sn          <Plug>(easymotion-next)
"map        sm          <Plug>(easymotion-prev)
" marks
map        sm          `
"map        smm         :SignatureToggleSigns<cr>
map        smm         :SignatureListMarks<cr>
" quick fix (location list? sl is for line...?)
nnoremap   sq          :call ToggleQuickfixList()<cr>
nnoremap   sqq         :call ToggleQuickfixList()<cr><C-w><Down>
nnoremap   sq,         :cprev<cr>
nnoremap   sq.         :cnext<cr>
nnoremap   q,          :colder<cr>
nnoremap   q.          :cnewer<cr>
"nnoremap   ll         :call ToggleLocationList()<cr>
" vimdiff
nnoremap   sd.         ]c
nnoremap   sd,         [c
" outline/tagbar
nnoremap   so         :TagbarToggle<cr>
" exploring file
nnoremap   se         :NERDTreeToggle<cr>
" buffer exploring
nnoremap   sb         :BufExplorer<cr>
" vimproj
noremap    sp         :vspl .vimprj<cr>
noremap    svim       :vspl ~/.vimrc<cr>
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

" undotree
nnoremap   su         :UndotreeToggle<cr>
" registers
noremap    sr         :registers<cr>
noremap    ry         "ry
noremap    rd         "rd
noremap    rp         "rp
noremap    rP         "rP
" tags/links
noremap    sl         :tag 
nnoremap   sll        <C-]>
noremap    swl        :vert stag 
noremap    swll       :vsplit<cr><C-]>
"noremap    stt        g<C-]>
noremap    sl,        :tprev<cr>
noremap    sl.        :tnext<cr>
noremap    l,         :tprev<cr>
noremap    l.         :tnext<cr>
nnoremap   l           <C-]>
nnoremap   wl          :vsplit<cr><C-]>

" to go to the end of a pasted text (maybe its better to use normal paste and `] when really needed?)
"nnoremap   p          gp
"vnoremap   p          gp
"nnoremap   P          gP
"vnoremap   P          gP
"nnoremap   gp         `[

" Folding
nnoremap   zz         :set foldenable!<cr>

" Undos (i'm very lazzy and I never use the original U concept (line undo))
nnoremap   U          <C-r>
nnoremap   <C-u>      U

" swaping visual modes
"nnoremap   v          V
"nnoremap   V          v


" diff mappings
" just for current file
nnoremap <silent> swd    :VCSVimDiff<cr><C-w><Left>]c
nnoremap <silent> wd     :VCSVimDiff<cr><C-w><Left>]c
" for all the files in the root directori: 
"   1.- open a new vim with the files obtained from git/svn cmdline in tabs (swap file are annoying)
"   2.- run vcsdiff in all tabs (why the nice <C-w><Left>]c cannot be passed to the tabdo?) 
"   3.- edit files freely
"   4.- once edition it's done the forked vim is closed, we return to the original vim and we refresh all our tabs
nnoremap <silent> wgd    :! vim -p $(git diff --name-only) -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wsd    :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wds     :VCSStatus .<cr>
nnoremap <silent> wdo     V:diffget<cr>
 noremap <silent> wdg     :diffget<cr>
nnoremap <silent> wdq     <C-w><Right>:q<cr>
nnoremap          wdr     :VCSRevert<cr>
nnoremap          wda     :VCSAdd<cr>
nnoremap          wdc     :tabnew .<cr>:VCSCommit<cr>i
nnoremap          wd.     ]c
nnoremap          wd,     [c

" build directly from any mode
nnoremap <C-b>                :Make<cr>
inoremap <C-b>           <Esc>:Make<cr>
vnoremap <C-b>           <Esc>:Make<cr>
nnoremap <C-d>                :Dispatch!<cr>
inoremap <C-d>           <Esc>:Dispatch!<cr>
vnoremap <C-d>           <Esc>:Dispatch!<cr>

" registers
nnoremap r "
vnoremap r "

" autocomplete
imap     <C-a>           <C-x><C-o>
"imap     <C-a>           <C-r>=CodeComplete()<cr><C-r>=SwitchRegion()<cr>
"imap     <C-a>           <C-r>=CodeComplete()<cr>

"
" Switching header / source / test
"
"au BufRead,BufNewFile *.hpp 		nmap  sh :exe 'tag '.expand('%:t:r').'.cpp'<cr>
"au BufRead,BufNewFile *.cpp 		nmap  sh :exe 'tag '.expand('%:t:r').'.hpp'<cr>
"
"au BufRead,BufNewFile *.hpp 		nmap  st :exe 'tag '.expand('%:t:r').'.test'<cr>
"au BufRead,BufNewFile *.test 		nmap  st :exe 'tag '.expand('%:t:r').'.hpp'<cr>

au BufRead,BufNewFile *.hpp 		nmap  sh :find %:t:r.cpp<cr>
au BufRead,BufNewFile *.cpp 		nmap  sh :find %:t:r.hpp<cr>

au BufRead,BufNewFile *.hpp 		nmap  st :find %:t:r.test<cr>
au BufRead,BufNewFile *.test 		nmap  st :find %:t:r.hpp<cr>

" Paste from clipboard not working
"nnoremap cp "*p 
"set clipboard=unnamedplus " conflict with YankRing?

"
" Commenting blocks of code
"
let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "cpp.doxygen": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "conf": '#',
    \   "sh": '#',
    \   "vim": '"',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            execute "silent s/^" . comment_leader . "//"
        else
            " Comment the line
            execute "silent s/^/" . comment_leader . "/"
        endif
    else
        echo "No comment leader found for filetype"
    end
endfunction
nmap cc :call ToggleComment()<cr>
vmap cc :call ToggleComment()<cr>

" passwds
if filereadable(glob('~/.vimrc.pass'))
    source ~/.vimrc.pass
"else
"    echo "Not loading vimrc.pass"
endif

function! ToggleOmniCppComplete()
    if g:OmniCpp_MayCompleteDot == 1
        let g:OmniCpp_MayCompleteDot   = 0
        let g:OmniCpp_MayCompleteArrow = 0
        let g:OmniCpp_MayCompleteScope = 0
"        execute "AcpDisable"
    else
        let g:OmniCpp_MayCompleteDot   = 1
        let g:OmniCpp_MayCompleteArrow = 1
        let g:OmniCpp_MayCompleteScope = 1
"        execute "AcpEnable"
    endif
endfunction

nmap ba :call ToggleOmniCppComplete()<cr>

"call ToggleOmniCppComplete()  " disable autocomplete by default

function! ToggleYCMComplete()
    if g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui=0
    else
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui=1
    endif
endfunction

nmap ycm :call ToggleYCMComplete()<cr>

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

" pdf (finally using a better plugin)
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"
" Advanced setup
"

" Remove any trailing whitespace that is in the file
"autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

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
