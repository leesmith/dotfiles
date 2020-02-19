#!/usr/bin/env bash
#
# Creates a ~/.gitconfig if one does not exist

set -e

if [[ -s "${HOME}/.gitconfig" ]]; then
  read -n1 -p "${HOME}/.gitconfig already exists. Overwrite it? " answer
  echo
  if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    exit 0
  fi
  rm -f "${HOME}/.gitconfig"
fi

global_config() {
  git config --global "$1" "$2"
}

read -p "Enter your global git user.name: " name
read -p "Enter your global git user.email: " email

global_config "user.name" "$name"
global_config "user.email" "$email"

global_config "branch.autosetuprebase" "always"
global_config "pull.rebase" "true"
global_config "push.default" "simple"
global_config "merge.conflictstyle" "diff3"

global_config "color.status.added" "green"
global_config "color.status.changed" "yellow"
global_config "color.status.untracked" "red"
global_config "color.ui" "true"

global_config "core.editor" "nvim"
global_config "core.excludesfile" "${HOME}/.gitignore"

global_config "alias.st"    "status --short --branch"
global_config "alias.co"    "checkout"
global_config "alias.aa"    "add --all"
global_config "alias.fa"    "fetch --all"
global_config "alias.fap"   "fetch --all --prune"
global_config "alias.ff"    "merge --ff-only"
global_config "alias.b"     "branch"
global_config "alias.ba"    "branch -a"

global_config "alias.ci"    "commit --verbose"
global_config "alias.amend" "commit --verbose --amend --no-edit"

global_config "alias.di"    "diff"
global_config "alias.dc"    "diff --cached"
global_config "alias.dh1"   "diff HEAD~1"

global_config "alias.po"    "push origin"
global_config "alias.pom"   "push origin master"
global_config "alias.pu"    "push upstream"
global_config "alias.pum"   "push upstream master"

# Fancy logging.
#   h = head
#   hp = head with patch
#   r = recent commits, only current branch
#   ra = recent commits, all reachable refs
#   l = all commits, only current branch
#   la = all commits, all reachable refs

HASH="%C(auto,yellow)%h%C(auto,reset)"
RELATIVE_TIME="%C(auto,green)(%ar)%C(auto,reset)"
AUTHOR="%C(auto,bold blue)<%an>%C(auto,reset)"
REFS="%C(auto,red)%d%C(auto,reset)"
SUBJECT="%s"

FORMAT="$HASH $RELATIVE_TIME $AUTHOR $REFS $SUBJECT"
PRETTY="--pretty='tformat:${FORMAT}'"

global_config "alias.h"     "log ${PRETTY} -1"
global_config "alias.head"  "log ${PRETTY} -1"
global_config "alias.hp"    "show --patch ${PRETTY}"

global_config "alias.l"     "log --graph ${PRETTY}"
global_config "alias.la"    "log --graph --all ${PRETTY}"

global_config "alias.r"     "log --graph ${PRETTY} -20"
global_config "alias.ra"    "log --graph --all ${PRETTY} -20"

exit 0
