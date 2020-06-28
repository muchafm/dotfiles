# Detect non-interactive shells
if [[ ! $- == *i* ]]; then
  return;
fi

################################################
## ZPLUG
if [ ! -d ~/.zplug ]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

## CONFIG
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## PLUGINS
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# THEME
DEFAULT_USER=rsophie
DEFAULT_MACHINE='XPS13'

## GLOBAL VARs
export EDITOR='nvim'

## ALIASES
# Override lses
alias ls='exa'
alias ll='exa -alFh'
alias la='exa -A'

#AWS
alias aws-login='$(aws ecr get-login --no-include-email)'

#Bindkeys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

# TAR
compress () { tar cfvz $1.tgz $1 }
extract () { tar xfvz $1 }

# Navigation
alias home='cd ~'
alias knp='cd ~/Documents/Knp'
alias dotfiles='cd ~/.dotfiles'

# Git
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gs='git status'
alias gph='git push'
alias gpl='git pull'

# VIM
alias vim='nvim'

# Install packages
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi
zplug load

fpath=(~/.zsh/completion $fpath)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:$HOME/.local/bin/
