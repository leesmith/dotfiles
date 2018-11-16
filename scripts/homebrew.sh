#!/usr/bin/env bash
#
# Installs Homebrew package manager
#
# https://brew.sh/

# Get the current directory
DIR="$( cd "$(dirname "$0" )" && pwd )"

# Install homebrew
if [ ! $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installed Homebrew."
fi

exit 0
