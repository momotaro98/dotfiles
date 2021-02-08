#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Shintaro Ikeda <ikenshirogivenup98@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Go
export PATH=$PATH:/usr/local/go/bin
export GO15VENDOREXPERIMENT=1
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Python
export PATH=$PATH:/usr/local/opt/python/libexec/bin

# Node
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Ruby
export PATH="${HOME}/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# BIN
export PATH=$PATH:$HOME/bin

# Qiita Username
export QIITA_USERNAME=momotaro98

# For docui https://github.com/skanehira/docui
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

# GitHub CLI
eval "$(gh completion -s zsh)"

# ghq peco hub aliases
## ref: https://qiita.com/itkrt2y/items/0671d1f48e66f21241e2
alias gg='ghq get -u -p'
alias gp='cd $(ghq root)/$(ghq list --full-path | grep -v $GOPATH | cut -d "/" -f 5,6,7 | peco)'
alias gogp='cd $GOPATH/src/$(ghq list --full-path | grep $GOPATH | cut -d "/" -f 6,7,8 | peco)'
alias hgp='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# docker-compose aliases
alias up='docker-compose down; docker-compose build; docker-compose up'
alias down='docker-compose down'

# Others
## circle-ci local
alias ci='circleci build .circleci/config.yml'
## panic parse https://github.com/maruel/panicparse#if-you-have-usrbinpp-installed
alias panicparse='$GOPATH/bin/pp'

# hub alias
function git(){hub "$@"}

# For direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# Google Cloud Platform
export PATH=$PATH:$HOME/google-cloud-sdk/bin

## The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/google-cloud-sdk/path.zsh.inc'; fi

## The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then source '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `userpath` on 2020-08-17 06:41:30
export PATH="$PATH:/Users/shintaro/.local/bin"
