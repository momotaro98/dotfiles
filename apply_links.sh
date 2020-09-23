#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -sf $DIR/.git_template/hooks/prepare-commit-msg ~/.git_template/hooks/prepare-commit-msg
