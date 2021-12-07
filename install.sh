# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. /home/$(echo $USER)/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
  nixpkgs.which `# not present in Arch` \
  nixpkgs.git \
  nixpkgs.zsh \
  nixpkgs.antibody \
  nixpkgs.stow \
  nixpkgs.tmux \
  nixpkgs.neovim \
  nixpkgs.gcc `# compiler` \
  nixpkgs.ripgrep `# for telescope.nvim` \
  nixpkgs.nodejs \
  nixpkgs.nodePackages.npm \
  nixpkgs.nodePackages.vls \
  nixpkgs.nodePackages.typescript \
  nixpkgs.nodePackages.typescript-language-server \
  nixpkgs.sumneko-lua-language-server
  # nixpkgs.nodePackages.intelephense \

# stow
stow zsh
stow tmux
stow nvim
stow git

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# source plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

## git
#######
#git config --global core.editor nvim
#git config --global color.diff always
#git config --global color.status always
#git config --global color.branch always
#git config --global color.interactive always
#git config --global user.name "Andrew Closs"
#git config --global user.email "andrewcloss@gmail.com"

# switch to shell for the current session
/home/$(echo $USER)/.nix-profile/bin/zsh

# auto-install Neovim packages
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
