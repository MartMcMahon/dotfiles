# Dotfiles
a repo of Mart's various configs

## Installation
```shell
git clone git@github.com:MartMcMahon/dotfiles.git
```
then copy what you need to ~
###### e.g.:
```shell
cp .zshrc ~
cp .vimrc ~
```

you'll need [vim-plug](https://github.com/junegunn/vim-plug) for installing the plugins in the most easy way
###### for regular vim
```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

###### Neovim
```shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

start vim and install those bad boys!
```shell
:PlugInstall
```

all done!

## Wait! What if I'm using windows?
sux 2 suck
