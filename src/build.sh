install_dir=$HOME/usr
cd vim
./configure --prefix=$install_dir --enable-luainterp=yes     \
                                  --enable-perlinterp=yes    \
                                  --enable-pythoninterp=yes  \
                                  --enable-python3interp=yes \
                                  --enable-tclinterp=yes     \
                                  --enable-rubyinterp=yes    \
                                  --enable-cscope            && make && make install

cd ../tmux
./configure --prefix=$install_dir && make && make install
