# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx

if [ "$(uname)" == "Darwin" ]; then

  # Use AirDrop over every interface. srsly this should be a default.
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
  
  # Always open everything in Finder's list view. This is important.
  defaults write com.apple.Finder FXPreferredViewStyle Nlsv
  
  # Show the ~/Library folder.
  chflags nohidden ~/Library
  
  # Set a really fast key repeat.
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  
  # Set the Finder prefs for showing a few different volumes on the Desktop.
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
  
  # Run the screensaver if we're in the bottom-left hot corner.
  defaults write com.apple.dock wvous-bl-corner -int 5
  defaults write com.apple.dock wvous-bl-modifier -int 0

# http://osxdaily.com/2014/01/31/turn-on-mac-touch-to-click-command-line/
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

fi
