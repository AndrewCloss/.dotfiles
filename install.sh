#!/bin/bash
ZDOTDIR=~/.config/zsh
cd "$(dirname "$0")"

# download submodule
git submodule update --init --recursive

# source the zsh config from this repo
[ -d ~/.config/zsh ] && rm -rf ~/.config/zsh
mkdir -p ~/.config
cp -rT zdotdir $ZDOTDIR

# source the .zshenv from ZDOTDIR
[ -f ~/.zshenv ] && mv -f ~/.zshenv ~/.zshenv.bak
echo ". $ZDOTDIR/.zshenv" > ~/.zshenv

# source the .p10k.zsh from ZDOTDIR
[ -f ~/.p10k.zsh ] && mv -f ~/.p10k.zsh ~/.p10k.zsh.bak
echo ". $ZDOTDIR/.p10k.zsh" > ~/.p10k.zsh

# disable sudo password prompt
sudo tee -a /etc/sudoers > /dev/null << EOT

# disable sudo password prompt
$USER ALL=(ALL) NOPASSWD: ALL
EOT

# disable docker sudo prompt
sudo groupadd docker
sudo usermod -a -G docker $USER

# install boilerplate apps
sudo apt update
sudo apt install -y zsh exa vim bat fzf ripgrep
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# start a new zsh session
zsh