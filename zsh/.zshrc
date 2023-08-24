# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is loaded
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETE=true

# The following lines were added by compinstall
zstyle :compinstall filename '/home/$(echo $USER)/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# source plugins
# source ~/.zsh_plugins.sh
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
antibody bundle romkatv/powerlevel10k

# aliases
alias sudo='sudo '
alias vim='nvim'
alias pa='php artisan'
alias ls="exa --color=always --icons --group-directories-first"
# alias ls='ls -al'

if [ -e /home/$(echo $USER)/.nix-profile/etc/profile.d/nix.sh ]; then . /home/$(echo $USER)/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
# End of lines configured by zsh-newuser-install

function greet {
  local RED='\033[0;31m'
  local WHITE='\033[1;37m'
  echo -e "${WHITE}              人  工  知  能  や  ロ  ボ  ッ  ト  エ  学              "
  echo -e "${RED}####    ####       ###     ####      #### ####    #####      ###"
  echo -e "${RED}####    ####      #####    #####     #### ####   #####      #####"
  echo -e "${RED}####    ####     #######   ######    #### ####  ####       #######"
  echo -e "${RED}############    #### ####  #######   #### ########        #### ####"
  echo -e "${RED}############   ####   #### ########  #### #########      ####   ####"
  echo -e "${RED}####    ####  ####     ######## #### #### ##### #####   ####     ####"
  echo -e "${RED}####    #### ####       #######  ######## ####   ##### ####       ####"
  echo -e "${RED}####    ########         ######   ####### ####    ########         ####"
  echo -e "${WHITE}       R       O       B       O       T       I       C       S      "
  echo -e "\n"
}
clear
greet

# Automatically start tmux on remote server when logging in via SSH
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  # This command creates a tmux session called ssh_tmux if none exists, 
  # or reattaches to a already existing session with that name. 
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

# suppress locale that sometimes appears
LC_CTYPE=en_US.UTF-5
LC_ALL=en_US.UTF-5

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -e /home/andrew/.nix-profile/etc/profile.d/nix.sh ]; then . /home/andrew/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
