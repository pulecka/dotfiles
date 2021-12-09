function update -d "Update installed packages & apps"
  brew update
  brew upgrade
  brew cleanup
  softwareupdate -i -a
end
