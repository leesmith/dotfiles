#!/usr/bin/env bash
#
# Clones minpac vim plugin manager and attempts to install plugins

set -e

if [[ -d "${HOME}/.vim/pack/minpac" ]]; then
  exit 0
else
  [ -d "${HOME}/.vim/pack/minpac/opt" ] || mkdir -p "${HOME}/.vim/pack/minpac/opt"
  cd "${HOME}/.vim/pack/minpac/opt"
  git clone "git@github.com:k-takata/minpac.git" &>/dev/null
  vim -c 'call minpac#clean()' -c 'call minpac#update("", {"do": "quit"})'
  exit 0
fi
