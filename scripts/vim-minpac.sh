#!/usr/bin/env bash
#
# Clones minpac vim plugin manager and attempts to install plugins

set -e

if [[ -d "${HOME}/.config/nvim/pack/minpac" ]]; then
  exit 0
else
  [ -d "${HOME}/.config/nvim/pack/minpac/opt" ] || mkdir -p "${HOME}/.config/nvim/pack/minpac/opt"
  cd "${HOME}/.config/nvim/pack/minpac/opt"
  git clone "git://github.com/k-takata/minpac.git" &>/dev/null
  nvim -c 'call minpac#clean()' -c 'call minpac#update("", {"do": "quit"})'
  exit 0
fi
