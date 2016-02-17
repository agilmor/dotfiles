install_dir=$HOME/usr
jobs=4

cd vim
./configure --prefix=$install_dir --enable-luainterp=yes     \
                                  --enable-perlinterp=yes    \
                                  --enable-pythoninterp=yes  \
                                  --enable-python3interp=yes \
                                  --enable-tclinterp=yes     \
                                  --enable-rubyinterp=yes    \
                                  --enable-cscope            \
                                  --with-features=huge       && make -j$jobs install
cd ..

cd libevent
sh autogen.sh && ./configure --prefix=$install_dir && make -j$jobs install
cd ..

cd tmux
patch -p1 < ../select-zoomed.patch && sh autogen.sh && CFLAGS="-I$HOME/usr/include" LDFLAGS="-L$HOME/usr/lib" ./configure --prefix=$install_dir && make -j$jobs install
cd ..


echo "Add these lines to your ~/.bashrc:"
echo "export PATH=\$HOME/usr/bin:\$PATH"
echo "export LD_LIBRARY_PATH=\$HOME/usr/lib:\$LD_LIBRARY_PATH"

