# Change default language to English
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en

cd

# Install hub for git
git clone https://github.com/github/hub.git
cd hub
sudo apt-get install -y rake
sudo rake install prefix=/opt/local
sudo apt-get install -y rbenv curl

# Personal profile
cd
git clone https://github.com/miludmann/my-profile
cat .bashrc my-profile/.bashrc > .bashrc_tmp
rm -f .bashrc
mv .bashrc_tmp .bashrc
ln -s my-profile/.aliases
ln -s my-profile/.gitconfig
ln -s my-profile/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

sudo apt-get install -y zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ln -s my-profile/.zshrc
source .zshrc

# Custom VIM
cd
git clone https://github.com/miludmann/my-vim
ln -s my-vim .vim
cd .vim
git submodule update --init --recursive
cd
ln -s .vim/.vimrc
ln -s .vim/solarize.sh

# Install YCM with clang
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev
# Add the following in your /etc/apt/sources.list
#deb http://llvm.org/apt/precise/ llvm-toolchain-precise main
#deb-src http://llvm.org/apt/precise/ llvm-toolchain-precise main
#deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu precise main
sudo apt-get update
sudo apt-get install -y libclang-3.5-dev
sudo ln -s /usr/lib/llvm-3.5/lib/libclang.so /usr/lib/
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang

# Colormake
sudo apt-get install -y colormake
# Htop
sudo apt-get install -y htop

# Compile latest VIM
sudo apt-get install -y ncurses-dev
sudo apt-get install -y python2.7-dev
sudo apt-get install -y mercurial
hg clone https://vim.googlecode.com/hg/ vim
cd vim
hg pull
hg update default
./configure -prefix="/opt/local" --enable-gui=auto --enable-cscope --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config --enable-sniff --enable-luainterp=yes --enable-rubyinterp=yes --with-features=huge
make -j2
sudo make install
cd
source .zshrc

sudo apt-get install -y automake
sudo apt-get install -y autoconf
sudo apt-get install -y libtool

mkdir -p dev

sudo apt-get install -y tig
