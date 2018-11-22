#!/usr/bin/env bash

# Get the current directory
DIR="$( cd "$(dirname "$0" )" && pwd )"

# if [ "$(uname -s)" == "Darwin" ]; then
# fi

# Link dot files to $HOME
for dotfile in $(find $DIR -maxdepth 1 -type f -name "*.symlink"); do
  dst="$HOME/.$(basename "${dotfile%.*}")"
  ln -fs $dotfile $dst
done

# Link rc files in .bashrc.d
[ -d "${HOME}/.bashrc.d" ] || mkdir "${HOME}/.bashrc.d"
for dotfile in ${DIR}/bashrc.d/*; do
  ln -fs $dotfile "${HOME}/.bashrc.d/$(basename $dotfile)"
done

# Link files in bin
[ -d "${HOME}/bin" ] || mkdir "${HOME}/bin"
for program in ${DIR}/bin/*; do
  ln -fs $program "${HOME}/bin/$(basename $program)"
done

# Prepare vim directories
[ -d "${HOME}/.vim/pack" ]    || mkdir -p "${HOME}/.vim/pack/"
[ -d "${HOME}/.vim/backups" ] || mkdir -p "${HOME}/.vim/backups"
[ -d "${HOME}/.vim/swaps" ]   || mkdir -p "${HOME}/.vim/swaps"
[ -d "${HOME}/.vim/undo" ]    || mkdir -p "${HOME}/.vim/undo"

# Link rbenv default-gems
[ -d "${HOME}/.rbenv" ] || mkdir "${HOME}/.rbenv"
ln -fs ${DIR}/default-gems "${HOME}/.rbenv/default-gems"

# execute scripts on install
(exec "${DIR}/scripts/setup-git.sh")
(exec "${DIR}/scripts/vim-minpac.sh")

echo "Installation was successful! 🎉"
