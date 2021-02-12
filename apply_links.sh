#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -sf $DIR/.zshrc ~/.zprezto/runcoms/zshrc
ln -sf $DIR/.zshenv ~/.zprezto/runcoms/zshenv
# TODO: zprofile and zpreztorc files

ln -sf $DIR/.vimrc ~/.vimrc

ln -sf $DIR/.gitconfig ~/.gitconfig
ln -sf $DIR/.gitignore_global ~/.gitignore_global
ln -sf $DIR/.gitmessage.txt ~/.gitmessage.txt

ln -sf $DIR/.git_template/hooks/prepare-commit-msg ~/.git_template/hooks/prepare-commit-msg

ln -sf $DIR/.git_templates/git-secrets/hooks/commit-msg ~/.git_templates/git-secrets/hooks/commit-msg
ln -sf $DIR/.git_templates/git-secrets/hooks/pre-commit ~/.git_templates/git-secrets/hooks/pre-commit
ln -sf $DIR/.git_templates/git-secrets/hooks/pre-commit-msg ~/.git_templates/git-secrets/hooks/prepare-commit-msg
