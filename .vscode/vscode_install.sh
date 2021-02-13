#!/bin/sh

echo "Starting symbolic link setting"

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "${VSCODE_SETTING_DIR}/settings.json"
ln -s "${SCRIPT_DIR}/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "${VSCODE_SETTING_DIR}/keybindings.json"
ln -s "${SCRIPT_DIR}/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

## Snippets
for filename in snippets/*.json; do
  # $filename is like "snippets/python.json"
  rm "${VSCODE_SETTING_DIR}/${filename}"
  ln -s "${filename}" "${VSCODE_SETTING_DIR}/${filename}"
done

echo "Finished symbolic link setting"


echo "Starting installing extensions"

if ! command -v code &> /dev/null
then
  echo "VSCode 'code' command is not found. Install it in VSCode Command Palette (⇧⌘P) then type 'Shell Command: install'"
  exit
fi

cat extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions

echo "Finished installing extensions"