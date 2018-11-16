#!/usr/bin/env bash

# Ask for the administrator password upfront
# sudo -v

# Enable font smoothing (non-retina screens)
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show desktop for bottom left hot corner
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifer -int 0
