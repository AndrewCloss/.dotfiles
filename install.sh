# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. /home/$(echo $USER)/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.git \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.stow \
	nixpkgs.tmux \
	nixpkgs.neovim \
	nixpkgs.exa \
	nixpkgs.unzip

# stow
stow zsh

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# source plugins
antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins.sh

# git
# git config --global user.name "Andrew Closs"
# git config --global user.email "andrewcloss@gmail.com"

# switch to shell for the current session
# /home/$(echo $USER)/.nix-profile/bin/zsh