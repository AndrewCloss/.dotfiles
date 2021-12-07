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
source ~/.zsh_plugins.sh

# aliases
alias sudo='sudo '
alias vim='nvim'
alias pa='php artisan'
alias ls='ls -al'

# Swap escape with caps lock
# setxkbmap -option caps:swapescape

if [ -e /home/$(echo $USER)/.nix-profile/etc/profile.d/nix.sh ]; then . /home/$(echo $USER)/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
# End of lines configured by zsh-newuser-install

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OLD
#####

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#fpath=($fpath "/home/developer/.zfunctions")
#autoload -U promptinit; promptinit
#prompt spaceship

## SPACESHIP_CHAR_SYMBOL=☯
## SPACESHIP_CHAR_SYMBOL=♞
#SPACESHIP_CHAR_SYMBOL=λ
#SPACESHIP_CHAR_SUFFIX=" "
#SPACESHIP_PROMPT_ORDER=(
#  time          # Time stamps section
#  # user          # Username section
#  dir           # Current directory section
#  # host          # Hostname section
#  git           # Git section (git_branch + git_status)
#  # hg            # Mercurial section (hg_branch  + hg_status)
#  # package       # Package version
#  # node          # Node.js section
#  # ruby          # Ruby section
#  # elixir        # Elixir section
#  # xcode         # Xcode section
#  # swift         # Swift section
#  # golang        # Go section
#  # php           # PHP section
#  # rust          # Rust section
#  # haskell       # Haskell Stack section
#  # julia         # Julia section
#  # docker        # Docker section
#  # aws           # Amazon Web Services section
#  # gcloud        # Google Cloud Platform section
#  # venv          # virtualenv section
#  # conda         # conda virtualenv section
#  # pyenv         # Pyenv section
#  # dotnet        # .NET section
#  # ember         # Ember.js section
#  # kubectl       # Kubectl context section
#  # terraform     # Terraform workspace section
#  # exec_time     # Execution time
#  line_sep      # Line break
#  # battery       # Battery level and status
#  # vi_mode       # Vi-mode indicator
#  # jobs          # Background jobs indicator
#  # exit_code     # Exit code section
#  char          # Prompt character
#)

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


##alias nvimconfig='nvim $HOME/personal/dotfiles/init.vim'

#export VISUAL='nvim'
#export EDITOR='nvim'
#export GIT_EDITOR='nvim'

## For when usins an appimage
##alias vim="$HOME/personal//nvim.appimage"
##alias nvim="$HOME/personal/nvim.appimage"
##export VISUAL='$HOME/personal/nvim.appimage'
##export EDITOR='$HOME/personal/nvim.appimage'
##export GIT_EDITOR='$HOME/personal/nvim.appimage'

#if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
#   tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
#fi

## https://www.reddit.com/r/zsh/comments/eblqvq/del_pgup_and_pgdown_input_in_terminal/fb7337q?utm_source=share&utm_medium=web2x&context=3
## If NumLock is off, translate keys to make them appear the same as with NumLock on.
#bindkey -s '^[OM' '^M'  # enter
#bindkey -s '^[Ok' '+'
#bindkey -s '^[Om' '-'
#bindkey -s '^[Oj' '*'
#bindkey -s '^[Oo' '/'
#bindkey -s '^[OX' '='

## If someone switches our terminal to application mode (smkx), translate keys to make
## them appear the same as in raw mode (rmkx).
#bindkey -s '^[OH' '^[[H'  # home
#bindkey -s '^[OF' '^[[F'  # end
#bindkey -s '^[OA' '^[[A'  # up
#bindkey -s '^[OB' '^[[B'  # down
#bindkey -s '^[OD' '^[[D'  # left
#bindkey -s '^[OC' '^[[C'  # right

## TTY sends different key codes. Translate them to regular.
#bindkey -s '^[[1~' '^[[H'  # home
#bindkey -s '^[[4~' '^[[F'  # end

#autoload -Uz up-line-or-beginning-search
#autoload -Uz down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search

#bindkey '^?'      backward-delete-char          # bs         delete one char backward
#bindkey '^[[3~'   delete-char                   # delete     delete one char forward
#bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
#bindkey '^[[F'    end-of-line                   # end        go to the end of line
#bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
#bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
#bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
#bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
#bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
#bindkey '^[[D'    backward-char                 # left       move cursor one char backward
#bindkey '^[[C'    forward-char                  # right      move cursor one char forward
#bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history
#bindkey '^[[B'    down-line-or-beginning-search # down       next command in history

#function work_in_progress() {
#    git commit --no-verify -m "WIP - $1"
#  }
#alias "wip"="work_in_progress"

if [ -e /home/andrewc/.nix-profile/etc/profile.d/nix.sh ]; then . /home/andrewc/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
