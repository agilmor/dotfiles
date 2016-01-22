cd vim
./configure --prefix=$HOME/usr --enable-luainterp=yes --enable-perlinterp=yes --enable-pythoninterp=yes --enable-python3interp=yes --enable-tclinterp=yes --enable-rubyinterp=yes --enable-cscope 
make && make install
