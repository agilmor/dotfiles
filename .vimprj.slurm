"
" Project configuration
"

" Build: command to be run
set makeprg=bear\ --append\ -o\ ./compile_commands.json\ make\ -O\ -C\ ../build\ -j6\ cscope\ install\ install-contrib

" each project can define its headers extension (.h or .hpp)
let g:cpp_header_ext='h'
set noexpandtab
set softtabstop=8
set tabstop=8
set shiftwidth=8
set textwidth=80
set cinoptions=t0         " don't outdent function return types
set cinoptions+=:0        " no extra indentation for case labels
set cinoptions+=g0        " no extra indentation for "public", "protected", "private" labels
set cinoptions+=(0        " line up function args
set formatoptions=croqlnt " c: autowrap comments on textwidth
                          " r: autoinsert comment leader on <Enter>
                          " o: autoinsert comment leader on <o> or <O>
                          " q: allow formatting of comments with gq
                          " l: long lines are not broken in insert mode
                          " n: recognize numbered lists
                          " t: autowrap using textwidth
set copyindent            " use previous indent


" Tags and CScope: used autocomplete and code search
"set tags =.vimprj.tag
"set tags+=/usr/local/include/boost/.tag

" cscope add .vimprj.cscope
cscope add ../build/cscope.out
" cscope add /usr/local/etc/ctags/qt/5.7.cscope

" Paths: file search
set path+=$PWD/**
" set path+=$PWD/../build
"set path+=modules
"set path+=.,/usr/local/include,/usr/include

" Man: documentation
"let $MANPATH='doc/man:'

" Autocmds: actions to be done in background
let g:myvimprj = 'true' " this line is mandatory if you add commands
augroup myvimprj

  "
  " Tags creation
  "
"  autocmd BufWritePost * :Start! ctags-exuberant -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ --tag-relative=no -f .vimprj.tag include/

  "
  " Add cscope db
  "
  autocmd ShellCmdPost * :cscope reset
  "cscope -b  -k -R; cscope-indexer -r -v
"   autocmd BufWritePost * :Start! cscope -b -R -f .vimprj.cscope -s ./
"   autocmd BufWritePost * :cs kill .vimprj.cscope
"   autocmd BufWritePost * :cs add .vimprj.cscope

"   autocmd BufWritePost * :Start! cscope -b -R -f .vimprj.cscope -s slurm/ | cs kill .vimprj.cscope | :cs add .vimprj.cscope
"     autocmd BufWritePost * :Start! cscope -b -R -f .vimprj.cscope
"     autocmd BufWritePost * :cs kill                .vimprj.cscope
"     autocmd BufWritePost * :cs add                 .vimprj.cscope
augroup END
