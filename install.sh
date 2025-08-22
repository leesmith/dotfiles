#!/usr/bin/env bash

# Get the current directory
DIR="$( cd "$(dirname "$0" )" && pwd )"

# if [ "$(uname -s)" == "Darwin" ]; then
# fi

# Create nvim file structure
# [ -d "${HOME}/.config" ] || mkdir "${HOME}/.config"
# [ -d "${HOME}/.config/nvim/pack" ]    || mkdir -p "${HOME}/.config/nvim/pack/"
# [ -d "${HOME}/.config/nvim/backups" ] || mkdir -p "${HOME}/.config/nvim/backups"
# [ -d "${HOME}/.config/nvim/swaps" ]   || mkdir -p "${HOME}/.config/nvim/swaps"
# [ -d "${HOME}/.config/nvim/undo" ]    || mkdir -p "${HOME}/.config/nvim/undo"
# ln -fs ${DIR}/nvim/init.vim "${HOME}/.config/nvim/init.vim"

# Create vim file structure
[ -d "${HOME}/.vim/pack" ]    || mkdir -p "${HOME}/.vim/pack/"
[ -d "${HOME}/.vim/backups" ] || mkdir -p "${HOME}/.vim/backups"
[ -d "${HOME}/.vim/swaps" ]   || mkdir -p "${HOME}/.vim/swaps"
[ -d "${HOME}/.vim/undo" ]    || mkdir -p "${HOME}/.vim/undo"

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

# execute scripts on install
(exec "${DIR}/scripts/setup-git.sh")
(exec "${DIR}/scripts/vim-minpac.sh")
# (exec "${DIR}/scripts/nvim-minpac.sh")
(exec "${DIR}/scripts/asdf.sh")

echo "Installation was successful! 🎉"
