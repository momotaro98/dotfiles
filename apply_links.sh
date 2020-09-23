#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -sf $DIR/.git_template/hooks/prepare-commit-msg ~/.git_template/hooks/prepare-commit-msg

ln -sf $DIR/.git_templates/git-secrets/hooks/commit-msg ~/.git_templates/git-secrets/hooks/commit-msg
ln -sf $DIR/.git_templates/git-secrets/hooks/pre-commit ~/.git_templates/git-secrets/hooks/pre-commit
ln -sf $DIR/.git_templates/git-secrets/hooks/pre-commit-msg ~/.git_templates/git-secrets/hooks/prepare-commit-msg
