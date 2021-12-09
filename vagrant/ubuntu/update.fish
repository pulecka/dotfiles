function update -d "Update installed packages & apps"
  sudo apt update
  sudo apt upgrade
  sudo snap refresh
end
