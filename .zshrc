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

# Python
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# golang
export GO15VENDOREXPERIMENT=1
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ruby
export PATH="${HOME}/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# Qiita Username
export QIITA_USERNAME=momotaro98

# ghq peco hub aliases
## ref: https://qiita.com/itkrt2y/items/0671d1f48e66f21241e2
alias gp='cd $(ghq root)/$(ghq list --full-path | grep -v $GOPATH | cut -d "/" -f 5,6,7 | peco)'
alias gogp='cd $GOPATH/src/$(ghq list --full-path | grep $GOPATH | cut -d "/" -f 6,7,8 | peco)'
alias hgp='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# hub alias
function git(){hub "$@"}

# ssh alias

## sakura VPS
alias sakura1='ssh ikeda@160.16.209.16'