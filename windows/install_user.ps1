#Autohotkey config
Write-Output "get autohoykey config"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/donamo/dotfiles/main/windows/autohotkey/autohotkey.ahk -OutFile $HOME\Documents\autohotkey.ahk

