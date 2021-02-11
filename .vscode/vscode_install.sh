#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# snippets
SNIPPETS_DIR=$SCRIPT_DIR/snippets
VSCODE_SNIPPETS_DIR=$VSCODE_SETTING_DIR/snippets
# TODO: for loop for all of languages snippets json files
rm "$VSCODE_SNIPPETS_DIR/go.json"
ln -s "$SNIPPETS_DIR/go.json" "${VSCODE_SNIPPETS_DIR}/go.json"

# install extention
cat extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions
