#!/usr/bin/env bash
#
# Install asdf plugins

set -e

asdf plugin add golang
asdf plugin add java
asdf plugin add nodejs
asdf plugin add postgres
asdf plugin add python
asdf plugin add ruby

exit 0
