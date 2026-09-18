#!/bin/bash

set -euo pipefail

if [[ -z $DOTFILES_DIR ]]; then
  echo "[ERROR] DOTFILES_DIR variable is not defined"
  exit 1
fi

if [[ ! -f $DOTFILES_DIR/exports.zsh ]]; then
  echo "[WARNING] $DOTFILES_DIR/exports.zsh file does not exist"
  echo "[WARNING] creating file $DOTFILES_DIR/exports.zsh"
  touch $DOTFILES_DIR/exports.zsh
fi 

if [[ $# -lt 1 ]]; then
  echo "[ERROR] invalid number of arguments"
  exit 2
fi

new_path="$1"

echo export PATH=\"$new_path:\$PATH\" >> $DOTFILES_DIR/exports.zsh
