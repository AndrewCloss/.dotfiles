# clone this project
[ -d ~/.config/zsh ] && rm -rf ~/.config/zsh
ZDOTDIR=~/.config/zsh
git clone --branch main https://github.com/AndrewCloss/zdotdir $ZDOTDIR

# source the .zshenv from ZDOTDIR
[ -f ~/.zshenv ] && mv -f ~/.zshenv ~/.zshenv.bak
echo ". $ZDOTDIR/.zshenv" > ~/.zshenv

# source the .p10k.zsh from ZDOTDIR
[ -f ~/.p10k.zsh ] && mv -f ~/.p10k.zsh ~/.p10k.zsh.bak
echo ". $ZDOTDIR/.p10k.zsh" > ~/.p10k.zsh

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

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
sudo apt install -y zsh exa unzip vim
sudo apt -y autoremove

# git
git config --global user.name "Andrew Closs"
git config --global user.email "andrewcloss@gmail.com"

# start a new zsh session
zsh