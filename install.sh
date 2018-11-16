#!/usr/bin/env bash

# Get the current directory
DIR="$( cd "$(dirname "$0" )" && pwd )"

if [ "$(uname -s)" == "Darwin" ]; then
  # Install Homebrew
  (exec "${DIR}/scripts/homebrew.sh")

  # Install Homebrew dependencies

  # Config MacOS settings
  (exec "${DIR}/scripts/macos-defaults.sh")
fi

echo "Installation was successful! 🎉"
exit 0
