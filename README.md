# Dotfiles

> A sample shell config using ZSH.

## Aliases

```
# single character aliases
alias _=sudo
alias l=ls
alias g=git

# git
alias ga=git add .
alias gs=git status
alias gc=git checkout
alias gcb=git checkout -b
alias gca=git commit --amend

# more ways to ls
alias la="ls -lah"
alias ldot='ls -ld .*'

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'
```

## What's included

A sample antidote `.zsh_plugins.txt` file that bundles plugins with the following plugin provided features:
- Better Zsh defaults
- [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [History substring searching](https://github.com/zsh-users/zsh-history-substring-search)
- [Syntax highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- <kbd>TAB</kbd> completions
- The popular [Powerlevel10k prompt](https://github.com/romkatv/powerlevel10k) with a baked-in config
- A few goodies from [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
- A `functions` directory for lazy-loaded functions
- Lots of [helpful plugins](https://github.com/unixorn/awesome-zsh-plugins)!

## Installation
Run `./install.sh`