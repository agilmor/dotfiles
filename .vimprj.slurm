"
" Project configuration
"

" Build: command to be run
set makeprg=make\ -C\ ../build\ -j\ cscope\ install\ install-contrib

" each project can define its headers extension (.h or .hpp)
let g:cpp_header_ext='h'
set noexpandtab
set softtabstop=8
set tabstop=8
set shiftwidth=8

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
