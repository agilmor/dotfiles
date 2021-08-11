#  sudo apt-get build-dep vim-gtk
#  sudo apt-get install python-dev gcc g++ make automake cmake scons bear build-essential libncurses5-dev libevent-dev libpango1.0-dev  golang cscope byacc libclang-12-dev
#  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev    libcairo2-dev libx11-dev libxpm-dev libxt-dev # for +clientserver of vim
#  sudo apt-get install compton xclip unclutter numlockx
#  sudo gem install tmuxinator

os_filename="/etc/os-release"
if [ -f $os_filename ]; then
    source $os_filename
    os_codename=$ID-$VERSION_ID
else
    os_codename=`lsb_release -a 2>/dev/null | grep Codename | awk '{print $2}'`
fi
install_dir=$HOME/usr-$os_codename
jobs=4

cd vim
./configure --prefix=$install_dir --enable-luainterp=yes     \
                                  --enable-perlinterp=yes    \
                                  --enable-pythoninterp=yes  \
                                  --enable-python3interp=yes \
                                  --enable-tclinterp=yes     \
                                  --enable-rubyinterp=yes    \
                                  --enable-cscope            \
                                  --enable-gui               \
                                  --with-x                   \
                                  --with-features=huge       \
                                  &&                         \
                                  make -j$jobs install
cd ..
# To get the helptags
vim --cmd 'helptags $VIMRUNTIME/doc' --cmd 'qall'

cd ../.vim/bundle/YouCompleteMe
./install.py --clang-completer --system-libclang
cd -

cd libevent
sh autogen.sh && ./configure --prefix=$install_dir && make -j$jobs install
cd -

cd tmux
sh autogen.sh && CFLAGS="-I$HOME/usr/include" LDFLAGS="-L$HOME/usr/lib" ./configure --prefix=$install_dir && make -j$jobs install
cd -

#go get -u github.com/odeke-em/drive/cmd/drive
go get -u github.com/ncw/rclone
rsync -av $install_dir/src/github.com/ncw/rclone/rclone.1 $install_dir/share/man/man1/

echo "Add these lines to your ~/.bashrc:"
echo "export PATH=\$HOME/usr/bin:\$PATH"
echo "export LD_LIBRARY_PATH=\$HOME/usr/lib:\$LD_LIBRARY_PATH"

