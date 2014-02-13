# Change default language to English
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en

# Install hub for git
git clone https://github.com/github/hub.git
cd hub
agi -y rake
sudo rake install prefix=/opt/local

# Personal profile
cd
git clone https://github.com/miludmann/my-profile
cat .bashrc my-profile/.bashrc > .bashrc_tmp
rm -f .bashrc
mv .bashrc_tmp .bashrc
ln -s my-profile/.aliases

sudo apt-get install -y zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ln -s my-profile/.zshrc
zsh

# Custom VIM
cd
git clone https://github.com/miludmann/my-vim
ln -s my-vim .vim
cd .vim
git submodule update --init --recursive
cd
ln -s .vim/.vimrc
ln -s .vim/solarize.sh

agi -y build-essential cmake
agi -y python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

# Colormake
agi -y colormake
# Htop
agi -y htop

# Compile latest VIM
agi -y ncurses-dev
agi -y python2.7-dev
agi -y mercurial
hg clone https://vim.googlecode.com/hg/ vim
cd vim
hg pull
hg update default
./configure -prefix="/opt/local" --enable-gui=auto --enable-cscope --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config --enable-sniff --enable-luainterp=yes --enable-rubyinterp=yes
make -j2
sudo make install
cd
zsh

agi -y automake
agi -y autoconf
agi -y libtool

mkdir dev



